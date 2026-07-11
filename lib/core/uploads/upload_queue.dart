import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../api/providers.dart';
import '../api/upload.dart';
import '../models/check.dart';
import '../../features/pharmacist/providers.dart';
import '../../features/doctor/providers.dart';
import 'pending_upload.dart';

const _uuid = Uuid();

/// Очередь загрузки фото: копит чеки/рецепты, копирует файлы в постоянную
/// папку, грузит при наличии сети и повторяет при сбоях. idempotencyKey = id
/// защищает от дублей на бэке при ретраях.
class UploadQueue extends AsyncNotifier<List<PendingUpload>> {
  Directory? _dir;
  bool _processing = false;

  @override
  Future<List<PendingUpload>> build() async {
    final docs = await getApplicationDocumentsDirectory();
    _dir = Directory('${docs.path}/uploads')..createSync(recursive: true);

    // Ретраим при появлении сети.
    final sub = Connectivity().onConnectivityChanged.listen((res) {
      if (res.any((r) => r != ConnectivityResult.none)) _process();
    });
    ref.onDispose(sub.cancel);

    final items = _load();
    // Первый прогон — вдруг сеть уже есть.
    Future.microtask(_process);
    return items;
  }

  File get _indexFile => File('${_dir!.path}/queue.json');

  List<PendingUpload> _load() {
    if (!_indexFile.existsSync()) return [];
    try {
      final raw = jsonDecode(_indexFile.readAsStringSync()) as List;
      return raw
          .map((e) => PendingUpload.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  void _save(List<PendingUpload> items) {
    _indexFile.writeAsStringSync(
        jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  /// Копирует выбранные файлы в постоянную папку (temp может очиститься).
  Future<List<String>> _persistFiles(String id, List<String> paths) async {
    final out = <String>[];
    for (var i = 0; i < paths.length; i++) {
      final dst = '${_dir!.path}/${id}_$i.jpg';
      await File(paths[i]).copy(dst);
      out.add(dst);
    }
    return out;
  }

  Future<void> enqueueCheck(List<String> paths) async {
    await _enqueue(UploadKind.check, paths, {});
  }

  Future<void> enqueueRecipe(List<String> paths, DoctorRecipeInfo? d) async {
    final fields = <String, String>{};
    if (d?.name != null) fields['doctorName'] = d!.name!;
    if (d?.workplace != null) fields['doctorWorkplace'] = d!.workplace!;
    if (d?.city != null) fields['doctorCity'] = d!.city!;
    if (d?.phone != null) fields['doctorPhone'] = d!.phone!;
    await _enqueue(UploadKind.recipe, paths, fields);
  }

  Future<void> _enqueue(
      UploadKind kind, List<String> paths, Map<String, String> fields) async {
    final id = _uuid.v4();
    final stored = await _persistFiles(id, paths);
    final item = PendingUpload(
      id: id,
      kind: kind,
      filePaths: stored,
      fields: fields,
      createdAt: DateTime.now().toIso8601String(),
    );
    final items = [...(state.asData?.value ?? <PendingUpload>[]), item];
    _save(items);
    state = AsyncData(items);
    _process();
  }

  /// Пытается выгрузить все элементы очереди по одному.
  Future<void> _process() async {
    if (_processing) return;
    _processing = true;
    try {
      final api = ref.read(apiProvider);
      var items = [...(state.asData?.value ?? _load())];
      for (final item in [...items]) {
        try {
          final files =
              item.filePaths.map((p) => UploadFile(path: p)).toList();
          if (item.kind == UploadKind.check) {
            await api.checks.submit(files, idempotencyKey: item.id);
          } else {
            await api.recipes.submit(files,
                idempotencyKey: item.id,
                doctor: DoctorRecipeInfo(
                  name: item.fields['doctorName'],
                  workplace: item.fields['doctorWorkplace'],
                  city: item.fields['doctorCity'],
                  phone: item.fields['doctorPhone'],
                ));
          }
          // Успех — убираем из очереди и чистим файлы.
          items = items.where((e) => e.id != item.id).toList();
          for (final p in item.filePaths) {
            final f = File(p);
            if (f.existsSync()) f.deleteSync();
          }
          _save(items);
          state = AsyncData(items);
          ref.invalidate(item.kind == UploadKind.check
              ? checksProvider
              : recipesProvider);
        } catch (e) {
          item.attempts++;
          item.lastError = e.toString();
          _save(items);
          state = AsyncData([...items]);
          // Прекращаем прогон — вероятно, нет сети; повторим позже.
          break;
        }
      }
    } finally {
      _processing = false;
    }
  }

  /// Ручной повтор (кнопка «повторить» в UI).
  Future<void> retryNow() => _process();
}

final uploadQueueProvider =
    AsyncNotifierProvider<UploadQueue, List<PendingUpload>>(UploadQueue.new);

/// Число ожидающих загрузок (для бейджа/индикатора).
final pendingUploadCountProvider = Provider<int>((ref) {
  return ref.watch(uploadQueueProvider).asData?.value.length ?? 0;
});

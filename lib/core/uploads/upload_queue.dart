import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../api/providers.dart';
import '../models/check.dart';
import '../../features/pharmacist/providers.dart';
import '../../features/doctor/providers.dart';
import 'pending_upload.dart';
import 'upload_storage.dart';

const _uuid = Uuid();

/// Очередь загрузки фото: копит чеки/рецепты, откладывает файлы на хранение,
/// грузит при наличии сети и повторяет при сбоях. idempotencyKey = id
/// защищает от дублей на бэке при ретраях.
/// Где именно лежат файлы — решает [UploadStorage] (диск на мобильных,
/// память вкладки на вебе).
class UploadQueue extends AsyncNotifier<List<PendingUpload>> {
  final UploadStorage _storage = createUploadStorage();
  bool _processing = false;

  @override
  Future<List<PendingUpload>> build() async {
    await _storage.init();

    // Ретраим при появлении сети.
    final sub = Connectivity().onConnectivityChanged.listen((res) {
      if (res.any((r) => r != ConnectivityResult.none)) _process();
    });
    ref.onDispose(sub.cancel);

    final items = _storage.load();
    // Первый прогон — вдруг сеть уже есть.
    Future.microtask(_process);
    return items;
  }

  Future<void> enqueueCheck(List<XFile> photos) async {
    await _enqueue(UploadKind.check, photos, {});
  }

  Future<void> enqueueRecipe(List<XFile> photos, DoctorRecipeInfo? d) async {
    final fields = <String, String>{};
    if (d?.name != null) fields['doctorName'] = d!.name!;
    if (d?.workplace != null) fields['doctorWorkplace'] = d!.workplace!;
    if (d?.city != null) fields['doctorCity'] = d!.city!;
    if (d?.phone != null) fields['doctorPhone'] = d!.phone!;
    await _enqueue(UploadKind.recipe, photos, fields);
  }

  Future<void> _enqueue(UploadKind kind, List<XFile> photos,
      Map<String, String> fields) async {
    final id = _uuid.v4();
    final stored = await _storage.persist(id, photos);
    final item = PendingUpload(
      id: id,
      kind: kind,
      filePaths: stored,
      fields: fields,
      createdAt: DateTime.now().toIso8601String(),
    );
    final items = [...(state.asData?.value ?? <PendingUpload>[]), item];
    _storage.save(items);
    state = AsyncData(items);
    _process();
  }

  /// Пытается выгрузить все элементы очереди по одному.
  Future<void> _process() async {
    if (_processing) return;
    _processing = true;
    try {
      final api = ref.read(apiProvider);
      var items = [...(state.asData?.value ?? _storage.load())];
      for (final item in [...items]) {
        try {
          final files = await _storage.readFiles(item);
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
          await _storage.cleanup(item);
          _storage.save(items);
          state = AsyncData(items);
          ref.invalidate(item.kind == UploadKind.check
              ? checksProvider
              : recipesProvider);
        } catch (e) {
          item.attempts++;
          item.lastError = e.toString();
          _storage.save(items);
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

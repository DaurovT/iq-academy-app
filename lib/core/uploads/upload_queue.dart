import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../api/api_exception.dart';
import '../api/providers.dart';
import '../models/check.dart';
import '../../features/pharmacist/providers.dart';
import '../../features/doctor/providers.dart';
import 'pending_upload.dart';
import 'upload_storage.dart';

const _uuid = Uuid();

/// Сжатие снимков перед отправкой: исходник камеры весит 5–25 МБ и обрывается
/// на мобильной связи, а для распознавания хватает 2000 px и качества 80
/// (~0,5 МБ). Передаётся в `pickImage` / `pickMultiImage`.
const kPhotoMaxSide = 2000.0;
const kPhotoQuality = 80;

/// Повтор неотправленного — пока приложение открыто.
const _retryEvery = Duration(minutes: 2);

/// Очередь загрузки фото: копит чеки/бланки, откладывает файлы на хранение,
/// грузит при наличии сети и повторяет при сбоях. idempotencyKey = id
/// защищает от дублей на бэке при повторах.
///
/// Один застрявший элемент больше не держит остальные: отказ сервера по
/// существу (4xx) помечает его «Не отправится», пропавшие файлы — «Фото не
/// сохранилось», и очередь идёт дальше. Ждать сети — только при сетевых
/// ошибках и 5xx.
class UploadQueue extends AsyncNotifier<List<PendingUpload>> {
  final UploadStorage _storage = createUploadStorage();
  bool _processing = false;

  @override
  Future<List<PendingUpload>> build() async {
    await _storage.init();

    // Повторяем при появлении сети, при возврате в приложение и по таймеру.
    final sub = Connectivity().onConnectivityChanged.listen((res) {
      if (res.any((r) => r != ConnectivityResult.none)) _process();
    });
    final lifecycle = AppLifecycleListener(onResume: _process);
    final timer = Timer.periodic(_retryEvery, (_) => _process());
    ref.onDispose(() {
      sub.cancel();
      lifecycle.dispose();
      timer.cancel();
    });

    final items = _storage.load();
    Future.microtask(() async {
      await _recoverLostPhoto();
      await _process();
    });
    return items;
  }

  List<PendingUpload> get _items => [
    ...(state.asData?.value ?? const <PendingUpload>[]),
  ];

  void _commit(List<PendingUpload> items) {
    _storage.save(items);
    state = AsyncData(items);
  }

  /// Чеки: каждое фото — отдельный чек (так их принимает сервер с 09.11.2026),
  /// поэтому и в очереди каждое фото — отдельный элемент: один неудачный
  /// снимок не задерживает остальные.
  Future<void> enqueueChecks(List<XFile> photos) async {
    for (final p in photos) {
      await _enqueue(UploadKind.check, [p], {}, process: false);
    }
    unawaited(_process());
  }

  Future<void> enqueueRecipe(List<XFile> photos, DoctorRecipeInfo? d) async {
    final fields = <String, String>{};
    if (d?.name != null) fields['doctorName'] = d!.name!;
    if (d?.workplace != null) fields['doctorWorkplace'] = d!.workplace!;
    if (d?.city != null) fields['doctorCity'] = d!.city!;
    if (d?.phone != null) fields['doctorPhone'] = d!.phone!;
    await _enqueue(UploadKind.recipe, photos, fields);
  }

  Future<void> _enqueue(
    UploadKind kind,
    List<XFile> photos,
    Map<String, String> fields, {
    bool process = true,
  }) async {
    final id = _uuid.v4();
    final stored = await _storage.persist(id, photos);
    final item = PendingUpload(
      id: id,
      kind: kind,
      filePaths: stored,
      fields: fields,
      createdAt: DateTime.now().toIso8601String(),
    );
    _commit([..._items, item]);
    if (process) unawaited(_process());
  }

  /// Перед открытием камеры: если Android выгрузит приложение, снимок
  /// восстановим при следующем запуске ([_recoverLostPhoto]).
  Future<void> markCapture(UploadKind? kind) =>
      _storage.markCapture(kind?.name);

  /// Android: приложение выгрузили, пока была открыта камера, — забираем снимок.
  Future<void> _recoverLostPhoto() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;
    try {
      final kind = await _storage.readCapture();
      final lost = await ImagePicker().retrieveLostData();
      await _storage.markCapture(null);
      final files =
          lost.files ?? (lost.file == null ? const <XFile>[] : [lost.file!]);
      if (lost.isEmpty || files.isEmpty) return;
      if (kind == UploadKind.recipe.name) {
        await _enqueue(UploadKind.recipe, files, {}, process: false);
      } else {
        for (final f in files) {
          await _enqueue(UploadKind.check, [f], {}, process: false);
        }
      }
    } catch (_) {
      // Не нашли — ничего страшного.
    }
  }

  /// Пытается выгрузить все элементы очереди по одному.
  Future<void> _process() async {
    if (_processing) return;
    _processing = true;
    try {
      final api = ref.read(apiProvider);
      for (final item in _items) {
        if (item.stuck) continue;
        // Файлы пропали (обновление на iPhone, чистка памяти) — отправлять
        // нечего; помечаем и идём дальше, а не ждём вечно.
        if (!await _storage.filesExist(item)) {
          item.state = UploadState.missing;
          _commit(_items);
          continue;
        }
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
          await _storage.cleanup(item);
          _commit(_items.where((e) => e.id != item.id).toList());
          ref.invalidate(
            item.kind == UploadKind.check ? checksProvider : recipesProvider,
          );
        } catch (e) {
          item.attempts++;
          item.lastError = e.toString();
          final fatal = isPermanentUploadError(e);
          if (fatal) item.state = UploadState.rejected;
          _commit(_items);
          // Сеть или сервер недоступны — остальные тоже не уйдут, ждём.
          if (!fatal) break;
        }
      }
    } finally {
      _processing = false;
    }
  }

  /// Ручной повтор (кнопка «Повторить»).
  Future<void> retryNow() => _process();

  /// «Удалить» у застрявшего чека.
  Future<void> remove(String id) async {
    final item = _items.where((e) => e.id == id).firstOrNull;
    if (item == null) return;
    await _storage.cleanup(item);
    _commit(_items.where((e) => e.id != id).toList());
  }

  /// Путь для превью элемента очереди.
  String previewPath(String stored) => _storage.previewPath(stored);
}

/// Отказ, который повтор не исправит: 4xx, кроме 401 (вход), 408 (таймаут)
/// и 429 (слишком часто). Сетевые ошибки и 5xx — временные.
bool isPermanentUploadError(Object e) {
  final err = e is DioException ? e.error : e;
  final status = err is ApiException ? err.statusCode : null;
  if (status == null) return false;
  if (status == 401 || status == 408 || status == 429) return false;
  return status >= 400 && status < 500;
}

final uploadQueueProvider =
    AsyncNotifierProvider<UploadQueue, List<PendingUpload>>(UploadQueue.new);

/// Число ожидающих загрузок (для бейджа/индикатора).
final pendingUploadCountProvider = Provider<int>((ref) {
  return ref.watch(uploadQueueProvider).asData?.value.length ?? 0;
});

import 'package:image_picker/image_picker.dart';
import '../api/upload.dart';
import 'pending_upload.dart';

export 'upload_storage_io.dart'
    if (dart.library.js_interop) 'upload_storage_web.dart';

/// Хранилище отложенных загрузок — единственное место, где очередь фото
/// расходится по платформам.
///
/// Мобильные: файлы копируются в постоянную папку, индекс очереди лежит в
/// JSON на диске — очередь переживает перезапуск приложения.
/// Веб: файловой системы нет, байты держим в памяти вкладки — очередь живёт
/// до перезагрузки страницы (офлайн-докачка там и не нужна).
abstract interface class UploadStorage {
  /// Подготовить хранилище (создать папку). Вызывается один раз при старте.
  Future<void> init();

  /// Прочитать сохранённую очередь (на вебе — всегда пусто).
  List<PendingUpload> load();

  /// Сохранить очередь (на вебе — no-op).
  void save(List<PendingUpload> items);

  /// Положить выбранные фото на хранение. Возвращает ссылки на файлы для
  /// [PendingUpload.filePaths] (на мобильных — имена, на вебе — blob-URL).
  Future<List<String>> persist(String id, List<XFile> photos);

  /// Путь для превью по записи из [PendingUpload.filePaths].
  String previewPath(String stored);

  /// Все фото элемента на месте (иначе — «Фото не сохранилось»).
  Future<bool> filesExist(PendingUpload item);

  /// Собрать файлы элемента очереди для отправки на бэкенд.
  Future<List<UploadFile>> readFiles(PendingUpload item);

  /// Удалить фото после успешной отправки.
  Future<void> cleanup(PendingUpload item);

  /// Пометка «открыта камера для чека/бланка» ('check' | 'recipe' | null):
  /// Android может выгрузить приложение, пока открыта камера, — после
  /// перезапуска по пометке понятно, куда положить восстановленный снимок.
  Future<void> markCapture(String? kind);
  Future<String?> readCapture();
}

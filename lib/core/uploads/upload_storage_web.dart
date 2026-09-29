import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

import '../api/upload.dart';
import 'pending_upload.dart';
import 'upload_storage.dart';

UploadStorage createUploadStorage() => WebUploadStorage();

/// Веб-реализация: диска нет, поэтому байты фото держим в памяти вкладки, а в
/// [PendingUpload.filePaths] кладём blob-URL — по нему рисуется превью.
/// Плата за это: перезагрузка страницы теряет неотправленную очередь. Для веб-
/// версии это приемлемо — она онлайновая, а докачка нужна мобильному офлайну.
class WebUploadStorage implements UploadStorage {
  final _bytes = <String, List<Uint8List>>{};

  @override
  Future<void> init() async {}

  @override
  List<PendingUpload> load() => [];

  @override
  void save(List<PendingUpload> items) {}

  @override
  Future<List<String>> persist(String id, List<XFile> photos) async {
    _bytes[id] = [for (final p in photos) await p.readAsBytes()];
    return [for (final p in photos) p.path]; // blob-URL для превью
  }

  @override
  Future<List<UploadFile>> readFiles(PendingUpload item) async {
    final bytes = _bytes[item.id] ?? const [];
    return [
      for (var i = 0; i < bytes.length; i++)
        UploadFile(
          path: item.filePaths.length > i ? item.filePaths[i] : '',
          bytes: bytes[i],
          filename: 'photo_$i.jpg',
        ),
    ];
  }

  @override
  Future<void> cleanup(PendingUpload item) async => _bytes.remove(item.id);
}

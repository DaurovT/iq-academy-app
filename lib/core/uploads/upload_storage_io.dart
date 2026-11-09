import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../api/upload.dart';
import 'pending_upload.dart';
import 'upload_storage.dart';

UploadStorage createUploadStorage() => IoUploadStorage();

/// Мобильная реализация: фото копируются в папку документов (temp может быть
/// очищен системой), индекс очереди — JSON рядом с ними.
///
/// В индексе хранятся только имена файлов, путь к папке собирается заново при
/// каждом запуске: на iOS путь контейнера приложения меняется при обновлении.
class IoUploadStorage implements UploadStorage {
  Directory? _dir;

  @override
  Future<void> init() async {
    final docs = await getApplicationDocumentsDirectory();
    _dir = Directory('${docs.path}/uploads')..createSync(recursive: true);
  }

  File get _indexFile => File('${_dir!.path}/queue.json');

  /// Имя файла → полный путь в текущей папке очереди. Старые записи (до 1.2.2)
  /// хранили абсолютный путь — берём из него только имя.
  String _resolve(String stored) => '${_dir!.path}/${stored.split('/').last}';

  @override
  List<PendingUpload> load() {
    if (_dir == null || !_indexFile.existsSync()) return [];
    try {
      final raw = jsonDecode(_indexFile.readAsStringSync()) as List;
      return raw
          .map((e) => PendingUpload.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  @override
  void save(List<PendingUpload> items) {
    if (_dir == null) return;
    _indexFile
        .writeAsStringSync(jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  @override
  Future<List<String>> persist(String id, List<XFile> photos) async {
    final out = <String>[];
    for (var i = 0; i < photos.length; i++) {
      final name = '${id}_$i.jpg';
      await File(photos[i].path).copy('${_dir!.path}/$name');
      out.add(name);
    }
    return out;
  }

  @override
  String previewPath(String stored) => _resolve(stored);

  @override
  Future<bool> filesExist(PendingUpload item) async =>
      item.filePaths.isNotEmpty &&
      item.filePaths.every((p) => File(_resolve(p)).existsSync());

  @override
  Future<List<UploadFile>> readFiles(PendingUpload item) async =>
      item.filePaths.map((p) => UploadFile(path: _resolve(p))).toList();

  @override
  Future<void> cleanup(PendingUpload item) async {
    for (final p in item.filePaths) {
      final f = File(_resolve(p));
      if (f.existsSync()) f.deleteSync();
    }
  }

  File get _captureFile => File('${_dir!.path}/capture.txt');

  @override
  Future<void> markCapture(String? kind) async {
    if (_dir == null) return;
    if (kind == null) {
      if (_captureFile.existsSync()) _captureFile.deleteSync();
    } else {
      _captureFile.writeAsStringSync(kind);
    }
  }

  @override
  Future<String?> readCapture() async {
    if (_dir == null || !_captureFile.existsSync()) return null;
    return _captureFile.readAsStringSync();
  }
}

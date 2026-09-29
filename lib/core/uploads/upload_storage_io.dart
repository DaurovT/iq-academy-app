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
class IoUploadStorage implements UploadStorage {
  Directory? _dir;

  @override
  Future<void> init() async {
    final docs = await getApplicationDocumentsDirectory();
    _dir = Directory('${docs.path}/uploads')..createSync(recursive: true);
  }

  File get _indexFile => File('${_dir!.path}/queue.json');

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
      final dst = '${_dir!.path}/${id}_$i.jpg';
      await File(photos[i].path).copy(dst);
      out.add(dst);
    }
    return out;
  }

  @override
  Future<List<UploadFile>> readFiles(PendingUpload item) async =>
      item.filePaths.map((p) => UploadFile(path: p)).toList();

  @override
  Future<void> cleanup(PendingUpload item) async {
    for (final p in item.filePaths) {
      final f = File(p);
      if (f.existsSync()) f.deleteSync();
    }
  }
}

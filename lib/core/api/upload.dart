import 'dart:typed_data';

/// Файл для multipart-загрузки (фото чека/рецепта), независимо от Dio.
///
/// На мобильных из image_picker приходит путь к файлу — его достаточно.
/// На вебе файловой системы нет: там [path] — это blob-URL (годится только
/// для превью), а реальное содержимое лежит в [bytes].
class UploadFile {
  const UploadFile({required this.path, this.filename, this.bytes});
  final String path;
  final String? filename;
  final Uint8List? bytes;
}

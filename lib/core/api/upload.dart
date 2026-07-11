/// Файл для multipart-загрузки (фото чека/рецепта), независимо от Dio.
/// Из image_picker получаем путь; HttpApi превратит его в MultipartFile.
class UploadFile {
  const UploadFile({required this.path, this.filename});
  final String path;
  final String? filename;
}

/// Ошибка API с человекочитаемым текстом.
/// Извлекает `detail` из ответа FastAPI (как http.ts в вебе), а не «HTTP 400».
class ApiException implements Exception {
  ApiException(this.message, {this.statusCode, this.unauthorized = false});

  final String message;
  final int? statusCode;
  final bool unauthorized;

  @override
  String toString() => message;
}

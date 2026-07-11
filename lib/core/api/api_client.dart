import 'package:dio/dio.dart';
import 'api_exception.dart';
import 'token_store.dart';

/// Базовый адрес platform_api (совпадает с VITE_API_BASE веба).
/// Позже вынесем в конфиг сборки (--dart-define).
const kApiBase = 'http://194.5.157.183:4000/api/1.0';

/// Собирает настроенный Dio: подставляет Bearer-токен и превращает
/// ошибки бэка в [ApiException] с текстом из поля `detail`.
Dio createDio(TokenStore tokens) {
  final dio = Dio(BaseOptions(
    baseUrl: kApiBase,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 30),
    contentType: Headers.jsonContentType,
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await tokens.readToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    },
    onError: (e, handler) {
      handler.reject(_toApiException(e));
    },
  ));

  return dio;
}

DioException _toApiException(DioException e) {
  final status = e.response?.statusCode;
  var message = e.message ?? 'Ошибка сети';

  // FastAPI отдаёт {detail: "..."} или {detail: [{msg: "..."}]}.
  final data = e.response?.data;
  if (data is Map && data['detail'] is String) {
    message = data['detail'] as String;
  } else if (data is Map && data['detail'] is List && (data['detail'] as List).isNotEmpty) {
    final first = (data['detail'] as List).first;
    if (first is Map && first['msg'] is String) message = first['msg'] as String;
  } else if (status == 401) {
    message = 'Нет доступа';
  }

  return e.copyWith(
    error: ApiException(
      message,
      statusCode: status,
      unauthorized: status == 401,
    ),
  );
}

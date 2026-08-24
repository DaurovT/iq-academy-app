import 'package:dio/dio.dart';
import '../../l10n/gen/app_localizations.dart';
import 'api_exception.dart';
import 'token_store.dart';

/// Базовый адрес platform_api (совпадает с VITE_API_BASE веба).
/// Позже вынесем в конфиг сборки (--dart-define).
const kApiBase = 'https://pharmview.uz/api/1.0';

/// Собирает настроенный Dio: подставляет Bearer-токен и превращает
/// ошибки бэка в [ApiException] с текстом из поля `detail`.
/// [l10n] отдаёт строки на текущем языке интерфейса (читается лениво,
/// чтобы смена локали действовала без пересоздания Dio).
Dio createDio(TokenStore tokens, AppLocalizations Function() l10n) {
  final dio = Dio(BaseOptions(
    baseUrl: kApiBase,
    // терпимее к краткому рестарту сервера и медленному мобильному интернету
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 60),
    // загрузка фото чека по LTE бывает долгой — даём запас на отправку
    sendTimeout: const Duration(seconds: 90),
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
      handler.reject(_toApiException(e, l10n()));
    },
  ));

  return dio;
}

DioException _toApiException(DioException e, AppLocalizations l10n) {
  final status = e.response?.statusCode;
  var message = e.message ?? l10n.apiNetworkError;

  // FastAPI отдаёт {detail: "..."} или {detail: [{msg: "..."}]}.
  final data = e.response?.data;
  if (data is Map && data['detail'] is String) {
    message = data['detail'] as String;
  } else if (data is Map && data['detail'] is List && (data['detail'] as List).isNotEmpty) {
    final first = (data['detail'] as List).first;
    if (first is Map && first['msg'] is String) message = first['msg'] as String;
  } else if (status == 401) {
    message = l10n.apiNoAccess;
  }

  return e.copyWith(
    error: ApiException(
      message,
      statusCode: status,
      unauthorized: status == 401,
    ),
  );
}

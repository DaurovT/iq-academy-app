import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_client.dart';
import 'http_api.dart';
import 'platform_api.dart';
import 'token_store.dart';

/// Защищённое хранилище (keystore/keychain).
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
});

/// Хранилище токена и активной роли.
final tokenStoreProvider = Provider<TokenStore>((ref) {
  return TokenStore(ref.watch(secureStorageProvider));
});

/// Настроенный Dio (Bearer-токен + маппинг ошибок).
final dioProvider = Provider<Dio>((ref) {
  return createDio(ref.watch(tokenStoreProvider));
});

/// Единая точка доступа к API. Провайдеры/экраны зависят от [PlatformApi].
final apiProvider = Provider<PlatformApi>((ref) {
  return HttpApi(ref.watch(dioProvider));
});

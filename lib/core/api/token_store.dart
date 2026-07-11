import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Защищённое хранилище токена и выбранной роли.
/// Аналог localStorage в вебе, но в шифрованном keystore/keychain.
class TokenStore {
  TokenStore(this._storage);

  final FlutterSecureStorage _storage;

  static const _kToken = 'token';
  static const _kActiveRole = 'activeRole';
  static const _kThemeMode = 'themeMode';

  Future<String?> readToken() => _storage.read(key: _kToken);
  Future<void> writeToken(String token) =>
      _storage.write(key: _kToken, value: token);

  Future<String?> readActiveRole() => _storage.read(key: _kActiveRole);
  Future<void> writeActiveRole(String role) =>
      _storage.write(key: _kActiveRole, value: role);

  /// Тема ('light' | 'dark' | 'system'). Не чистится при выходе.
  Future<String?> readThemeMode() => _storage.read(key: _kThemeMode);
  Future<void> writeThemeMode(String mode) =>
      _storage.write(key: _kThemeMode, value: mode);

  /// Чистит только сессию (токен + роль); настройки (тема) остаются.
  Future<void> clear() async {
    await _storage.delete(key: _kToken);
    await _storage.delete(key: _kActiveRole);
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Защищённое хранилище токена и выбранной роли.
/// Аналог localStorage в вебе, но в шифрованном keystore/keychain.
class TokenStore {
  TokenStore(this._storage);

  final FlutterSecureStorage _storage;

  static const _kToken = 'token';
  static const _kActiveRole = 'activeRole';
  static const _kThemeMode = 'themeMode';
  static const _kLocale = 'locale';

  Future<String?> readToken() => _storage.read(key: _kToken);
  Future<void> writeToken(String token) => _write(_kToken, token);

  Future<String?> readActiveRole() => _storage.read(key: _kActiveRole);
  Future<void> writeActiveRole(String role) => _write(_kActiveRole, role);

  /// Тема ('light' | 'dark' | 'system'). Не чистится при выходе.
  Future<String?> readThemeMode() => _storage.read(key: _kThemeMode);
  Future<void> writeThemeMode(String mode) => _write(_kThemeMode, mode);

  /// Язык интерфейса ('ru' | 'uz' | 'kk' | 'tg' | 'ky'). Не чистится при выходе.
  Future<String?> readLocale() => _storage.read(key: _kLocale);
  Future<void> writeLocale(String code) => _write(_kLocale, code);

  /// Запись по схеме delete-then-write. На iOS обычный `write` при уже
  /// существующем элементе может падать с errSecDuplicateItem (-25299),
  /// особенно если менялся атрибут доступа (accessibility). Явное удаление
  /// ищет элемент только по ключу и надёжно снимает эту проблему.
  Future<void> _write(String key, String value) async {
    await _storage.delete(key: key);
    await _storage.write(key: key, value: value);
  }

  /// Чистит только сессию (токен + роль); настройки (тема) остаются.
  Future<void> clear() async {
    await _storage.delete(key: _kToken);
    await _storage.delete(key: _kActiveRole);
  }
}

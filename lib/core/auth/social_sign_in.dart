import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Client ID Google (проект Firebase pharmiq-fb). Это не секреты — они зашиты в любую
/// сборку; при необходимости переопределяются `--dart-define=GOOGLE_SERVER_CLIENT_ID=…`.
/// serverClientId — web client: для него Google выпускает idToken, который проверяет бэкенд.
const _googleServerClientId = String.fromEnvironment('GOOGLE_SERVER_CLIENT_ID',
    defaultValue:
        '802236256438-1mql3gmt5l9vgbv5l9s34ltfkcr5r0gm.apps.googleusercontent.com');
const _googleIosClientId = String.fromEnvironment('GOOGLE_IOS_CLIENT_ID',
    defaultValue:
        '802236256438-okgc27evg9m4r0u2bgrl3mnr6h2bi1pl.apps.googleusercontent.com');

/// Что отправить на бэкенд после входа у провайдера.
class SocialCredential {
  const SocialCredential(this.provider, this.idToken,
      {this.nonce, this.authorizationCode, this.fullName});
  final String provider; // google | apple
  final String idToken;
  final String? nonce;
  final String? authorizationCode;
  final String? fullName;
}

/// Пользователь закрыл окно входа — это не ошибка, сообщение не показываем.
class SocialSignInCanceled implements Exception {
  const SocialSignInCanceled();
}

class SocialSignIn {
  static bool get _ios => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  static bool get _android =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  /// На вебе кнопки нет: там Google требует свою кнопку GIS, а Apple — Services ID.
  static bool get googleAvailable =>
      _googleServerClientId.isNotEmpty &&
      (_android || (_ios && _googleIosClientId.isNotEmpty));

  /// Apple обязателен на iOS, если есть другие внешние входы (App Store 4.8).
  static bool get appleAvailable => _ios;

  static bool _googleReady = false;

  static Future<SocialCredential> google() async {
    final g = GoogleSignIn.instance;
    if (!_googleReady) {
      await g.initialize(
        clientId: _ios ? _googleIosClientId : null,
        serverClientId: _googleServerClientId,
      );
      _googleReady = true;
    }
    try {
      final account = await g.authenticate();
      final token = account.authentication.idToken;
      if (token == null) throw Exception('Google не вернул токен входа');
      return SocialCredential('google', token);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw const SocialSignInCanceled();
      }
      rethrow;
    }
  }

  static Future<SocialCredential> apple() async {
    // Apple получает sha256(nonce), бэкенд — исходный nonce и сверяет хеш в токене.
    final raw = _randomNonce();
    try {
      final c = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: sha256.convert(utf8.encode(raw)).toString(),
      );
      final token = c.identityToken;
      if (token == null) throw Exception('Apple не вернул токен входа');
      // имя Apple отдаёт только при самом первом входе
      final name = [c.givenName, c.familyName]
          .whereType<String>()
          .where((s) => s.trim().isNotEmpty)
          .join(' ');
      return SocialCredential('apple', token,
          nonce: raw,
          authorizationCode: c.authorizationCode,
          fullName: name.isEmpty ? null : name);
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const SocialSignInCanceled();
      }
      rethrow;
    }
  }

  static String _randomNonce([int length = 32]) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final r = Random.secure();
    return List.generate(length, (_) => chars[r.nextInt(chars.length)]).join();
  }
}

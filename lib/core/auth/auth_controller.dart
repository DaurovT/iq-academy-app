import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_exception.dart';
import '../api/providers.dart';
import '../models/account.dart';
import '../models/common.dart';

/// Состояние авторизации: аккаунт + выбранная активная роль.
class AuthState {
  const AuthState({this.account, this.activeRole});

  final Account? account;
  final Role? activeRole;

  bool get isAuthed => account != null;

  /// Вошёл, но роль ещё не выбрана (у аккаунта их несколько).
  bool get needsRole => account != null && activeRole == null;

  AuthState copyWith({Account? account, Role? activeRole}) =>
      AuthState(
        account: account ?? this.account,
        activeRole: activeRole ?? this.activeRole,
      );
}

/// Контроллер авторизации. При старте (`build`) пытается восстановить сессию
/// по сохранённому токену — аналог useEffect в web/auth.tsx.
class AuthController extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    final tokens = ref.read(tokenStoreProvider);
    final token = await tokens.readToken();
    if (token == null) return const AuthState();

    // Выходим из аккаунта ТОЛЬКО если сервер сказал «нет доступа» (401).
    // Нет сети, таймаут, сервер перезапускается при выкатке — остаёмся
    // в аккаунте: повторяем запрос, а не получилось — берём аккаунт из кэша.
    Object? lastError;
    for (var attempt = 0; attempt < 3; attempt++) {
      try {
        final s = await ref.read(apiProvider).auth.session();
        if (s.token != null) await tokens.writeToken(s.token!);
        await _cacheAccount(s.account);
        return AuthState(
          account: s.account,
          activeRole: _resolveRole(s.account, await tokens.readActiveRole()),
        );
      } catch (e) {
        if (isUnauthorized(e)) {
          await tokens.clear();
          return const AuthState();
        }
        lastError = e;
        if (attempt < 2) {
          await Future<void>.delayed(Duration(seconds: 2 + attempt * 3));
        }
      }
    }
    final cached = await _cachedAccount();
    if (cached != null) {
      return AuthState(
        account: cached,
        activeRole: _resolveRole(cached, await tokens.readActiveRole()),
      );
    }
    // Ни сети, ни кэша (первый запуск после обновления): токен НЕ трогаем —
    // покажем экран входа, а при следующем запуске сессия восстановится.
    Error.throwWithStackTrace(
      lastError ?? StateError('no session'),
      StackTrace.current,
    );
  }

  /// Ответ 401 — токен недействителен (все прочие ошибки — проблемы связи).
  static bool isUnauthorized(Object e) {
    final err = e is DioException ? e.error : e;
    return err is ApiException && err.unauthorized;
  }

  Future<void> _cacheAccount(Account a) async {
    try {
      await ref.read(tokenStoreProvider).writeAccount(jsonEncode(a.toJson()));
    } catch (_) {}
  }

  Future<Account?> _cachedAccount() async {
    try {
      final raw = await ref.read(tokenStoreProvider).readAccount();
      if (raw == null) return null;
      return Account.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  /// Выбирает активную роль: сохранённую (если ещё валидна) либо единственную.
  Role? _resolveRole(Account account, String? savedName) {
    final saved = savedName == null
        ? null
        : Role.values.where((r) => r.name == savedName).firstOrNull;
    if (saved != null && account.roles.contains(saved)) return saved;
    return account.roles.length == 1 ? account.roles.first : null;
  }

  /// Завершить вход: сохранить токен и, если роль одна, сразу её выбрать.
  Future<void> completeLogin(Session session) async {
    final tokens = ref.read(tokenStoreProvider);
    await tokens.writeToken(session.token);
    await _cacheAccount(session.account);
    final role =
        session.account.roles.length == 1 ? session.account.roles.first : null;
    if (role != null) await tokens.writeActiveRole(role.name);
    state = AsyncData(AuthState(account: session.account, activeRole: role));
  }

  /// Выбрать активную роль (экран RoleSelect / переключатель в шапке).
  Future<void> setActiveRole(Role role) async {
    final current = state.asData?.value;
    if (current?.account == null) return;
    await ref.read(tokenStoreProvider).writeActiveRole(role.name);
    state = AsyncData(current!.copyWith(activeRole: role));
  }

  /// Выход: чистим сервер и локальное хранилище.
  Future<void> logout() async {
    try {
      await ref.read(apiProvider).auth.logout();
    } catch (_) {
      // даже если сервер недоступен — выходим локально
    }
    await ref.read(tokenStoreProvider).clear();
    state = const AsyncData(AuthState());
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);

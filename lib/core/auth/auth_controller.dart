import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    try {
      final account = await ref.read(apiProvider).auth.session();
      return AuthState(account: account, activeRole: _resolveRole(account, await tokens.readActiveRole()));
    } catch (_) {
      // Токен протух — чистим и считаем гостем.
      await tokens.clear();
      return const AuthState();
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
    final role = session.account.roles.length == 1
        ? session.account.roles.first
        : null;
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

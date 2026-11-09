// Вход не должен слетать из-за плохой связи: выходим только по 401.
//   flutter test --no-pub test/unit/auth_session_test.dart
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/api/api_exception.dart';
import 'package:platform_app/core/api/platform_api.dart';
import 'package:platform_app/core/api/providers.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/account.dart';
import 'package:platform_app/core/models/common.dart';

const _account = Account(
  id: 7,
  phone: '+998901234567',
  fullName: 'Дауров Тимур',
  language: Language.ru,
  roles: [Role.pharmacist],
);

DioException _net() => DioException(
  requestOptions: RequestOptions(path: '/auth/userCheck'),
  type: DioExceptionType.connectionError,
);

DioException _unauthorized() => DioException(
  requestOptions: RequestOptions(path: '/auth/userCheck'),
  error: ApiException('Нет доступа', statusCode: 401, unauthorized: true),
);

/// `session()` по очереди отдаёт ответы из [replies] (ошибка — бросает).
class _Api implements PlatformApi {
  _Api(this.replies);
  final List<Object> replies;
  int calls = 0;

  @override
  AuthApi get auth => _Auth(this);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Auth implements AuthApi {
  _Auth(this.api);
  final _Api api;

  @override
  Future<({Account account, String? token})> session() async {
    final r = api.replies[api.calls.clamp(0, api.replies.length - 1)];
    api.calls++;
    if (r is Account) return (account: r, token: null);
    throw r;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<(AsyncValue<AuthState>, Map<String, String>)> _start(
  _Api api,
  Map<String, String> stored,
) async {
  FlutterSecureStorage.setMockInitialValues(stored);
  // Без автоповтора Riverpod: повторы считает сам контроллер.
  final c = ProviderContainer(
    retry: (_, __) => null,
    overrides: [apiProvider.overrideWithValue(api)],
  );
  addTearDown(c.dispose);
  try {
    await c.read(authControllerProvider.future);
  } catch (_) {}
  final left = await const FlutterSecureStorage().readAll();
  return (c.read(authControllerProvider), left);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final cached = jsonEncode(_account.toJson());

  test(
    'нет сети, есть кэш — остаёмся в аккаунте',
    () async {
      final api = _Api([_net()]);
      final (state, left) = await _start(api, {
        'token': 't',
        'account': cached,
      });
      expect(api.calls, 3, reason: 'три попытки до кэша');
      expect(state.asData?.value.account?.id, 7);
      expect(left['token'], 't');
    },
    timeout: const Timeout(Duration(seconds: 30)),
  );

  test(
    'сеть вернулась со второй попытки — свежий аккаунт',
    () async {
      final api = _Api([_net(), _account]);
      final (state, left) = await _start(api, {'token': 't'});
      expect(api.calls, 2);
      expect(state.asData?.value.account?.id, 7);
      expect(left['account'], isNotNull, reason: 'аккаунт закэширован');
    },
    timeout: const Timeout(Duration(seconds: 30)),
  );

  test(
    'нет сети и нет кэша — токен не трогаем',
    () async {
      final api = _Api([_net()]);
      final (state, left) = await _start(api, {'token': 't'});
      expect(state.hasError, isTrue);
      expect(left['token'], 't');
    },
    timeout: const Timeout(Duration(seconds: 30)),
  );

  test('401 — выходим и чистим токен', () async {
    final api = _Api([_unauthorized()]);
    final (state, left) = await _start(api, {'token': 't', 'account': cached});
    expect(api.calls, 1);
    expect(state.asData?.value.isAuthed, isFalse);
    expect(left.containsKey('token'), isFalse);
    expect(left.containsKey('account'), isFalse);
  });
}

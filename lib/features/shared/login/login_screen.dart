import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/providers.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../onboarding/welcome_screen.dart';
import 'auth_ui.dart';
import 'social_login_buttons.dart';

/// Вход по номеру телефона (макеты Login, LoginKeyboard, LoginError).
/// Код из SMS — отдельный экран `/login/code` ([SmsCodeScreen]).
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneCtrl = TextEditingController();
  final _phoneFocus = FocusNode();
  bool _loading = false;
  bool _phoneNotFound = false;
  String? _error;
  int _shake = 0;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  String get _digits => authPhoneDigits(_phoneCtrl.text);
  String get _phone => authFullPhone(_digits);

  Future<void> _submitPhone() async {
    setState(() {
      _loading = true;
      _error = null;
      _phoneNotFound = false;
    });
    try {
      final api = ref.read(apiProvider).auth;
      final res = await api.checkNumber(_phone);
      if (!res.exists) {
        // Номер не зарегистрирован: сообщаем об этом и предлагаем выбор —
        // ввести номер снова или пройти регистрацию (не редиректим сразу).
        if (mounted) {
          _phoneFocus.unfocus();
          setState(() {
            _phoneNotFound = true;
            _shake++;
          });
        }
        return;
      }
      await api.sendSms(_phone);
      if (mounted) {
        context.push(Uri(path: '/login/code', queryParameters: {'phone': _phone}).toString());
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _shake++;
        });
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _otherNumber() {
    setState(() {
      _phoneNotFound = false;
      _error = null;
      _phoneCtrl.clear();
    });
    _phoneFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    // Первый запуск (язык ещё не выбирали) — сначала приветствие.
    final seen = ref.watch(welcomeSeenProvider);
    if (seen.asData?.value == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/welcome');
      });
    }
    if (!seen.hasValue) return const AuthScreen(child: SizedBox.expand());

    final l10n = context.l10n;
    final keyboard = MediaQuery.viewInsetsOf(context).bottom > 0;
    final complete = _digits.length == kAuthPhoneDigits;
    final fieldError = _phoneNotFound ? l10n.authPhoneNotRegistered : _error;

    final field = AuthPhoneField(
      key: const ValueKey('phone'),
      controller: _phoneCtrl,
      focusNode: _phoneFocus,
      label: l10n.loginPhoneLabel,
      error: fieldError,
      shakeKey: _shake,
      enabled: !_loading,
      onChanged:
          (_) => setState(() {
            _phoneNotFound = false;
            _error = null;
          }),
      onSubmitted: (_) {
        if (complete && !_loading) _submitPhone();
      },
    );

    final submit = PqButton(
      label: l10n.oauthLinkSendCode,
      loading: _loading,
      // Пустое поле — кнопка ведёт в поле ввода; неполный номер — неактивна.
      onPressed:
          complete
              ? _submitPhone
              : _digits.isEmpty
              ? _phoneFocus.requestFocus
              : null,
    );

    final title = Padding(
      key: const ValueKey('title'),
      padding: EdgeInsets.only(top: keyboard ? 8 : 0),
      child: AuthTitleBlock(title: l10n.loginTitle, subtitle: l10n.authSmsHint),
    );

    // Одинаковые ключи в обеих раскладках: поле телефона не пересоздаётся
    // (и не теряет фокус), когда клавиатура открывается/закрывается.
    return AuthScreen(
      child: AuthFlow(
        padding: EdgeInsets.fromLTRB(20, 0, 20, keyboard ? 12 : 32),
        children:
            keyboard
                ? [
                  const AuthHeader(key: ValueKey('header')),
                  title,
                  field,
                  const AuthPush(),
                  KeyedSubtree(key: const ValueKey('submit'), child: submit),
                ]
                : [
                  const AuthHeader(key: ValueKey('header')),
                  AuthHero(
                    key: const ValueKey('hero'),
                    title: l10n.loginTagline,
                    subtitle: l10n.authLoginSubtitle,
                  ),
                  const AuthPush(),
                  title,
                  field,
                  if (_phoneNotFound)
                    Column(
                      key: const ValueKey('notFound'),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PqButton(
                          label: l10n.loginRegister,
                          onPressed:
                              () => context.go(
                                Uri(
                                  path: '/register',
                                  queryParameters: {'phone': _phone},
                                ).toString(),
                              ),
                        ),
                        const SizedBox(height: 12),
                        PqButton(
                          label: l10n.authOtherNumber,
                          kind: PqButtonKind.text,
                          height: 52,
                          onPressed: _otherNumber,
                        ),
                      ],
                    )
                  else ...[
                    Column(
                      key: const ValueKey('actions'),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [submit, const SizedBox(height: 12), const SocialLoginButtons()],
                    ),
                    AuthTextLink(
                      key: const ValueKey('register'),
                      text: l10n.loginNoAccount,
                      link: l10n.loginRegister,
                      onTap: () => context.go('/register'),
                    ),
                  ],
                ],
      ),
    );
  }
}

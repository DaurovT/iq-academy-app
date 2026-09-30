import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/oauth.dart';
import 'auth_ui.dart';

/// Подтверждение номера после первого входа через Google/Apple.
/// Номер связывает внешний вход с аккаунтом и данными из ботов (баллы, роли);
/// нужно один раз — дальше вход через Google/Apple сразу пускает внутрь.
/// Отдельного макета нет — собран из элементов Login/SmsCode.
class OAuthLinkScreen extends ConsumerStatefulWidget {
  const OAuthLinkScreen({super.key, required this.linkToken, this.fullName});

  final String linkToken;
  final String? fullName;

  @override
  ConsumerState<OAuthLinkScreen> createState() => _OAuthLinkScreenState();
}

class _OAuthLinkScreenState extends ConsumerState<OAuthLinkScreen> {
  final _phoneCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  final _codeFocus = FocusNode();
  bool _codeSent = false;
  bool _loading = false;
  String? _error;
  int _shake = 0;
  AuthCodeState _codeState = AuthCodeState.normal;

  String get _digits => authPhoneDigits(_phoneCtrl.text);
  String get _phone => authFullPhone(_digits);

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _codeCtrl.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await action();
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _shake++;
          if (_codeSent) _codeState = AuthCodeState.error;
        });
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _sendCode() => _run(() async {
    await ref.read(apiProvider).auth.oauthLinkSendSms(widget.linkToken, _phone);
    if (mounted) setState(() => _codeSent = true);
  });

  Future<void> _confirm() => _run(() async {
    final res = await ref
        .read(apiProvider)
        .auth
        .oauthLinkConfirm(widget.linkToken, _phone, _codeCtrl.text.trim());
    if (!mounted) return;
    switch (res) {
      case OAuthDone(:final session):
        setState(() => _codeState = AuthCodeState.success);
        await ref.read(authControllerProvider.notifier).completeLogin(session);
      case OAuthRegisterRequired(:final linkToken, :final phone):
        // номера нет ни у нас, ни в ботах — регистрация с уже подтверждённым номером
        context.go(
          Uri(path: '/register', queryParameters: {'phone': phone, 'link': linkToken}).toString(),
        );
      case OAuthLinkRequired():
        break;
    }
  });

  void _changePhone() => setState(() {
    _codeSent = false;
    _error = null;
    _codeState = AuthCodeState.normal;
    _codeCtrl.clear();
  });

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final complete = _digits.length == kAuthPhoneDigits;
    final codeComplete = _codeCtrl.text.length == 6;

    return AuthScreen(
      child: Column(
        children: [
          PqTopBar(
            backLabel: l10n.authBack,
            onBack: () => context.canPop() ? context.pop() : context.go('/login'),
          ),
          Expanded(
            child: AuthFlow(
              children: [
                AuthTitleBlock(title: l10n.oauthLinkTitle, subtitle: l10n.oauthLinkBody),
                if (!_codeSent)
                  AuthPhoneField(
                    key: const ValueKey('phone'),
                    controller: _phoneCtrl,
                    label: l10n.oauthLinkPhoneLabel,
                    error: _error,
                    shakeKey: _shake,
                    enabled: !_loading,
                    autofocus: true,
                    onChanged: (_) => setState(() => _error = null),
                  )
                else
                  Column(
                    key: const ValueKey('code'),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '${l10n.oauthLinkCodeSent(authPrettyPhone(_phone))} · ',
                            style: PqText.text(15, FontWeight.w400, c: pq.textMuted),
                          ),
                          PqPressable(
                            onTap: _loading ? null : _changePhone,
                            semanticLabel: l10n.oauthLinkChangePhone,
                            child: Text(
                              l10n.authChange,
                              style: PqText.text(15, FontWeight.w700, c: pq.accent),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AuthCodeCells(
                        controller: _codeCtrl,
                        focusNode: _codeFocus,
                        state: _codeState,
                        shakeKey: _shake,
                        enabled: !_loading,
                        onChanged: (v) {
                          setState(() {
                            _error = null;
                            _codeState = AuthCodeState.normal;
                          });
                          if (v.length == 6 && !_loading) _confirm();
                        },
                      ),
                      if (_error != null) ...[const SizedBox(height: 12), AuthErrorLine(_error!)],
                    ],
                  ),
                const AuthPush(),
                PqButton(
                  label: _codeSent ? l10n.oauthLinkConfirm : l10n.oauthLinkSendCode,
                  loading: _loading,
                  onPressed:
                      _codeSent ? (codeComplete ? _confirm : null) : (complete ? _sendCode : null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

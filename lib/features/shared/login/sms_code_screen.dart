import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import 'auth_ui.dart';

/// Ввод кода из SMS (макет SmsCode). Код вводится системной цифровой
/// клавиатурой с автоподстановкой из сообщений; вход — автоматически
/// после 6-й цифры. Маршрут `/login/code?phone=…` (SMS уже отправлено).
class SmsCodeScreen extends ConsumerStatefulWidget {
  const SmsCodeScreen({super.key, required this.phone});

  final String phone;

  @override
  ConsumerState<SmsCodeScreen> createState() => _SmsCodeScreenState();
}

class _SmsCodeScreenState extends ConsumerState<SmsCodeScreen> {
  static const _len = 6;
  static const _resendSeconds = 60;

  final _codeCtrl = TextEditingController();
  final _codeFocus = FocusNode();
  bool _loading = false;
  AuthCodeState _state = AuthCodeState.normal;
  String? _error;
  int _shake = 0;
  Timer? _resendTimer;
  int _resendLeft = 0;

  @override
  void initState() {
    super.initState();
    _startResend();
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    _codeFocus.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startResend() {
    _resendTimer?.cancel();
    setState(() => _resendLeft = _resendSeconds);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _resendLeft--);
      if (_resendLeft <= 0) t.cancel();
    });
  }

  void _onChanged(String v) {
    if (_state == AuthCodeState.error) {
      setState(() {
        _state = AuthCodeState.normal;
        _error = null;
      });
    }
    if (v.length == _len && !_loading) _submitCode();
  }

  Future<void> _submitCode() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final session = await ref
          .read(apiProvider)
          .auth
          .confirmCode(widget.phone, _codeCtrl.text.trim());
      if (!mounted) return;
      setState(() => _state = AuthCodeState.success);
      // Показать успех (pqPop/pqRing), затем войти — роутер уведёт дальше.
      if (!PqMotion.reduced(context)) {
        await Future<void>.delayed(const Duration(milliseconds: 450));
      }
      await ref.read(authControllerProvider.notifier).completeLogin(session);
    } catch (e) {
      if (mounted) {
        setState(() {
          _state = AuthCodeState.error;
          _error = e.toString();
          _shake++;
        });
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _resend() async {
    setState(() => _loading = true);
    try {
      await ref.read(apiProvider).auth.sendSms(widget.phone);
      if (!mounted) return;
      _codeCtrl.clear();
      setState(() {
        _state = AuthCodeState.normal;
        _error = null;
      });
      _startResend();
      _codeFocus.requestFocus();
    } catch (e) {
      if (mounted) showPqToast(context, e.toString(), tone: PqTone.danger);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _changeNumber() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/login');
    }
  }

  String get _timer {
    final m = _resendLeft ~/ 60;
    final s = (_resendLeft % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final canResend = _resendLeft <= 0 && !_loading;
    final resendColor = canResend ? pq.accent : pq.textMuted;

    return AuthScreen(
      child: AuthFlow(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        children: [
          const AuthHeader(),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: AuthTitleBlock(
              title: l10n.oauthLinkCodeLabel,
              subtitleWidget: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${l10n.authCodeSentTo(authPrettyPhone(widget.phone))} · ',
                    style: PqText.text(15, FontWeight.w400, c: pq.textMuted),
                  ),
                  PqPressable(
                    onTap: _loading ? null : _changeNumber,
                    semanticLabel: l10n.oauthLinkChangePhone,
                    child: Text(
                      l10n.authChange,
                      style: PqText.text(15, FontWeight.w700, c: pq.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AuthCodeCells(
            controller: _codeCtrl,
            focusNode: _codeFocus,
            onChanged: _onChanged,
            length: _len,
            state: _state,
            shakeKey: _shake,
            enabled: _state != AuthCodeState.success,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            layoutBuilder:
                (current, previous) => Stack(
                  alignment: Alignment.topLeft,
                  children: [...previous, if (current != null) current],
                ),
            child:
                _error != null
                    ? AuthErrorLine(_error!, key: ValueKey(_error))
                    : Text(
                      l10n.authCodeAuto,
                      key: const ValueKey('hint'),
                      style: PqText.body(c: pq.textMuted),
                    ),
          ),
          const AuthPush(),
          Center(
            child: PqPressable(
              onTap: canResend ? _resend : null,
              semanticLabel: canResend ? l10n.loginResendAgain : l10n.authResendIn(_timer),
              child: SizedBox(
                height: 44,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PqIcon(PqIcons.refresh, size: 18, color: resendColor),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          canResend || _resendLeft <= 0
                              ? l10n.loginResendAgain
                              : l10n.authResendIn(_timer),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: PqText.text(15, FontWeight.w600, c: resendColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

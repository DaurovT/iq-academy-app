import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/oauth.dart';
import '../widgets/pharm_academy_logo.dart';

/// Подтверждение номера после первого входа через Google/Apple.
/// Номер связывает внешний вход с аккаунтом и данными из ботов (баллы, роли);
/// нужно один раз — дальше вход через Google/Apple сразу пускает внутрь.
class OAuthLinkScreen extends ConsumerStatefulWidget {
  const OAuthLinkScreen({super.key, required this.linkToken, this.fullName});

  final String linkToken;
  final String? fullName;

  @override
  ConsumerState<OAuthLinkScreen> createState() => _OAuthLinkScreenState();
}

class _OAuthLinkScreenState extends ConsumerState<OAuthLinkScreen> {
  final _phoneCtrl = TextEditingController(text: '+998');
  final _codeCtrl = TextEditingController();
  bool _codeSent = false;
  bool _loading = false;
  String? _error;

  static const _bg = Color(0xFF0A0F1E);
  static const _field = Color(0xFF131D35);
  static const _fieldBorder = Color(0xFF253152);
  static const _blue = Color(0xFF1A75FF);
  static const _sub = Color(0xFF6B7A99);

  String get _phone => _phoneCtrl.text.trim();

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _codeCtrl.dispose();
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
      if (mounted) setState(() => _error = e.toString());
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
            await ref.read(authControllerProvider.notifier).completeLogin(session);
          case OAuthRegisterRequired(:final linkToken, :final phone):
            // номера нет ни у нас, ни в ботах — регистрация с уже подтверждённым номером
            context.go(Uri(path: '/register', queryParameters: {
              'phone': phone,
              'link': linkToken,
            }).toString());
          case OAuthLinkRequired():
            break;
        }
      });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () =>
                    context.canPop() ? context.pop() : context.go('/login'),
              ),
            ),
            const SizedBox(height: 16),
            const Center(child: PharmAcademyLogo(height: 36)),
            const SizedBox(height: 32),
            Text(l10n.oauthLinkTitle,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Text(l10n.oauthLinkBody,
                style: const TextStyle(fontSize: 15, height: 1.4, color: _sub)),
            const SizedBox(height: 24),
            _input(
              controller: _phoneCtrl,
              label: l10n.oauthLinkPhoneLabel,
              enabled: !_codeSent,
              keyboard: TextInputType.phone,
              formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))],
            ),
            if (_codeSent) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(l10n.oauthLinkCodeSent(_phone),
                        style: const TextStyle(fontSize: 13, color: _sub)),
                  ),
                  TextButton(
                    onPressed: _loading
                        ? null
                        : () => setState(() {
                              _codeSent = false;
                              _codeCtrl.clear();
                            }),
                    child: Text(l10n.oauthLinkChangePhone),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _input(
                controller: _codeCtrl,
                label: l10n.oauthLinkCodeLabel,
                keyboard: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                autofocus: true,
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!,
                  style: const TextStyle(color: Color(0xFFF04452), fontSize: 13)),
            ],
            const SizedBox(height: 20),
            SizedBox(
              height: 52,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: _blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _loading ? null : (_codeSent ? _confirm : _sendCode),
                child: _loading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : Text(
                        _codeSent ? l10n.oauthLinkConfirm : l10n.oauthLinkSendCode,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required String label,
    bool enabled = true,
    bool autofocus = false,
    TextInputType? keyboard,
    List<TextInputFormatter>? formatters,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      autofocus: autofocus,
      keyboardType: keyboard,
      inputFormatters: formatters,
      style: const TextStyle(fontSize: 17, color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: _sub),
        filled: true,
        fillColor: _field,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: _fieldBorder)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: _fieldBorder)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: _blue)),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../widgets/pharm_academy_logo.dart';
import 'telegram_login.dart';

/// Вход по номеру телефона и SMS-коду. Перенесён из макета Figma
/// «pharmiq-login» / «pharmiq-login-code».
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

enum _Step { phone, code }

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneCtrl = TextEditingController(text: '+998');
  final _codeCtrl = TextEditingController();
  final _codeFocus = FocusNode();
  _Step _step = _Step.phone;
  bool _loading = false;
  bool _phoneNotFound = false;
  String? _error;
  Timer? _resendTimer;
  int _resendLeft = 0;

  static const _bg = Color(0xFF0A0F1E);
  static const _field = Color(0xFF131D35);
  static const _fieldBorder = Color(0xFF253152);
  static const _blue = Color(0xFF1A75FF);
  static const _sub = Color(0xFF6B7A99);

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _codeCtrl.dispose();
    _codeFocus.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  String get _phone => _phoneCtrl.text.trim();

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

  void _startResend() {
    _resendTimer?.cancel();
    setState(() => _resendLeft = 180);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _resendLeft--);
      if (_resendLeft <= 0) t.cancel();
    });
  }

  Future<void> _submitPhone() => _run(() async {
        final api = ref.read(apiProvider).auth;
        final res = await api.checkNumber(_phone);
        if (!res.exists) {
          // Номер не зарегистрирован: сообщаем об этом и предлагаем выбор —
          // ввести номер снова или пройти регистрацию (не редиректим сразу).
          if (mounted) setState(() => _phoneNotFound = true);
          return;
        }
        await api.sendSms(_phone);
        if (mounted) {
          setState(() => _step = _Step.code);
          _startResend();
          _codeFocus.requestFocus();
        }
      });

  Future<void> _submitCode() => _run(() async {
        final api = ref.read(apiProvider).auth;
        final session = await api.confirmCode(_phone, _codeCtrl.text.trim());
        await ref.read(authControllerProvider.notifier).completeLogin(session);
      });

  Future<void> _resend() => _run(() async {
        await ref.read(apiProvider).auth.sendSms(_phone);
        _startResend();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  const Color(0xFF1A75FF).withValues(alpha: 0.35),
                  const Color(0xFF1A75FF).withValues(alpha: 0),
                ]),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PharmAcademyLogo(height: 34),
                  const SizedBox(height: 40),
                  const Text('Обучайся.\nПрименяй.\nДостигай.',
                      style: TextStyle(
                          fontSize: 38,
                          height: 1.05,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFEFEFE))),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Вход',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFEFEFE))),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A2040),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFFEFEFE)),
                        ),
                        child: const Text('RU',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFEFEFE))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _step == _Step.phone
                        ? 'Войдите по номеру телефона'
                        : 'Код из SMS на $_phone',
                    style: const TextStyle(fontSize: 14, color: _sub),
                  ),
                  const SizedBox(height: 24),
                  if (_step == _Step.phone) ..._phoneStep() else ..._codeStep(),
                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Text(_error!,
                        style: const TextStyle(
                            color: Color(0xFFFF6B6B), fontSize: 13)),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _phoneStep() {
    return [
      const Text('Номер телефона',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFEFEFE))),
      const SizedBox(height: 8),
      Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: _field,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: _phoneNotFound ? const Color(0xFFF04452) : _fieldBorder),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                style:
                    const TextStyle(fontSize: 16, color: Color(0xFFFEFEFE)),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9+ ]')),
                ],
                onChanged: (_) {
                  if (_phoneNotFound) setState(() => _phoneNotFound = false);
                },
                decoration: const InputDecoration(
                  isCollapsed: true,
                  filled: false,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      if (_phoneNotFound) ...[
        const SizedBox(height: 8),
        const Text('Номер не найден в системе',
            style: TextStyle(color: Color(0xFFF04452), fontSize: 13)),
      ],
      const SizedBox(height: 16),
      _primaryButton(
          label: 'Подтвердить', onTap: _loading ? null : _submitPhone),
      if (_phoneNotFound) ...[
        const SizedBox(height: 12),
        _secondaryButton(
          label: 'Пройти регистрацию',
          onTap: () =>
              context.go('/register?phone=${Uri.encodeComponent(_phone)}'),
        ),
      ] else ...[
        const SizedBox(height: 16),
        _orDivider(),
        const SizedBox(height: 16),
        const TelegramLoginButton(),
        const SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: () => context.go('/register'),
            child: const Text('Зарегистрироваться',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFEFEFE))),
          ),
        ),
      ],
    ];
  }

  List<Widget> _codeStep() {
    return [
      _codeBoxes(),
      const SizedBox(height: 20),
      _primaryButton(label: 'Войти', onTap: _loading ? null : _submitCode),
      const SizedBox(height: 16),
      Center(
        child: _resendLeft > 0
            ? Text('Повтор через $_resendLeft с',
                style: const TextStyle(fontSize: 13, color: _sub))
            : TextButton(
                onPressed: _loading ? null : _resend,
                child: const Text('Отправить снова',
                    style: TextStyle(fontSize: 14, color: _blue)),
              ),
      ),
      Center(
        child: TextButton(
          onPressed: () => setState(() {
            _step = _Step.phone;
            _error = null;
            _codeCtrl.clear();
          }),
          child: const Text('‹ Изменить номер',
              style: TextStyle(fontSize: 14, color: _sub)),
        ),
      ),
    ];
  }

  Widget _codeBoxes() {
    const len = 6;
    return Stack(
      children: [
        Row(
          children: [
            for (var i = 0; i < len; i++) ...[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.85,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _field,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: i == _codeCtrl.text.length
                            ? _blue
                            : _fieldBorder,
                      ),
                    ),
                    child: Text(
                      i < _codeCtrl.text.length ? _codeCtrl.text[i] : '',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFEFEFE)),
                    ),
                  ),
                ),
              ),
              if (i < len - 1) const SizedBox(width: 8),
            ],
          ],
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0,
            child: TextField(
              controller: _codeCtrl,
              focusNode: _codeFocus,
              autofocus: true,
              keyboardType: TextInputType.number,
              maxLength: len,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (v) {
                setState(() {});
                if (v.length == len && !_loading) _submitCode();
              },
              decoration: const InputDecoration(counterText: ''),
            ),
          ),
        ),
      ],
    );
  }

  Widget _primaryButton({required String label, VoidCallback? onTap}) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: _blue,
          foregroundColor: Colors.white,
          disabledBackgroundColor: _blue.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: onTap,
        child: _loading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white))
            : Text(label,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _secondaryButton({required String label, VoidCallback? onTap}) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFFFEFEFE),
          backgroundColor: const Color(0xFF0E1428),
          side: const BorderSide(color: _fieldBorder),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: _loading ? null : onTap,
        child: Text(label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _orDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFF253152))),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('или', style: TextStyle(fontSize: 13, color: Color(0xFF4A5568))),
        ),
        const Expanded(child: Divider(color: Color(0xFF253152))),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import 'telegram_login.dart';

/// Вход по номеру телефона и SMS-коду. Два шага: телефон → код.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

enum _Step { phone, code }

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneCtrl = TextEditingController(text: '+998');
  final _codeCtrl = TextEditingController();
  _Step _step = _Step.phone;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _codeCtrl.dispose();
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

  Future<void> _submitPhone() => _run(() async {
        final api = ref.read(apiProvider).auth;
        final res = await api.checkNumber(_phone);
        if (!res.exists) {
          if (mounted) {
            context.go('/register?phone=${Uri.encodeComponent(_phone)}');
          }
          return;
        }
        await api.sendSms(_phone);
        if (mounted) setState(() => _step = _Step.code);
      });

  Future<void> _submitCode() => _run(() async {
        final api = ref.read(apiProvider).auth;
        final session = await api.confirmCode(_phone, _codeCtrl.text.trim());
        await ref.read(authControllerProvider.notifier).completeLogin(session);
        // Дальше роутер сам уведёт на /role или /home.
      });

  @override
  Widget build(BuildContext context) {
    final onCode = _step == _Step.code;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('IQ Academy',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(
                    onCode
                        ? 'Введите код из SMS на $_phone'
                        : 'Вход по номеру телефона',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  if (!onCode)
                    TextField(
                      controller: _phoneCtrl,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Номер телефона',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                    )
                  else
                    TextField(
                      controller: _codeCtrl,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Код из SMS',
                        prefixIcon: Icon(Icons.sms_outlined),
                      ),
                    ),
                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Text(_error!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error)),
                  ],
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: _loading
                        ? null
                        : (onCode ? _submitCode : _submitPhone),
                    child: _loading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(onCode ? 'Войти' : 'Получить код'),
                  ),
                  if (onCode)
                    TextButton(
                      onPressed: _loading
                          ? null
                          : () => setState(() {
                                _step = _Step.phone;
                                _error = null;
                              }),
                      child: const Text('Изменить номер'),
                    ),
                  if (!onCode) ...[
                    const SizedBox(height: 16),
                    Row(children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('или',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      const Expanded(child: Divider()),
                    ]),
                    const SizedBox(height: 16),
                    const TelegramLoginButton(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

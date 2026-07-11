import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/account.dart';

/// Кнопка входа через Telegram-бота: открывает deep-link и опрашивает статус
/// по nonce, пока пользователь подтверждает вход в боте.
class TelegramLoginButton extends ConsumerStatefulWidget {
  const TelegramLoginButton({super.key});

  @override
  ConsumerState<TelegramLoginButton> createState() => _TelegramLoginButtonState();
}

class _TelegramLoginButtonState extends ConsumerState<TelegramLoginButton> {
  bool _busy = false;
  Timer? _poll;

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final api = ref.read(apiProvider).auth;
      final start = await api.telegramStart();
      final uri = Uri.parse(start.deepLink);
      await launchUrl(uri, mode: LaunchMode.externalApplication);

      // Поллинг статуса, пока не done/expired (или таймаут по expiresIn).
      final deadline = start.expiresIn;
      var elapsed = 0;
      _poll?.cancel();
      _poll = Timer.periodic(const Duration(seconds: 2), (t) async {
        elapsed += 2;
        if (elapsed > deadline) {
          t.cancel();
          if (mounted) setState(() => _busy = false);
          messenger.showSnackBar(
              const SnackBar(content: Text('Время входа истекло')));
          return;
        }
        try {
          final res = await api.telegramPoll(start.nonce);
          switch (res) {
            case TgPollDone(:final token, :final account):
              t.cancel();
              await ref
                  .read(authControllerProvider.notifier)
                  .completeLogin(Session(token: token, account: account));
            case TgPollExpired():
              t.cancel();
              if (mounted) setState(() => _busy = false);
              messenger.showSnackBar(
                  const SnackBar(content: Text('Время входа истекло')));
            case TgPollPending():
              break; // ждём дальше
          }
        } catch (_) {
          // сетевую ошибку одного тика игнорируем, продолжаем поллинг
        }
      });
    } catch (e) {
      if (mounted) setState(() => _busy = false);
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: _busy ? null : _start,
      icon: _busy
          ? const SizedBox(
              height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
          : const Icon(Icons.telegram),
      label: Text(_busy ? 'Ожидание подтверждения…' : 'Войти через Telegram'),
    );
  }
}

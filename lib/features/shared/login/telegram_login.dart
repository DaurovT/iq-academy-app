import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/account.dart';
import 'social_login_buttons.dart';

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
    final l10n = context.l10n;
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
              SnackBar(content: Text(l10n.tgLoginExpired)));
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
                  SnackBar(content: Text(l10n.tgLoginExpired)));
            case TgPollPending():
              break; // ждём дальше
          }
        } on DioException catch (_) {
          // сетевую ошибку одного тика игнорируем, продолжаем поллинг
        } catch (e, st) {
          // Ответ пришёл, но не разобрался (несовпадение схемы `done`).
          // Это не самоисправится — прекращаем ожидание и показываем причину,
          // иначе спиннер «Ожидание подтверждения…» висит вечно.
          t.cancel();
          if (kDebugMode) debugPrint('[tg/poll] parse error: $e\n$st');
          if (mounted) setState(() => _busy = false);
          messenger.showSnackBar(
              SnackBar(content: Text(l10n.tgLoginParseError(e))));
        }
      });
    } catch (e) {
      if (mounted) setState(() => _busy = false);
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      label: _busy ? context.l10n.tgWaitingConfirm : context.l10n.tgLoginButton,
      icon: const Icon(Icons.telegram, size: 24, color: Colors.white),
      background: const Color(0xFF2AABEE),
      foreground: Colors.white,
      busy: _busy,
      onTap: _start,
    );
  }
}

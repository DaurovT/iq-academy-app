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
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF2AABEE),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: _busy ? null : _start,
        icon: _busy
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white))
            : const Icon(Icons.telegram, size: 22),
        label: Text(
          _busy ? context.l10n.tgWaitingConfirm : context.l10n.tgLoginButton,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

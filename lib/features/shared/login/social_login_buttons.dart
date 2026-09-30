import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/social_sign_in.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/account.dart';
import '../../../core/models/oauth.dart';

/// Альтернативные способы входа (макет Login): разделитель «или» и сетка
/// кнопок Apple · Google · Telegram (высота 52, радиус 14).
///
/// Apple — только на iOS, Google — где заданы client ID (Android/iOS),
/// Telegram — везде (deep-link в бота + опрос статуса по nonce).
class SocialLoginButtons extends ConsumerStatefulWidget {
  const SocialLoginButtons({super.key});

  @override
  ConsumerState<SocialLoginButtons> createState() => _SocialLoginButtonsState();
}

class _SocialLoginButtonsState extends ConsumerState<SocialLoginButtons> {
  String? _busy; // провайдер, вход через который сейчас идёт
  Timer? _poll;

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  void _toast(String message) {
    if (!mounted) return;
    showPqToast(context, message, tone: PqTone.danger);
  }

  Future<void> _signIn(String provider) async {
    if (_busy != null) return;
    setState(() => _busy = provider);
    try {
      final c = provider == 'apple' ? await SocialSignIn.apple() : await SocialSignIn.google();
      final res = await ref
          .read(apiProvider)
          .auth
          .oauth(
            c.provider,
            c.idToken,
            nonce: c.nonce,
            authorizationCode: c.authorizationCode,
            fullName: c.fullName,
          );
      if (!mounted) return;
      switch (res) {
        case OAuthDone(:final session):
          // дальше переводит защита роутера — как после входа по SMS
          await ref.read(authControllerProvider.notifier).completeLogin(session);
        case OAuthLinkRequired(:final linkToken, :final fullName):
          context.push(
            Uri(
              path: '/oauth-link',
              queryParameters: {'token': linkToken, if (fullName != null) 'name': fullName},
            ).toString(),
          );
        case OAuthRegisterRequired():
          break; // /auth/oauth так не отвечает — только шаг подтверждения номера
      }
    } on SocialSignInCanceled {
      // пользователь закрыл окно входа
    } catch (e) {
      _toast(e.toString());
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  /// Вход через Telegram-бота: открываем deep-link и опрашиваем статус
  /// по nonce, пока пользователь подтверждает вход в боте.
  Future<void> _telegram() async {
    if (_busy != null) return;
    setState(() => _busy = 'telegram');
    final l10n = context.l10n;
    try {
      final api = ref.read(apiProvider).auth;
      final start = await api.telegramStart();
      await launchUrl(Uri.parse(start.deepLink), mode: LaunchMode.externalApplication);

      // Поллинг статуса, пока не done/expired (или таймаут по expiresIn).
      final deadline = start.expiresIn;
      var elapsed = 0;
      _poll?.cancel();
      _poll = Timer.periodic(const Duration(seconds: 2), (t) async {
        elapsed += 2;
        if (elapsed > deadline) {
          t.cancel();
          if (mounted) setState(() => _busy = null);
          _toast(l10n.tgLoginExpired);
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
              if (mounted) setState(() => _busy = null);
              _toast(l10n.tgLoginExpired);
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
          if (mounted) setState(() => _busy = null);
          _toast(l10n.tgLoginParseError(e));
        }
      });
    } catch (e) {
      if (mounted) setState(() => _busy = null);
      _toast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final tiles = <Widget>[
      if (SocialSignIn.appleAvailable)
        _SocialTile(
          icon: PqIcons.apple,
          iconSize: 20,
          label: 'Apple',
          semanticLabel: l10n.loginWithApple,
          busy: _busy == 'apple',
          onTap: _busy == null ? () => _signIn('apple') : null,
        ),
      if (SocialSignIn.googleAvailable)
        _SocialTile(
          icon: PqIcons.google,
          iconSize: 18,
          label: 'Google',
          semanticLabel: l10n.loginWithGoogle,
          busy: _busy == 'google',
          onTap: _busy == null ? () => _signIn('google') : null,
        ),
      _SocialTile(
        icon: PqIcons.telegram,
        iconSize: 20,
        label: 'Telegram',
        semanticLabel: l10n.tgLoginButton,
        busy: _busy == 'telegram',
        onTap: _busy == null ? _telegram : null,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Container(height: 1, color: pq.border)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(l10n.loginOr, style: PqText.body(c: pq.textMuted)),
            ),
            Expanded(child: Container(height: 1, color: pq.border)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (var i = 0; i < tiles.length; i++) ...[
              if (i > 0) const SizedBox(width: 10),
              Expanded(child: tiles[i]),
            ],
          ],
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          child:
              _busy == 'telegram'
                  ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: PqAnimate(
                      fx: PqFx.fade,
                      child: Text(
                        l10n.tgWaitingConfirm,
                        textAlign: TextAlign.center,
                        style: PqText.body(c: pq.textMuted),
                      ),
                    ),
                  )
                  : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}

/// Кнопка провайдера: 52, радиус 14, рамка, значок + название 15/600.
class _SocialTile extends StatelessWidget {
  const _SocialTile({
    required this.icon,
    required this.iconSize,
    required this.label,
    required this.semanticLabel,
    required this.busy,
    required this.onTap,
  });

  final PqIcons icon;
  final double iconSize;
  final String label;
  final String semanticLabel;
  final bool busy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      semanticLabel: semanticLabel,
      child: Builder(
        builder: (context) {
          final pressed = PqPressedScope.of(context);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: pressed ? pq.border : pq.fieldBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: pressed ? pq.borderStrong : pq.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 20,
                  child: Center(
                    child:
                        busy
                            ? PqSpinner(
                              color: pq.accent,
                              trackColor: pq.border,
                              size: 18,
                              stroke: 2,
                            )
                            : PqIcon(icon, size: iconSize, color: pq.text),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.text(15, FontWeight.w600, c: pq.text),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

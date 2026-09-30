import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../login/auth_ui.dart';

/// Праймер перед системным запросом разрешения на уведомления (макет
/// PermNotif), маршрут `/push-primer`. «Включить» — системный запрос и
/// привязка токена; «Не сейчас» — просто закрыть.
class PushPrimerScreen extends ConsumerStatefulWidget {
  const PushPrimerScreen({super.key, this.onRequested});

  /// После системного запроса: привязать токен устройства
  /// (маршрут передаёт `PushService.syncToken`).
  final void Function(WidgetRef ref)? onRequested;

  @override
  ConsumerState<PushPrimerScreen> createState() => _PushPrimerScreenState();
}

class _PushPrimerScreenState extends ConsumerState<PushPrimerScreen> {
  bool _busy = false;

  void _close() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/app');
    }
  }

  Future<void> _enable() async {
    setState(() => _busy = true);
    final supported =
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS);
    if (supported) {
      try {
        await FirebaseMessaging.instance.requestPermission(alert: true, badge: true, sound: true);
        // Токен на сервер — как после входа (без ожидания: на iOS до 20 с).
        widget.onRequested?.call(ref);
      } catch (e) {
        debugPrint('PushPrimer.requestPermission: $e');
      }
    }
    if (mounted) _close();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;

    Widget sample(String time, String title, String body, int delayMs) => PqAnimate(
      fx: PqFx.toast,
      duration: const Duration(milliseconds: 450),
      delay: Duration(milliseconds: delayMs),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: pq.border),
          boxShadow: pq.cardShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const AuthLogoMark(width: 32, height: 31),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'PharmIQ',
                          style: PqText.caption(c: pq.textMuted, w: FontWeight.w700),
                        ),
                      ),
                      Text(time, style: PqText.caption(c: pq.textMuted)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(title, style: PqText.text(15, FontWeight.w700, c: pq.text)),
                  const SizedBox(height: 2),
                  Text(body, style: PqText.body(c: pq.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return AuthScreen(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PqAnimate(
                        fx: PqFx.pop,
                        child: PqBob(
                          duration: const Duration(milliseconds: 3200),
                          delay: const Duration(milliseconds: 600),
                          child: Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                              color: pq.accentSoft,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            alignment: Alignment.center,
                            child: PqIcon(PqIcons.bell, size: 47, color: pq.accentText),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PqAnimate(
                        delay: PqMotion.staggerDelay(1, maxIndex: 4),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Text(
                            l10n.authPushTitle,
                            textAlign: TextAlign.center,
                            style: PqText.heading(26, FontWeight.w700, height: 1.2, c: pq.text),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PqAnimate(
                        delay: PqMotion.staggerDelay(2, maxIndex: 4),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 330),
                          child: Text(
                            l10n.authPushBody,
                            textAlign: TextAlign.center,
                            style: PqText.bodyLarge(c: pq.textMuted),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      sample(
                        l10n.authPushNow,
                        l10n.authPushSample1Title,
                        l10n.authPushSample1Body,
                        300,
                      ),
                      const SizedBox(height: 8),
                      sample(
                        l10n.authPushSample2Time,
                        l10n.authPushSample2Title,
                        l10n.authPushSample2Body,
                        450,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PqButton(label: l10n.authPushEnable, loading: _busy, onPressed: _enable),
            const SizedBox(height: 6),
            PqPressable(
              onTap: _busy ? null : _close,
              semanticLabel: l10n.authPushLater,
              child: SizedBox(
                height: 48,
                child: Center(
                  child: Text(
                    l10n.authPushLater,
                    style: PqText.text(15, FontWeight.w600, c: pq.accent),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

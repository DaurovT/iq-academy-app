import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';

/// «Аккаунт удалён» (макет AccountDeleted): фон с плавающими пятнами,
/// галочка pqPop, каскад pq-auth, кнопки «Создать новый аккаунт» / «Закрыть».
class AccountDeletedScreen extends StatelessWidget {
  const AccountDeletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    Widget up(int i, Widget child) => PqAnimate(
          delay: PqMotion.staggerDelay(i, maxIndex: 4),
          child: child,
        );
    return PqScreen(
      drift: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 34),
        child: Column(children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  PqAnimate(
                    fx: PqFx.pop,
                    child: Container(
                      width: 104,
                      height: 104,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: pq.surfaceAlt, shape: BoxShape.circle),
                      child: PqIcon(PqIcons.check, size: 44, color: pq.textSecondary),
                    ),
                  ),
                  const SizedBox(height: 12 + 18),
                  up(1, Semantics(
                    header: true,
                    child: Text(l.profileDeletedTitle,
                        textAlign: TextAlign.center, style: PqText.headline(c: pq.text)),
                  )),
                  const SizedBox(height: 12),
                  up(2, ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: Text(l.profileDeletedBody,
                        textAlign: TextAlign.center, style: PqText.bodyLarge(c: pq.textMuted)),
                  )),
                  const SizedBox(height: 12 + 16),
                  up(3, PqCard(
                    radius: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(l.profileDeletedCardTitle,
                            style: PqText.body(c: pq.text, w: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text(l.profileDeletedCardBody, style: PqText.body(c: pq.textMuted)),
                      ]),
                    ),
                  )),
                ]),
              ),
            ),
          ),
          PqButton(label: l.profileDeletedNew, onPressed: () => context.go('/login')),
          const SizedBox(height: 6),
          PqPressable(
            onTap: () => context.go('/login'),
            child: SizedBox(
              height: 48,
              child: Center(
                child: Text(l.profileClose,
                    style: PqText.text(15, FontWeight.w600, c: pq.accent)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

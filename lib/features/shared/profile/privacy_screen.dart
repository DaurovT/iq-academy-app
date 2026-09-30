import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import 'profile_widgets.dart';

/// «Конфиденциальность» — краткое описание обработки данных (макет Privacy).
/// Открывается из профиля (`/app/privacy`) и с экранов регистрации
/// (`/register/privacy`); полный текст — `<путь>/full`.
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final sections = [
      (PqIcons.shield, l.profilePrivacyCollectTitle, l.profilePrivacyCollectBody),
      (PqIcons.check, l.profilePrivacyWhyTitle, l.profilePrivacyWhyBody),
      (PqIcons.users, l.profilePrivacyWhoTitle, l.profilePrivacyWhoBody),
      (PqIcons.lock, l.profilePrivacyStoreTitle, l.profilePrivacyStoreBody),
      (PqIcons.trash, l.profilePrivacyDeleteTitle, l.profilePrivacyDeleteBody),
    ];
    final fullPath = '${GoRouterState.of(context).uri.path}/full';
    return PqScreen(
      child: Column(children: [
        PqTopBar(
          title: l.profilePrivacyShort,
          backLabel: l.profileBack,
          onBack: () => profileGoBack(context),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: PqStagger.auth(
              gap: 22,
              children: [
                Semantics(
                  header: true,
                  child: Text(l.profilePrivacyHeadline, style: PqText.display(c: pq.text)),
                ),
                ProfileWarnBanner(l.profilePrivacyDraft),
                for (final (icon, title, body) in sections)
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    PqIconTile(icon, size: 40, radius: 12, iconSize: 20),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(title, style: PqText.title(c: pq.text)),
                        const SizedBox(height: 4),
                        Text(body,
                            style: PqText.text(15, FontWeight.w400, height: 1.55, c: pq.textSecondary)),
                      ]),
                    ),
                  ]),
                PqPressable(
                  onTap: () => context.push(fullPath),
                  child: SizedBox(
                    height: 48,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(l.profilePrivacyFullLink,
                          style: PqText.text(15, FontWeight.w600, c: pq.accent)),
                      const SizedBox(width: 6),
                      PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

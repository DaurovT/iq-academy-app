import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/legal.dart';
import 'sapper_widgets.dart';

/// Официальные правила акции «Супер Сапёр» — главное в приложении, полные — на сайте.
/// App Store (5.3) и Google Play требуют, чтобы правила призовой акции были доступны в
/// приложении до участия: экран открывается со страницы акции и из подтверждения клеток.
/// Отдельного макета нет — оформлен в стиле SapperIntro («Как участвовать»).
class SapperRulesScreen extends StatelessWidget {
  const SapperRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final rules = [
      l10n.sapperRule1, l10n.sapperRule2, l10n.sapperRule3, l10n.sapperRule4,
      l10n.sapperRule5, l10n.sapperRule6, l10n.sapperRule7, l10n.sapperRule8,
    ];
    return PqScreen(
      child: Column(children: [
        SapperBackLink(
          label: l10n.sapperTitle,
          onTap: () => context.canPop() ? context.pop() : context.go('/app/sapper'),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            children: [
              PqStagger.auth(gap: 24, children: [
                Text(l10n.sapperRulesTitle, style: PqText.display(c: pq.text)),
                PqCard(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: Column(children: [
                    for (var i = 0; i < rules.length; i++)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          border: i < rules.length - 1
                              ? Border(bottom: BorderSide(color: pq.divider))
                              : null,
                        ),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: pq.accentSoft,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text('${i + 1}',
                                style: PqText.text(13, FontWeight.w800,
                                    height: 1, c: pq.accentText)),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(rules[i],
                                style: PqText.text(15, FontWeight.w400,
                                    height: 1.5, c: pq.textSecondary)),
                          ),
                        ]),
                      ),
                  ]),
                ),
                PqButton(
                  label: l10n.sapperRulesFull,
                  kind: PqButtonKind.secondary,
                  icon: PqIcons.externalLink,
                  onPressed: () => launchUrl(Uri.parse(kSapperRulesUrl),
                      mode: LaunchMode.externalApplication),
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}

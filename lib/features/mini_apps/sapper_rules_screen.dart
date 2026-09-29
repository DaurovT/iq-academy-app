import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/l10n/l10n.dart';
import '../../core/legal.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';

/// Официальные правила акции «Супер Сапёр» — главное в приложении, полные — на сайте.
/// App Store (5.3) и Google Play требуют, чтобы правила призовой акции были доступны в
/// приложении до участия: экран открывается со списка акций и из подтверждения клетки.
class SapperRulesScreen extends StatelessWidget {
  const SapperRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final l10n = context.l10n;
    final rules = [
      l10n.sapperRule1, l10n.sapperRule2, l10n.sapperRule3, l10n.sapperRule4,
      l10n.sapperRule5, l10n.sapperRule6, l10n.sapperRule7, l10n.sapperRule8,
    ];
    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: p.textPrimary),
                    onPressed: () =>
                        context.canPop() ? context.pop() : context.go('/app/sapper'),
                  ),
                ),
                Text(l10n.sapperRulesTitle,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: p.textPrimary)),
                const SizedBox(height: 16),
                for (var i = 0; i < rules.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: p.accent.withValues(alpha: 0.14),
                              shape: BoxShape.circle),
                          child: Text('${i + 1}',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: p.accent)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(rules[i],
                              style: TextStyle(
                                  fontSize: 15, height: 1.4, color: p.textPrimary)),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  icon: const Icon(Icons.open_in_new, size: 18),
                  label: Text(l10n.sapperRulesFull),
                  onPressed: () => launchUrl(Uri.parse(kSapperRulesUrl),
                      mode: LaunchMode.externalApplication),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

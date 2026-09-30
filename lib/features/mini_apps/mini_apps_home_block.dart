import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';

/// Карточка «Мини-приложения» на главной (макет Refined): плитка 48 с сеткой,
/// заголовок + подпись, акцентный шеврон. Ведёт в список мини-приложений.
class MiniAppsHomeBlock extends StatelessWidget {
  const MiniAppsHomeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqPressable(
      onTap: () => context.push('/app/mini-apps'),
      semanticLabel: l.miniAppsTitle,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: pq.border),
        ),
        child: Row(children: [
          PqIconTile(
            PqIcons.grid,
            size: 48,
            iconSize: 22,
            background: pq.isDark ? pq.accentSoft : const Color(0xFFDFE7F4),
            foreground: pq.accent,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l.miniAppsTitle, style: PqText.rowTitle(c: pq.text)),
              const SizedBox(height: 2),
              Text(l.homeMiniAppsSub, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
            ]),
          ),
          const SizedBox(width: 14),
          PqIcon(PqIcons.chevronRight, size: 20, color: pq.accent),
        ]),
      ),
    );
  }
}

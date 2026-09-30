import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../widgets/pq_states.dart';
import 'providers.dart';

/// Распознанный текст бланка (макет RxOcr): предупреждение о скрытом ФИО,
/// моноширинный текст из `aiText`, «Копировать» и «Ошибка в тексте».
class RecipeTextScreen extends ConsumerWidget {
  const RecipeTextScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final detail = ref.watch(recipeDetailProvider(id));
    return PqScreen(
      child: Column(children: [
        PqTopBar(
          title: l10n.recipeDetailTitle(id),
          backLabel: l10n.rxBack,
          onBack: () => context.canPop()
              ? context.pop()
              : context.go('/app/recipes/$id'),
        ),
        Expanded(
          child: PqAsync<RecipeDetail>(
            value: detail,
            onRetry: () => ref.invalidate(recipeDetailProvider(id)),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            data: (d) => _Body(text: d.aiText?.trim() ?? ''),
          ),
        ),
      ]),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      children: [
        PqStagger(gap: 16, children: [
          PqPageTitle(l10n.rxOcrTitle, subtitle: l10n.rxOcrSubtitle),
          if (text.isEmpty)
            PqEmptyState(
              icon: PqIcons.fileText,
              title: l10n.rxOcrEmpty,
              message: l10n.rxOcrEmptyText,
            )
          else ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: pq.accentSoft,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                PqIcon(PqIcons.lock, size: 18, color: pq.accentText),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.rxOcrNote,
                    style: PqText.text(14, FontWeight.w600,
                        height: 1.5, c: pq.accentText),
                  ),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: pq.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: pq.border),
              ),
              child: SelectableText(
                text,
                style: TextStyle(
                  fontFamily: 'Menlo',
                  fontFamilyFallback: const ['SF Mono', 'Roboto Mono', 'monospace'],
                  fontSize: 14,
                  height: 24 / 14,
                  color: pq.textSecondary,
                ),
              ),
            ),
            Row(children: [
              Expanded(
                child: PqButton(
                  label: l10n.rxCopy,
                  icon: PqIcons.copy,
                  kind: PqButtonKind.secondary,
                  height: 52,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: text));
                    if (!context.mounted) return;
                    showPqToast(context, l10n.rxCopied, icon: PqIcons.copy);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PqButton(
                  label: l10n.rxReportError,
                  icon: PqIcons.alertTriangle,
                  kind: PqButtonKind.secondary,
                  height: 52,
                  onPressed: () => context.push('/app/support'),
                ),
              ),
            ]),
          ],
        ]),
      ],
    );
  }
}

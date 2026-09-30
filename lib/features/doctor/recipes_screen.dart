import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/uploads/upload_queue.dart';
import '../../widgets/pq_states.dart';
import 'providers.dart';
import 'rx_common.dart';

enum _Tab { all, pending, done }

/// «Мои бланки» (макеты RxList и RxEmpty): заголовок со счётчиком,
/// «Отправить бланк», сегменты «Все / На проверке / Завершённые» и
/// карточки бланков. Пока бланков нет — пустое состояние с советами.
class RecipesScreen extends ConsumerStatefulWidget {
  const RecipesScreen({super.key});

  @override
  ConsumerState<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends ConsumerState<RecipesScreen> {
  _Tab _tab = _Tab.all;

  Future<void> _refresh() async {
    ref.invalidate(recipesProvider);
    try {
      await ref.read(recipesProvider.future);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final recipes = ref.watch(recipesProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        const RxTabHeader(),
        Expanded(
          child: PqRefresh(
            onRefresh: _refresh,
            child: PqAsync<List<Recipe>>(
              value: recipes,
              onRetry: _refresh,
              loadingBuilder: (_) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
                child: PqSkeletonList(title: l10n.recipesTitle),
              ),
              data: (all) => all.isEmpty
                  ? const _EmptyView()
                  : _ListView(
                      all: all,
                      tab: _tab,
                      onTab: (t) => setState(() => _tab = t),
                    ),
            ),
          ),
        ),
      ]),
    );
  }
}

// ── Список ──────────────────────────────────────────────────────────────

class _ListView extends ConsumerWidget {
  const _ListView({required this.all, required this.tab, required this.onTab});

  final List<Recipe> all;
  final _Tab tab;
  final ValueChanged<_Tab> onTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final credits = ref.watch(recipeCreditsProvider);
    RxStage stageOf(Recipe r) => r.status.rxStage(credits[r.id]);
    final list = switch (tab) {
      _Tab.all => all,
      _Tab.pending => all.where((r) => stageOf(r) == RxStage.pending).toList(),
      _Tab.done => all.where((r) => stageOf(r) != RxStage.pending).toList(),
    };
    final earned = all.fold<int>(0, (s, r) => s + (credits[r.id] ?? 0));
    final count = l10n.rxListCount(all.length);
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
      children: [
        PqStagger(gap: 20, children: [
          PqPageTitle(l10n.recipesTitle,
              subtitle: earned > 0 ? l10n.rxListCountEarned(count, earned) : count),
          RxSendButton(label: l10n.docHomeSendRecipe),
          PqSegmented<_Tab>(
            values: _Tab.values,
            selected: tab,
            labelOf: (t) => switch (t) {
              _Tab.all => l10n.recipesTabAll,
              _Tab.pending => l10n.rxTabPending,
              _Tab.done => l10n.rxTabDone,
            },
            onChanged: onTab,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            switchInCurve: PqMotion.ease,
            layoutBuilder: (current, previous) => Stack(
              alignment: Alignment.topCenter,
              children: [...previous, if (current != null) current],
            ),
            child: Column(
              key: ValueKey(tab),
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _UploadBanner(bottom: 12),
                if (list.isEmpty)
                  PqEmptyState(
                    icon: PqIcons.fileRx,
                    title: l10n.rxFilterEmpty,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  )
                else
                  for (var i = 0; i < list.length; i++) ...[
                    if (i > 0) const SizedBox(height: 12),
                    _RecipeCard(
                        recipe: list[i],
                        stage: stageOf(list[i]),
                        credited: credits[list[i].id]),
                  ],
              ],
            ),
          ),
        ]),
      ],
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.recipe, required this.stage, this.credited});

  final Recipe recipe;
  final RxStage stage;
  final int? credited;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return PqCard(
      onTap: () => context.push('/app/recipes/${recipe.id}'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          PqIconTile(PqIcons.fileRx, tone: stage.tone, iconSize: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l10n.recipeDetailTitle(recipe.id),
                  style: PqText.heading(16, FontWeight.w700, c: pq.text)),
              const SizedBox(height: 2),
              Text(
                l10n.rxMeta(formatShortDateTime(recipe.createdAt), recipe.photoCount),
                style: PqText.caption(c: pq.textMuted),
              ),
            ]),
          ),
          const SizedBox(width: 12),
          RxStatusBadge(stage),
        ]),
        const SizedBox(height: 12),
        switch (stage) {
          RxStage.approved => _DrugsStrip(
              recipe: recipe, value: l10n.rxSoon, color: pq.success),
          RxStage.credited => _DrugsStrip(
              recipe: recipe,
              value: l10n.rxRewardIqc(credited ?? 0),
              color: pq.tone(PqTone.info).fg),
          RxStage.pending => Row(children: [
              PqBreath(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration:
                      BoxDecoration(color: pq.warning, shape: BoxShape.circle),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(l10n.rxPendingHint,
                    style: rxText14(pq.textMuted)),
              ),
            ]),
          RxStage.rejected => Row(children: [
              PqIcon(PqIcons.alertTriangle, size: 16, color: pq.danger),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  _reason(recipe.rejectReason) ?? l10n.rxRejectedDefault,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: rxText14(pq.danger),
                ),
              ),
              const SizedBox(width: 12),
              PqPillButton(
                label: l10n.rxRetake,
                icon: PqIcons.camera,
                onPressed: () => openRecipeCamera(context),
              ),
            ]),
        },
      ]),
    );
  }

  static String? _reason(String? r) {
    final t = r?.trim() ?? '';
    return t.isEmpty ? null : t;
  }
}

/// Плашка «препараты · Скоро / +N IQC» у одобренного бланка.
class _DrugsStrip extends StatelessWidget {
  const _DrugsStrip({required this.recipe, required this.value, required this.color});

  final Recipe recipe;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final drugs = rxDrugsLine(recipe.drugs);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: pq.surfaceAlt,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        PqIcon(PqIcons.sparkle, size: 16, color: rxSparkleColor(pq)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            drugs.isEmpty ? l10n.recipeDetailNoDrugs : drugs,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: rxText14(drugs.isEmpty ? pq.textMuted : pq.textSecondary),
          ),
        ),
        const SizedBox(width: 12),
        Text(value, style: PqText.heading(15, FontWeight.w700, c: color)),
      ]),
    );
  }
}

/// Бланки из очереди загрузки (офлайн/ретраи): спиннер + «Повторить».
class _UploadBanner extends ConsumerWidget {
  const _UploadBanner({this.bottom = 0});

  final double bottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(pendingUploadCountProvider);
    final pq = context.pq;
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: PqMotion.ease,
      child: count == 0
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: PqCard(
                padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
                child: Row(children: [
                  PqSpinner(color: pq.accent, trackColor: pq.borderStrong, size: 18),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(context.l10n.recipesUploadingBanner(count),
                        style: rxText14(pq.text, FontWeight.w600)),
                  ),
                  PqButton(
                    label: context.l10n.recipesRetry,
                    kind: PqButtonKind.text,
                    expand: false,
                    onPressed: () =>
                        ref.read(uploadQueueProvider.notifier).retryNow(),
                  ),
                ]),
              ),
            ),
    );
  }
}

// ── Пусто (RxEmpty) ─────────────────────────────────────────────────────

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
      children: [
        PqStagger(gap: 22, children: [
          Text(l10n.recipesTitle, style: PqText.display(c: pq.text)),
          Column(children: [
            const _UploadBanner(bottom: 22),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(children: [
                PqAnimate(
                  fx: PqFx.pop,
                  child: PqBob(
                    duration: const Duration(milliseconds: 3200),
                    delay: const Duration(milliseconds: 600),
                    child: const PqIconTile(PqIcons.fileRx,
                        size: 88, radius: 28, iconSize: 40),
                  ),
                ),
                const SizedBox(height: 20),
                Text(l10n.rxEmptyTitle,
                    textAlign: TextAlign.center,
                    style: PqText.emptyTitle(c: pq.text)),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 310),
                  child: Text(
                    l10n.rxEmptyText,
                    textAlign: TextAlign.center,
                    style: PqText.text(15, FontWeight.w400,
                        height: 1.5, c: pq.textMuted),
                  ),
                ),
              ]),
            ),
          ]),
          const _HowToCard(),
          RxSendButton(label: l10n.rxSendFirst),
        ]),
      ],
    );
  }
}

class _HowToCard extends StatelessWidget {
  const _HowToCard();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final tips = [
      (PqIcons.scan, l10n.rxTipWholeTitle, l10n.rxTipWholeText),
      (PqIcons.stamp, l10n.rxTipStampTitle, l10n.rxTipStampText),
      (PqIcons.sun, l10n.rxTipLightTitle, l10n.rxTipLightText),
    ];
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Text(l10n.rxHowTo.toUpperCase(),
              style: PqText.overline(c: pq.textMuted)),
        ),
        for (var i = 0; i < tips.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: i < tips.length - 1
                  ? Border(bottom: BorderSide(color: pq.divider))
                  : null,
            ),
            child: Row(children: [
              PqIconTile(tips[i].$1, size: 40, iconSize: 20),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(tips[i].$2,
                      style: PqText.text(15, FontWeight.w600, c: pq.text)),
                  const SizedBox(height: 2),
                  Text(tips[i].$3, style: rxText14(pq.textMuted)),
                ]),
              ),
            ]),
          ),
      ]),
    );
  }
}

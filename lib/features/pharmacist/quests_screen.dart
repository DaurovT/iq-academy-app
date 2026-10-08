import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/quest.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import '../shared/quest_history/quests_done_view.dart';
import 'providers.dart';
import 'quests/quest_card.dart';
import 'quests/quest_ui.dart';

enum QuestsTab { active, done }

/// Квесты фармацевта и врача (макеты Quests / QuestsDone): шапка вкладки,
/// заголовок + поиск, сегменты «Активные · Завершённые», список.
class QuestsScreen extends ConsumerStatefulWidget {
  const QuestsScreen({super.key, this.initialTab = QuestsTab.active});

  final QuestsTab initialTab;

  @override
  ConsumerState<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends ConsumerState<QuestsScreen> {
  late QuestsTab _tab = widget.initialTab;

  Future<void> _refresh(QuestTarget target) async {
    ref.invalidate(questParticipationsProvider);
    ref.invalidate(questDetailProvider);
    ref.invalidate(questsListProvider(target));
    await ref.read(questsListProvider(target).future);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final target = watchQuestTarget(ref);
    final recipes = target == QuestTarget.recipes;
    final listAsync = ref.watch(questsListProvider(target));
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;

    Widget body;
    if (listAsync.hasError && !listAsync.hasValue) {
      body = PqAsync<List<Quest>>(
        value: listAsync,
        onRetry: () => ref.invalidate(questsListProvider(target)),
        data: (_) => const SizedBox.shrink(),
      );
    } else {
      final all = listAsync.asData?.value;
      final active =
          all == null
              ? null
              : (all.where((q) => q.status == QuestStatus.active).toList()
                ..sort((a, b) => b.progress.compareTo(a.progress)));
      body = PqRefresh(
        onRefresh: () => _refresh(target),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
          children: [
            PqAnimate(
              child: _TitleRow(
                subtitle: recipes ? l.questsSubtitleDoctor : l.questsSubtitle,
                onSearch: () => context.push('/app/quests/search'),
              ),
            ),
            const SizedBox(height: 24),
            PqAnimate(
              delay: PqMotion.staggerDelay(1),
              child: _QuestTabs(
                selected: _tab,
                activeCount: active?.length,
                onChanged: (t) => setState(() => _tab = t),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: PqMotion.ease,
              switchOutCurve: PqMotion.ease,
              layoutBuilder:
                  (current, previous) => Stack(
                    alignment: Alignment.topCenter,
                    children: [...previous, if (current != null) current],
                  ),
              child: KeyedSubtree(
                key: ValueKey(_tab),
                child:
                    _tab == QuestsTab.active
                        ? (active == null
                            ? const _CardsSkeleton()
                            : _ActiveContent(quests: active, recipes: recipes))
                        : _DoneContent(quests: all),
              ),
            ),
          ],
        ),
      );
    }

    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTabHeader(
            onBell: () => context.go('/app/notifications'),
            bellLabel: l.notifTitle,
            unread: unread > 0,
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}

/// Заголовок «Квесты» + подзаголовок и круглая кнопка поиска 44.
class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.subtitle, required this.onSearch});

  final String subtitle;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: PqPageTitle(l.questsTitle, subtitle: subtitle)),
        const SizedBox(width: 12),
        PqPressable(
          onTap: onSearch,
          semanticLabel: l.questsSearchLabel,
          scale: .94,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: pq.surface,
              shape: BoxShape.circle,
              border: Border.all(color: pq.border),
            ),
            alignment: Alignment.center,
            child: PqIcon(PqIcons.search, size: 20, color: pq.text),
          ),
        ),
      ],
    );
  }
}

/// Сегменты «Активные (N) · Завершённые»: плашка скользит между вкладками
/// (как [PqSegmented]), у «Активных» — счётчик.
class _QuestTabs extends StatelessWidget {
  const _QuestTabs({
    required this.selected,
    required this.activeCount,
    required this.onChanged,
  });

  final QuestsTab selected;
  final int? activeCount;
  final ValueChanged<QuestsTab> onChanged;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    const values = QuestsTab.values;
    final idx = values.indexOf(selected);
    return Semantics(
      label: l.questsTitle,
      container: true,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: pq.surfaceAlt,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: pq.border),
        ),
        child: LayoutBuilder(
          builder: (context, box) {
            const gap = 4.0;
            final w = (box.maxWidth - gap) / 2;
            return SizedBox(
              height: 40,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 280),
                    curve: PqMotion.ease,
                    left: idx * (w + gap),
                    top: 0,
                    bottom: 0,
                    width: w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: pq.segmentActive,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1F000000),
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < values.length; i++) ...[
                        if (i > 0) const SizedBox(width: gap),
                        SizedBox(
                          width: w,
                          child: Semantics(
                            selected: i == idx,
                            button: true,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => onChanged(values[i]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: AnimatedDefaultTextStyle(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      style: PqText.text(
                                        14,
                                        i == idx
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                        c: i == idx ? pq.text : pq.textMuted,
                                      ),
                                      child: Text(
                                        values[i] == QuestsTab.active
                                            ? l.questsTabActive
                                            : l.questsTabDone,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  if (values[i] == QuestsTab.active &&
                                      (activeCount ?? 0) > 0) ...[
                                    const SizedBox(width: 6),
                                    Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 20,
                                      ),
                                      height: 20,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: pq.accentSoft,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$activeCount',
                                        style: PqText.tag(c: pq.accentText),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Вкладка «Активные»: подсказка сортировки, карточки, «Как работают квесты».
class _ActiveContent extends StatelessWidget {
  const _ActiveContent({required this.quests, required this.recipes});

  final List<Quest> quests;
  final bool recipes;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final list =
        quests.isEmpty
            ? PqEmptyState(
              icon: PqIcons.target,
              title: l.questsEmptyActiveTitle,
              message: l.questsEmptyActiveSub,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l.questsSortHint,
                  style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
                ),
                for (final q in quests) ...[
                  const SizedBox(height: 12),
                  QuestCard(
                    quest: q,
                    onTap: () => context.push('/app/quests/${q.id}'),
                  ),
                ],
              ],
            );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqAnimate(delay: PqMotion.staggerDelay(2), child: list),
        const SizedBox(height: 24),
        PqAnimate(
          delay: PqMotion.staggerDelay(3),
          child: _HowItWorks(recipes: recipes),
        ),
      ],
    );
  }
}

/// «Как работают квесты»: три шага в одной карточке.
class _HowItWorks extends StatelessWidget {
  const _HowItWorks({required this.recipes});

  final bool recipes;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final steps = [
      (
        recipes ? PqIcons.fileRx : PqIcons.cart,
        recipes ? l.questsStepPrescribeTitle : l.questsStepSellTitle,
        recipes ? l.questsStepPrescribeSub : l.questsStepSellSub,
      ),
      (
        PqIcons.camera,
        l.questsStepSendTitle,
        recipes ? l.questsStepSendRecipeSub : l.questsStepSendCheckSub,
      ),
      // Врач (DocQuests) — «Дождитесь проверки», фармацевт (Quests) — «Выполните условия».
      recipes
          ? (PqIcons.gift, l.questsStepWaitTitle, l.questsStepWaitSub)
          : (PqIcons.squareCheck, l.questsStepDoTitle, l.questsStepDoSub),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqSectionHeader(l.questsHowTitle),
        const SizedBox(height: 12),
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < steps.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: pq.accentSoft,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: PqIcon(
                          steps[i].$1,
                          size: 20,
                          color: pq.accentText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: steps[i].$2,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const TextSpan(text: '\n'),
                            TextSpan(
                              text: steps[i].$3,
                              style: TextStyle(color: pq.textMuted),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: PqText.text(
                          14,
                          FontWeight.w400,
                          height: 1.3,
                          c: pq.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Вкладка «Завершённые»: история участия + завершённые квесты.
class _DoneContent extends ConsumerWidget {
  const _DoneContent({required this.quests});

  final List<Quest>? quests;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final parts = ref.watch(questParticipationsProvider);
    if (parts.hasError && !parts.hasValue) {
      return PqEmptyState(
        icon: PqIcons.cloudAlert,
        tone: PqTone.danger,
        title: l.stateServerErrorTitle,
        message: l.stateServerErrorText,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        action: PqButton(
          label: l.asyncRetry,
          icon: PqIcons.refresh,
          expand: false,
          onPressed: () => ref.invalidate(questParticipationsProvider),
        ),
      );
    }
    final list = parts.asData?.value;
    if (list == null || quests == null) return const _RowsSkeleton();
    return QuestsDoneView(
      items: QuestDoneItem.build(list, quests!),
      staggerFrom: 2,
      onOpen: (it) => context.push('/app/quests/${it.questId}'),
    );
  }
}

/// Скелетон карточек квестов на время загрузки.
class _CardsSkeleton extends StatelessWidget {
  const _CardsSkeleton();

  @override
  Widget build(BuildContext context) {
    Widget card() => PqCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              PqSkeleton(width: 48, height: 24),
              SizedBox(width: 8),
              Expanded(child: PqSkeleton(height: 14)),
              SizedBox(width: 80),
            ],
          ),
          const SizedBox(height: 16),
          const FractionallySizedBox(
            widthFactor: .6,
            child: PqSkeleton(height: 20),
          ),
          const SizedBox(height: 8),
          const FractionallySizedBox(
            widthFactor: .4,
            child: PqSkeleton(height: 14),
          ),
          const SizedBox(height: 16),
          const PqSkeleton(height: 8, radius: 4),
        ],
      ),
    );
    return Semantics(
      label: context.l10n.stateRefreshing,
      child: Column(children: [card(), const SizedBox(height: 12), card()]),
    );
  }
}

/// Скелетон строк завершённых квестов.
class _RowsSkeleton extends StatelessWidget {
  const _RowsSkeleton();

  @override
  Widget build(BuildContext context) => Semantics(
    label: context.l10n.stateRefreshing,
    child: const Column(
      children: [
        PqCard(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PqSkeletonRow(),
        ),
        SizedBox(height: 10),
        PqCard(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PqSkeletonRow(),
        ),
      ],
    ),
  );
}

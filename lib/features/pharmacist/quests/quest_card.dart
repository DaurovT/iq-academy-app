import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/quest.dart';
import '../providers.dart';
import 'quest_ui.dart';

/// Карточка активного квеста (макет Quests): метка награды · строка награды ·
/// статус; название + пояснение; «6 из 10 продаж» / «Ещё 4» и сегменты
/// (pq-seg); снизу срок и «Подробнее ›».
class QuestCard extends ConsumerWidget {
  const QuestCard({super.key, required this.quest, required this.onTap});

  final Quest quest;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    // Цель (goal) и точный счётчик есть только в детали — она кэшируется,
    // повторный заход в квест потом мгновенный.
    final detail = ref.watch(questDetailProvider(quest.id)).asData?.value;
    final p = QuestProgress.of(quest, detail);
    final colors = QuestColors.of(context, quest.rewardType);
    final recipes = quest.target == QuestTarget.recipes;
    final info = questInfoLine(
      quest.description,
      drug: quest.drug,
      brand: quest.brand,
    );
    final left = p.left;

    return PqCard(
      onTap: onTap,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              QuestRewardTag(quest.rewardType),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PqIcon(PqIcons.gift, size: 15, color: pq.textMuted),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        questRewardLine(
                          l,
                          quest.rewardType,
                          quest.description,
                          quest.prizeIqc,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.body(
                          c: pq.textMuted,
                        ).copyWith(height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
              if (p.done || p.almostDone) ...[
                const SizedBox(width: 8),
                QuestStatusBadge(
                  p.done ? l.questsCompleted : l.questsAlmostDone,
                  tone: PqTone.success,
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Text(
            quest.name,
            style: PqText.heading(18, FontWeight.w700, ls: -0.2, c: pq.text),
          ),
          if (info != null) ...[
            const SizedBox(height: 4),
            Text(
              info,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
            ),
          ],
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(child: QuestCountText(progress: p, recipes: recipes)),
              if (left != null && left > 0)
                Text(
                  l.questsLeftShort(left),
                  style: PqText.text(14, FontWeight.w700, c: colors.accent),
                ),
            ],
          ),
          const SizedBox(height: 10),
          PqSegmentProgress(
            total: p.segments,
            filled: p.filledSegments,
            fillColor: colors.fill,
            trackColor: colors.track,
            height: 8,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: pq.divider)),
            ),
            child: Row(
              children: [
                PqIcon(PqIcons.calendar, size: 15, color: pq.textMuted),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    questPeriod(l, quest.startDate, quest.endDate),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
                  ),
                ),
                const SizedBox(width: 6),
                Text(l.questsMore, style: PqText.link(c: pq.accent)),
                const SizedBox(width: 2),
                PqIcon(PqIcons.chevronRight, size: 15, color: pq.accent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Компактная карточка в результатах поиска (макет QuestSearch): метка
/// награды · статус; название с подсветкой; «6 из 10 продаж · до 30.06» /
/// «Ещё 4»; сплошная полоса прогресса.
class QuestSearchCard extends ConsumerWidget {
  const QuestSearchCard({
    super.key,
    required this.quest,
    required this.query,
    required this.onTap,
  });

  final Quest quest;
  final String query;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final detail = ref.watch(questDetailProvider(quest.id)).asData?.value;
    final p = QuestProgress.of(quest, detail);
    final colors = QuestColors.of(context, quest.rewardType);
    final recipes = quest.target == QuestTarget.recipes;
    final end = questDate(quest.endDate);
    final goal = p.goal;
    final left = p.left;
    final meta = [
      if (goal != null && goal > 0)
        '${p.count} ${recipes ? l.questsOfGoalRecipes(goal) : l.questsOfGoalSales(goal)}',
      if (end != null) l.questsPeriodUntil(questDm(end)),
    ].join(' · ');

    return PqCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              QuestRewardTag(quest.rewardType),
              const Spacer(),
              if (p.done || p.almostDone)
                PqPill(
                  p.done ? l.questsCompleted : l.questsAlmostDone,
                  tone: PqTone.success,
                ),
            ],
          ),
          const SizedBox(height: 12),
          QuestHighlight(
            text: quest.name,
            query: query,
            style: PqText.heading(18, FontWeight.w700, c: pq.text),
          ),
          if (meta.isNotEmpty || (left != null && left > 0)) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    meta,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
                  ),
                ),
                if (left != null && left > 0)
                  Text(
                    l.questsLeftShort(left),
                    style: PqText.text(14, FontWeight.w700, c: colors.accent),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 8,
              color: colors.track,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: p.ratio,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.fill,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

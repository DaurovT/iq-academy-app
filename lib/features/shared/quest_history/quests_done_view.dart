import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/quest.dart';
import '../../pharmacist/quests/quest_ui.dart';

/// Завершённый квест: выполненное участие (из истории участия) или квест,
/// который закончился без выполнения (статус disabled).
class QuestDoneItem {
  const QuestDoneItem({
    required this.questId,
    required this.name,
    required this.date,
    required this.completed,
    required this.rewardType,
    required this.rewardIqc,
    required this.rewardReceived,
  });

  final int questId;
  final String name;
  final DateTime? date;

  /// true — выполнен (участие засчитано), false — квест просто завершился.
  final bool completed;
  final RewardType rewardType;
  final int rewardIqc;
  final bool rewardReceived;

  /// История участия + завершённые квесты без участия; новые — сверху.
  static List<QuestDoneItem> build(
    List<QuestParticipation> participations,
    List<Quest> quests,
  ) {
    final done = {for (final p in participations) p.questId};
    final out = <QuestDoneItem>[
      for (final p in participations)
        QuestDoneItem(
          questId: p.questId,
          name: p.questName,
          date: questDate(p.completedAt),
          completed: true,
          rewardType: p.rewardType,
          rewardIqc: p.rewardIqc,
          rewardReceived: p.rewardReceived,
        ),
      for (final q in quests)
        if (q.status == QuestStatus.disabled && !done.contains(q.id))
          QuestDoneItem(
            questId: q.id,
            name: q.name,
            date: questDate(q.endDate),
            completed: false,
            rewardType: q.rewardType,
            rewardIqc: q.prizeIqc,
            rewardReceived: false,
          ),
    ];
    out.sort((a, b) {
      final ad = a.date, bd = b.date;
      if (ad == null && bd == null) return 0;
      if (ad == null) return 1;
      if (bd == null) return -1;
      return bd.compareTo(ad);
    });
    return out;
  }

  String caption(AppLocalizations l) {
    final d = date == null ? '' : questDmy(date!);
    if (d.isEmpty) return completed ? l.questsCompleted : l.questsFinished;
    return completed ? l.questsDoneOn(d) : l.questsEndedOn(d);
  }
}

/// Вкладка «Завершённые» (макет QuestsDone): группы по месяцам (надпись
/// капсом) с карточками-строками и поясняющий текст внизу.
class QuestsDoneView extends StatelessWidget {
  const QuestsDoneView({
    super.key,
    required this.items,
    required this.onOpen,
    this.staggerFrom = 0,
  });

  final List<QuestDoneItem> items;
  final ValueChanged<QuestDoneItem> onOpen;

  /// Индекс первого блока в каскаде экрана (pq-stagger).
  final int staggerFrom;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    if (items.isEmpty) {
      return PqAnimate(
        delay: PqMotion.staggerDelay(staggerFrom),
        child: PqEmptyState(
          icon: PqIcons.trophy,
          title: l.questsEmptyDoneTitle,
          message: l.questsEmptyArchiveSub,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        ),
      );
    }
    // Группировка по месяцу даты (без даты — последняя группа без заголовка).
    final groups = <String, List<QuestDoneItem>>{};
    for (final it in items) {
      final d = it.date;
      final key =
          d == null ? '' : '${l.questsMonthName('m${d.month}')} ${d.year}';
      groups.putIfAbsent(key, () => []).add(it);
    }
    final children = <Widget>[];
    for (final e in groups.entries) {
      children.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (e.key.isNotEmpty) ...[
              Text(
                e.key.toUpperCase(),
                style: PqText.overline(c: pq.textMuted),
              ),
              const SizedBox(height: 10),
            ],
            for (var i = 0; i < e.value.length; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              QuestDoneCard(item: e.value[i], onTap: () => onOpen(e.value[i])),
            ],
          ],
        ),
      );
    }
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(
          l.questsDoneFooter,
          textAlign: TextAlign.center,
          style: PqText.body(c: pq.textMuted),
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(height: 24),
          PqAnimate(
            delay: PqMotion.staggerDelay(staggerFrom + i),
            child: children[i],
          ),
        ],
      ],
    );
  }
}

/// Плитка статуса завершённого квеста: трофей (выполнен) или флажок.
class _DoneTile extends StatelessWidget {
  const _DoneTile({required this.completed, this.check = false});

  final bool completed;
  final bool check;

  @override
  Widget build(BuildContext context) => PqIconTile(
    completed ? (check ? PqIcons.check : PqIcons.trophy) : PqIcons.archive,
    tone: completed ? PqTone.success : PqTone.neutral,
  );
}

/// Карточка завершённого квеста (вкладка «Завершённые»).
class QuestDoneCard extends StatelessWidget {
  const QuestDoneCard({super.key, required this.item, required this.onTap});

  final QuestDoneItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqCard(
      onTap: onTap,
      child: Row(
        children: [
          _DoneTile(completed: item.completed),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.heading(16, FontWeight.w600, c: pq.text),
                ),
                const SizedBox(height: 3),
                Text(item.caption(l), style: PqText.caption(c: pq.textMuted)),
              ],
            ),
          ),
          const SizedBox(width: 14),
          QuestRewardTag(item.rewardType),
        ],
      ),
    );
  }
}

/// Строка завершённого квеста в результатах поиска: подсветка совпадения,
/// справа — полученная награда.
class QuestDoneSearchRow extends StatelessWidget {
  const QuestDoneSearchRow({
    super.key,
    required this.item,
    required this.query,
    required this.onTap,
  });

  final QuestDoneItem item;
  final String query;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final received = item.completed && item.rewardReceived;
    final value =
        item.rewardType == RewardType.voucher
            ? l.questsPillVoucher
            : '+${item.rewardIqc} IQC';
    return PqPressable(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            _DoneTile(completed: item.completed, check: true),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestHighlight(
                    text: item.name,
                    query: query,
                    style: PqText.heading(16, FontWeight.w600, c: pq.text),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    // В поиске — «Завершён · дата» (макет QuestSearch).
                    item.date == null
                        ? l.questsFinished
                        : l.questsEndedOn(questDmy(item.date!)),
                    style: PqText.caption(c: pq.textMuted),
                  ),
                ],
              ),
            ),
            if (item.completed) ...[
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: PqText.amount(c: received ? pq.success : pq.text),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    received ? l.questsReceived : l.questsPending,
                    style: PqText.caption(c: pq.textMuted),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

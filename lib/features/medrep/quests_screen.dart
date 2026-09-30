import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// Сводка по квесту компании, посчитанная из участников.
class MedQuestSummary {
  MedQuestSummary(this.q, this.now)
      : participants = q.participants.length,
        completed = q.participants.where((p) => p.done > 0).length,
        idle = q.participants.where((p) => p.done == 0 && p.collected == 0).length,
        sold = _hasDrugTotals(q)
            ? q.drugs.fold(0, (s, d) => s + (d.got ?? 0))
            : q.participants.fold(0, (s, p) => s + packsOf(p, q.goal)),
        target = _hasDrugTotals(q)
            ? q.drugs.fold(0, (s, d) => s + d.need)
            : q.goal * (q.participants.isEmpty ? 1 : q.participants.length);

  /// Бэкенд отдаёт по препаратам квеста «нужно/продано» — берём их как
  /// итог квеста; иначе считаем из участников.
  static bool _hasDrugTotals(MedrepQuest q) =>
      q.drugs.isNotEmpty && q.drugs.every((d) => d.got != null);

  final MedrepQuest q;
  final DateTime now;
  final int participants;
  final int completed;
  final int idle;

  /// Упаковки, засчитанные в квест (выполненные заходы + текущий).
  final int sold;
  final int target;

  double get progress => target <= 0 ? 0 : (sold / target).clamp(0.0, 1.0);

  bool get finished {
    final end = q.endDate == null ? null : DateTime.tryParse(q.endDate!);
    if (end == null) return false;
    return end.isBefore(DateTime(now.year, now.month, now.day));
  }

  /// «01.06 — 30.06.2026».
  String? get dates {
    final s = q.startDate, e = q.endDate;
    if (s == null || e == null) return null;
    final ed = DateTime.tryParse(e);
    return '${medDayMonth(s)} — ${medDayMonth(e)}${ed == null ? '' : '.${ed.year}'}';
  }

  /// Упаковки провизора: сумма по препаратам, иначе заходы × норма + текущий.
  static int packsOf(MedrepQuestParticipant p, int goal) => p.perDrug.isNotEmpty
      ? p.perDrug.fold(0, (s, d) => s + d.got)
      : p.done * goal + p.collected;
}

enum _Filter { active, finished, all }

/// Квесты компании (макет MedQuests).
class MedrepQuestsScreen extends ConsumerStatefulWidget {
  const MedrepQuestsScreen({super.key});

  @override
  ConsumerState<MedrepQuestsScreen> createState() => _MedrepQuestsScreenState();
}

class _MedrepQuestsScreenState extends ConsumerState<MedrepQuestsScreen> {
  _Filter _filter = _Filter.all;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final quests = ref.watch(medrepQuestsProvider);
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTabHeader(
          onBell: () => context.go('/app/notifications'),
          bellLabel: l.notifTitle,
          unread: unread > 0,
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(medrepQuestsProvider);
              await ref.read(medrepQuestsProvider.future).then((_) {}, onError: (_) {});
            },
            child: PqAsync<List<MedrepQuest>>(
              value: quests,
              onRetry: () => ref.invalidate(medrepQuestsProvider),
              data: (list) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
                child: _body(context, list),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, List<MedrepQuest> list) {
    final pq = context.pq;
    final l = context.l10n;
    final portfolio = ref.watch(portfolioProvider).asData?.value.length;
    final now = ref.watch(medrepNowProvider)();
    final all = [for (final q in list) MedQuestSummary(q, now)];
    final shown = all.where((s) => switch (_filter) {
          _Filter.all => true,
          _Filter.active => !s.finished,
          _Filter.finished => s.finished,
        }).toList();

    return PqStagger(gap: 16, children: [
      PqPageTitle(l.navQuests, subtitle: l.medrepQuestsSub),
      if (list.isNotEmpty)
        PqSegmented<_Filter>(
          values: _Filter.values,
          selected: _filter,
          labelOf: (f) => switch (f) {
            _Filter.active => l.medrepFilterActive,
            _Filter.finished => l.medrepFilterFinished,
            _Filter.all => l.medrepFilterAll,
          },
          onChanged: (f) => setState(() => _filter = f),
        ),
      if (shown.isEmpty)
        MedEmptyBlock(
          key: ValueKey('empty-$_filter'),
          tile: MedPopTile(
            icon: PqIcons.target,
            background: pq.accentSoft,
            foreground: pq.accentText,
          ),
          title: l.medrepQuestsEmpty,
        ),
      // Карточки — прямые дети каскада (как в макете); при смене фильтра
      // новые карточки проявляются (pqFade).
      for (var i = 0; i < shown.length; i++)
        PqAnimate(
          key: ValueKey('$_filter-${shown[i].q.id}'),
          fx: PqFx.fade,
          child: _QuestCard(s: shown[i], index: i, portfolio: portfolio),
        ),
    ]);
  }
}

class _QuestCard extends StatelessWidget {
  const _QuestCard({required this.s, required this.index, required this.portfolio});

  final MedQuestSummary s;
  final int index;
  final int? portfolio;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final finished = s.finished;
    final end = s.q.endDate;
    Widget tile(String value, String label) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: pq.surfaceAlt,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.statSmall(c: pq.text)),
              const SizedBox(height: 2),
              Text(label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.caption(c: pq.textMuted)),
            ]),
          ),
        );
    final card = PqCard(
      padding: const EdgeInsets.all(18),
      onTap: () => context.push('/app/medrep/quests/${s.q.id}'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Слева в макете — метка награды (IQC/Ваучер): в API её нет.
        Row(children: [
          const Spacer(),
          PqPill(
            finished ? l.medrepQuestFinished : l.medrepQuestRunning,
            tone: finished ? PqTone.success : PqTone.accent,
          ),
        ]),
        const SizedBox(height: 14),
        Text(s.q.name, style: PqText.title(c: pq.text)),
        if (finished && end != null) ...[
          const SizedBox(height: 4),
          Text(l.medrepQuestFinishedOn(medDayMonth(end)),
              style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
        ] else if (s.dates != null) ...[
          const SizedBox(height: 4),
          Text(s.dates!, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
        ],
        const SizedBox(height: 14),
        Row(children: [
          tile(
            portfolio == null ? '${s.participants}' : l.medrepOfN(s.participants, portfolio!),
            l.medrepParticipating,
          ),
          const SizedBox(width: 10),
          tile(l.medrepPacksShort(s.sold), l.medrepSoldOf(s.target)),
        ]),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 8,
            color: pq.isDark ? pq.border : const Color(0xFFE5E7EB),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: s.progress,
              heightFactor: 1,
              child: PqAnimate(
                fx: PqFx.fillX,
                duration: const Duration(milliseconds: 800),
                delay: Duration(milliseconds: 200 + 100 * index.clamp(0, 6)),
                child: Container(
                  decoration: BoxDecoration(
                    color: finished
                        ? pq.success
                        : (pq.isDark ? PqColors.questBorder : PqColors.reward),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
    // В макете у завершённого квеста opacity .8, но карточка — прямой ребёнок
    // .pq-stagger, и pqUp (fill-mode both) перекрывает её до 1.
    return card;
  }
}

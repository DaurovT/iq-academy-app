import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'providers.dart';
import 'quests_screen.dart' show MedQuestSummary;

/// Квест компании с разбивкой по провизорам (макет MedQuestDetail).
class MedrepQuestDetailScreen extends ConsumerStatefulWidget {
  const MedrepQuestDetailScreen({super.key, required this.questId});

  final int questId;

  @override
  ConsumerState<MedrepQuestDetailScreen> createState() =>
      _MedrepQuestDetailScreenState();
}

class _MedrepQuestDetailScreenState extends ConsumerState<MedrepQuestDetailScreen> {
  static const _visible = 6;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final quests = ref.watch(medrepQuestsProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.navQuests,
          backLabel: l.navQuests,
          onBack: () => medBack(context, '/app/medrep/quests'),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(medrepQuestsProvider);
              await ref.read(medrepQuestsProvider.future).then((_) {}, onError: (_) {});
            },
            child: PqAsync<List<MedrepQuest>>(
              value: quests,
              loading: PqLoadingKind.home,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              onRetry: () => ref.invalidate(medrepQuestsProvider),
              data: (list) {
                final q = list.where((q) => q.id == widget.questId).firstOrNull;
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                  child: q == null
                      ? PqEmptyState(icon: PqIcons.target, title: l.medrepQuestsEmpty)
                      : _body(context, MedQuestSummary(q, ref.watch(medrepNowProvider)())),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, MedQuestSummary s) {
    final pq = context.pq;
    final l = context.l10n;
    final muted = medHeroMuted(pq);
    final q = s.q;
    final portfolio = ref.watch(portfolioProvider).asData?.value.length;
    final pct = (s.progress * 100).round();
    final left = (s.target - s.sold).clamp(0, 1 << 31);
    final end = q.endDate;

    final rows = [...q.participants]..sort((a, b) {
        final c = b.done.compareTo(a.done);
        return c != 0 ? c : b.collected.compareTo(a.collected);
      });
    final hidden = rows.length > _visible && !_expanded ? rows.sublist(_visible) : const <MedrepQuestParticipant>[];
    final shown = hidden.isEmpty ? rows : rows.sublist(0, _visible);
    final hiddenPacks =
        hidden.fold<int>(0, (a, p) => a + MedQuestSummary.packsOf(p, q.goal));

    return PqStagger(gap: 24, children: [
      MedHeroCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            MedHeroPill(
              s.finished
                  ? l.medrepQuestFinishedOn(end == null ? '' : medDayMonth(end))
                  : end == null
                      ? l.medrepQuestRunning
                      : l.medrepQuestRunningUntil(medDayMonth(end)),
              height: 24,
              dot: s.finished ? const Color(0x99FFFFFF) : const Color(0xFF4ADE80),
            ),
          ]),
          const SizedBox(height: 16),
          Text(q.name, style: PqText.heading(24, FontWeight.w700, c: Colors.white)),
          if (s.dates != null) ...[
            const SizedBox(height: 2),
            Text(s.dates!, style: PqText.text(14, FontWeight.w400, c: muted)),
          ],
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('${s.sold}',
                  style: PqText.heading(48, FontWeight.w800, height: 1, c: Colors.white)),
              const SizedBox(width: 8),
              Flexible(
                child: Text(l.medrepOfPacks(s.target),
                    style: PqText.heading(16, FontWeight.w700, c: muted)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 10,
              color: const Color(0x2EFFFFFF),
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: s.progress,
                heightFactor: 1,
                child: PqAnimate(
                  fx: PqFx.fillX,
                  duration: const Duration(milliseconds: 900),
                  delay: const Duration(milliseconds: 300),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            left == 0
                ? l.medrepGoalDone
                : '${l.medrepGoalPercent(pct)} · ${l.medrepPacksLeft(left)}',
            style: PqText.text(14, FontWeight.w400, c: muted),
          ),
          const SizedBox(height: 16),
          MedHeroStats(items: [
            (
              portfolio == null
                  ? '${s.participants}'
                  : l.medrepOfN(s.participants, portfolio),
              l.medrepStatParticipating,
            ),
            ('${s.completed}', l.medrepStatCompleted),
            ('${s.idle}', l.medrepStatIdle),
          ]),
        ]),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PqSectionHeader(l.medrepPharmacistsSection),
        const SizedBox(height: 8),
        if (rows.isEmpty)
          PqCard(
            padding: const EdgeInsets.all(20),
            child: Text(l.medrepQuestsNoParticipants,
                textAlign: TextAlign.center, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
          )
        else
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: PqMotion.ease,
            alignment: Alignment.topCenter,
            child: PqListCard(children: [
              for (var i = 0; i < shown.length; i++)
                _row(context, shown[i], i, q.goal),
              if (hidden.isNotEmpty)
                PqPressable(
                  onTap: () => setState(() => _expanded = true),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 52),
                    child: Row(children: [
                      Expanded(
                        child: Text(l.medrepMoreRows(hidden.length, hiddenPacks),
                            style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
                      ),
                      const SizedBox(width: 12),
                      Text(l.medrepShow, style: PqText.link(c: pq.accent)),
                    ]),
                  ),
                ),
            ]),
          ),
      ]),
    ]);
  }

  Widget _row(BuildContext context, MedrepQuestParticipant p, int i, int goal) {
    final pq = context.pq;
    final l = context.l10n;
    final packs = MedQuestSummary.packsOf(p, goal);
    final idle = p.done == 0 && p.collected == 0;
    return MedPersonRow(
      rank: i + 1,
      rankColor: i == 0 && p.done > 0 ? pq.warning : null,
      name: p.name,
      avatarSeed: p.telegramId,
      subtitle: p.done > 0 ? l.medrepDoneOf(goal, goal) : l.medrepOfN(p.collected, goal),
      value: '$packs',
      unit: l.medrepPacksUnit,
      avatarColors: idle ? kMedMutedGradient : null,
      onTap: () => context.push('/app/portfolio/${p.telegramId}'),
    );
  }
}

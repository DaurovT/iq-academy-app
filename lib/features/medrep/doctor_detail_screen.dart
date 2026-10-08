import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'portfolio_screen.dart' show teamDoctorKey;
import 'providers.dart';

/// Карточка врача в команде медпреда (макет MedDoctor).
///
/// Данные берутся из списка команды: отдельного запроса по врачу в API нет,
/// поэтому вместо «упаковок» и «квестов» показываем то, что приходит —
/// одобренные бланки и последнюю активность, а списка последних бланков нет.
class MedrepDoctorDetailScreen extends ConsumerWidget {
  const MedrepDoctorDetailScreen({super.key, required this.doctorKey});

  /// Ключ врача из [teamDoctorKey].
  final String doctorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final team = ref.watch(medrepTeamProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.medrepTeamTitle,
          backLabel: l.medrepTeamTitle,
          onBack: () => medBack(context, '/app/portfolio'),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(medrepTeamProvider);
              await ref
                  .read(medrepTeamProvider.future)
                  .then((_) {}, onError: (_) {});
            },
            child: PqAsync<MedrepTeam>(
              value: team,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              loading: PqLoadingKind.home,
              onRetry: () => ref.invalidate(medrepTeamProvider),
              data: (t) {
                final doctor = t.doctors
                    .where((d) => teamDoctorKey(d) == doctorKey)
                    .firstOrNull;
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                  child: doctor == null
                      ? MedEmptyBlock(
                          tile: MedPopTile(
                            icon: PqIcons.stethoscope,
                            background: context.pq.accentSoft,
                            foreground: context.pq.accentText,
                          ),
                          title: l.medrepTeamNobody,
                        )
                      : _Body(doctor: doctor),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.doctor});

  final TeamDoctor doctor;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = doctor;
    final muted = medHeroMuted(pq);
    final line = medHeroLine(pq);
    final work = [d.specialty, d.workplace].where((s) => s.isNotEmpty).join(' · ');
    final last = d.lastAt == null || d.lastAt!.isEmpty ? '—' : medDayMonth(d.lastAt!);
    final since = d.joinedAt == null || d.joinedAt!.isEmpty
        ? '—'
        : l.medrepSince(medDayMonth(d.joinedAt!));
    final stats = [
      ('${d.approved}', l.medrepUnitApproved),
      (last, l.medrepLastActivity),
      (since, l.medrepUnitInTeam),
    ];

    return PqStagger(gap: 24, children: [
      MedHeroCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            PqAnimate(
              fx: PqFx.pop,
              child: MedAvatar(d.name,
                  seed: d.accountId ?? d.telegramId,
                  size: 56,
                  colors: d.active ? null : kMedMutedGradient),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(d.name,
                    style: PqText.heading(20, FontWeight.w700, c: Colors.white)),
                if (work.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(work,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.text(14, FontWeight.w400, c: muted)),
                ],
                if (d.city.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(d.city, style: PqText.text(14, FontWeight.w400, c: muted)),
                ],
              ]),
            ),
          ]),
          const SizedBox(height: 18),
          Row(children: [
            Expanded(
              child: Text(l.medrepBlanksAllTime.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.overline(c: muted)),
            ),
            const SizedBox(width: 8),
            MedHeroPill(
              d.active ? l.pharmDetailActive : l.pharmDetailPassive,
              dot: d.active ? const Color(0xFF4ADE80) : const Color(0x99FFFFFF),
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('${d.recipes}', style: PqText.balance(c: Colors.white)),
              const SizedBox(width: 8),
              Text(l.medrepUnitBlanks(d.recipes),
                  style: PqText.heading(18, FontWeight.w700, c: muted)),
            ],
          ),
          const SizedBox(height: 18),
          // Как MedHeroStats, но только с верхней линией (в макете MedDoctor
          // под показателями нет кнопки и нижней линии).
          Container(
            padding: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: line))),
            child: IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                for (var i = 0; i < stats.length; i++)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: i == 0 ? 0 : 14),
                      decoration: i == 0
                          ? null
                          : BoxDecoration(border: Border(left: BorderSide(color: line))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(stats[i].$1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: PqText.statSmall(c: Colors.white)),
                          const SizedBox(height: 2),
                          Text(stats[i].$2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: PqText.caption(c: muted)),
                        ],
                      ),
                    ),
                  ),
              ]),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(l.medrepPatientsHidden,
            style: PqText.text(12, FontWeight.w400, height: 1.45, c: pq.textMuted)),
      ),
    ]);
  }
}

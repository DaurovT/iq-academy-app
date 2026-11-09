import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/format.dart';
import '../../core/models/medrep.dart';
import '../doctor/rx_common.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'portfolio_screen.dart' show teamDoctorKey;
import 'providers.dart';

/// Карточка врача в команде медпреда (макет MedDoctor).
///
/// Пришедшие из приложения (ключ `a{accountId}`) — из
/// `GET /client/medrep/doctors/{accountId}`: упаковки, квесты, последние
/// бланки. Врачи из бота (ключ `t{telegramId}`) и любой сбой запроса —
/// из списка команды, без упаковок и бланков.
class MedrepDoctorDetailScreen extends ConsumerWidget {
  const MedrepDoctorDetailScreen({super.key, required this.doctorKey});

  /// Ключ врача из [teamDoctorKey].
  final String doctorKey;

  int? get _accountId =>
      doctorKey.startsWith('a') ? int.tryParse(doctorKey.substring(1)) : null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final id = _accountId;
    final detail = id == null ? null : ref.watch(doctorDetailProvider(id));
    final useTeam = detail == null || detail.hasError;
    final team = useTeam ? ref.watch(medrepTeamProvider) : null;

    Future<void> refresh() async {
      if (id != null) ref.invalidate(doctorDetailProvider(id));
      ref.invalidate(medrepTeamProvider);
      try {
        if (id != null) {
          await ref.read(doctorDetailProvider(id).future);
        } else {
          await ref.read(medrepTeamProvider.future);
        }
      } catch (_) {
        // покажем данные из команды
      }
    }

    Widget scroll(Widget child) => SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
      child: child,
    );

    final nobody = MedEmptyBlock(
      tile: MedPopTile(
        icon: PqIcons.stethoscope,
        background: context.pq.accentSoft,
        foreground: context.pq.accentText,
      ),
      title: l.medrepTeamNobody,
    );

    final Widget content =
        !useTeam
            ? PqAsync<DoctorDetail>(
              value: detail,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              loading: PqLoadingKind.home,
              onRetry: () => ref.invalidate(doctorDetailProvider(id!)),
              data: (d) => scroll(_Body(doctor: d, full: true)),
            )
            : PqAsync<MedrepTeam>(
              value: team!,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              loading: PqLoadingKind.home,
              onRetry: () => ref.invalidate(medrepTeamProvider),
              data: (t) {
                final d =
                    t.doctors
                        .where((d) => teamDoctorKey(d) == doctorKey)
                        .firstOrNull;
                return scroll(
                  d == null ? nobody : _Body(doctor: _fromTeam(d), full: false),
                );
              },
            );

    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTopBar(
            title: l.medrepTeamTitle,
            backLabel: l.medrepTeamTitle,
            onBack: () => medBack(context, '/app/portfolio'),
          ),
          Expanded(child: PqRefresh(onRefresh: refresh, child: content)),
        ],
      ),
    );
  }
}

DoctorDetail _fromTeam(TeamDoctor d) => DoctorDetail(
  accountId: d.accountId,
  telegramId: d.telegramId,
  name: d.name,
  specialty: d.specialty,
  workplace: d.workplace,
  city: d.city,
  phone: d.phone,
  recipes: d.recipes,
  approved: d.approved,
  active: d.active,
  joinedAt: d.joinedAt,
  lastAt: d.lastAt,
);

class _Body extends StatelessWidget {
  const _Body({required this.doctor, required this.full});

  final DoctorDetail doctor;

  /// Данные из карточки врача (упаковки, квесты, бланки); иначе — из списка
  /// команды: одобрено и последняя активность.
  final bool full;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = doctor;
    final muted = medHeroMuted(pq);
    final line = medHeroLine(pq);
    final work = [
      d.specialty,
      d.workplace,
    ].where((s) => s.isNotEmpty).join(' · ');
    final last =
        d.lastAt == null || d.lastAt!.isEmpty ? '—' : medDayMonth(d.lastAt!);
    final since =
        d.joinedAt == null || d.joinedAt!.isEmpty
            ? '—'
            : l.medrepSince(medDayMonth(d.joinedAt!));
    final stats =
        full
            ? [
              ('${d.approvedPacks}', l.medrepUnitPacks(d.approvedPacks)),
              ('${d.quests}', l.medrepUnitQuests(d.quests)),
              (since, l.medrepUnitInTeam),
            ]
            : [
              ('${d.approved}', l.medrepUnitApproved),
              (last, l.medrepLastActivity),
              (since, l.medrepUnitInTeam),
            ];

    return PqStagger(
      gap: 24,
      children: [
        MedHeroCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  PqAnimate(
                    fx: PqFx.pop,
                    child: MedAvatar(
                      d.name,
                      seed: d.accountId ?? d.telegramId,
                      size: 56,
                      colors: d.active ? null : kMedMutedGradient,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          d.name,
                          style: PqText.heading(
                            20,
                            FontWeight.w700,
                            c: Colors.white,
                          ),
                        ),
                        if (work.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            work,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: PqText.text(14, FontWeight.w400, c: muted),
                          ),
                        ],
                        if (d.city.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            d.city,
                            style: PqText.text(14, FontWeight.w400, c: muted),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.medrepBlanksAllTime.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.overline(c: muted),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Ещё ни одного бланка — «Новый» (макет MedDoctorEmpty):
                  // «Активным» врач с нулями не выглядит.
                  if (d.recipes == 0)
                    MedHeroPill(l.medrepDoctorNew, dot: Colors.white)
                  else
                    MedHeroPill(
                      d.active ? l.pharmDetailActive : l.pharmDetailPassive,
                      dot:
                          d.active
                              ? const Color(0xFF4ADE80)
                              : const Color(0x99FFFFFF),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('${d.recipes}', style: PqText.balance(c: Colors.white)),
                  const SizedBox(width: 8),
                  Text(
                    l.medrepUnitBlanks(d.recipes),
                    style: PqText.heading(18, FontWeight.w700, c: muted),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Как MedHeroStats, но только с верхней линией (в макете MedDoctor
              // под показателями нет кнопки и нижней линии).
              Container(
                padding: const EdgeInsets.only(top: 14),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: line)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < stats.length; i++)
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: i == 0 ? 0 : 14),
                            decoration:
                                i == 0
                                    ? null
                                    : BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: line),
                                      ),
                                    ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  stats[i].$1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: PqText.statSmall(c: Colors.white),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  stats[i].$2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: PqText.caption(c: muted),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (full) ...[
              // «Все» нет: сервер отдаёт только 5 последних бланков.
              PqSectionHeader(
                l.rxHomeRecent,
                count: d.recipes,
                countTone: PqTone.success,
              ),
              const SizedBox(height: 12),
              if (d.recentRecipes.isEmpty)
                const _NoBlanks()
              else
                PqListCard(
                  children: [
                    for (final r in d.recentRecipes) _RecipeRow(recipe: r),
                  ],
                ),
              const SizedBox(height: 12),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                l.medrepPatientsHidden,
                style: PqText.text(
                  12,
                  FontWeight.w400,
                  height: 1.45,
                  c: pq.textMuted,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Строка бланка: иконка документа в тоне статуса, номер, дата, капсула
/// статуса. Не нажимается — фото бланков медпреду не показываются.
class _RecipeRow extends StatelessWidget {
  const _RecipeRow({required this.recipe});

  final DoctorRecentRecipe recipe;

  @override
  Widget build(BuildContext context) {
    final stage = recipe.status.rxStage();
    return PqListRow(
      title: context.l10n.recipeDetailTitle(recipe.id),
      subtitle: formatShortDateTime(recipe.createdAt),
      icon: PqIcons.fileText,
      tone: stage.tone,
      trailing: RxStatusBadge(stage),
    );
  }
}

/// «Бланков пока нет» (макет MedDoctorEmpty): пунктирная карточка, значок
/// бланка, заголовок и подпись.
class _NoBlanks extends StatelessWidget {
  const _NoBlanks();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return CustomPaint(
      foregroundPainter: MedDashedBorder(color: pq.borderStrong, radius: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const PqIconTile(PqIcons.fileRx,
                tone: PqTone.neutral, size: 56, radius: 16, iconSize: 26),
            const SizedBox(height: 12),
            Text(
              l.medrepDoctorNoBlanks,
              textAlign: TextAlign.center,
              style: PqText.heading(17, FontWeight.w700, c: pq.text),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 260),
              child: Text(
                l.medrepDoctorNoBlanksSub,
                textAlign: TextAlign.center,
                style: PqText.text(14, FontWeight.w400,
                    height: 1.45, c: pq.textMuted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

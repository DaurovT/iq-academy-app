import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_modules.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// Главная медпреда «Портфель» (макеты MedHome / MedEmpty, обе темы).
class MedrepHome extends ConsumerStatefulWidget {
  const MedrepHome({super.key});

  @override
  ConsumerState<MedrepHome> createState() => _MedrepHomeState();
}

class _MedrepHomeState extends ConsumerState<MedrepHome> {
  String _period = 'all';

  Future<void> _refresh() async {
    ref.invalidate(medrepMetricsProvider);
    ref.invalidate(medrepCodeProvider);
    ref.invalidate(medrepTeamProvider);
    ref.invalidate(leaderboardProvider('checks'));
    ref.invalidate(companiesProvider);
    ref.invalidate(unreadCountProvider);
    await ref.read(medrepTeamProvider.future).then((_) {}, onError: (_) {});
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final team = ref.watch(medrepTeamProvider);
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
            onRefresh: _refresh,
            child: PqAsync<MedrepTeam>(
              value: team,
              loading: PqLoadingKind.home,
              onRetry: () => ref.invalidate(medrepTeamProvider),
              data: (t) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
                child: t.doctors.isEmpty && t.pharmacists.isEmpty
                    ? _empty(context)
                    : _content(context, t),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  String get _name =>
      ref.watch(authControllerProvider).asData?.value.account?.fullName ?? '';

  String? get _company {
    final board = ref.watch(leaderboardProvider('checks')).asData?.value;
    final companies = ref.watch(companiesProvider).asData?.value;
    final c = board?.company ??
        (companies == null || companies.isEmpty ? null : companies.first.name);
    return c == null || c.isEmpty ? null : c;
  }

  /// Кодовое слово (null — ещё грузится или не пришло).
  String? get _code => ref.watch(medrepCodeProvider).asData?.value.code;

  /// Приветствие и компания (в обновлённом макете MedHome — без атрибуции).
  Widget _title(BuildContext context) {
    final l = context.l10n;
    final name = _name;
    return PqPageTitle(
      name.isEmpty ? l.medrepHomeGreetingNoName : l.medrepHelloName(name),
      subtitle: _company,
    );
  }

  // ── MedEmpty ───────────────────────────────────────────────────────────

  Widget _empty(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final code = _code;
    Widget step(PqIcons icon, String title, String text) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(children: [
            PqIconTile(icon, size: 40, iconSize: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: PqText.text(15, FontWeight.w600, c: pq.text)),
                const SizedBox(height: 2),
                Text(text, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
              ]),
            ),
          ]),
        );
    return PqStagger(gap: 20, children: [
      _title(context),
      MedEmptyBlock(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
        gap: 10,
        messageMaxWidth: 310,
        tile: MedPopTile(
          icon: PqIcons.users,
          background: pq.accentSoft,
          foreground: pq.accentText,
        ),
        title: l.medrepEmptyTitle,
        message: l.medrepEmptyText,
      ),
      PqListCard(children: [
        step(PqIcons.share, l.medrepStep1Title,
            code == null ? l.medrepStep1Text : l.medrepStep1TextCode(code)),
        step(PqIcons.userPlus, l.medrepStep2Title, l.medrepStep2Text),
        step(PqIcons.barChart, l.medrepStep3Title, l.medrepStep3Text),
      ]),
      Column(children: [
        PqButton(
          label: l.medrepInviteTitle,
          icon: PqIcons.share,
          onPressed: () => context.push('/app/portfolio/invite'),
        ),
        const SizedBox(height: 8),
        MedOutlineButton(
          label: l.medrepCopyCode,
          icon: PqIcons.copy,
          height: 52,
          fontSize: 16,
          transparent: true,
          expand: true,
          onTap: code == null ? null : () => medCopyCode(context, code),
        ),
      ]),
    ]);
  }

  // ── MedHome ────────────────────────────────────────────────────────────

  Widget _content(BuildContext context, MedrepTeam team) {
    final l = context.l10n;
    final teamSize = team.doctors.length + team.pharmacists.length;
    final metrics = ref.watch(medrepMetricsProvider(_period));
    final showRating = ref.moduleVisible('leaderboard');
    final board = showRating
        ? ref.watch(leaderboardProvider('checks')).asData?.value
        : null;
    final showPortfolio = ref.moduleVisible('medrep_portfolio');
    // «Самые активные» — фармацевты по чекам (карточка открывается по
    // Telegram-id, поэтому без него в топ не берём).
    final top = [
      for (final p in team.pharmacists)
        if (p.telegramId != null) p,
    ]..sort((a, b) => b.checks.compareTo(a.checks));

    return PqStagger(gap: 24, children: [
      _title(context),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PqSegmented<String>(
          values: const ['all', '30', '7'],
          selected: _period,
          labelOf: (v) => switch (v) {
            '30' => l.medrepPeriod30,
            '7' => l.medrepPeriod7,
            _ => l.medrepPeriodAll,
          },
          onChanged: (v) => setState(() => _period = v),
        ),
        const SizedBox(height: 12),
        _StatsGrid(
          metrics: metrics,
          teamSize: teamSize,
          onRetry: () => ref.invalidate(medrepMetricsProvider(_period)),
        ),
      ]),
      if (board != null && board.myRank > 0 && board.items.isNotEmpty)
        _RatingCard(board: board),
      if (showPortfolio && top.isNotEmpty)
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          PqSectionHeader(
            l.medrepMostActive,
            actionLabel: l.medrepAllTeam,
            onAction: () => context.go('/app/portfolio'),
          ),
          const SizedBox(height: 8),
          PqListCard(children: [
            for (var i = 0; i < top.length && i < 3; i++)
              MedPersonRow(
                rank: i + 1,
                name: top[i].name,
                avatarSeed: top[i].telegramId,
                subtitle: [top[i].shop, top[i].city]
                    .where((s) => s.isNotEmpty)
                    .join(' · '),
                value: '${top[i].checks}',
                unit: l.medrepUnitChecks(top[i].checks),
                onTap: () => context.push('/app/portfolio/${top[i].telegramId}'),
              ),
          ]),
        ]),
      _InviteCard(code: _code),
      _Menu(),
    ]);
  }
}

// ── Показатели 2×2 ───────────────────────────────────────────────────────

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({
    required this.metrics,
    required this.teamSize,
    required this.onRetry,
  });

  /// Сколько человек в команде (врачи + фармацевты) — первая плитка.
  final int teamSize;
  final AsyncValue<MedrepMetrics> metrics;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final m = metrics.asData?.value;
    if (m == null && metrics.hasError) {
      return PqCard(
        child: Column(children: [
          Text(context.l10n.stateServerErrorTitle,
              textAlign: TextAlign.center, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
          const SizedBox(height: 12),
          PqButton(
            label: l.medrepHomeRetry,
            kind: PqButtonKind.secondary,
            height: 44,
            onPressed: onRetry,
          ),
        ]),
      );
    }
    final purple = pq.isDark
        ? (bg: const Color(0x2E7C3AED), fg: const Color(0xFFC4B5FD))
        : (bg: const Color(0xFFEDE9FE), fg: const Color(0xFF6D28D9));
    final accent = pq.tone(PqTone.accent);
    final success = pq.tone(PqTone.success);
    final warning = pq.tone(PqTone.warning);
    Widget card(int i, PqIcons icon, ({Color bg, Color fg}) t, int? value,
            String Function(int) label) =>
        Expanded(
          child: PqAnimate(
            delay: Duration(milliseconds: 100 + 60 * i),
            child: _StatCard(
              icon: icon,
              tone: t,
              value: value,
              label: label(value ?? 0),
            ),
          ),
        );
    return Column(children: [
      Row(children: [
        card(0, PqIcons.users, accent, teamSize, (_) => l.medrepUnitInTeam),
        const SizedBox(width: 12),
        card(1, PqIcons.receipt, success, m?.checksCount, l.medrepUnitChecks),
      ]),
      const SizedBox(height: 12),
      Row(children: [
        card(2, PqIcons.package, purple, m?.approvedPacksSum, l.medrepUnitPacks),
        const SizedBox(width: 12),
        card(3, PqIcons.target, warning, m?.questsDone, l.medrepUnitQuestsDone),
      ]),
    ]);
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.tone,
    required this.value,
    required this.label,
  });

  final PqIcons icon;
  final ({Color bg, Color fg}) tone;
  final int? value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        PqIconTile(icon,
            size: 36, iconSize: 18, background: tone.bg, foreground: tone.fg),
        const SizedBox(height: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: value == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: PqSkeleton(width: 56, height: 25),
                )
              : Text('$value',
                  key: ValueKey(value),
                  style: PqText.stat(c: pq.text)),
        ),
        const SizedBox(height: 2),
        Text(label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
      ]),
    );
  }
}

// ── Рейтинг по чекам ─────────────────────────────────────────────────────

class _RatingCard extends StatelessWidget {
  const _RatingCard({required this.board});

  final Leaderboard board;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final muted = medHeroMuted(pq);
    final rank = board.myRank;
    final items = board.items;
    final me = items.where((r) => r.isMe == true).firstOrNull ??
        (rank <= items.length ? items[rank - 1] : null);
    final above = rank >= 2 && rank - 2 < items.length ? items[rank - 2] : null;
    final progress = above == null || above.value <= 0
        ? 1.0
        : ((me?.value ?? 0) / above.value).clamp(0.0, 1.0);
    final gap = above == null ? 0 : (above.value - (me?.value ?? 0)).clamp(0, 1 << 31);

    return MedHeroCard(
      padding: const EdgeInsets.all(18),
      radius: 22,
      onTap: () => context.go('/app/leaderboard'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Expanded(
            child: Text(l.medrepRatingByChecks.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.overline(c: muted)),
          ),
          const SizedBox(width: 12),
          Text(l.medrepRatingAll, style: PqText.link(c: Colors.white)),
          const SizedBox(width: 4),
          const PqIcon(PqIcons.chevronRight, size: 14, color: Colors.white),
        ]),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              child: Text(l.medrepPlace(rank),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.heading(40, FontWeight.w800, height: 1, c: Colors.white)),
            ),
            const SizedBox(width: 8),
            Text(l.medrepOutOf(items.length), style: PqText.subtitle(c: muted)),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 8,
            color: const Color(0x2EFFFFFF),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: progress,
              heightFactor: 1,
              child: PqAnimate(
                fx: PqFx.fillX,
                duration: const Duration(milliseconds: 900),
                delay: const Duration(milliseconds: 400),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          above == null
              ? TextSpan(text: l.medrepLeader)
              : TextSpan(children: [
                  TextSpan(text: '${l.medrepGapTo(rank - 1)} '),
                  TextSpan(
                    text: l.medrepCountChecks(gap),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ]),
          style: PqText.text(14, FontWeight.w400, c: muted),
        ),
      ]),
    );
  }
}

// ── Пригласить в команду ─────────────────────────────────────────────────

/// Карточка приглашения (MedHome): кодовое слово в пунктирной рамке,
/// «Копировать» и «Поделиться». Ссылки-приглашения в приложении нет.
class _InviteCard extends StatelessWidget {
  const _InviteCard({required this.code});

  final String? code;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final c = code;
    return PqCard(
      padding: const EdgeInsets.all(18),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PqPressable(
          onTap: () => context.push('/app/portfolio/invite'),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const PqIconTile(PqIcons.userPlus, size: 40, iconSize: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.medrepInviteTitle, style: PqText.title(c: pq.text)),
                const SizedBox(height: 2),
                Text(l.medrepInviteText, style: PqText.body(c: pq.textMuted)),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 14),
        Text(l.medrepYourCode.toUpperCase(), style: PqText.overline(c: pq.textMuted)),
        const SizedBox(height: 6),
        CustomPaint(
          foregroundPainter: MedDashedBorder(color: pq.accentText, radius: 16),
          child: Container(
            height: 60,
            padding: const EdgeInsets.only(left: 18, right: 8),
            decoration: BoxDecoration(
              color: pq.surfaceAlt,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(children: [
              Expanded(child: MedCodeWord(c, size: 28, spacing: 6)),
              const SizedBox(width: 12),
              PqPressable(
                onTap: c == null ? null : () => medCopyCode(context, c),
                semanticLabel: l.medrepCopyCode,
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Center(
                    child: PqIcon(PqIcons.copy, size: 20, color: pq.accentText),
                  ),
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
            child: MedOutlineButton(
              label: l.medrepHomeCopy,
              icon: PqIcons.copy,
              height: 48,
              radius: 14,
              transparent: true,
              expand: true,
              onTap: c == null ? null : () => medCopyCode(context, c),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: MedAccentButton(
              label: l.medrepHomeShare,
              icon: PqIcons.share,
              iconGap: 8,
              onTap: c == null ? null : () => medShareCode(context, c),
            ),
          ),
        ]),
      ]),
    );
  }
}

// ── Меню ─────────────────────────────────────────────────────────────────

class _Menu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final rows = <Widget>[
      if (ref.moduleVisible('medrep_referrals'))
        MedMenuRow(
          icon: PqIcons.userPlus,
          title: l.medrepHomeMenuPending,
          subtitle: l.medrepPendingSub,
          onTap: () => context.push('/app/referrals'),
        ),
      if (ref.moduleVisible('medrep_companies'))
        MedMenuRow(
          icon: PqIcons.building,
          title: l.medrepHomeMenuCompanies,
          subtitle: l.medrepCompaniesSub,
          onTap: () => context.push('/app/companies'),
        ),
      if (ref.moduleVisible('medrep_doctors'))
        MedMenuRow(
          icon: PqIcons.stethoscope,
          title: l.navDoctors,
          subtitle: l.medrepDoctorsSub,
          onTap: () => context.push('/app/doctors'),
        ),
    ];
    if (rows.isEmpty) return const SizedBox.shrink();
    return PqListCard(children: rows);
  }
}

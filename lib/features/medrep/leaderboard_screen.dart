import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'medrep_widgets.dart';
import 'portfolio_screen.dart' show teamDoctorKey;
import 'providers.dart';

/// Рейтинг медпредов (макеты MedRating / MedNotRanked).
class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  @override
  void initState() {
    super.initState();
    // Рейтинг меняется в течение дня — при каждом открытии берём свежий.
    Future.microtask(() {
      if (mounted) ref.invalidate(leaderboardProvider);
    });
  }

  /// null — по умолчанию: «Бланки», если команда только из врачей, иначе «Чеки».
  String? _picked;
  String _metric = 'checks';
  List<String> _metrics = const ['checks', 'pharm', 'quests'];

  /// Смешанная команда (фармацевты и врачи): два уровня вкладок —
  /// «Медпреды | Моя команда», под ними чипы (макеты MedRatingMix, MedRatingTeam).
  bool _mixed = false;
  bool _teamScope = false;

  /// «Моя команда»: 'pharm' — фармацевты по чекам, 'doctors' — врачи по бланкам.
  String _teamTab = 'pharm';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    // Бланки и врачи у медпредов — когда сервер их считает (recipesCount).
    final blanks =
        ref.watch(medrepMetricsProvider('all')).asData?.value.recipesCount !=
            null;
    final team = ref.watch(medrepTeamProvider).asData?.value;
    final hasDoctors = team?.doctors.isNotEmpty ?? false;
    final hasPharm = team?.pharmacists.isNotEmpty ?? false;
    _mixed = hasDoctors && hasPharm;
    final onlyDoctors = hasDoctors && !hasPharm && blanks;
    // Фармацевты — «Чеки», «Фармацевты»; врачи — «Бланки», «Врачи»;
    // «Квесты» — всем.
    final withDoctors = blanks && hasDoctors;
    final withPharm = !onlyDoctors;
    _metrics = [
      if (withPharm) 'checks',
      if (withDoctors) 'recipes',
      if (withPharm) 'pharm',
      if (withDoctors) 'doctors',
      'quests',
    ];
    _metric = _picked != null && _metrics.contains(_picked)
        ? _picked!
        : (onlyDoctors ? 'recipes' : 'checks');
    final teamView = _mixed && _teamScope;
    final provider = leaderboardProvider(_metric);
    final board = ref.watch(provider);
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;

    Widget body;
    if (teamView) {
      body = SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
        child: _teamContent(context, team!),
      );
    } else if (board.hasError && !board.hasValue) {
      body = PqAsync<Leaderboard>(
        value: board,
        onRetry: () => ref.invalidate(provider),
        data: (_) => const SizedBox.shrink(),
      );
    } else {
      body = SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
        child: _content(context, board.asData?.value),
      );
    }

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
              if (teamView) {
                ref.invalidate(medrepTeamProvider);
                await ref
                    .read(medrepTeamProvider.future)
                    .then((_) {}, onError: (_) {});
                return;
              }
              ref.invalidate(provider);
              await ref.read(provider.future).then((_) {}, onError: (_) {});
            },
            child: body,
          ),
        ),
      ]),
    );
  }

  String _tabLabel(String v) => switch (v) {
        'pharm' => context.l10n.medrepTabPharm,
        'recipes' => context.l10n.medrepTabBlanks,
        'doctors' => context.l10n.medrepTabDoctors,
        'quests' => context.l10n.medrepTabQuests,
        _ => context.l10n.medrepTabChecks,
      };

  String _unit(int n) => switch (_metric) {
        'pharm' => context.l10n.medrepUnitPharm(n),
        'recipes' => context.l10n.medrepUnitBlanks(n),
        'doctors' => context.l10n.medrepUnitDoctors(n),
        'quests' => context.l10n.medrepUnitQuests(n),
        _ => context.l10n.medrepUnitChecks(n),
      };

  String _count(int n) => switch (_metric) {
        'pharm' => context.l10n.medrepCountPharmacists(n),
        'recipes' => context.l10n.medrepCountBlanks(n),
        'doctors' => context.l10n.medrepCountDoctors(n),
        'quests' => context.l10n.medrepCountQuests(n),
        _ => context.l10n.medrepCountChecks(n),
      };

  /// Заголовок и вкладки. Без смешанной команды — сегменты; у смешанной —
  /// «Медпреды | Моя команда» и чипы второго уровня (переносятся по строкам).
  List<Widget> _header(String? subtitle) {
    final l = context.l10n;
    Widget chips(List<String> values, String selected, ValueChanged<String> on) =>
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final v in values)
            PqChip(
              height: 36,
              label: _tabLabel(v),
              selected: v == selected,
              onTap: () => on(v),
            ),
        ]);
    return [
      PqPageTitle(l.leaderboardTitle, subtitle: subtitle),
      if (!_mixed)
        PqSegmented<String>(
          values: _metrics,
          selected: _metric,
          labelOf: _tabLabel,
          onChanged: (v) => setState(() => _picked = v),
        )
      else
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          PqSegmented<bool>(
            values: const [false, true],
            selected: _teamScope,
            labelOf: (v) => v ? l.medrepRatingMyTeam : l.medrepRatingMedreps,
            onChanged: (v) => setState(() => _teamScope = v),
          ),
          const SizedBox(height: 12),
          if (_teamScope)
            chips(const ['pharm', 'doctors'], _teamTab,
                (v) => setState(() => _teamTab = v))
          else
            chips(_metrics, _metric, (v) => setState(() => _picked = v)),
        ]),
    ];
  }

  /// «Моя команда»: фармацевты по чекам или врачи по бланкам (макет MedRatingTeam).
  Widget _teamContent(BuildContext context, MedrepTeam team) {
    final pq = context.pq;
    final l = context.l10n;
    final doctors = _teamTab == 'doctors';
    final people = <({String name, String sub, int value, String? open})>[
      if (doctors)
        for (final d in team.doctors)
          (
            name: d.name,
            sub: [d.specialty, d.workplace].where((s) => s.isNotEmpty).join(' · '),
            value: d.recipes,
            open: '/app/portfolio/doctor/${teamDoctorKey(d)}',
          )
      else
        for (final p in team.pharmacists)
          (
            name: p.name,
            sub: [p.shop, p.city].where((s) => s.isNotEmpty).join(' · '),
            value: p.checks,
            open: p.telegramId == null ? null : '/app/portfolio/${p.telegramId}',
          ),
    ]..sort((a, b) => b.value.compareTo(a.value));
    String unit(int n) =>
        doctors ? l.medrepUnitBlanks(n) : l.medrepUnitChecks(n);
    final subtitle = [
      l.medrepRatingYourTeam,
      doctors
          ? l.medrepCountDoctors(people.length)
          : l.medrepCountPharm(people.length),
      doctors ? l.medrepByBlanks : l.medrepByChecks,
    ].join(' · ');

    if (people.isEmpty) {
      return PqStagger(gap: 16, children: [
        ..._header(subtitle),
        MedEmptyBlock(
          tile: MedPopTile(
            icon: PqIcons.users,
            background: pq.accentSoft,
            foreground: pq.accentText,
          ),
          title: l.medrepTeamNobody,
        ),
      ]);
    }
    return PqStagger(gap: 16, children: [
      ..._header(subtitle),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: _Podium(
          top: [
            for (var i = 0; i < people.length && i < 3; i++)
              LeaderRow(
                  rank: i + 1,
                  name: _shortName(people[i].name),
                  value: people[i].value),
          ],
          unit: unit,
        ),
      ),
      if (people.length > 3)
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (var i = 3; i < people.length; i++) ...[
            if (i > 3) const SizedBox(height: 8),
            _RankRow(
              row: LeaderRow(
                  rank: i + 1, name: people[i].name, value: people[i].value),
              me: false,
              unit: unit(people[i].value),
              subtitle: people[i].sub,
              onTap: people[i].open == null
                  ? null
                  : () => context.push(people[i].open!),
            ),
          ],
        ]),
    ]);
  }

  /// «Нодира Юсупова» → «Нодира Ю.» — подпись под пьедесталом.
  static String _shortName(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length < 2 || parts[1].isEmpty) return name;
    return '${parts[0]} ${parts[1].characters.first}.';
  }

  Widget _content(BuildContext context, Leaderboard? b) {
    final pq = context.pq;
    final l = context.l10n;
    final ranked = b != null && b.myRank > 0 && b.items.isNotEmpty;
    // Атрибуцию в подзаголовке не показываем — как на главной.
    final subtitle = b == null
        ? null
        : [
            if (b.company != null && b.company!.isNotEmpty) b.company!,
            l.medrepCountMedreps(b.items.length),
          ].join(' · ');
    final header = _header(subtitle);

    if (b == null) {
      return PqStagger(gap: 16, children: [
        ...header,
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            for (var i = 0; i < 5; i++) const PqSkeletonRow(),
          ]),
        ),
      ]);
    }

    if (b.items.isEmpty) {
      return PqStagger(gap: 16, children: [
        ...header,
        MedEmptyBlock(
          tile: MedPopTile(
            icon: PqIcons.award,
            background: pq.accentSoft,
            foreground: pq.accentText,
          ),
          title: l.medrepRatingEmpty,
        ),
      ]);
    }

    if (!ranked) {
      return PqStagger(gap: 16, children: [
        ...header,
        const _NotRankedCard(),
        PqListCard(children: [
          for (var i = 0; i < b.items.length && i < 5; i++)
            MedPersonRow(
              rank: b.items[i].rank,
              rankColor: i == 0 ? pq.warning : null,
              rankWidth: 24,
              rankSize: 16,
              verticalPadding: 10,
              name: b.items[i].name,
              avatarColors: i < 3 ? _listGradients[i] : kMedMutedGradient,
              value: '${b.items[i].value}',
              unit: _unit(b.items[i].value),
            ),
        ]),
      ]);
    }

    final rank = b.myRank;
    final items = b.items;
    final me = items.where((r) => r.isMe == true).firstOrNull ??
        (rank <= items.length ? items[rank - 1] : null);
    final above = rank >= 2 && rank - 2 < items.length ? items[rank - 2] : null;
    final gap = above == null || me == null
        ? 0
        : (above.value - me.value).clamp(0, 1 << 31);

    return PqStagger(gap: 16, children: [
      ...header,
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: _Podium(top: items.take(3).toList(), unit: _unit),
      ),
      // Под пьедесталом — места с 4-го до «вы + 2» (минимум три строки).
      if (items.length > 3)
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (var i = 3; i < items.length && i < (rank + 2).clamp(6, 1 << 20); i++) ...[
            if (i > 3) const SizedBox(height: 8),
            _RankRow(
              row: items[i],
              me: identical(items[i], me) || items[i].isMe == true,
              unit: _unit(items[i].value),
            ),
          ],
        ]),
      Text(
        above == null ? l.medrepLeader : l.medrepGapText(rank - 1, _count(gap)),
        textAlign: TextAlign.center,
        style: PqText.text(14, FontWeight.w400, c: pq.textMuted),
      ),
    ]);
  }
}

/// Градиенты аватаров пьедестала: 1, 2, 3 место.
const _podiumGradients = [
  [Color(0xFFF59E0B), Color(0xFFEF4444)],
  [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
  [Color(0xFFEC4899), Color(0xFF8B5CF6)],
];

/// Градиенты первых трёх строк списка «нет в рейтинге».
const _listGradients = [
  [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
  [Color(0xFFF59E0B), Color(0xFFEF4444)],
  [Color(0xFFEC4899), Color(0xFF8B5CF6)],
];

// ── Пьедестал ───────────────────────────────────────────────────────────

class _Podium extends StatelessWidget {
  const _Podium({required this.top, required this.unit});

  final List<LeaderRow> top;
  final String Function(int) unit;

  @override
  Widget build(BuildContext context) {
    // Порядок на экране: 2 · 1 · 3.
    const order = [1, 0, 2];
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      for (final (i, place) in order.indexed) ...[
        if (i > 0) const SizedBox(width: 10),
        Expanded(
          child: place < top.length
              ? _PodiumColumn(row: top[place], place: place, unit: unit)
              : const SizedBox.shrink(),
        ),
      ],
    ]);
  }
}

class _PodiumColumn extends StatelessWidget {
  const _PodiumColumn({required this.row, required this.place, required this.unit});

  final LeaderRow row;
  final int place;
  final String Function(int) unit;

  static const _colors = [Color(0xFFF59E0B), Color(0xFF6B9EF5), Color(0xFFEC4899)];
  static const _heights = [160.0, 120.0, 96.0];
  static const _popDelays = [700, 600, 500];
  static const _growDelays = [400, 300, 200];

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final color = _colors[place];
    final first = place == 0;
    final size = first ? 56.0 : 48.0;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      if (first) ...[
        const PqBob(
          duration: Duration(milliseconds: 2400),
          child: PqIcon(PqIcons.crown, size: 22, color: Color(0xFFF59E0B)),
        ),
        const SizedBox(height: 8),
      ],
      PqAnimate(
        fx: PqFx.pop,
        delay: Duration(milliseconds: _popDelays[place]),
        child: SizedBox(
          width: size,
          height: size + 8,
          child: Stack(clipBehavior: Clip.none, alignment: Alignment.topCenter, children: [
            MedAvatar(row.name, size: size, colors: _podiumGradients[place]),
            Positioned(
              bottom: 0,
              child: Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: pq.bg, width: 2),
                ),
                child: Text('${row.rank}',
                    style: PqText.text(12, FontWeight.w800, height: 1, c: Colors.white)),
              ),
            ),
          ]),
        ),
      ),
      // gap 8 + margin-top 6 − 8 px выступа значка места.
      const SizedBox(height: 6),
      Text(row.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: PqText.text(14, FontWeight.w600, c: pq.text)),
      const SizedBox(height: 8),
      PqAnimate(
        fx: PqFx.growY,
        delay: Duration(milliseconds: _growDelays[place]),
        child: Container(
          width: double.infinity,
          height: _heights[place],
          padding: const EdgeInsets.only(top: 14),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16), bottom: Radius.circular(6)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color, color.withValues(alpha: .2)],
            ),
          ),
          child: Column(children: [
            Text('${row.value}',
                style: PqText.heading(22, FontWeight.w800, c: Colors.white)),
            Opacity(
              opacity: .85,
              child: Text(unit(row.value), style: PqText.caption(c: Colors.white)),
            ),
          ]),
        ),
      ),
    ]);
  }
}

// ── Строка места (4+) ────────────────────────────────────────────────────

class _RankRow extends StatelessWidget {
  const _RankRow({
    required this.row,
    required this.me,
    required this.unit,
    this.subtitle,
    this.onTap,
  });

  final LeaderRow row;
  final bool me;
  final String unit;

  /// Вторая строка у людей команды: «Хирург · ГКБ №1» (макет MedRatingTeam).
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final card = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: me ? pq.accentSoft : pq.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: me ? pq.accent : pq.border),
      ),
      child: Row(children: [
        SizedBox(
          width: 24,
          child: Text('${row.rank}',
              style: PqText.heading(16, FontWeight.w700,
                  c: me ? pq.accentText : pq.textMuted)),
        ),
        const SizedBox(width: 12),
        MedAvatar(
          row.name,
          colors: me ? const [Color(0xFF3B82F6), Color(0xFF06B6D4)] : kMedMutedGradient,
          label: me ? l.medrepYouShort : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(me ? l.medrepYouName(row.name) : row.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.text(16, me ? FontWeight.w700 : FontWeight.w600,
                    c: pq.text)),
            if (subtitle != null && subtitle!.isNotEmpty)
              Text(subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.caption(c: pq.textMuted)),
          ]),
        ),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('${row.value}', style: PqText.amount(c: pq.text)),
          Text(unit, style: PqText.caption(c: pq.textMuted)),
        ]),
      ]),
    );
    return onTap == null ? card : PqPressable(onTap: onTap, child: card);
  }
}

// ── Нет в рейтинге ──────────────────────────────────────────────────────

class _NotRankedCard extends StatelessWidget {
  const _NotRankedCard();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return CustomPaint(
      foregroundPainter: _DashedRRect(color: pq.accent, radius: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: pq.accentSoft,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: pq.surface, shape: BoxShape.circle),
              child: PqIcon(PqIcons.award, size: 20, color: pq.accentText),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.medrepNotRankedTitle,
                    style: PqText.heading(17, FontWeight.w700, c: pq.text)),
                const SizedBox(height: 2),
                Text(l.medrepNotRankedText,
                    style: PqText.body(c: pq.textSecondary)),
              ]),
            ),
          ]),
          const SizedBox(height: 12),
          PqButton(
            label: l.medrepInviteTitle,
            icon: PqIcons.share,
            onPressed: () => context.push('/app/portfolio/invite'),
          ),
        ]),
      ),
    );
  }
}

/// Пунктирная рамка 1 px по скруглённому прямоугольнику (`border: 1px dashed`).
class _DashedRRect extends CustomPainter {
  _DashedRRect({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Offset.zero & size, Radius.circular(radius)).deflate(.5));
    for (final ui.PathMetric m in path.computeMetrics()) {
      for (double d = 0; d < m.length; d += 6) {
        canvas.drawPath(m.extractPath(d, (d + 3).clamp(0, m.length)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRect old) => old.color != color || old.radius != radius;
}

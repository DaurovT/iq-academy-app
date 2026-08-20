import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'portfolio_screen.dart' show initialsOf;
import 'providers.dart';

/// Экран «Рейтинг» медпреда. Дизайн перенесён из макета Figma
/// (тёмная 152:5 и светлая 152:108 темы).
class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  String _metric = 'checks';

  String _unit(String metric) => switch (metric) {
        'pharm' => context.l10n.leaderboardUnitPharm,
        'quests' => context.l10n.leaderboardUnitQuests,
        _ => context.l10n.leaderboardUnitChecks,
      };

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final board = ref.watch(leaderboardProvider(_metric));
    final unit = _unit(_metric);
    final tabs = [
      ('checks', context.l10n.leaderboardTabChecks),
      ('pharm', context.l10n.leaderboardTabPharm),
      ('quests', context.l10n.leaderboardTabQuests),
    ];

    return Scaffold(
      backgroundColor: p.bg,
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(medrepLeaderboardDecor)),
          Column(
            children: [
              const PharmTopBar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.leaderboardTitle,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: p.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _Tabs(
                      palette: p,
                      value: _metric,
                      tabs: tabs,
                      onChanged: (v) => setState(() => _metric = v),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: board.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => _ErrorView(
                    palette: p,
                    message: e.toString(),
                    onRetry: () =>
                        ref.invalidate(leaderboardProvider(_metric)),
                  ),
                  data: (b) => RefreshIndicator(
                    onRefresh: () async =>
                        ref.invalidate(leaderboardProvider(_metric)),
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      children: [
                        _InfoBanner(palette: p, board: b),
                        const SizedBox(height: 20),
                        if (b.items.length >= 3)
                          _Podium(palette: p, top: b.items.take(3).toList(), unit: unit),
                        const SizedBox(height: 12),
                        for (final row in b.items.skip(3))
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _RankRow(palette: p, row: row, unit: unit),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Табы ────────────────────────────────────────────────────────────────

class _Tabs extends StatelessWidget {
  const _Tabs({
    required this.palette,
    required this.value,
    required this.tabs,
    required this.onChanged,
  });

  final PharmPalette palette;
  final String value;
  final List<(String, String)> tabs;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        for (final (key, label) in tabs) ...[
          Expanded(
            child: _Pill(
              label: label,
              selected: value == key,
              palette: palette,
              isDark: isDark,
              onTap: () => onChanged(key),
            ),
          ),
          if (key != tabs.last.$1) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.label,
    required this.selected,
    required this.palette,
    required this.isDark,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final PharmPalette palette;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected
        ? palette.accent
        : (isDark ? const Color(0xFF22232B) : Colors.white);
    final fg = selected ? Colors.white : palette.textMuted;
    final border = selected
        ? Colors.transparent
        : (isDark ? const Color(0xFF2D2E38) : palette.cardBorder);
    return Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
        side: BorderSide(color: border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Инфо-баннер ─────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({required this.palette, required this.board});

  final PharmPalette palette;
  final Leaderboard board;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final attribution = board.mode == AttributionMode.primary
        ? context.l10n.leaderboardAttributionPrimary
        : context.l10n.leaderboardAttributionTotal;
    final company = board.company ?? context.l10n.leaderboardCompanyFallback;
    final total = board.items.length;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(12),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: palette.accent),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 13, color: palette.textMuted),
                children: [
                  TextSpan(
                      text: context.l10n.leaderboardMyRankLabel(company)),
                  TextSpan(
                    text: context.l10n.leaderboardMyRank(board.myRank, total),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: palette.accent,
                    ),
                  ),
                  TextSpan(text: ' · $attribution'),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Пьедестал ───────────────────────────────────────────────────────────

const _gold = Color(0xFFF59E0B);
const _blue = Color(0xFF3B82F6);
const _pink = Color(0xFFEC4899);

class _Podium extends StatelessWidget {
  const _Podium({required this.palette, required this.top, required this.unit});

  final PharmPalette palette;
  final List<LeaderRow> top;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final first = top[0];
    final second = top[1];
    final third = top[2];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: _Column(
            palette: palette,
            row: second,
            color: _blue,
            pedestalHeight: 92,
            unit: unit,
            crown: false,
            avatarSize: 48,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _Column(
            palette: palette,
            row: first,
            color: _gold,
            pedestalHeight: 130,
            unit: unit,
            crown: true,
            avatarSize: 60,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _Column(
            palette: palette,
            row: third,
            color: _pink,
            pedestalHeight: 72,
            unit: unit,
            crown: false,
            avatarSize: 48,
          ),
        ),
      ],
    );
  }
}

class _Column extends StatelessWidget {
  const _Column({
    required this.palette,
    required this.row,
    required this.color,
    required this.pedestalHeight,
    required this.unit,
    required this.crown,
    required this.avatarSize,
  });

  final PharmPalette palette;
  final LeaderRow row;
  final Color color;
  final double pedestalHeight;
  final String unit;
  final bool crown;
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isFirst = crown;
    return Column(
      children: [
        // корона или ранг
        SizedBox(
          height: 28,
          child: crown
              ? Icon(Icons.emoji_events, size: 22, color: _gold)
              : Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: palette.card,
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 1.5),
                  ),
                  child: Text(
                    '${row.rank}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 6),
        Container(
          width: avatarSize,
          height: avatarSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Text(
            initialsOf(row.name),
            style: TextStyle(
              fontSize: avatarSize * 0.34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          row.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: palette.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: pedestalHeight,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: isFirst
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [_gold, Color(0xFFD97706)],
                  )
                : null,
            color: isFirst
                ? null
                : color.withValues(alpha: isDark ? 0.24 : 0.14),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
          ),
          // FittedBox: на низком пьедестале (3-е место, 72px) цифра+подпись
          // не влезали и давали bottom overflow — ужимаем контент по месту.
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${row.value}',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: isFirst ? Colors.white : color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    unit,
                    style: TextStyle(
                      fontSize: 11,
                      color: isFirst
                          ? Colors.white.withValues(alpha: 0.9)
                          : color.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Строка рейтинга ─────────────────────────────────────────────────────

class _RankRow extends StatelessWidget {
  const _RankRow({required this.palette, required this.row, required this.unit});

  final PharmPalette palette;
  final LeaderRow row;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final me = row.isMe == true;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: me
            ? palette.accent.withValues(alpha: isDark ? 0.16 : 0.08)
            : palette.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: me ? palette.accent : palette.cardBorder,
          width: me ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '${row.rank}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: palette.textMuted,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: me ? palette.accent : const Color(0xFF7C3AED),
              shape: BoxShape.circle,
            ),
            child: Text(
              initialsOf(row.name),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              row.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: palette.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${row.value}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: palette.textPrimary,
                ),
              ),
              Text(
                unit,
                style: TextStyle(fontSize: 11, color: palette.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.palette,
    required this.message,
    required this.onRetry,
  });

  final PharmPalette palette;
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline,
                size: 40, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 12),
            Text(message,
                textAlign: TextAlign.center,
                style: TextStyle(color: palette.textMuted)),
            const SizedBox(height: 12),
            FilledButton.tonal(
                onPressed: onRetry,
                child: Text(context.l10n.leaderboardRetry)),
          ],
        ),
      ),
    );
  }
}

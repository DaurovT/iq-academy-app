import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/models/medrep.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/screen_decor.dart';
import 'home_screen.dart' show StatTile;
import 'portfolio_screen.dart' show initialsOf;
import 'providers.dart';

/// Деталь фармацевта (портфель медпреда). Дизайн перенесён из макета Figma
/// (тёмная 149:7 и светлая 149:106 темы).
class MedrepPharmacistDetailScreen extends ConsumerWidget {
  const MedrepPharmacistDetailScreen({super.key, required this.telegramId});
  final int telegramId;

  Future<void> _incentivize(BuildContext context, WidgetRef ref) async {
    var rating = 5.0;
    final note = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: Text(ctx.l10n.pharmDetailIncentivizeTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ctx.l10n.pharmDetailRating(rating.round())),
              Slider(
                value: rating,
                min: 1,
                max: 5,
                divisions: 4,
                label: '${rating.round()}',
                onChanged: (v) => setState(() => rating = v),
              ),
              TextField(
                controller: note,
                decoration: InputDecoration(
                    labelText: ctx.l10n.pharmDetailComment),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(ctx.l10n.pharmDetailCancel)),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(ctx.l10n.pharmDetailSend)),
          ],
        ),
      ),
    );
    if (ok != true) return;
    if (!context.mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    try {
      await ref
          .read(apiProvider)
          .medrep
          .incentivize(telegramId, rating.round(), note.text.trim());
      messenger.showSnackBar(
          SnackBar(content: Text(l10n.pharmDetailSent)));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);
    final detail = ref.watch(pharmacistDetailProvider(telegramId));

    return Scaffold(
      backgroundColor: p.bg,
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(medrepPharmacistDecor)),
          Column(
            children: [
              _DetailTopBar(palette: p),
              Expanded(
                child: detail.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => _ErrorView(
                    palette: p,
                    message: e.toString(),
                    onRetry: () =>
                        ref.invalidate(pharmacistDetailProvider(telegramId)),
                  ),
                  data: (d) => _Body(
                    palette: p,
                    detail: d,
                    onIncentivize: () => _incentivize(context, ref),
                    onRefresh: () async => ref
                        .invalidate(pharmacistDetailProvider(telegramId)),
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

// ── Верхняя панель с кнопкой «назад» ─────────────────────────────────────

class _DetailTopBar extends StatelessWidget {
  const _DetailTopBar({required this.palette});

  final PharmPalette palette;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoColor = isDark ? palette.textPrimary : const Color(0xFF293B71);
    final topInset = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: topInset),
      decoration: BoxDecoration(
        color: isDark ? palette.bg : Colors.white,
        border: isDark
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE5E8EB))),
      ),
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.canPop()
                    ? context.pop()
                    : context.go('/app/portfolio'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, size: 20, color: palette.textPrimary),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.pharmDetailBack,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: palette.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 24,
                    height: 18,
                    colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'PharmIQ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: logoColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Тело ────────────────────────────────────────────────────────────────

const _tileBlue = Color(0xFF3B82F6);
const _tileGreen = Color(0xFF10B981);
const _tileTeal = Color(0xFF14B8A6);
const _tileAmber = Color(0xFFF59E0B);

class _Body extends StatelessWidget {
  const _Body({
    required this.palette,
    required this.detail,
    required this.onIncentivize,
    required this.onRefresh,
  });

  final PharmPalette palette;
  final PharmacistDetail detail;
  final VoidCallback onIncentivize;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final active = detail.checks > 0;
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          // профиль по центру
          Center(
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: _tileTeal,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    initialsOf(detail.name),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  detail.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: palette.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${detail.shop} · ${detail.city}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: palette.textMuted),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _StatusPill(active: active),
                    const SizedBox(width: 12),
                    _RewardButton(onTap: onIncentivize),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // сетка метрик 2×2
          Row(
            children: [
              Expanded(
                child: StatTile(
                  palette: palette,
                  value: '${detail.checks}',
                  label: context.l10n.pharmDetailChecks,
                  icon: Icons.receipt_long_outlined,
                  color: _tileBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(
                  palette: palette,
                  value: '${detail.approvedPacks}',
                  label: context.l10n.pharmDetailPacks,
                  icon: Icons.inventory_2_outlined,
                  color: _tileGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatTile(
                  palette: palette,
                  value: '${detail.quests}',
                  label: context.l10n.pharmDetailQuests,
                  icon: Icons.flag_outlined,
                  color: _tileTeal,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(
                  palette: palette,
                  value: '${detail.recentChecks.fold<int>(0, (s, c) => s + c.packs)}',
                  label: context.l10n.pharmDetailIqcPoints,
                  icon: Icons.adjust_outlined,
                  color: _tileAmber,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            context.l10n.pharmDetailRecentChecks,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: palette.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          if (detail.recentChecks.isEmpty)
            Text(context.l10n.pharmDetailNoChecks,
                style: TextStyle(fontSize: 14, color: palette.textMuted))
          else
            Container(
              decoration: BoxDecoration(
                color: palette.card,
                borderRadius: BorderRadius.circular(16),
                border: Theme.of(context).brightness == Brightness.dark
                    ? null
                    : Border.all(color: palette.cardBorder),
              ),
              child: Column(
                children: [
                  for (var i = 0; i < detail.recentChecks.length; i++) ...[
                    if (i > 0)
                      Divider(height: 1, color: palette.cardBorder),
                    _CheckRow(palette: palette, check: detail.recentChecks[i]),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF10B981) : const Color(0xFF9CA3AF);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color),
      ),
      child: Text(
        active
            ? context.l10n.pharmDetailActive
            : context.l10n.pharmDetailPassive,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _RewardButton extends StatelessWidget {
  const _RewardButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF10B981),
      borderRadius: BorderRadius.circular(999),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, size: 16, color: Colors.white),
              const SizedBox(width: 6),
              Text(
                context.l10n.pharmDetailIncentivize,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  const _CheckRow({required this.palette, required this.check});

  final PharmPalette palette;
  final RecentCheck check;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '№${check.id}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: palette.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  formatDate(check.createdAt),
                  style: TextStyle(fontSize: 12, color: palette.textMuted),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6)
                  .withValues(alpha: isDark ? 0.20 : 0.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              '+${check.packs}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3B82F6),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _StatusChip(status: check.status, isDark: isDark),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status, required this.isDark});

  final CheckStatus status;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final Color color = switch (status) {
      CheckStatus.approved => const Color(0xFF10B981),
      CheckStatus.rejected || CheckStatus.aiWrong => const Color(0xFFEF4444),
      _ => const Color(0xFFF59E0B),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.20 : 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.label(context.l10n).toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
          color: color,
        ),
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
                child: Text(context.l10n.pharmDetailRetry)),
          ],
        ),
      ),
    );
  }
}

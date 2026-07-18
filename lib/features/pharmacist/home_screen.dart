import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/models/quest.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import 'checks_screen.dart';
import '../news/news_home_block.dart';
import '../news/survey_home_block.dart';
import '../mini_apps/mini_apps_home_block.dart';
import 'providers.dart';

/// Главная фармацевта. Дизайн перенесён из макета Figma «pharmiq-home-md3»
/// (тёмная и светлая темы). Цвета — из [PharmPalette].
class PharmacistHome extends ConsumerWidget {
  const PharmacistHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final name = ref
            .watch(authControllerProvider)
            .asData
            ?.value
            .account
            ?.fullName ??
        '';
    final wallet = ref.watch(walletProvider).asData?.value;
    final quests =
        ref.watch(questsListProvider(QuestTarget.checks)).asData?.value ??
            const [];
    final checks = ref.watch(checksProvider).asData?.value ?? const [];

    final iqc = wallet?.balanceIqc ?? 0;
    final approved =
        checks.where((c) => c.status == CheckStatus.approved).length;

    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(walletProvider);
                ref.invalidate(questsListProvider(QuestTarget.checks));
                ref.invalidate(checksProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    // Декоративные абстракции на фоне (только светлая тема),
                    // растянуты на всю высоту контента и скроллятся вместе с ним.
                    if (!isDark)
                      const Positioned.fill(
                        child: IgnorePointer(child: _HomeDecor()),
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      _Greeting(palette: p, name: name),
                      const SizedBox(height: 24),
                      _WalletCard(
                        palette: p,
                        iqc: iqc,
                        onWallet: () => context.go('/app/wallet'),
                      ),
                      const SizedBox(height: 16),
                      _QuickAction(
                        palette: p,
                        onTap: () => showNewCheckSheet(context),
                      ),
                      const SizedBox(height: 24),
                      _StatsRow(
                        palette: p,
                        activeQuests: quests.length,
                        approvedChecks: approved,
                        iqc: iqc,
                      ),
                      const SizedBox(height: 24),
                      _SectionHeader(
                        palette: p,
                        title: context.l10n.homePhActiveQuests,
                        action: context.l10n.homePhAllQuests,
                        onAction: () => context.go('/app/quests'),
                      ),
                      const SizedBox(height: 16),
                      if (quests.isEmpty)
                        _EmptyCard(
                            palette: p, text: context.l10n.homePhNoActiveQuests)
                      else
                        for (final q in quests.take(3)) ...[
                          _QuestCard(quest: q),
                          const SizedBox(height: 12),
                        ],
                      const SizedBox(height: 12),
                      const NewsHomeBlock(),
                      const SizedBox(height: 24),
                      const SurveyHomeBlock(),
                      const SizedBox(height: 24),
                      const MiniAppsHomeBlock(),
                      const SizedBox(height: 24),
                      _SectionHeader(
                        palette: p,
                        title: context.l10n.homePhRecentChecks,
                        action: context.l10n.homePhAllChecks,
                        onAction: () => context.go('/app/checks'),
                      ),
                      const SizedBox(height: 16),
                      if (checks.isEmpty)
                        _EmptyCard(palette: p, text: context.l10n.homePhNoChecks)
                      else
                        for (final c in checks.take(3)) ...[
                          _ReceiptItem(palette: p, check: c),
                          const SizedBox(height: 8),
                        ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Декоративные абстракции (светлая тема) ──────────────────────────────

/// Декоративный фон светлой темы. Перенесён 1:1 из макета Figma
/// (bg-decorative-pattern, нода 164:4): плоские круги и скруглённые
/// прямоугольники с низкой прозрачностью, слегка размытые для мягкости.
class _HomeDecor extends StatelessWidget {
  const _HomeDecor();

  static const _blue = Color(0xFF2563EB);
  static const _pink = Color(0xFFEC4899);
  static const _purple = Color(0xFF7C3AED);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: const [
          // blob-blue
          _Circle(top: -140, left: -120, size: 360, color: _blue, a: 0.20),
          // rect-purple
          _Rect(
              top: -120,
              right: -80,
              width: 320,
              height: 220,
              radius: 56,
              color: _purple,
              a: 0.16),
          // circle-pink
          _Circle(top: 430, left: -200, size: 260, color: _pink, a: 0.22),
          // blob-blue-soft
          _Circle(top: 260, right: -110, size: 300, color: _blue, a: 0.16),
          // rect-purple-soft
          _Rect(
              bottom: -81,
              left: -154,
              width: 280,
              height: 180,
              radius: 48,
              color: _purple,
              a: 0.14),
          // circle-pink-small
          _Circle(bottom: -140, right: -120, size: 180, color: _pink, a: 0.20),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.color,
    required this.a,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;
  final double a;

  @override
  Widget build(BuildContext context) {
    // Плоский полупрозрачный круг без размытия и градиентов.
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: a),
        ),
      ),
    );
  }
}

class _Rect extends StatelessWidget {
  const _Rect({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
    required this.a,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final double a;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color.withValues(alpha: a),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

// ── Приветствие ─────────────────────────────────────────────────────────

class _Greeting extends StatelessWidget {
  const _Greeting({required this.palette, required this.name});

  final PharmPalette palette;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.isEmpty
              ? context.l10n.homePhGreeting
              : context.l10n.homePhGreetingName(name),
          style: TextStyle(
            fontSize: 32,
            height: 1.1,
            fontWeight: FontWeight.w700,
            color: palette.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.homePhGreetingSub,
          style: TextStyle(fontSize: 16, color: palette.textMuted),
        ),
      ],
    );
  }
}

// ── Карточка кошелька ───────────────────────────────────────────────────

class _WalletCard extends StatelessWidget {
  const _WalletCard({
    required this.palette,
    required this.iqc,
    required this.onWallet,
  });

  final PharmPalette palette;
  final int iqc;
  final VoidCallback onWallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: palette.walletGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.homePhWalletBalanceLabel,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: palette.walletText.withValues(alpha: 0.75),
                ),
              ),
              _WalletPill(palette: palette, onTap: onWallet),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$iqc',
                style: TextStyle(
                  fontSize: 56,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: palette.walletText,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'IQC',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: palette.walletText.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WalletPill extends StatelessWidget {
  const _WalletPill({required this.palette, required this.onTap});

  final PharmPalette palette;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: palette.walletPillBg,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: palette.walletPillBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.homePhWalletButton,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: palette.walletText,
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right, size: 16, color: palette.walletText),
          ],
        ),
      ),
    );
  }
}

// ── Быстрое действие ────────────────────────────────────────────────────

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.palette, required this.onTap});

  final PharmPalette palette;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: palette.quickBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: palette.quickBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: palette.quickIconBg,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.photo_camera_outlined,
                  size: 24, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.homePhSendCheck,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: palette.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.l10n.homePhSendCheckSub,
                    style: TextStyle(fontSize: 14, color: palette.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Статистика ──────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.palette,
    required this.activeQuests,
    required this.approvedChecks,
    required this.iqc,
  });

  final PharmPalette palette;
  final int activeQuests;
  final int approvedChecks;
  final int iqc;

  @override
  Widget build(BuildContext context) {
    // IntrinsicHeight + stretch: все плитки по высоте самой высокой, без
    // жёсткого height (на Android шрифт выше, чем на iOS, — был overflow).
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatItem(
                palette: palette,
                value: '$activeQuests',
                label: context.l10n.homePhStatActiveQuests),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatItem(
                palette: palette,
                value: '$approvedChecks',
                label: context.l10n.homePhStatApprovedChecks),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatItem(
                palette: palette,
                value: '$iqc',
                label: context.l10n.homePhStatIqcPoints),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.palette,
    required this.value,
    required this.label,
  });

  final PharmPalette palette;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: palette.accent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12, height: 1.4, color: palette.textMuted),
          ),
        ],
      ),
    );
  }
}

// ── Заголовок секции ────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.palette,
    required this.title,
    required this.action,
    required this.onAction,
  });

  final PharmPalette palette;
  final String title;
  final String action;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: palette.textPrimary,
          ),
        ),
        InkWell(
          onTap: onAction,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              action,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: palette.accent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Карточка квеста ─────────────────────────────────────────────────────

class _QuestCard extends StatelessWidget {
  const _QuestCard({required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    final pct = (quest.progress.clamp(0, 1) * 100).round();
    final isVoucher = quest.rewardType == RewardType.voucher;
    return GestureDetector(
      onTap: () => context.go('/app/quests'),
      child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF241C52), Color(0xFF2E2470), Color(0xFF4B2A93)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40632CD4),
            blurRadius: 28,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Мягкое свечение в правом верхнем углу для глубины.
          Positioned(
            top: -50,
            right: -30,
            child: Container(
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0x66A855F7), Color(0x00A855F7)],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        quest.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isVoucher
                            ? const Color(0xFFFACC15)
                            : Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isVoucher ? context.l10n.homePhVoucherBadge : 'IQC',
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w800,
                          color: isVoucher
                              ? const Color(0xFF1F2937)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.homePhProgress,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.65))),
                    Text(
                      context.l10n.homePhPctDone(pct),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFC4B5FD),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _ProgressBar(value: quest.progress.clamp(0, 1).toDouble()),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

/// Гладкий прогресс-бар: полупрозрачная дорожка + градиентная заливка
/// (фиолетовый → голубой) с мягким свечением.
class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 8,
        color: Colors.white.withValues(alpha: 0.14),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: value <= 0 ? 0.03 : value,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFA855F7), Color(0xFF38BDF8)],
                ),
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [
                  BoxShadow(color: Color(0x80A855F7), blurRadius: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Строка чека ─────────────────────────────────────────────────────────

class _ReceiptItem extends StatelessWidget {
  const _ReceiptItem({required this.palette, required this.check});

  final PharmPalette palette;
  final Check check;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final status = check.status;
    final approved = status == CheckStatus.approved;
    final rejected = status == CheckStatus.rejected;

    final (Color chipBg, Color chipFg) = approved
        ? (palette.approvedChipBg, palette.approvedText)
        : rejected
            ? (palette.rejectedChipBg, palette.rejectedText)
            : (palette.chipNeutralBg, palette.chipNeutralText);

    final iconBg = (isDark && approved)
        ? const Color(0xFF173F20)
        : palette.receiptIconBg;
    final iconColor =
        (isDark && approved) ? palette.approvedText : palette.textMuted;

    return Material(
      color: palette.card,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/app/checks/${check.id}'),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: isDark ? null : Border.all(color: palette.cardBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(color: iconBg, shape: BoxShape.circle),
                child: Icon(Icons.description_outlined,
                    size: 20, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.homePhCheckNumber(check.id),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: palette.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      formatDate(check.createdAt),
                      style: TextStyle(fontSize: 12, color: palette.textMuted),
                    ),
                  ],
                ),
              ),
              _Chip(label: status.label(context.l10n), bg: chipBg, fg: chipFg),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Мелкие элементы ─────────────────────────────────────────────────────

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.bg, required this.fg});

  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
          color: fg,
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.palette, required this.text});

  final PharmPalette palette;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: palette.textMuted),
      ),
    );
  }
}

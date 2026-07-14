import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/models/medrep.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

/// Обзор медпреда «Портфель». Дизайн перенесён из макета Figma
/// (тёмная 144:5 и светлая 144:126 темы).
class MedrepHome extends ConsumerStatefulWidget {
  const MedrepHome({super.key});

  @override
  ConsumerState<MedrepHome> createState() => _MedrepHomeState();
}

class _MedrepHomeState extends ConsumerState<MedrepHome> {
  String _period = 'all';

  static const _fallbackLink = 'https://t.me/PharmQuestBot?start=ref_';

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final name = ref
            .watch(authControllerProvider)
            .asData
            ?.value
            .account
            ?.fullName ??
        '';
    final metrics = ref.watch(medrepMetricsProvider(_period));
    final link = ref.watch(medrepReflinkProvider).asData?.value ?? _fallbackLink;
    final mode = metrics.asData?.value.mode;
    final attribution =
        mode == AttributionMode.primary ? 'Первичная' : 'Общая';

    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(medrepMetricsProvider);
                ref.invalidate(medrepReflinkProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Positioned.fill(child: ScreenDecor(medrepHomeDecor)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _Greeting(
                              palette: p, name: name, attribution: attribution),
                          const SizedBox(height: 20),
                          _PeriodTabs(
                            palette: p,
                            value: _period,
                            onChanged: (v) => setState(() => _period = v),
                          ),
                          const SizedBox(height: 20),
                          metrics.when(
                            loading: () => const _StatsSkeleton(),
                            error: (e, _) => _ErrorCard(
                              palette: p,
                              message: e.toString(),
                              onRetry: () =>
                                  ref.invalidate(medrepMetricsProvider),
                            ),
                            data: (m) => _StatsGrid(palette: p, metrics: m),
                          ),
                          const SizedBox(height: 20),
                          _ReferralCard(palette: p, link: link),
                          const SizedBox(height: 20),
                          _MenuRow(
                            palette: p,
                            icon: Icons.people_alt_outlined,
                            label: 'Фармацевты',
                            onTap: () => context.go('/app/portfolio'),
                          ),
                          const SizedBox(height: 12),
                          _MenuRow(
                            palette: p,
                            icon: Icons.person_add_alt_1_outlined,
                            label: 'Ожидают подтверждения',
                            onTap: () => context.go('/app/referrals'),
                          ),
                          const SizedBox(height: 12),
                          _MenuRow(
                            palette: p,
                            icon: Icons.business_outlined,
                            label: 'Компании',
                            onTap: () => context.go('/app/companies'),
                          ),
                          const SizedBox(height: 12),
                          _MenuRow(
                            palette: p,
                            icon: Icons.emoji_events_outlined,
                            label: 'Рейтинг',
                            onTap: () => context.go('/app/leaderboard'),
                          ),
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

// ── Приветствие ─────────────────────────────────────────────────────────

class _Greeting extends StatelessWidget {
  const _Greeting({
    required this.palette,
    required this.name,
    required this.attribution,
  });

  final PharmPalette palette;
  final String name;
  final String attribution;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.isEmpty ? 'Привет!' : 'Привет, $name',
          style: TextStyle(
            fontSize: 32,
            height: 1.1,
            fontWeight: FontWeight.w700,
            color: palette.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Атрибуция: $attribution',
          style: TextStyle(fontSize: 15, color: palette.textMuted),
        ),
      ],
    );
  }
}

// ── Сегментированный фильтр периода ──────────────────────────────────────

class _PeriodTabs extends StatelessWidget {
  const _PeriodTabs({
    required this.palette,
    required this.value,
    required this.onChanged,
  });

  final PharmPalette palette;
  final String value;
  final ValueChanged<String> onChanged;

  static const _items = [
    ('all', 'Все'),
    ('30', '30 дн'),
    ('7', '7 дн'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        for (final (key, label) in _items) ...[
          _Pill(
            label: label,
            selected: value == key,
            palette: palette,
            isDark: isDark,
            onTap: () => onChanged(key),
          ),
          const SizedBox(width: 8),
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
    final fg = selected
        ? Colors.white
        : palette.textMuted;
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Сетка метрик 2×2 ─────────────────────────────────────────────────────

const _tileBlue = Color(0xFF3B82F6);
const _tileGreen = Color(0xFF10B981);
const _tileTeal = Color(0xFF14B8A6);
const _tileAmber = Color(0xFFF59E0B);

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.palette, required this.metrics});

  final PharmPalette palette;
  final MedrepMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatTile(
                palette: palette,
                value: '${metrics.pharmCount}',
                label: 'Фармацевтов',
                icon: Icons.people_alt_outlined,
                color: _tileBlue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatTile(
                palette: palette,
                value: '${metrics.checksCount}',
                label: 'Чеков',
                icon: Icons.receipt_long_outlined,
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
                value: '${metrics.approvedPacksSum}',
                label: 'Упаковок',
                icon: Icons.inventory_2_outlined,
                color: _tileTeal,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatTile(
                palette: palette,
                value: '${metrics.questsDone}',
                label: 'Квестов',
                icon: Icons.adjust_outlined,
                color: _tileAmber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Цветная плитка метрики (используется на обзоре и в детали фармацевта).
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.palette,
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });

  final PharmPalette palette;
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? null : palette.card,
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.alphaBlend(color.withValues(alpha: 0.30), palette.card),
                  palette.card,
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 26,
                    height: 1.0,
                    fontWeight: FontWeight.w800,
                    color: palette.textPrimary,
                  ),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: isDark ? 0.22 : 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: color),
              ),
            ],
          ),
          const Spacer(),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13, color: palette.textMuted),
          ),
        ],
      ),
    );
  }
}

class _StatsSkeleton extends StatelessWidget {
  const _StatsSkeleton();

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    Widget box() => Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: p.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: p.cardBorder),
            ),
          ),
        );
    return Column(
      children: [
        Row(children: [box(), const SizedBox(width: 12), box()]),
        const SizedBox(height: 12),
        Row(children: [box(), const SizedBox(width: 12), box()]),
      ],
    );
  }
}

// ── Реферальная карточка ─────────────────────────────────────────────────

class _ReferralCard extends StatelessWidget {
  const _ReferralCard({required this.palette, required this.link});

  final PharmPalette palette;
  final String link;

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: link));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ссылка скопирована')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Реферальная ссылка',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: palette.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Отправьте ссылку провизору — он привяжется к вам при регистрации',
            style: TextStyle(fontSize: 13, height: 1.35, color: palette.textMuted),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF15161C) : const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: palette.cardBorder),
            ),
            child: Text(
              link,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: palette.textPrimary),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _OutlineButton(
                  palette: palette,
                  icon: Icons.copy_outlined,
                  label: 'Копировать',
                  onTap: () => _copy(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FilledButton(
                  color: palette.accent,
                  icon: Icons.share_outlined,
                  label: 'Поделиться',
                  onTap: () => _copy(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({
    required this.palette,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final PharmPalette palette;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: palette.accent),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: palette.accent),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: palette.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilledButton extends StatelessWidget {
  const _FilledButton({
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                label,
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

// ── Пункт меню ───────────────────────────────────────────────────────────

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.palette,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final PharmPalette palette;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: palette.card,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
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
                decoration: BoxDecoration(
                  color: palette.accent.withValues(alpha: isDark ? 0.18 : 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 20, color: palette.accent),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: palette.textPrimary,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 20, color: palette.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Ошибка ───────────────────────────────────────────────────────────────

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({
    required this.palette,
    required this.message,
    required this.onRetry,
  });

  final PharmPalette palette;
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.cardBorder),
      ),
      child: Column(
        children: [
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(color: palette.textMuted)),
          const SizedBox(height: 12),
          FilledButton.tonal(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}

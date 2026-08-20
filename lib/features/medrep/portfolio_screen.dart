import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

/// Экран «Фармацевты» (портфель медпреда). Дизайн перенесён из макета Figma
/// (тёмная 147:7 и светлая 147:261 темы).
class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  String _query = '';
  int _tab = 0; // 0 — все, 1 — активные, 2 — пассивные

  /// Активным считаем фармацевта, у которого есть хотя бы один чек
  /// (в модели нет отдельного статуса).
  bool _isActive(PortfolioPharmacist p) => p.checks > 0;

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final list = ref.watch(portfolioProvider);

    return Scaffold(
      backgroundColor: p.bg,
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(medrepPortfolioDecor)),
          Column(
            children: [
              const PharmTopBar(),
              Expanded(
                child: list.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => _ErrorView(
                    palette: p,
                    message: e.toString(),
                    onRetry: () => ref.invalidate(portfolioProvider),
                  ),
                  data: (items) => _Loaded(
                    palette: p,
                    items: items,
                    query: _query,
                    tab: _tab,
                    isActive: _isActive,
                    onQuery: (v) => setState(() => _query = v),
                    onTab: (v) => setState(() => _tab = v),
                    onRefresh: () async => ref.invalidate(portfolioProvider),
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

class _Loaded extends StatelessWidget {
  const _Loaded({
    required this.palette,
    required this.items,
    required this.query,
    required this.tab,
    required this.isActive,
    required this.onQuery,
    required this.onTab,
    required this.onRefresh,
  });

  final PharmPalette palette;
  final List<PortfolioPharmacist> items;
  final String query;
  final int tab;
  final bool Function(PortfolioPharmacist) isActive;
  final ValueChanged<String> onQuery;
  final ValueChanged<int> onTab;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final activeCount = items.where(isActive).length;
    final passiveCount = items.length - activeCount;

    var filtered = items;
    if (tab == 1) {
      filtered = filtered.where(isActive).toList();
    } else if (tab == 2) {
      filtered = filtered.where((p) => !isActive(p)).toList();
    }
    final q = query.trim().toLowerCase();
    if (q.isNotEmpty) {
      filtered = filtered
          .where((p) =>
              p.name.toLowerCase().contains(q) ||
              p.shop.toLowerCase().contains(q) ||
              p.city.toLowerCase().contains(q))
          .toList();
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          _Header(palette: palette, total: items.length),
          const SizedBox(height: 16),
          _SearchField(palette: palette, onChanged: onQuery),
          const SizedBox(height: 16),
          _Tabs(
            palette: palette,
            tab: tab,
            all: items.length,
            active: activeCount,
            passive: passiveCount,
            onTab: onTab,
          ),
          const SizedBox(height: 16),
          if (filtered.isEmpty)
            _EmptyCard(palette: palette)
          else
            for (var i = 0; i < filtered.length; i++) ...[
              _PharmacistCard(
                palette: palette,
                pharmacist: filtered[i],
                index: i,
                active: isActive(filtered[i]),
              ),
              const SizedBox(height: 12),
            ],
        ],
      ),
    );
  }
}

// ── Заголовок ───────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({required this.palette, required this.total});

  final PharmPalette palette;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                context.l10n.portfolioTitle,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: palette.textPrimary,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: palette.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                context.l10n.portfolioUpdated,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: palette.accent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          context.l10n.portfolioInPortfolio(total),
          style: TextStyle(fontSize: 14, color: palette.textMuted),
        ),
      ],
    );
  }
}

// ── Поиск ───────────────────────────────────────────────────────────────

class _SearchField extends StatelessWidget {
  const _SearchField({required this.palette, required this.onChanged});

  final PharmPalette palette;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(14),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 15, color: palette.textPrimary),
        decoration: InputDecoration(
          isDense: true,
          hintText: context.l10n.portfolioSearchHint,
          hintStyle: TextStyle(fontSize: 15, color: palette.textMuted),
          prefixIcon: Icon(Icons.search, size: 20, color: palette.textMuted),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }
}

// ── Табы ────────────────────────────────────────────────────────────────

class _Tabs extends StatelessWidget {
  const _Tabs({
    required this.palette,
    required this.tab,
    required this.all,
    required this.active,
    required this.passive,
    required this.onTab,
  });

  final PharmPalette palette;
  final int tab;
  final int all;
  final int active;
  final int passive;
  final ValueChanged<int> onTab;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _TabPill(
            label: context.l10n.portfolioTabAll(all),
            selected: tab == 0,
            palette: palette,
            isDark: isDark,
            onTap: () => onTab(0)),
        _TabPill(
            label: context.l10n.portfolioTabActive(active),
            selected: tab == 1,
            palette: palette,
            isDark: isDark,
            onTap: () => onTab(1)),
        _TabPill(
            label: context.l10n.portfolioTabPassive(passive),
            selected: tab == 2,
            palette: palette,
            isDark: isDark,
            onTap: () => onTab(2)),
      ],
    );
  }
}

class _TabPill extends StatelessWidget {
  const _TabPill({
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
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

// ── Карточка фармацевта ──────────────────────────────────────────────────

const _avatarColors = [
  Color(0xFF3B82F6),
  Color(0xFF7C3AED),
  Color(0xFF14B8A6),
  Color(0xFFEC4899),
  Color(0xFFF59E0B),
];

String initialsOf(String name) {
  final parts = name.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty);
  if (parts.isEmpty) return '?';
  final letters = parts.take(2).map((s) => s.characters.first.toUpperCase());
  return letters.join();
}

class _PharmacistCard extends StatelessWidget {
  const _PharmacistCard({
    required this.palette,
    required this.pharmacist,
    required this.index,
    required this.active,
  });

  final PharmPalette palette;
  final PortfolioPharmacist pharmacist;
  final int index;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = _avatarColors[index % _avatarColors.length];
    return Material(
      color: palette.card,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () =>
            context.push('/app/portfolio/${pharmacist.telegramId}'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: isDark ? null : Border.all(color: palette.cardBorder),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: active ? accent : palette.textMuted,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.all(12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: _Avatar(color: accent, name: pharmacist.name),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pharmacist.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: palette.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${pharmacist.shop} · ${pharmacist.city}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 12, color: palette.textMuted),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _MiniChip(
                        label: context.l10n
                            .portfolioChecksChip(pharmacist.checks),
                        color: const Color(0xFF3B82F6),
                        isDark: isDark,
                      ),
                      const SizedBox(height: 6),
                      _MiniChip(
                        label: context.l10n
                            .portfolioQuestsChip(pharmacist.quests),
                        color: const Color(0xFF10B981),
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.color, required this.name});

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        initialsOf(name),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({
    required this.label,
    required this.color,
    required this.isDark,
  });

  final String label;
  final Color color;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.20 : 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

// ── Прочее ──────────────────────────────────────────────────────────────

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.palette});

  final PharmPalette palette;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Text(
        context.l10n.portfolioNotFound,
        textAlign: TextAlign.center,
        style: TextStyle(color: palette.textMuted),
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
                onPressed: onRetry, child: Text(context.l10n.portfolioRetry)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/app_modules.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/sapper.dart';
import '../../widgets/pq_states.dart';
import 'sapper_widgets.dart';


final miniAppsProvider = FutureProvider<List<MiniApp>>((ref) => ref.watch(apiProvider).miniApps.list());
final sapperDrawsProvider = FutureProvider<List<SapperDrawItem>>((ref) => ref.watch(apiProvider).sapper.draws());
final sapperFieldProvider = FutureProvider.family<SapperField, int>((ref, id) => ref.watch(apiProvider).sapper.field(id));

void _back(BuildContext context, String fallback) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(fallback);
  }
}

/// Ближайший активный розыгрыш (или первый в списке).
SapperDrawItem? _primaryDraw(List<SapperDrawItem> draws) {
  for (final d in draws) {
    if (d.status == 'active') return d;
  }
  return draws.isEmpty ? null : draws.first;
}

/// Заголовок экрана: h1 Onest 30/700 + подзаголовок 15.
class _PageTitle extends StatelessWidget {
  const _PageTitle({required this.title, required this.subtitle, this.gap = 4, this.height});

  final String title;
  final String subtitle;
  final double gap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: PqText.display(c: pq.text)),
      SizedBox(height: gap),
      Text(subtitle,
          style: PqText.text(15, FontWeight.w400, height: height, c: pq.textMuted)),
    ]);
  }
}

// ── Хаб мини-приложений (макет MiniApps) ─────────────────────────────────────
class MiniAppsHubScreen extends ConsumerWidget {
  const MiniAppsHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final v = ref.watch(miniAppsProvider);
    return PqScreen(
      child: Column(children: [
        SapperBackLink(label: l10n.navHome, onTap: () => _back(context, '/app')),
        Expanded(
          child: PqAsync<List<MiniApp>>(
            value: v,
            onRetry: () => ref.invalidate(miniAppsProvider),
            loadingBuilder: (_) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: PqSkeletonList(title: l10n.miniAppsTitle, rows: 3),
            ),
            data: (apps) {
              final visible = apps.where((a) => ref.moduleVisible(a.key)).toList();
              final soon = visible.where((a) => !a.available).toList();
              return PqRefresh(
                onRefresh: () {
                  ref.invalidate(sapperDrawsProvider);
                  return ref.refresh(miniAppsProvider.future);
                },
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                  children: [
                    PqStagger.auth(gap: 20, children: [
                      _PageTitle(title: l10n.miniAppsTitle, subtitle: l10n.miniAppsSubtitle),
                      for (final a in visible.where((a) => a.available))
                        a.key == 'sapper' ? _SapperHeroCard(app: a) : _AppTile(app: a),
                      for (final a in soon) _SoonCard(title: a.title, subtitle: a.subtitle),
                    ]),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

/// Большая карточка «Супер Сапёр»: градиентная обложка 160 с полем-декором,
/// описание, капсулы призов/своих клеток и круглая кнопка-стрелка.
class _SapperHeroCard extends ConsumerWidget {
  const _SapperHeroCard({required this.app});

  final MiniApp app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l10n = context.l10n;
    final draws = ref.watch(sapperDrawsProvider).asData?.value ?? const <SapperDrawItem>[];
    final draw = _primaryDraw(draws);
    final active = draw != null && draw.status == 'active';
    return PqPressable(
      onTap: () => context.push('/app/sapper'),
      semanticLabel: app.title,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: pq.border),
          boxShadow: pq.cardShadow,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: 160,
            decoration: BoxDecoration(gradient: sapperGradient(pq)),
            child: Stack(clipBehavior: Clip.hardEdge, children: [
              const Positioned(right: 18, top: 34, child: _HeroField()),
              if (active)
                Positioned(
                  left: 20,
                  top: 20,
                  child: SapperGlassPill(sapperResultsPill(l10n, draw.revealAt),
                      icon: PqIcons.clock),
                ),
              Positioned(
                left: 20,
                bottom: 18,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  // В макете название — в две строки («Супер / Сапёр»).
                  child: Text(
                    app.title.trim().replaceFirst(' ', '\n'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.heading(30, FontWeight.w800, height: 1.1, c: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              if (app.subtitle.isNotEmpty) ...[
                Text(app.subtitle,
                    style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textSecondary)),
                const SizedBox(height: 14),
              ],
              Row(children: [
                Expanded(
                  child: Wrap(spacing: 8, runSpacing: 8, children: [
                    if (draw != null && draw.prizeCount > 0)
                      PqPill(l10n.sapperPrizesCount(draw.prizeCount),
                          tone: PqTone.warning, icon: PqIcons.gift),
                    if (draw != null && draw.myCells > 0)
                      PqPill(l10n.sapperMyCellsCount(draw.myCells),
                          tone: PqTone.accent, icon: PqIcons.grid),
                  ]),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: pq.accent, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: PqIcon(PqIcons.chevronRight, size: 20, color: pq.onAccent),
                ),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}

/// Декор обложки: поле 5×4 клеток 22 (зазор 5), повёрнуто на −8°;
/// клетки появляются pqPop .4s с шагом 20 мс после .2s.
class _HeroField extends StatelessWidget {
  const _HeroField();

  static const _accent = {3, 7, 16};
  static const _gold = {9, 18};

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    Color colorOf(int i) {
      if (_accent.contains(i)) return pq.isDark ? pq.accent : Colors.white;
      if (_gold.contains(i)) {
        return pq.isDark ? const Color(0xFFFBBF24) : PqColors.voucher;
      }
      return Colors.white.withValues(alpha: pq.isDark ? .10 : .18);
    }

    return ExcludeSemantics(
      child: Transform.rotate(
        angle: -8 * 3.1415926535 / 180,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          for (var r = 0; r < 4; r++) ...[
            if (r > 0) const SizedBox(height: 5),
            Row(mainAxisSize: MainAxisSize.min, children: [
              for (var c = 0; c < 5; c++) ...[
                if (c > 0) const SizedBox(width: 5),
                PqAnimate(
                  fx: PqFx.pop,
                  duration: const Duration(milliseconds: 400),
                  delay: Duration(milliseconds: 200 + 20 * (r * 5 + c)),
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: colorOf(r * 5 + c),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ]),
          ],
        ]),
      ),
    );
  }
}

/// Доступное мини-приложение без собственного экрана (на будущее).
class _AppTile extends StatelessWidget {
  const _AppTile({required this.app});

  final MiniApp app;

  @override
  Widget build(BuildContext context) => PqMenuTile(
        icon: PqIcons.sparkles,
        title: app.title,
        subtitle: app.subtitle.isEmpty ? null : app.subtitle,
        trailing: const SizedBox.shrink(),
      );
}

/// «Скоро»: пунктирная карточка 1.5, плитка 48 с покачиванием pqBob 3s.
class _SoonCard extends StatelessWidget {
  const _SoonCard({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      enabled: false,
      child: CustomPaint(
        painter: _DashedRRectPainter(color: pq.borderStrong, radius: 20, width: 1.5),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            PqBob(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: pq.surfaceAlt, borderRadius: BorderRadius.circular(14)),
                alignment: Alignment.center,
                child: PqIcon(PqIcons.sparkles, size: 24, color: pq.warning),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(title, style: PqText.text(16, FontWeight.w700, c: pq.text)),
                    Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: pq.surfaceAlt, borderRadius: BorderRadius.circular(14)),
                      child: Align(
                        widthFactor: 1,
                        child: Text(context.l10n.miniAppsSoon,
                            style: PqText.tag(c: pq.textMuted)),
                      ),
                    ),
                  ],
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(subtitle, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
                ],
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  _DashedRRectPainter({required this.color, required this.radius, required this.width});

  final Color color;
  final double radius;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final r = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(width / 2),
      Radius.circular(radius),
    );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    const dash = 4.5, gap = 3.0;
    for (final m in (Path()..addRRect(r)).computeMetrics()) {
      for (double d = 0; d < m.length; d += dash + gap) {
        canvas.drawPath(m.extractPath(d, (d + dash).clamp(0, m.length)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRectPainter old) =>
      old.color != color || old.radius != radius || old.width != width;
}

// ── «Супер Сапёр»: вступление и список розыгрышей (макет SapperIntro) ───────
class SapperDrawsScreen extends ConsumerWidget {
  const SapperDrawsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final v = ref.watch(sapperDrawsProvider);
    final draws = v.asData?.value;
    final target = draws == null ? null : _primaryDraw(draws);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        SapperBackLink(
            label: l10n.miniAppsTitle, onTap: () => _back(context, '/app/mini-apps')),
        Expanded(
          child: Stack(children: [
            Positioned.fill(
              child: PqAsync<List<SapperDrawItem>>(
                value: v,
                onRetry: () => ref.invalidate(sapperDrawsProvider),
                loadingBuilder: (_) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                  child: PqSkeletonList(title: l10n.sapperTitle, rows: 3),
                ),
                data: (draws) => PqRefresh(
                  onRefresh: () {
                    for (final d in draws) {
                      ref.invalidate(sapperFieldProvider(d.id));
                    }
                    return ref.refresh(sapperDrawsProvider.future);
                  },
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                        16, 0, 16, target == null ? 40 : sapperStickyClearance(context, 140)),
                    children: [
                      PqStagger.auth(gap: 24, children: [
                        _PageTitle(
                          title: l10n.sapperTitle,
                          subtitle: l10n.sapperSubtitle,
                          gap: 6,
                          height: 1.5,
                        ),
                        if (draws.isEmpty)
                          PqEmptyState(
                            icon: PqIcons.grid,
                            title: l10n.sapperNoDraws,
                            padding: const EdgeInsets.symmetric(vertical: 24),
                          ),
                        for (final d in draws) _DrawCard(d: d),
                        _HowToPlay(price: target?.priceIqc ?? 1),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            if (target != null)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SapperStickyBottom(children: [
                  PqButton(
                    label: target.status == 'active'
                        ? l10n.sapperGoToGame
                        : l10n.sapperViewResults,
                    icon: PqIcons.grid,
                    onPressed: () => context.push('/app/sapper/${target.id}'),
                  ),
                ]),
              ),
          ]),
        ),
      ]),
    );
  }
}

/// Карточка розыгрыша на градиенте: название + время, призы, цена/мои клетки,
/// заполненность поля (pqFill .9s после .3s).
class _DrawCard extends ConsumerWidget {
  const _DrawCard({required this.d});

  final SapperDrawItem d;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l10n = context.l10n;
    final active = d.status == 'active';
    final fill = d.cellCount > 0 ? (d.occupied / d.cellCount).clamp(0.0, 1.0) : 0.0;
    // Состав призов есть только в данных поля — подгружаем его (кэш общий с игрой).
    final legend = ref.watch(sapperFieldProvider(d.id)).asData?.value.legend ?? const [];
    final white = PqText.text(14, FontWeight.w400, c: Colors.white.withValues(alpha: .8));

    Widget tile(String label, String value) => Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style: PqText.text(12, FontWeight.w400, c: Colors.white.withValues(alpha: .8))),
            const SizedBox(height: 2),
            Text(value, style: PqText.heading(20, FontWeight.w800, c: Colors.white)),
          ]),
        );

    return PqPressable(
      onTap: () => context.push('/app/sapper/${d.id}'),
      semanticLabel: d.title,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: sapperGradient(pq),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0xB37C3AED),
              offset: Offset(0, 24),
              blurRadius: 40,
              spreadRadius: -24,
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Expanded(
              child: Text(d.title,
                  style: PqText.heading(20, FontWeight.w700, c: Colors.white)),
            ),
            const SizedBox(width: 12),
            SapperGlassPill(
              active ? sapperCountdown(l10n, d.revealAt) : l10n.sapperRevealed,
              icon: PqIcons.clock,
            ),
          ]),
          const SizedBox(height: 16),
          Text(l10n.sapperHiddenLabel, style: white),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: [
            if (legend.isNotEmpty)
              for (final p in legend) SapperPrizeChip(count: p.count, label: p.label)
            else
              SapperGlassPill(l10n.sapperPrizesCount(d.prizeCount),
                  icon: PqIcons.gift, alpha: .16),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: tile(l10n.sapperCellPriceTitle, '${d.priceIqc} IQC')),
            const SizedBox(width: 8),
            Expanded(child: tile(l10n.sapperMyCellsTitle, '${d.myCells}')),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: Text(l10n.sapperOccupiedTitle, style: white)),
            Text(l10n.sapperOccupiedOf(d.occupied, d.cellCount),
                style: PqText.text(14, FontWeight.w700, c: Colors.white)),
          ]),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 8,
              color: Colors.white.withValues(alpha: .18),
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: fill,
                child: PqAnimate(
                  fx: PqFx.fillX,
                  duration: const Duration(milliseconds: 900),
                  delay: const Duration(milliseconds: 300),
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
        ]),
      ),
    );
  }
}

/// «Как участвовать»: три шага с номерами + ссылка на правила акции
/// (правила должны быть доступны до участия — требование App Store / Google Play).
class _HowToPlay extends StatelessWidget {
  const _HowToPlay({required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final steps = [
      (PqIcons.grid, l10n.sapperStep1Title, l10n.sapperStep1Text(price)),
      (PqIcons.clock, l10n.sapperStep2Title, l10n.sapperStep2Text),
      (PqIcons.squareCheck, l10n.sapperStep3Title, l10n.sapperStep3Text),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(l10n.sapperHowTitle, style: PqText.section(c: pq.text)),
      const SizedBox(height: 8),
      PqCard(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Column(children: [
          for (var i = 0; i < steps.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                border: i < steps.length - 1
                    ? Border(bottom: BorderSide(color: pq.divider))
                    : null,
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox.square(
                  dimension: 40,
                  child: Stack(clipBehavior: Clip.none, children: [
                    PqIconTile(steps[i].$1, size: 40, radius: 12, iconSize: 20),
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(color: pq.accent, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text('${i + 1}',
                            style: PqText.text(12, FontWeight.w800, height: 1, c: pq.onAccent)),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(steps[i].$2, style: PqText.text(16, FontWeight.w600, c: pq.text)),
                    const SizedBox(height: 2),
                    Text(steps[i].$3, style: PqText.body(c: pq.textMuted)),
                  ]),
                ),
              ]),
            ),
        ]),
      ),
      // Ссылки на правила в макете нет — оставлена: правила акции должны быть
      // доступны до участия (App Store 5.3 / Google Play).
      const SizedBox(height: 8),
      Center(
        child: PqButton(
          label: l10n.sapperRulesButton,
          kind: PqButtonKind.text,
          icon: PqIcons.fileText,
          expand: false,
          onPressed: () => context.push('/app/sapper-rules'),
        ),
      ),
    ]);
  }
}

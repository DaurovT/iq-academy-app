import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';

// Общие элементы раздела «Мини-приложения · Супер Сапёр» (макеты MiniApps,
// SapperIntro, SapperGame, SapperResult).

/// Обратный отсчёт до ISO-времени: «6д 23ч», «3ч 12м», «4м 10с», «скоро».
String sapperCountdown(AppLocalizations l10n, String? iso) {
  if (iso == null) return '';
  final t = DateTime.tryParse(iso);
  if (t == null) return '';
  final ms = t.difference(DateTime.now()).inSeconds;
  if (ms <= 0) return l10n.sapperCountdownSoon;
  final d = ms ~/ 86400, h = (ms % 86400) ~/ 3600, m = (ms % 3600) ~/ 60, s = ms % 60;
  if (d > 0) return l10n.sapperCountdownDaysHours(d, h);
  if (h > 0) return l10n.sapperCountdownHoursMinutes(h, m);
  return l10n.sapperCountdownMinutesSeconds(m, s);
}

/// Текст капсулы времени: до итогов — «Итоги через …». Когда время уже
/// наступило (сервер подведёт итоги в течение ~20 с) — короткое «Скоро».
String sapperResultsPill(AppLocalizations l10n, String? iso) {
  final t = iso == null ? null : DateTime.tryParse(iso);
  if (t == null || t.difference(DateTime.now()).inSeconds <= 0) return l10n.miniAppsSoon;
  return l10n.sapperResultsIn(sapperCountdown(l10n, iso));
}

/// Приз-ваучер (иначе — IQC). Бэкенд отдаёт только подпись приза.
bool sapperIsVoucher(String label) {
  final s = label.toLowerCase();
  return s.contains('ваучер') || s.contains('voucher') || s.contains('vaucher');
}

/// «10 IQC» → «+10 IQC» (как в макете); ваучер — без изменений.
String sapperPrizeText(String label) =>
    RegExp(r'^\d').hasMatch(label.trim()) ? '+${label.trim()}' : label;

/// Число из подписи IQC-приза для клетки поля: «10 IQC» → «10».
String? sapperPrizeAmount(String label) =>
    RegExp(r'\d[\d\s]*').firstMatch(label)?.group(0)?.replaceAll(RegExp(r'\s'), '');

/// CSS `linear-gradient(<angle>deg, …)` — направление считается в пикселях
/// по размеру блока, как в браузере.
class SapperCssGradient extends Gradient {
  const SapperCssGradient({required this.angle, required super.colors, super.stops});

  /// Угол в градусах (0 — вверх, 90 — вправо).
  final double angle;

  @override
  Shader createShader(Rect rect, {TextDirection? textDirection}) {
    final a = angle * math.pi / 180;
    final dir = Offset(math.sin(a), -math.cos(a));
    final len = (rect.width * dir.dx).abs() + (rect.height * dir.dy).abs();
    final half = dir * (len / 2);
    final st = stops ??
        List<double>.generate(colors.length, (i) => i / math.max(1, colors.length - 1));
    return ui.Gradient.linear(rect.center - half, rect.center + half, colors, st);
  }

  @override
  Gradient scale(double factor) => SapperCssGradient(
        angle: angle,
        colors: [for (final c in colors) Color.lerp(null, c, factor)!],
        stops: stops,
      );

  @override
  Gradient withOpacity(double opacity) => SapperCssGradient(
        angle: angle,
        colors: [for (final c in colors) c.withValues(alpha: c.a * opacity)],
        stops: stops,
      );
}

/// Фирменный фиолетово-синий градиент карточек Сапёра (145°).
Gradient sapperGradient(PqColors pq) => pq.isDark
    ? const SapperCssGradient(
        angle: 145,
        colors: [Color(0xFF3B1D7A), Color(0xFF1E1B4B), Color(0xFF172554)],
        stops: [0, .6, 1],
      )
    : const SapperCssGradient(
        angle: 145,
        colors: [Color(0xFF7C3AED), Color(0xFF4F46E5), Color(0xFF2563EB)],
        stops: [0, .55, 1],
      );

/// Фиолетовый акцент «IQC» / выигрыша в списке победителей.
Color sapperPurple(PqColors pq) =>
    pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);

/// Цвета клеток поля (из `K.c` интерактивного прототипа SapperGame).
class SapperCellColors {
  const SapperCellColors._({
    required this.free,
    required this.freeBorder,
    required this.theirs,
    required this.theirsFg,
    required this.mine,
    required this.mineFg,
    required this.sel,
    required this.selBorder,
    required this.selFg,
    required this.iqc,
    required this.iqcFg,
    required this.empty,
  });

  final Color free, freeBorder, theirs, theirsFg, mine, mineFg;
  final Color sel, selBorder, selFg, iqc, iqcFg, empty;
  Color get voucher => PqColors.voucher;
  Color get voucherFg => PqColors.onVoucher;

  factory SapperCellColors.of(PqColors pq) => pq.isDark
      ? SapperCellColors._(
          free: const Color(0xFF1D1E27),
          freeBorder: pq.border,
          theirs: const Color(0xFF262733),
          theirsFg: pq.textFaint,
          mine: pq.accent,
          mineFg: pq.onAccent,
          sel: PqColors.reward,
          selBorder: const Color(0xFFC4B5FD),
          selFg: Colors.white,
          iqc: const Color(0xFFFBBF24),
          iqcFg: const Color(0xFF3A2E0E),
          empty: const Color(0xFF15161D),
        )
      : SapperCellColors._(
          free: Colors.white,
          freeBorder: const Color(0xFFE5E7EB),
          theirs: const Color(0xFFEEF0F4),
          theirsFg: pq.textFaint,
          mine: pq.accent,
          mineFg: pq.onAccent,
          sel: const Color(0xFFEDE9FE),
          selBorder: PqColors.reward,
          selFg: const Color(0xFF6D28D9),
          iqc: const Color(0xFFF59E0B),
          iqcFg: Colors.white,
          empty: pq.bg,
        );
}

/// Шапка «‹ Раздел»: круг 36 с шевроном + подпись акцентом 15/600, зона 44.
class SapperBackLink extends StatelessWidget {
  const SapperBackLink({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final border = pq.iconButtonBorder;
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: PqPressable(
            onTap: onTap,
            scale: .96,
            semanticLabel: context.l10n.sapperBackTo(label),
            child: ExcludeSemantics(
              child: SizedBox(
                height: 44,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: pq.iconButtonBg,
                        shape: BoxShape.circle,
                        border: border == null ? null : Border.all(color: border),
                      ),
                      alignment: Alignment.center,
                      child: PqIcon(PqIcons.chevronLeft, size: 18, color: pq.text),
                    ),
                    const SizedBox(width: 4),
                    Text(label, style: PqText.text(15, FontWeight.w600, c: pq.accent)),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Полупрозрачная капсула 28 на градиентной карточке (белый текст 12/700).
class SapperGlassPill extends StatelessWidget {
  const SapperGlassPill(this.label, {super.key, this.icon, this.alpha = .18});

  final String label;
  final PqIcons? icon;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: alpha),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[
          PqIcon(icon!, size: 14, color: Colors.white),
          const SizedBox(width: 6),
        ],
        Text(label, maxLines: 1, style: PqText.tag(c: Colors.white)),
      ]),
    );
  }
}

/// Капсула приза «2 × 10 IQC» (монеты) / «1 × Ваучер …» (билет).
class SapperPrizeChip extends StatelessWidget {
  const SapperPrizeChip({super.key, required this.count, required this.label});

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) => SapperGlassPill(
        '$count × $label',
        icon: sapperIsVoucher(label) ? PqIcons.ticket : PqIcons.coins,
        alpha: .16,
      );
}

/// Закреплённый низ экрана: растворение фона (0 → bg к 45 %) и кнопка.
class SapperStickyBottom extends StatelessWidget {
  const SapperStickyBottom({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final inset = MediaQuery.paddingOf(context).bottom;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [pq.bg.withValues(alpha: 0), pq.bg, pq.bg],
          stops: const [0, .45, 1],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, math.max(28, inset + 8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              children[i],
            ],
          ],
        ),
      ),
    );
  }
}

/// Нижний отступ прокрутки над [SapperStickyBottom].
double sapperStickyClearance(BuildContext context, double base) =>
    base + math.max(0, MediaQuery.paddingOf(context).bottom - 20);

/// Легенда поля: квадрат 12 (радиус 4, рамка 1) + подпись 12.
class SapperFieldLegend extends StatelessWidget {
  const SapperFieldLegend({super.key, required this.items});

  /// (заливка, рамка, подпись).
  final List<(Color, Color, String)> items;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        for (final it in items)
          Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: it.$1,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: it.$2),
              ),
            ),
            const SizedBox(width: 6),
            Text(it.$3, style: PqText.caption(c: pq.textMuted)),
          ]),
      ],
    );
  }
}

/// Сетка поля: колонки по 44 (или меньше на узком экране), зазор 4, по центру.
class SapperGrid extends StatelessWidget {
  const SapperGrid({
    super.key,
    required this.cols,
    required this.count,
    required this.semanticLabel,
    required this.cellBuilder,
  });

  final int cols;
  final int count;
  final String semanticLabel;
  final Widget Function(int index, double size) cellBuilder;

  @override
  Widget build(BuildContext context) {
    final c = math.max(1, cols);
    return Semantics(
      label: semanticLabel,
      container: true,
      child: LayoutBuilder(builder: (context, box) {
        final size = math.min(44.0, (box.maxWidth - 4 * (c - 1)) / c).floorToDouble();
        final rows = (count / c).ceil();
        return Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            for (var r = 0; r < rows; r++) ...[
              if (r > 0) const SizedBox(height: 4),
              Row(mainAxisSize: MainAxisSize.min, children: [
                for (var col = 0; col < c; col++) ...[
                  if (col > 0) const SizedBox(width: 4),
                  if (r * c + col < count)
                    SizedBox.square(dimension: size, child: cellBuilder(r * c + col, size))
                  else
                    SizedBox.square(dimension: size),
                ],
              ]),
            ],
          ]),
        );
      }),
    );
  }
}

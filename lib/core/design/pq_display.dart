import 'package:flutter/material.dart';

import 'pq_colors.dart';
import 'pq_icon.dart';
import 'pq_icons.dart';
import 'pq_motion.dart';
import 'pq_text.dart';

/// Статус чека/рецепта: капсула 12/700 на мягкой заливке тона.
class PqStatusBadge extends StatelessWidget {
  const PqStatusBadge(this.label, {super.key, required this.tone});

  final String label;
  final PqTone tone;

  @override
  Widget build(BuildContext context) {
    final t = context.pq.tone(tone);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: t.bg, borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: PqText.tag(c: t.fg)),
    );
  }
}

/// Метка награды квеста: «+30 IQC» (фиолетовая) или «Ваучер» (жёлтая).
class PqRewardTag extends StatelessWidget {
  const PqRewardTag.iqc(this.label, {super.key}) : voucher = false;
  const PqRewardTag.voucher(this.label, {super.key}) : voucher = true;

  final String label;
  final bool voucher;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: voucher ? PqColors.voucher : PqColors.reward,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: PqText.tag(
          c: voucher ? PqColors.onVoucher : Colors.white,
          w: voucher ? FontWeight.w800 : FontWeight.w700,
        ),
      ),
    );
  }
}

/// Капсула 28 с иконкой: «+3 IQC», «6д 23ч».
class PqPill extends StatelessWidget {
  const PqPill(this.label, {super.key, this.tone = PqTone.neutral, this.icon});

  final String label;
  final PqTone tone;
  final PqIcons? icon;

  @override
  Widget build(BuildContext context) {
    final t = context.pq.tone(tone);
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: t.bg, borderRadius: BorderRadius.circular(14)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[
          PqIcon(icon!, size: 14, color: t.fg),
          const SizedBox(width: 6),
        ],
        Text(label, maxLines: 1, style: PqText.tag(c: t.fg)),
      ]),
    );
  }
}

/// Красный счётчик непрочитанного (22) или точка (10).
class PqCounter extends StatelessWidget {
  const PqCounter(this.count, {super.key});
  const PqCounter.dot({super.key}) : count = null;

  final int? count;

  @override
  Widget build(BuildContext context) {
    if (count == null) {
      return Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(color: PqColors.badge, shape: BoxShape.circle),
      );
    }
    return Container(
      constraints: const BoxConstraints(minWidth: 22),
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          color: PqColors.badge, borderRadius: BorderRadius.circular(11)),
      alignment: Alignment.center,
      child: Text(count! > 99 ? '99+' : '$count', style: PqText.tag(c: Colors.white)),
    );
  }
}

/// Плитка с иконкой: 44×44 радиус 12 (строки), 36 (показатели), 48 (меню).
class PqIconTile extends StatelessWidget {
  const PqIconTile(
    this.icon, {
    super.key,
    this.tone = PqTone.accent,
    this.size = 44,
    this.radius = 12,
    this.iconSize,
    this.background,
    this.foreground,
  });

  final PqIcons icon;
  final PqTone tone;
  final double size;
  final double radius;
  final double? iconSize;
  final Color? background;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final t = context.pq.tone(tone);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background ?? t.bg,
        borderRadius: BorderRadius.circular(radius),
      ),
      alignment: Alignment.center,
      child: PqIcon(icon,
          size: iconSize ?? (size >= 44 ? 20 : 18), color: foreground ?? t.fg),
    );
  }
}

/// Карточка: радиус 20, рамка 1, фон surface; в светлой теме — мягкая тень.
class PqCard extends StatelessWidget {
  const PqCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 20,
    this.onTap,
    this.color,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? pq.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor ?? pq.border),
        boxShadow: pq.cardShadow,
      ),
      child: child,
    );
    return onTap == null ? card : PqPressable(onTap: onTap, child: card);
  }
}

/// Карточка-список: строки с разделителями, поля 16 по бокам.
class PqListCard extends StatelessWidget {
  const PqListCard({super.key, required this.children, this.footer});

  final List<Widget> children;

  /// Блок под строками через пунктир (подсказка).
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        // Container (а не DecoratedBox): рамка занимает 1 px, как border-bottom в CSS.
        for (var i = 0; i < children.length; i++)
          Container(
            decoration: BoxDecoration(
              border: i < children.length - 1
                  ? Border(bottom: BorderSide(color: pq.divider))
                  : null,
            ),
            child: children[i],
          ),
        if (footer != null)
          CustomPaint(
            painter: _DashedTopBorder(pq.borderStrong),
            // 1 px сверху — место под пунктирную рамку (border-top: 1px dashed).
            child: Padding(padding: const EdgeInsets.fromLTRB(0, 15, 0, 16), child: footer),
          ),
      ]),
    );
  }
}

class _DashedTopBorder extends CustomPainter {
  _DashedTopBorder(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 6) {
      canvas.drawLine(Offset(x, .5), Offset((x + 3).clamp(0, size.width), .5), p);
    }
  }

  @override
  bool shouldRepaint(_DashedTopBorder old) => old.color != color;
}

/// Строка списка: плитка 44 · заголовок (≤2 строк) + подпись · правый блок.
class PqListRow extends StatelessWidget {
  const PqListRow({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.tone = PqTone.accent,
    this.leading,
    this.trailing,
    this.value,
    this.valueCaption,
    this.valueTone,
    this.valueIsAmount = true,
    this.onTap,
    this.chevron = false,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
  });

  final String title;
  final String? subtitle;
  final PqIcons? icon;
  final PqTone tone;
  final Widget? leading;

  /// Произвольный правый блок (кнопка «Переснять» и т. п.).
  final Widget? trailing;

  /// Правое значение («+144 IQC», «~24 ч») и подпись под ним.
  final String? value;
  final String? valueCaption;
  final PqTone? valueTone;

  /// true — Onest 16/700; false — Inter 14/600 (время ожидания).
  final bool valueIsAmount;
  final VoidCallback? onTap;
  final bool chevron;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final vt = valueTone == null ? null : pq.tone(valueTone!);
    final row = Padding(
      padding: padding,
      child: Row(children: [
        leading ?? (icon != null ? PqIconTile(icon!, tone: tone) : const SizedBox.shrink()),
        if (leading != null || icon != null) const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.rowTitle(c: pq.text)),
              if (subtitle != null) ...[
                const SizedBox(height: 3),
                Text(subtitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.caption(c: pq.textMuted)),
              ],
            ],
          ),
        ),
        if (value != null) ...[
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value!,
                  style: valueIsAmount
                      ? PqText.amount(c: vt?.fg ?? pq.text)
                      : PqText.link(c: vt?.fg ?? pq.text)),
              if (valueCaption != null) ...[
                const SizedBox(height: 2),
                Text(valueCaption!, style: PqText.caption(c: pq.textMuted)),
              ],
            ],
          ),
        ],
        if (trailing != null) ...[const SizedBox(width: 12), trailing!],
        if (chevron) ...[
          const SizedBox(width: 8),
          PqIcon(PqIcons.chevronRight, size: 18, color: pq.textMuted),
        ],
      ]),
    );
    return onTap == null ? row : PqPressable(onTap: onTap, child: row);
  }
}

/// Показатель: плитка 36 + крупное число Onest 30/800 + подпись.
class PqStatCard extends StatelessWidget {
  const PqStatCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    this.tone = PqTone.accent,
    this.onTap,
  });

  final String value;
  final String label;
  final PqIcons icon;
  final PqTone tone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        PqIconTile(icon, tone: tone, size: 36),
        const SizedBox(height: 10),
        Text(value, style: PqText.stat(c: pq.text)),
        const SizedBox(height: 2),
        Text(label, style: PqText.body(c: pq.textMuted)),
      ]),
    );
  }
}

/// Пустое состояние: плитка 88 (радиус 28) с покачиванием pqBob 3s,
/// заголовок Onest 22/700, текст 15, необязательное действие.
class PqEmptyState extends StatelessWidget {
  const PqEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.action,
    this.tone,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
  });

  final PqIcons icon;
  final String title;
  final String? message;
  final Widget? action;

  /// null — нейтральная серая плитка.
  final PqTone? tone;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final t = tone == null ? (bg: pq.surfaceAlt, fg: pq.textMuted) : pq.tone(tone!);
    return Padding(
      padding: padding,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        PqBob(
          child: Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(color: t.bg, borderRadius: BorderRadius.circular(28)),
            alignment: Alignment.center,
            child: PqIcon(icon, size: 40, color: t.fg),
          ),
        ),
        const SizedBox(height: 18),
        Text(title, textAlign: TextAlign.center, style: PqText.emptyTitle(c: pq.text)),
        if (message != null) ...[
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(message!,
                textAlign: TextAlign.center,
                style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textMuted)),
          ),
        ],
        if (action != null) ...[const SizedBox(height: 20), action!],
      ]),
    );
  }
}

/// Прямоугольник скелетона (pqShim 1.4s).
class PqSkeleton extends StatelessWidget {
  const PqSkeleton({super.key, this.width, this.height = 14, this.radius = 8});

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqShimmer(
      base: pq.skeletonBase,
      highlight: pq.skeletonHighlight,
      width: width,
      height: height,
      radius: radius,
    );
  }
}

/// Скелетон строки списка: плитка 44 + две полосы.
class PqSkeletonRow extends StatelessWidget {
  const PqSkeletonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(children: [
        const PqSkeleton(width: 44, height: 44, radius: 12),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FractionallySizedBox(
                widthFactor: .7, child: const PqSkeleton(height: 14)),
            const SizedBox(height: 8),
            FractionallySizedBox(
                widthFactor: .4, child: const PqSkeleton(height: 12)),
          ]),
        ),
      ]),
    );
  }
}

/// Сегментный прогресс (квесты): N сегментов высотой 6 с зазором 4;
/// сегменты «наливаются» каскадом (pq-seg). [current] — дышащий сегмент.
class PqSegmentProgress extends StatelessWidget {
  const PqSegmentProgress({
    super.key,
    required this.total,
    required this.filled,
    required this.fillColor,
    required this.trackColor,
    this.height = 6,
    this.current,
    this.currentColor,
    this.colors,
  });

  final int total;
  final int filled;
  final Color fillColor;
  final Color trackColor;
  final double height;

  /// Индекс сегмента «в процессе» — мерцает (pqBreath).
  final int? current;
  final Color? currentColor;

  /// Индивидуальные цвета сегментов (перекрывают fill/track).
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    final n = total.clamp(1, 60);
    return Row(children: [
      for (var i = 0; i < n; i++) ...[
        if (i > 0) const SizedBox(width: 4),
        Expanded(
          child: PqSegFill(
            index: i,
            child: _seg(i),
          ),
        ),
      ],
    ]);
  }

  Widget _seg(int i) {
    final c = colors != null && i < colors!.length
        ? colors![i]
        : i == current
            ? (currentColor ?? fillColor)
            : i < filled
                ? fillColor
                : trackColor;
    final box = Container(
      height: height,
      decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(height / 2)),
    );
    return i == current ? PqBreath(child: box) : box;
  }
}

/// Сплошная полоса прогресса: заливка «наливается» (pqFill .8s после .3s).
class PqProgressBar extends StatelessWidget {
  const PqProgressBar({
    super.key,
    required this.value,
    this.height = 8,
    this.color,
    this.trackColor,
    this.gradient,
    this.delay = const Duration(milliseconds: 300),
  });

  final double value;
  final double height;
  final Color? color;
  final Color? trackColor;
  final Gradient? gradient;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: Container(
        height: height,
        color: trackColor ?? pq.surfaceAlt,
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0, 1),
          child: PqAnimate(
            fx: PqFx.fillX,
            delay: delay,
            duration: const Duration(milliseconds: 800),
            child: Container(
              decoration: BoxDecoration(
                color: gradient == null ? (color ?? pq.accent) : null,
                gradient: gradient,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Подсказка с иконкой (лампочка/предупреждение) — текст 14, интерлиньяж 1.45.
class PqHint extends StatelessWidget {
  const PqHint({
    super.key,
    required this.text,
    this.boldPrefix,
    this.icon = PqIcons.lightbulb,
    this.tone = PqTone.warning,
  });

  final String text;
  final String? boldPrefix;
  final PqIcons icon;
  final PqTone tone;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 1),
        child: PqIcon(icon, size: 18, color: pq.tone(tone).fg),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text.rich(
          TextSpan(children: [
            if (boldPrefix != null)
              TextSpan(
                  text: '$boldPrefix ',
                  style: PqText.body(c: pq.text, w: FontWeight.w700)),
            TextSpan(text: text),
          ]),
          style: PqText.body(c: pq.textSecondary),
        ),
      ),
    ]);
  }
}

/// Строка-меню (профиль, мини-приложения): плитка 48 · заголовок + подпись · шеврон.
class PqMenuTile extends StatelessWidget {
  const PqMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.tone = PqTone.accent,
    this.trailing,
  });

  final PqIcons icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final PqTone tone;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      onTap: onTap,
      child: Row(children: [
        PqIconTile(icon, tone: tone, size: 48, iconSize: 22),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: PqText.rowTitle(c: pq.text)),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(subtitle!, style: PqText.body(c: pq.textMuted)),
            ],
          ]),
        ),
        trailing ?? PqIcon(PqIcons.chevronRight, size: 20, color: pq.textMuted),
      ]),
    );
  }
}

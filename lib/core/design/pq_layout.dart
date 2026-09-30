import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pq_colors.dart';
import 'pq_icon.dart';
import 'pq_icons.dart';
import 'pq_motion.dart';
import 'pq_text.dart';

/// Фон экрана: сплошной цвет + радиальное свечение в левом верхнем углу
/// (420×360 в точке −80/−120). [drift] — три «плавающих» пятна экранов
/// входа (pqDrift 7s/9s).
class PqBackground extends StatelessWidget {
  const PqBackground({super.key, this.drift = false, this.glow = true});

  final bool drift;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    Widget blob(double w, double h, Color c) => Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(h / 2),
            gradient: RadialGradient(colors: [c, c.withValues(alpha: 0)]),
          ),
        );
    return IgnorePointer(
      child: Stack(clipBehavior: Clip.hardEdge, children: [
        Positioned.fill(child: ColoredBox(color: pq.bg)),
        if (glow)
          Positioned(left: -80, top: -120, child: blob(420, 360, pq.glow)),
        if (drift) ...[
          Positioned(
            right: -120,
            top: -80,
            child: PqDrift(child: blob(360, 360, pq.driftPurple)),
          ),
          Positioned(
            left: -140,
            bottom: -60,
            child: PqDrift(
              duration: const Duration(seconds: 9),
              reverse: true,
              child: blob(340, 340, pq.driftPurple),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 300,
            child: SizedBox(height: 240, child: blob(double.infinity, 240, pq.driftTeal)),
          ),
        ],
      ]),
    );
  }
}

/// Каркас экрана редизайна: фон со свечением + SafeArea-контент.
class PqScreen extends StatelessWidget {
  const PqScreen({
    super.key,
    required this.child,
    this.drift = false,
    this.bottom,
    this.safeBottom = true,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget child;
  final bool drift;

  /// Закреплённый снизу блок (кнопка действия).
  final Widget? bottom;
  final bool safeBottom;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Scaffold(
      backgroundColor: pq.bg,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(children: [
        Positioned.fill(child: PqBackground(drift: drift)),
        SafeArea(
          bottom: safeBottom && bottom == null,
          child: DefaultTextStyle(
            style: PqText.body(c: pq.text),
            child: bottom == null
                ? child
                : Column(children: [
                    Expanded(child: child),
                    SafeArea(top: false, child: bottom!),
                  ]),
          ),
        ),
      ]),
    );
  }
}

/// Круглая кнопка 44×44 в шапке (назад, колокольчик, закрыть).
class PqIconButton extends StatelessWidget {
  const PqIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.label,
    this.badge = false,
    this.size = 44,
    this.iconSize = 20,
    this.background,
    this.color,
  });

  final PqIcons icon;
  final VoidCallback? onTap;
  final String label;

  /// Точка «есть новые» (pqDot ×3 после 1s).
  final bool badge;
  final double size;
  final double iconSize;
  final Color? background;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final border = pq.iconButtonBorder;
    return PqPressable(
      onTap: onTap,
      semanticLabel: label,
      scale: .94,
      child: SizedBox.square(
        dimension: size,
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: background ?? pq.iconButtonBg,
              shape: BoxShape.circle,
              border: background == null && border != null ? Border.all(color: border) : null,
            ),
            alignment: Alignment.center,
            child: PqIcon(icon, size: iconSize, color: color ?? pq.text),
          ),
          if (badge)
            Positioned(
              // В светлой теме макет сдвигает точку на 1 px (у кнопки рамка 1 px).
              top: border == null ? 10 : 9,
              right: border == null ? 11 : 10,
              child: PqDotPulse(
                delay: const Duration(seconds: 1),
                repeat: 3,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: pq.accent,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: pq.navBg.withValues(alpha: 1), width: 2),
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}

/// Логотип PharmIQ в шапке: знак 21×20 + «PharmIQ» Onest 18/700.
class PqLogo extends StatelessWidget {
  const PqLogo({super.key, this.markSize = 21, this.textSize = 18});

  final double markSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SvgPicture.asset(
        'assets/logo.svg',
        width: markSize,
        height: markSize * 20 / 21,
        // Знак белый; в светлых макетах он фирменный тёмно-синий.
        colorFilter: pq.isDark
            ? null
            : const ColorFilter.mode(Color(0xFF293B71), BlendMode.srcIn),
      ),
      const SizedBox(width: 10),
      // В светлой теме надпись логотипа — фирменный тёмно-синий из макетов.
      // Сдвиг −2: Skia ставит глифы Onest 18 на 2 px ниже, чем Chrome в макете
      // (знак и колокольчик при этом совпадают до пикселя).
      Transform.translate(
        offset: Offset(0, -2 * textSize / 18),
        child: Text('PharmIQ',
            style: PqText.heading(textSize, FontWeight.w700,
                c: pq.isDark ? pq.text : const Color(0xFF293B71))),
      ),
    ]);
  }
}

/// Шапка вкладки: логотип слева, справа — колокольчик уведомлений (и
/// другие действия). Высота 64, поля 16.
class PqTabHeader extends StatelessWidget {
  const PqTabHeader({
    super.key,
    this.onBell,
    this.bellLabel = '',
    this.unread = false,
    this.actions = const [],
    this.leading,
  });

  final VoidCallback? onBell;
  final String bellLabel;
  final bool unread;
  final List<Widget> actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          leading ?? const PqLogo(),
          const Spacer(),
          for (final a in actions) ...[a, const SizedBox(width: 8)],
          if (onBell != null)
            PqIconButton(
              icon: PqIcons.bell,
              iconSize: 21,
              onTap: onBell,
              label: bellLabel,
              badge: unread,
            ),
        ]),
      ),
    );
  }
}

/// Верхняя панель вложенного экрана: «назад» 44 · заголовок по центру · слот 44.
class PqTopBar extends StatelessWidget {
  const PqTopBar({
    super.key,
    this.title,
    this.onBack,
    this.backLabel = 'Назад',
    this.trailing,
    this.leadingIcon = PqIcons.chevronLeft,
  });

  final String? title;

  /// null — «назад» по стеку навигации.
  final VoidCallback? onBack;
  final String backLabel;
  final Widget? trailing;
  final PqIcons leadingIcon;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          PqIconButton(
            icon: leadingIcon,
            label: backLabel,
            onTap: onBack ?? () => Navigator.of(context).maybePop(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: PqText.topBar(c: pq.text),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(width: 44, height: 44, child: trailing),
        ]),
      ),
    );
  }
}

/// Заголовок экрана (h1 Onest 30/700) + подзаголовок (Inter 15, приглушённый).
class PqPageTitle extends StatelessWidget {
  const PqPageTitle(this.title, {super.key, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: PqText.display(c: pq.text)),
      if (subtitle != null) ...[
        const SizedBox(height: 4),
        Text(subtitle!, style: PqText.subtitle(c: pq.textMuted)),
      ],
    ]);
  }
}

/// Заголовок секции (h2 Onest 20/600) + необязательный счётчик и ссылка
/// «Все …  ›» справа (высота зоны нажатия 44).
class PqSectionHeader extends StatelessWidget {
  const PqSectionHeader(
    this.title, {
    super.key,
    this.count,
    this.countTone = PqTone.neutral,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final int? count;
  final PqTone countTone;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final tone = pq.tone(countTone);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 28),
      child: Row(children: [
        // Заголовок занимает всё свободное место (без деления пополам со Spacer).
        Expanded(
          child: Row(children: [
            Flexible(child: Text(title, style: PqText.section(c: pq.text))),
            if (count != null) ...[
              const SizedBox(width: 8),
              Container(
                constraints: const BoxConstraints(minWidth: 22),
                height: 22,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                    color: tone.bg, borderRadius: BorderRadius.circular(11)),
                alignment: Alignment.center,
                child: Text('$count', style: PqText.tag(c: tone.fg)),
              ),
            ],
          ]),
        ),
        if (actionLabel != null)
          PqPressable(
            onTap: onAction,
            child: SizedBox(
              height: 44,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(actionLabel!, style: PqText.link(c: pq.accent)),
                const SizedBox(width: 2),
                PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
              ]),
            ),
          ),
      ]),
    );
  }
}

/// Стандартные поля контента: 4 сверху, 16 по бокам.
const kPqPagePadding = EdgeInsets.fromLTRB(16, 4, 16, 40);

/// Нижний отступ контента над нижним меню (84 + запас).
const kPqNavClearance = 120.0;

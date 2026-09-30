import 'dart:async';

import 'package:flutter/material.dart';

import 'pq_colors.dart';
import 'pq_display.dart';
import 'pq_icons.dart';
import 'pq_motion.dart';
import 'pq_text.dart';

/// Высота нижнего меню из макета.
const kPqNavHeight = 84.0;

OverlayEntry? _currentToast;

/// Всплывающее подтверждение (раздел «07 Подтверждения»): над меню,
/// появляется pqToast .35s и само исчезает через 4 секунды.
void showPqToast(
  BuildContext context,
  String message, {
  PqTone tone = PqTone.success,
  PqIcons? icon,
  String? actionLabel,
  VoidCallback? onAction,
  String? subtitle,
  Duration duration = const Duration(seconds: 4),
}) {
  final overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) return;
  _currentToast?.remove();
  _currentToast = null;
  late OverlayEntry entry;
  entry = OverlayEntry(
    builder: (ctx) => _ToastHost(
      message: message,
      subtitle: subtitle,
      tone: tone,
      icon: icon ??
          switch (tone) {
            PqTone.danger => PqIcons.alertTriangle,
            PqTone.warning => PqIcons.alertCircle,
            PqTone.info || PqTone.accent => PqIcons.bell,
            _ => PqIcons.check,
          },
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
      onDone: () {
        if (entry.mounted) entry.remove();
        if (identical(_currentToast, entry)) _currentToast = null;
      },
    ),
  );
  _currentToast = entry;
  overlay.insert(entry);
}

class _ToastHost extends StatefulWidget {
  const _ToastHost({
    required this.message,
    required this.subtitle,
    required this.tone,
    required this.icon,
    required this.actionLabel,
    required this.onAction,
    required this.duration,
    required this.onDone,
  });

  final String message;
  final String? subtitle;
  final PqTone tone;
  final PqIcons icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Duration duration;
  final VoidCallback onDone;

  @override
  State<_ToastHost> createState() => _ToastHostState();
}

class _ToastHostState extends State<_ToastHost> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
    reverseDuration: const Duration(milliseconds: 250),
  )..forward();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, _close);
  }

  Future<void> _close() async {
    _timer?.cancel();
    if (!mounted) return;
    await _c.reverse();
    widget.onDone();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final curve = CurvedAnimation(parent: _c, curve: PqMotion.ease, reverseCurve: Curves.easeIn);
    return Positioned(
      left: 16,
      right: 16,
      bottom: kPqNavHeight + (bottom > 16 ? bottom - 16 : 0) + 12,
      child: AnimatedBuilder(
        animation: curve,
        builder: (_, child) => Opacity(
          opacity: curve.value.clamp(0, 1),
          child: Transform.translate(offset: Offset(0, 16 * (1 - curve.value)), child: child),
        ),
        child: Dismissible(
          key: const ValueKey('pq-toast'),
          direction: DismissDirection.down,
          onDismissed: (_) => widget.onDone(),
          child: PqToastCard(
            message: widget.message,
            subtitle: widget.subtitle,
            tone: widget.tone,
            icon: widget.icon,
            actionLabel: widget.actionLabel,
            onAction: widget.actionLabel == null
                ? null
                : () {
                    widget.onAction?.call();
                    _close();
                  },
          ),
        ),
      ),
    );
  }
}

/// Карточка подтверждения (раздел «07»): плитка 36 · текст 15/600 · кнопка 40.
/// Статичный вид тоста — [showPqToast] показывает её над меню.
class PqToastCard extends StatelessWidget {
  const PqToastCard({
    super.key,
    required this.message,
    this.subtitle,
    this.tone = PqTone.success,
    this.icon = PqIcons.check,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final String? subtitle;
  final PqTone tone;
  final PqIcons icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Material(
      type: MaterialType.transparency,
      child: Semantics(
        liveRegion: true,
        child: Container(
          constraints: const BoxConstraints(minHeight: 60),
          padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
          decoration: BoxDecoration(
            color: pq.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: pq.border),
            boxShadow: pq.toastShadow,
          ),
          child: Row(children: [
            PqIconTile(icon, tone: tone, size: 36, iconSize: 18),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message, style: PqText.text(15, FontWeight.w600, c: pq.text)),
                  if (subtitle != null) ...[
                    const SizedBox(height: 1),
                    Text(subtitle!, style: PqText.caption(c: pq.textMuted)),
                  ],
                ],
              ),
            ),
            if (actionLabel != null) ...[
              const SizedBox(width: 12),
              PqPressable(
                onTap: onAction,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: pq.surfaceAlt,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(actionLabel!, style: PqText.buttonSmall(c: pq.accent)),
                ),
              ),
            ],
          ]),
        ),
      ),
    );
  }
}

/// Нижний лист: затемнение pqFade .25s, выезд pqSheet .35s,
/// радиус 28 сверху, «ручка» 40×5, поля 12/20/30.
Future<T?> showPqSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  bool isDismissible = true,
  bool scrollable = false,
  EdgeInsets padding = const EdgeInsets.fromLTRB(20, 12, 20, 30),
  double handleGap = 16,
  bool bordered = false,
  Color? scrim,
  Duration duration = const Duration(milliseconds: 350),
}) {
  final pq = context.pq;
  return showModalBottomSheet<T>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: Colors.transparent,
    barrierColor: scrim ?? pq.scrim,
    elevation: 0,
    sheetAnimationStyle: AnimationStyle(
      duration: duration,
      reverseDuration: const Duration(milliseconds: 250),
      curve: PqMotion.ease,
    ),
    builder: (ctx) => PqSheet(
      scrollable: scrollable,
      padding: padding,
      handleGap: handleGap,
      bordered: bordered,
      child: builder(ctx),
    ),
  );
}

/// Оформление нижнего листа — для [showPqSheet] и встраивания.
class PqSheet extends StatelessWidget {
  const PqSheet({
    super.key,
    required this.child,
    this.scrollable = false,
    this.padding = const EdgeInsets.fromLTRB(20, 12, 20, 30),
    this.handleGap = 16,
    this.bordered = false,
  });

  final Widget child;
  final bool scrollable;

  /// Поля листа: 12/20/30 (SurveySheet); в других макетах 10/20/28 и т. п.
  final EdgeInsets padding;

  /// Зазор от «ручки» до содержимого (gap листа).
  final double handleGap;

  /// Рамка 1 px сверху (border-top), как у листов Upload/ProfileRole/NotifSettings.
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final mq = MediaQuery.of(context);
    final content = Padding(
      padding: padding.copyWith(bottom: padding.bottom + mq.padding.bottom * .5),
      child: DefaultTextStyle(
        style: PqText.body(c: pq.text),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: pq.sheetHandle,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            SizedBox(height: handleGap),
            if (scrollable) Flexible(child: SingleChildScrollView(child: child)) else child,
          ],
        ),
      ),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: mq.size.height * .92),
        child: Material(
          color: pq.sheetBg,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            side: bordered ? BorderSide(color: pq.border) : BorderSide.none,
          ),
          clipBehavior: Clip.antiAlias,
          child: content,
        ),
      ),
    );
  }
}

/// Диалог подтверждения в стиле карточек: заголовок, текст, две кнопки.
Future<bool> showPqConfirm(
  BuildContext context, {
  required String title,
  String? message,
  required String confirmLabel,
  required String cancelLabel,
  bool danger = false,
  PqIcons? icon,
}) async {
  final pq = context.pq;
  final res = await showPqSheet<bool>(
    context,
    builder: (ctx) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Center(
            child: PqAnimate(
              fx: PqFx.pop,
              child: PqIconTile(icon,
                  tone: danger ? PqTone.danger : PqTone.accent, size: 64, radius: 20, iconSize: 28),
            ),
          ),
          const SizedBox(height: 16),
        ],
        Text(title,
            textAlign: icon != null ? TextAlign.center : TextAlign.start,
            style: PqText.sheetTitle(c: pq.text)),
        if (message != null) ...[
          const SizedBox(height: 8),
          Text(message,
              textAlign: icon != null ? TextAlign.center : TextAlign.start,
              style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textMuted)),
        ],
        const SizedBox(height: 24),
        _Buttons(confirmLabel, cancelLabel, danger),
      ],
    ),
  );
  return res ?? false;
}

class _Buttons extends StatelessWidget {
  const _Buttons(this.confirm, this.cancel, this.danger);

  final String confirm;
  final String cancel;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    Widget btn(String label, Color bg, Color fg, bool value, {Border? border}) => PqPressable(
          onTap: () => Navigator.of(context).pop(value),
          child: Container(
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bg,
              border: border,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(label, style: PqText.button(c: fg)),
          ),
        );
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      danger
          ? btn(confirm, pq.dangerSoft, pq.danger, true)
          : btn(confirm, pq.accent, pq.onAccent, true),
      const SizedBox(height: 8),
      btn(cancel, Colors.transparent, pq.text, false, border: Border.all(color: pq.border)),
    ]);
  }
}

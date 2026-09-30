import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pq_colors.dart';
import 'pq_icon.dart';
import 'pq_icons.dart';
import 'pq_motion.dart';
import 'pq_text.dart';

enum PqButtonKind {
  /// Основная: заливка акцентом, тень, текст onAccent.
  primary,

  /// Вторичная: прозрачная с рамкой.
  secondary,

  /// Опасная: мягкая красная заливка.
  danger,

  /// Текстовая: акцентный текст, высота 44.
  text,
}

/// Кнопка из раздела «01 Кнопки»: высота 56, радиус 16, Inter 16/700.
/// Состояния: обычная, нажатая (scale .98 + темнее), неактивная, загрузка.
class PqButton extends StatelessWidget {
  const PqButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.kind = PqButtonKind.primary,
    this.icon,
    this.loading = false,
    this.loadingLabel,
    this.height,
    this.expand = true,
    this.pulse = false,
    this.fontWeight,
    this.fontSize = 16,
    this.iconSize = 20,
    this.iconGap = 10,
  });

  final String label;
  final VoidCallback? onPressed;
  final PqButtonKind kind;

  /// Начертание текста: по умолчанию 700; в ряде макетов вторичные — 600.
  final FontWeight? fontWeight;
  final double fontSize;
  final double iconSize;
  final double iconGap;
  final PqIcons? icon;
  final bool loading;

  /// Текст во время загрузки («Отправляем…»). По умолчанию — [label].
  final String? loadingLabel;
  final double? height;
  final bool expand;

  /// pqPulse 2s ×3 после .8s — привлечь внимание к главному действию.
  final bool pulse;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;
    Widget btn = PqPressable(
      onTap: enabled ? onPressed : null,
      enabled: enabled,
      semanticLabel: label,
      child: _ButtonFace(
        label: loading ? (loadingLabel ?? label) : label,
        kind: kind,
        icon: icon,
        loading: loading,
        disabled: onPressed == null && !loading,
        height: height ?? (kind == PqButtonKind.text ? 44 : 56),
        expand: expand,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: fontSize,
        iconSize: iconSize,
        iconGap: iconGap,
      ),
    );
    if (pulse && enabled && kind == PqButtonKind.primary) {
      btn = PqPulseRing.pulse(
        borderRadius: BorderRadius.circular(16),
        color: context.pq.accent,
        delay: const Duration(milliseconds: 800),
        repeat: 3,
        child: btn,
      );
    }
    return btn;
  }
}

class _ButtonFace extends StatelessWidget {
  const _ButtonFace({
    required this.label,
    required this.kind,
    required this.icon,
    required this.loading,
    required this.disabled,
    required this.height,
    required this.expand,
    required this.fontWeight,
    required this.fontSize,
    required this.iconSize,
    required this.iconGap,
  });

  final String label;
  final PqButtonKind kind;
  final PqIcons? icon;
  final bool loading;
  final bool disabled;
  final double height;
  final bool expand;
  final FontWeight fontWeight;
  final double fontSize;
  final double iconSize;
  final double iconGap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final pressed = PqPressedScope.of(context);
    Color bg;
    Color fg;
    Border? border;
    List<BoxShadow>? shadow;
    if (disabled) {
      bg = kind == PqButtonKind.text ? Colors.transparent : pq.fieldDisabledBg;
      fg = pq.textMuted;
      border = kind == PqButtonKind.text ? null : Border.all(color: pq.border);
    } else {
      switch (kind) {
        case PqButtonKind.primary:
          bg = pressed ? pq.accentPressed : pq.accent;
          fg = pq.onAccent;
          shadow = pressed || loading
              ? null
              : [
                  BoxShadow(
                      color: pq.accentShadow,
                      offset: const Offset(0, 12),
                      blurRadius: 24,
                      spreadRadius: -12),
                ];
        case PqButtonKind.secondary:
          bg = pressed ? pq.surfaceAlt : Colors.transparent;
          fg = pq.text;
          border = Border.all(color: pressed ? pq.borderStrong : pq.border);
        case PqButtonKind.danger:
          bg = pq.dangerSoft;
          fg = pq.danger;
        case PqButtonKind.text:
          bg = Colors.transparent;
          fg = pq.accent;
      }
    }
    return AnimatedOpacity(
      opacity: loading ? .9 : 1,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        height: height,
        width: expand ? double.infinity : null,
        padding: expand ? null : const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: border,
          boxShadow: shadow,
        ),
        child: Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading) ...[
              PqSpinner(color: fg, trackColor: const Color(0x59FFFFFF)),
              SizedBox(width: iconGap),
            ] else if (icon != null) ...[
              PqIcon(icon!, size: iconSize, color: fg),
              SizedBox(width: iconGap),
            ],
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.text(fontSize, fontWeight, c: fg)
                    .copyWith(fontFeatures: const []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Маленькая кнопка-капсула: высота 40, радиус 20, Inter 14/700
/// («Переснять», «Вернуть», «Выдать»).
class PqPillButton extends StatelessWidget {
  const PqPillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.background,
    this.foreground,
    this.height = 40,
    this.semanticLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final PqIcons? icon;
  final Color? background;
  final Color? foreground;
  final double height;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final fg = foreground ?? pq.onAccent;
    return PqPressable(
      onTap: onPressed,
      semanticLabel: semanticLabel ?? label,
      scale: .96,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: background ?? pq.accent,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[
            PqIcon(icon!, size: 16, color: fg),
            const SizedBox(width: 6),
          ],
          Text(label, style: PqText.buttonSmall(c: fg)),
        ]),
      ),
    );
  }
}

/// Поле ввода: высота 56, радиус 14, текст 16 (iOS не увеличивает экран).
/// Фокус — рамка 2 акцентом, ошибка — рамка 2 красным + подпись с иконкой.
class PqTextField extends StatefulWidget {
  const PqTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.error,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.autofocus = false,
    this.focusNode,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.minLines,
    this.obscure = false,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.height = 56,
  });

  /// Высота однострочного поля (56; в листе удаления аккаунта — 52).
  final double height;

  final TextEditingController? controller;
  final String? hint;

  /// Подпись над полем (Inter 14/600).
  final String? label;
  final String? error;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLines;
  final int? minLines;
  final bool obscure;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;

  @override
  State<PqTextField> createState() => _PqTextFieldState();
}

class _PqTextFieldState extends State<PqTextField> {
  late final FocusNode _focus = widget.focusNode ?? FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  void _onFocus() => setState(() => _focused = _focus.hasFocus);

  @override
  void dispose() {
    _focus.removeListener(_onFocus);
    if (widget.focusNode == null) _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final hasError = widget.error != null;
    final borderColor = hasError
        ? pq.danger
        : _focused
            ? pq.accent
            : pq.border;
    final borderWidth = hasError || _focused ? 2.0 : 1.0;
    final multiline = widget.maxLines > 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: PqText.link(c: pq.text)),
          const SizedBox(height: 8),
        ],
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          constraints: BoxConstraints(minHeight: multiline ? 112 : widget.height),
          padding: EdgeInsets.symmetric(
              horizontal: 16 - (borderWidth - 1), vertical: multiline ? 12 : 0),
          decoration: BoxDecoration(
            color: widget.enabled ? pq.fieldBg : pq.fieldDisabledBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          alignment: multiline ? Alignment.topLeft : Alignment.centerLeft,
          child: Row(children: [
            if (widget.prefix != null) ...[widget.prefix!, const SizedBox(width: 8)],
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: _focus,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                inputFormatters: widget.inputFormatters,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                obscureText: widget.obscure,
                textCapitalization: widget.textCapitalization,
                autofillHints: widget.autofillHints,
                cursorColor: pq.accent,
                cursorWidth: 2,
                style: PqText.field(c: widget.enabled ? pq.text : pq.textMuted),
                decoration: InputDecoration(
                  isDense: true,
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: widget.hint,
                  hintStyle: PqText.field(c: pq.textMuted),
                ),
              ),
            ),
            if (widget.suffix != null) ...[const SizedBox(width: 8), widget.suffix!],
          ]),
        ),
        if (hasError) ...[
          const SizedBox(height: 6),
          PqAnimate(
            fx: PqFx.fade,
            child: Row(children: [
              PqIcon(PqIcons.alertCircle, size: 16, color: pq.danger),
              const SizedBox(width: 6),
              Flexible(child: Text(widget.error!, style: PqText.body(c: pq.danger))),
            ]),
          ),
        ],
      ],
    );
  }
}

/// Сегменты: контейнер с отступом 4, радиус 16; активный сегмент
/// поднимается плашкой (скользит между вариантами).
class PqSegmented<T> extends StatelessWidget {
  const PqSegmented({
    super.key,
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onChanged,
  });

  final List<T> values;
  final T selected;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final idx = values.indexOf(selected).clamp(0, values.length - 1);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: pq.surfaceAlt,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: pq.border),
      ),
      child: LayoutBuilder(builder: (context, box) {
        const gap = 4.0;
        final w = (box.maxWidth - gap * (values.length - 1)) / values.length;
        return SizedBox(
          height: 40,
          child: Stack(children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 280),
              curve: PqMotion.ease,
              left: idx * (w + gap),
              top: 0,
              bottom: 0,
              width: w,
              child: Container(
                decoration: BoxDecoration(
                  color: pq.segmentActive,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1), blurRadius: 3),
                  ],
                ),
              ),
            ),
            Row(children: [
              for (var i = 0; i < values.length; i++) ...[
                if (i > 0) const SizedBox(width: gap),
                SizedBox(
                  width: w,
                  child: Semantics(
                    selected: i == idx,
                    button: true,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onChanged(values[i]),
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: PqText.text(14, i == idx ? FontWeight.w700 : FontWeight.w500,
                              c: i == idx ? pq.text : pq.textMuted),
                          child: Text(labelOf(values[i]),
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ]),
          ]),
        );
      }),
    );
  }
}

/// Чип-фильтр: высота 40, радиус 20. Активный — инвертированный.
class PqChip extends StatelessWidget {
  const PqChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.count,
    this.icon,
    this.selectedWeight = FontWeight.w700,
    this.weight = FontWeight.w500,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final int? count;
  final PqIcons? icon;

  /// Начертание выбранного / обычного (в макете Notif оба 600).
  final FontWeight selectedWeight;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final fg = selected ? pq.chipActiveText : pq.textSecondary;
    return PqPressable(
      onTap: onTap,
      scale: .96,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selected ? pq.chipActiveBg : pq.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? pq.chipActiveBg : pq.border),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[
            PqIcon(icon!, size: 16, color: fg),
            const SizedBox(width: 6),
          ],
          Text(
            count == null ? label : '$label $count',
            style: PqText.text(14, selected ? selectedWeight : weight, c: fg),
          ),
        ]),
      ),
    );
  }
}

/// Переключатель 48×30: включён — акцент, выключен — серый; бегунок 24.
class PqSwitch extends StatelessWidget {
  const PqSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.large = false,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;

  /// Вариант экранов уведомлений: 52×32, бегунок 26, выключенный
  /// трек border (#2e2f3a / #e5e7eb), переходы .22s.
  final bool large;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final w = large ? 52.0 : 48.0;
    final h = large ? 32.0 : 30.0;
    final knob = large ? 26.0 : 24.0;
    final dur = Duration(milliseconds: large ? 220 : 200);
    final off = large ? (pq.isDark ? pq.border : const Color(0xFFE5E7EB)) : pq.toggleOff;
    return Semantics(
      toggled: value,
      label: label,
      enabled: onChanged != null,
      child: GestureDetector(
        onTap: onChanged == null ? null : () => onChanged!(!value),
        child: AnimatedContainer(
          duration: dur,
          curve: Curves.ease,
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: value ? pq.accent : off,
            borderRadius: BorderRadius.circular(h / 2),
          ),
          child: AnimatedAlign(
            duration: dur,
            curve: PqMotion.ease,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(3),
              width: knob,
              height: knob,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Color(0x4D000000), offset: Offset(0, 1), blurRadius: 3)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Радиокнопка 24: выбрана — толстая акцентная рамка 7 с белой серединой.
class PqRadio extends StatelessWidget {
  const PqRadio({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: PqMotion.ease,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? pq.accent : pq.borderStrong,
          width: selected ? 7 : 2,
        ),
      ),
    );
  }
}

/// Флажок 24, радиус 7: отмечен — акцентная заливка с галочкой.
class PqCheckbox extends StatelessWidget {
  const PqCheckbox({super.key, required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: checked ? pq.accent : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        border: checked ? null : Border.all(color: pq.borderStrong, width: 2),
      ),
      alignment: Alignment.center,
      child: checked
          ? PqAnimate(
              fx: PqFx.pop,
              duration: const Duration(milliseconds: 300),
              child: PqIcon(PqIcons.check, size: 16, color: pq.onAccent, strokeWidth: 2.6),
            )
          : null,
    );
  }
}

/// Вариант ответа (опрос, тест, выбор роли): высота ≥56, радиус 16.
/// Выбран — рамка 2 акцентом и мягкая акцентная заливка.
class PqOption extends StatelessWidget {
  const PqOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.leading,
    this.trailing,
    this.subtitle,
    this.radio = true,
  });

  final String label;
  final String? subtitle;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? leading;

  /// По умолчанию — радиокнопка (если [radio]).
  final Widget? trailing;
  final bool radio;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: const BoxConstraints(minHeight: 56),
        padding: EdgeInsets.symmetric(horizontal: selected ? 15 : 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? (pq.isDark ? pq.accentSoft : const Color(0xFFEEF2FF))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: selected ? pq.accent : pq.border, width: selected ? 2 : 1),
        ),
        child: Row(children: [
          if (leading != null) ...[leading!, const SizedBox(width: 12)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label,
                    style: PqText.field(
                        c: pq.text, w: selected ? FontWeight.w700 : FontWeight.w500)),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: PqText.body(c: pq.textMuted)),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          trailing ?? (radio ? PqRadio(selected: selected) : const SizedBox.shrink()),
        ]),
      ),
    );
  }
}

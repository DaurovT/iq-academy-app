import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pq_icons.dart';

/// Иконка из макетов (контурная, штрих 1.8). Цвет по умолчанию —
/// текущий цвет иконок/текста ([IconTheme]).
class PqIcon extends StatelessWidget {
  const PqIcon(
    this.icon, {
    super.key,
    this.size = 20,
    this.color,
    this.strokeWidth = 1.8,
    this.semanticLabel,
  });

  final PqIcons icon;
  final double size;
  final Color? color;
  final double strokeWidth;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = color ?? IconTheme.of(context).color ?? DefaultTextStyle.of(context).style.color;
    final svg = icon.filled ? icon.svg : icon.svg.replaceAll('{sw}', '$strokeWidth');
    return SvgPicture.string(
      svg,
      width: icon == PqIcons.backspace ? size * 26 / 20 : size,
      height: size,
      theme: SvgTheme(currentColor: c ?? const Color(0xFF000000)),
      semanticsLabel: semanticLabel,
      excludeFromSemantics: semanticLabel == null,
    );
  }
}

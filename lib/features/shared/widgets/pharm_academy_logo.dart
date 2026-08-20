import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Логотип «PharmIQ ACADEMY» (треугольный знак + текст). Используется на
/// splash и экранах входа/регистрации.
class PharmAcademyLogo extends StatelessWidget {
  const PharmAcademyLogo({
    super.key,
    this.height = 40,
    this.color = Colors.white,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          height: height,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        SizedBox(width: height * 0.28),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PharmIQ',
              style: TextStyle(
                fontSize: height * 0.62,
                height: 1.0,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            SizedBox(height: height * 0.06),
            Text(
              'ACADEMY',
              style: TextStyle(
                fontSize: height * 0.24,
                height: 1.0,
                fontWeight: FontWeight.w600,
                letterSpacing: height * 0.14,
                color: color.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

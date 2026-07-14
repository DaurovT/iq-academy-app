import 'package:flutter/material.dart';

/// Одна декоративная фигура фона: плоский полупрозрачный круг или скруглённый
/// прямоугольник. Координаты — из макета Figma (слой `decorative-shapes`).
class DecorShape {
  const DecorShape.circle({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required double size,
    required this.color,
    required this.opacity,
  })  : width = size,
        height = size,
        radius = null;

  const DecorShape.rect({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
    required this.opacity,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double width;
  final double height;
  final double? radius;
  final Color color;
  final double opacity;
}

/// Абстрактный декоративный фон экрана (перенос из макетов PharmIQ).
/// Показывается только в светлой теме — в тёмной абстракций по дизайну нет.
/// Кладётся первым слоем за контентом: `Stack([ Positioned.fill(ScreenDecor(...)), content ])`.
class ScreenDecor extends StatelessWidget {
  const ScreenDecor(this.shapes, {super.key});

  final List<DecorShape> shapes;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
      child: ClipRect(
        child: Stack(
          children: [
            for (final s in shapes)
              Positioned(
                top: s.top,
                bottom: s.bottom,
                left: s.left,
                right: s.right,
                child: Container(
                  width: s.width,
                  height: s.height,
                  decoration: BoxDecoration(
                    color: s.color.withValues(alpha: s.opacity),
                    shape: s.radius == null ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: s.radius == null
                        ? null
                        : BorderRadius.circular(s.radius!),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Палитра декора ───────────────────────────────────────────────────────
const decorBlue = Color(0xFF2563EB);
const decorLightBlue = Color(0xFF60A5FA);
const decorViolet = Color(0xFF8B5CF6);
const decorPurple = Color(0xFF7C3AED);
const decorPink = Color(0xFFEC4899);

const _oCircle = 0.14;
const _oRect = 0.11;
const _r = 44.0;

// Хелперы для краткости наборов ниже.
DecorShape _c(Color color, double top, double left, double size,
        [double o = _oCircle]) =>
    DecorShape.circle(top: top, left: left, size: size, color: color, opacity: o);
DecorShape _rt(Color color, double top, double left, double w, double h,
        [double o = _oRect]) =>
    DecorShape.rect(
        top: top, left: left, width: w, height: h, radius: _r, color: color, opacity: o);

/// Фон экрана «Мои чеки» (Figma 183:4).
const checksDecor = <DecorShape>[
  DecorShape.circle(
      top: -140, left: -120, size: 360, color: decorBlue, opacity: 0.18),
  DecorShape.rect(
      top: -120,
      right: -120,
      width: 280,
      height: 220,
      radius: 56,
      color: decorPurple,
      opacity: 0.14),
  DecorShape.circle(
      top: 260, left: -160, size: 260, color: decorPink, opacity: 0.20),
  DecorShape.rect(
      bottom: -160,
      right: -100,
      width: 320,
      height: 200,
      radius: 48,
      color: decorBlue,
      opacity: 0.13),
  DecorShape.circle(
      bottom: -140, left: -180, size: 200, color: decorPink, opacity: 0.18),
];

// Наборы фигур остальных экранов (Figma abstract-bg-shapes, светлая тема).
// Координаты — top/left от верхнего края экрана.
final checkDetailDecor = <DecorShape>[
  _rt(decorPurple, 121, 159, 130, 140),
  _c(decorViolet, 253, 126, 178),
  _c(decorBlue, 427, 201, 172),
  _rt(decorBlue, 638, -38, 141, 136),
];

final questsDecor = <DecorShape>[
  _c(decorPurple, 104, 208, 234),
  _c(decorPink, 264, 163, 97),
  _c(decorLightBlue, 545, 343, 161),
  _rt(decorPink, 784, 225, 174, 91),
];

final questDetailDecor = <DecorShape>[
  _rt(decorPurple, 27, 50, 266, 144),
  _c(decorLightBlue, 315, 177, 87),
  _rt(decorViolet, 494, 187, 164, 147),
  _c(decorPink, 675, 43, 95),
];

final walletDecor = <DecorShape>[
  _c(decorBlue, 109, 28, 159),
  _c(decorViolet, 471, -35, 125),
  _c(decorLightBlue, 787, 36, 108),
  _c(decorLightBlue, 1124, -22, 125),
  _rt(decorBlue, 1442, 214, 213, 62),
];

final voucherDecor = <DecorShape>[
  _rt(decorLightBlue, 1, 342, 269, 180),
  _c(decorViolet, 290, 388, 103),
  _rt(decorViolet, 551, 348, 193, 171),
  _rt(decorPurple, 732, 320, 226, 157),
];

final profileDecor = <DecorShape>[
  _rt(decorLightBlue, 4, 375, 170, 128),
  _rt(decorBlue, 352, 359, 114, 93),
  _c(decorPurple, 574, -31, 230),
  _c(decorBlue, 788, 63, 111),
  _rt(decorPurple, 1126, -34, 178, 73),
];

final supportDecor = <DecorShape>[
  _c(decorBlue, 26, 113, 221),
  _c(decorPurple, 233, 62, 161),
  _rt(decorPurple, 388, 236, 268, 164),
  _c(decorPink, 570, 337, 190),
  _c(decorLightBlue, 767, -14, 116),
];

final learnDecor = <DecorShape>[
  _rt(decorBlue, 49, -17, 166, 76),
  _rt(decorPurple, 181, 220, 245, 72),
  _c(decorBlue, 404, -22, 208),
  _rt(decorBlue, 625, 39, 261, 145),
  _c(decorLightBlue, 755, 51, 195),
];

final courseDetailDecor = <DecorShape>[
  _c(decorBlue, 19, 301, 217),
  _rt(decorLightBlue, 271, 283, 201, 132),
  _c(decorViolet, 405, 365, 181),
  _c(decorPurple, 617, 145, 121),
  _c(decorPink, 745, 243, 104),
];

final lessonDecor = <DecorShape>[
  _rt(decorBlue, 16, 265, 167, 127),
  _c(decorPurple, 235, 314, 195),
  _c(decorPurple, 399, 397, 163),
  _c(decorPink, 601, 293, 158),
  _rt(decorLightBlue, 750, 246, 166, 92),
];

final quizDecor = <DecorShape>[
  _rt(decorPink, 59, 1, 272, 154),
  _c(decorBlue, 210, 377, 103),
  _rt(decorLightBlue, 451, 43, 131, 83),
  _rt(decorPurple, 567, 113, 238, 91),
  _rt(decorPink, 761, 18, 239, 79),
];

final quizCongratsDecor = <DecorShape>[
  _c(decorPink, 102, 7, 112),
  _c(decorViolet, 250, 215, 189),
  _c(decorPurple, 427, 154, 164),
  _rt(decorLightBlue, 552, 33, 163, 148),
  _c(decorBlue, 720, 130, 80),
];

final quizFailedDecor = <DecorShape>[
  _rt(decorBlue, 87, 105, 168, 179),
  _rt(decorPurple, 247, 377, 214, 120),
  _rt(decorLightBlue, 353, 60, 126, 61),
  _c(decorBlue, 605, 63, 96),
  _c(decorViolet, 795, 158, 119),
];

// ── Экраны врача ─────────────────────────────────────────────────────────

/// Фон главной врача (Figma 160:3). Скроллится вместе с контентом, поэтому
/// часть фигур привязана к правому/нижнему краю через right/bottom.
const doctorHomeDecor = <DecorShape>[
  DecorShape.circle(
      top: -140, left: -120, size: 360, color: decorBlue, opacity: 0.18),
  DecorShape.rect(
      top: -120,
      right: -80,
      width: 320,
      height: 220,
      radius: 56,
      color: decorPurple,
      opacity: 0.14),
  DecorShape.circle(
      top: 430, left: -200, size: 260, color: decorPink, opacity: 0.20),
  DecorShape.circle(
      top: 260, right: -110, size: 300, color: decorBlue, opacity: 0.14),
  DecorShape.rect(
      bottom: -80,
      left: -154,
      width: 280,
      height: 180,
      radius: 48,
      color: decorPurple,
      opacity: 0.12),
  DecorShape.circle(
      bottom: -140, right: -120, size: 180, color: decorPink, opacity: 0.18),
];

/// Фон экрана «Мои рецепты» (Figma 161:1088, слой abstract-bg-shapes).
final recipesDecor = <DecorShape>[
  _c(decorPink, 104, 276, 125),
  _c(decorPurple, 196, 92, 192),
  _c(decorBlue, 398, 304, 225),
  _rt(decorPink, 566, 297, 269, 78),
  _rt(decorPink, 763, 182, 136, 75),
];

/// Фон экрана «Рецепт №N» (Figma 161:242, слой abstract-bg-shapes).
final recipeDetailDecor = <DecorShape>[
  _c(decorViolet, 71, 231, 213),
  _rt(decorBlue, 285, 370, 235, 126),
  _c(decorBlue, 543, 218, 210),
  _c(decorPink, 717, 40, 109),
];

// ── Экраны медпреда ──────────────────────────────────────────────────────

/// Фон обзора медпреда (Figma 144:126, слой abstract-bg-shapes).
final medrepHomeDecor = <DecorShape>[
  _c(decorPink, 56, 361, 238),
  _c(decorPink, 389, 57, 196),
  _c(decorBlue, 615, 328, 122),
  _c(decorPink, 886, 35, 174),
];

/// Фон экрана «Фармацевты» (Figma 147:261, слой abstract-bg-shapes).
final medrepPortfolioDecor = <DecorShape>[
  _c(decorViolet, 93, 113, 114),
  _rt(decorViolet, 198, 214, 101, 131),
  _c(decorPink, 489, -13, 124),
  _rt(decorLightBlue, 682, 59, 266, 83),
];

/// Фон детали фармацевта (Figma 149:106, слой abstract-bg-shapes).
final medrepPharmacistDecor = <DecorShape>[
  _c(decorPink, 77, 100, 107),
  _c(decorPurple, 315, 353, 171),
  _c(decorPurple, 508, 33, 174),
  _c(decorPurple, 646, 279, 190),
];

/// Фон экрана «Рейтинг» (Figma 152:108, слой abstract-bg-shapes).
final medrepLeaderboardDecor = <DecorShape>[
  _c(decorPink, 106, 235, 166),
  _c(decorPurple, 259, 46, 215),
  _c(decorBlue, 510, 80, 141),
  _c(decorBlue, 670, 352, 207),
];

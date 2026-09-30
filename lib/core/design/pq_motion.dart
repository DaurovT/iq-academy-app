import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Анимации редизайна 1.2 — перенос CSS-keyframes `pq*` из макетов.
///
/// Как в CSS, кривая применяется к каждому отрезку между ключевыми кадрами
/// (см. [kf]). При включённом «Уменьшить движение» (`prefers-reduced-motion`
/// в макетах) все анимации сразу показывают конечное состояние.
abstract final class PqMotion {
  /// `cubic-bezier(.2,.7,.2,1)` — основная кривая всех появлений.
  static const ease = Cubic(0.2, 0.7, 0.2, 1);

  /// `cubic-bezier(.4,0,.2,1)` — полоса загрузки на заставке.
  static const load = Cubic(0.4, 0, 0.2, 1);

  /// `cubic-bezier(.3,.6,.4,1)` — падение конфетти.
  static const fall = Cubic(0.3, 0.6, 0.4, 1);

  static const easeOut = Curves.easeOut;
  static const easeInOut = Curves.easeInOut;

  /// Шаг каскада `.pq-stagger` — 50 мс между соседями.
  static const staggerStep = Duration(milliseconds: 50);

  /// Задержка ребёнка каскада. `maxIndex` — после какого индекса задержка
  /// перестаёт расти: 6 на экранах приложения (`n+7` → .3s), 4 на экранах
  /// входа (`n+5` → .2s).
  static Duration staggerDelay(int index, {int maxIndex = 6}) =>
      staggerStep * math.min(index, maxIndex);

  static bool reduced(BuildContext context) =>
      MediaQuery.maybeDisableAnimationsOf(context) ?? false;
}

double _lerp(double a, double b, double t) => a + (b - a) * t;

/// Значение по ключевым кадрам: `stops` — доли 0..1, `values` — значения,
/// `curve` применяется внутри каждого отрезка (как animation-timing-function).
double kf(double t, List<double> stops, List<double> values,
    [Curve curve = Curves.linear]) {
  if (t <= stops.first) return values.first;
  for (var i = 1; i < stops.length; i++) {
    if (t <= stops[i]) {
      final local = (t - stops[i - 1]) / (stops[i] - stops[i - 1]);
      return _lerp(values[i - 1], values[i], curve.transform(local));
    }
  }
  return values.last;
}

/// Однократные эффекты появления.
enum PqFx {
  /// pqUp: opacity 0→1, translateY 12→0.
  up,

  /// pqRise: opacity 0→1, translateY 10→0.
  rise,

  /// pqToast: opacity 0→1, translateY 16→0.
  toast,

  /// pqPop: scale .4→1.1 (60%)→1, opacity 0→1 (60%).
  pop,

  /// pqIn: scale .6→1.08 (70%)→1.
  zoomIn,

  /// pqFade: opacity 0→1.
  fade,

  /// pqLogo: scale .88→1, opacity 0→1 к 60%.
  logo,

  /// pqFlip: rotateY 90°→0, opacity .2→1.
  flip,

  /// pqOpen: translateY 28 + scale .94 → на место.
  open,

  /// pqThumb: translateY 10, rotate −4° → rotate([PqAnimate.rotation]).
  thumb,

  /// pqReveal: раскрытие сверху вниз (clip) + translateY −16→0.
  reveal,

  /// pqSheet: translateY 100%→0.
  sheet,

  /// pqFill: scaleX 0→1 от левого края.
  fillX,

  /// pqGrow: scaleY 0→1 от нижнего края.
  growY,

  /// pqPress: scale 1→.97 (40%)→1.
  press,

  /// pqShake: translateX 0/−6/6/−6/6/0.
  shake,

  /// pqGone: opacity 1→0.
  gone,

  /// pqSpin (однократно): rotate 0→−360°.
  spin,
}

/// Однократная анимация с задержкой — аналог `animation: pqX dur curve delay both`.
class PqAnimate extends StatefulWidget {
  const PqAnimate({
    super.key,
    required this.child,
    this.fx = PqFx.up,
    this.delay = Duration.zero,
    this.duration,
    this.curve,
    this.rotation = 0,
    this.play = true,
  });

  final Widget child;
  final PqFx fx;
  final Duration delay;

  /// По умолчанию — длительность из макета для данного эффекта.
  final Duration? duration;

  /// По умолчанию — [PqMotion.ease] (для shake — ease-in-out).
  final Curve? curve;

  /// Конечный поворот для [PqFx.thumb], в градусах (`--r`).
  final double rotation;

  /// false — держать начальное состояние; смена на true запускает анимацию.
  final bool play;

  static Duration defaultDuration(PqFx fx) => switch (fx) {
        PqFx.up => const Duration(milliseconds: 450),
        PqFx.rise || PqFx.toast || PqFx.sheet || PqFx.thumb || PqFx.zoomIn =>
          const Duration(milliseconds: 350),
        PqFx.pop => const Duration(milliseconds: 500),
        PqFx.fade => const Duration(milliseconds: 250),
        PqFx.logo => const Duration(milliseconds: 900),
        PqFx.flip || PqFx.reveal => const Duration(milliseconds: 450),
        PqFx.open => const Duration(milliseconds: 420),
        PqFx.fillX => const Duration(milliseconds: 500),
        PqFx.growY => const Duration(milliseconds: 600),
        PqFx.press => const Duration(milliseconds: 300),
        PqFx.shake => const Duration(milliseconds: 400),
        PqFx.gone => const Duration(milliseconds: 200),
        PqFx.spin => const Duration(milliseconds: 900),
      };

  @override
  State<PqAnimate> createState() => _PqAnimateState();
}

class _PqAnimateState extends State<PqAnimate>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration ?? PqAnimate.defaultDuration(widget.fx),
  );
  Timer? _timer;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started && widget.play) _start();
  }

  @override
  void didUpdateWidget(PqAnimate old) {
    super.didUpdateWidget(old);
    if (widget.play && !old.play) {
      _started = false;
      _c.value = 0;
      _start();
    }
  }

  void _start() {
    _started = true;
    if (PqMotion.reduced(context) || _mountedByScroll()) {
      _c.value = 1;
      return;
    }
    if (widget.delay == Duration.zero) {
      _c.forward();
    } else {
      _timer = Timer(widget.delay, () {
        if (mounted) _c.forward();
      });
    }
  }

  /// Элемент ленивого списка появился из-за прокрутки (список уже сдвинут) —
  /// показываем сразу: появление играет только при открытии экрана, иначе
  /// строки «выпрыгивают» при каждой прокрутке туда и обратно.
  bool _mountedByScroll() {
    if (widget.fx != PqFx.up && widget.fx != PqFx.rise && widget.fx != PqFx.fade &&
        widget.fx != PqFx.pop && widget.fx != PqFx.fillX) {
      return false;
    }
    final pos = Scrollable.maybeOf(context)?.position;
    if (pos == null || !pos.hasPixels || !pos.hasContentDimensions) return false;
    return pos.pixels > pos.minScrollExtent + 1;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      // RepaintBoundary: во время анимации не перерисовываем содержимое
      // и соседей — меняется только слой трансформации/прозрачности.
      child: RepaintBoundary(child: widget.child),
      // Структура дерева не меняется по завершении — иначе содержимое
      // пересоздалось бы и вложенные анимации начались бы заново.
      builder: (context, child) => _apply(_c.value, child!),
    );
  }

  Widget _apply(double t, Widget child) {
    final curve = widget.curve ??
        (widget.fx == PqFx.shake ? PqMotion.easeInOut : PqMotion.ease);
    switch (widget.fx) {
      case PqFx.up:
      case PqFx.rise:
      case PqFx.toast:
        final dy = switch (widget.fx) {
          PqFx.up => 12.0,
          PqFx.rise => 10.0,
          _ => 16.0,
        };
        final v = curve.transform(t);
        return Opacity(
          opacity: v.clamp(0, 1),
          child: Transform.translate(offset: Offset(0, dy * (1 - v)), child: child),
        );
      case PqFx.pop:
        final s = kf(t, const [0, .6, 1], const [.4, 1.1, 1], curve);
        final o = kf(t, const [0, .6, 1], const [0, 1, 1], curve);
        return Opacity(
            opacity: o.clamp(0, 1), child: Transform.scale(scale: s, child: child));
      case PqFx.zoomIn:
        final s = kf(t, const [0, .7, 1], const [.6, 1.08, 1], curve);
        final o = kf(t, const [0, .7, 1], const [0, 1, 1], curve);
        return Opacity(
            opacity: o.clamp(0, 1), child: Transform.scale(scale: s, child: child));
      case PqFx.fade:
        return Opacity(opacity: curve.transform(t).clamp(0, 1), child: child);
      case PqFx.gone:
        return Opacity(opacity: (1 - curve.transform(t)).clamp(0, 1), child: child);
      case PqFx.logo:
        // transform задан только в 0% и 100% — одна кривая на весь отрезок.
        final s = _lerp(.88, 1, curve.transform(t));
        final o = kf(t, const [0, .6, 1], const [0, 1, 1], curve);
        return Opacity(
            opacity: o.clamp(0, 1), child: Transform.scale(scale: s, child: child));
      case PqFx.flip:
        final v = curve.transform(t);
        return Opacity(
          opacity: _lerp(.2, 1, v).clamp(0, 1),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY((1 - v) * math.pi / 2),
            child: child,
          ),
        );
      case PqFx.open:
        final v = curve.transform(t);
        return Opacity(
          opacity: v.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, 28 * (1 - v)),
            child: Transform.scale(scale: _lerp(.94, 1, v), child: child),
          ),
        );
      case PqFx.thumb:
        final v = curve.transform(t);
        final deg = _lerp(-4, widget.rotation, v);
        return Opacity(
          opacity: v.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, 10 * (1 - v)),
            child: Transform.rotate(angle: deg * math.pi / 180, child: child),
          ),
        );
      case PqFx.reveal:
        final v = curve.transform(t);
        return ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: v.clamp(0, 1),
            child: Transform.translate(offset: Offset(0, -16 * (1 - v)), child: child),
          ),
        );
      case PqFx.sheet:
        final v = curve.transform(t);
        return FractionalTranslation(translation: Offset(0, 1 - v), child: child);
      case PqFx.fillX:
        return Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.diagonal3Values(curve.transform(t).clamp(0, 1.2), 1, 1),
          child: child,
        );
      case PqFx.growY:
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(1, curve.transform(t).clamp(0, 1.2), 1),
          child: child,
        );
      case PqFx.press:
        final s = kf(t, const [0, .4, 1], const [1, .97, 1], curve);
        return Transform.scale(scale: s, child: child);
      case PqFx.shake:
        final x = kf(t, const [0, .2, .4, .6, .8, 1], const [0, -6, 6, -6, 6, 0], curve);
        return Transform.translate(offset: Offset(x, 0), child: child);
      case PqFx.spin:
        return Transform.rotate(angle: -2 * math.pi * curve.transform(t), child: child);
    }
  }
}

/// Каскадное появление детей (`.pq-stagger`): каждый ребёнок — pqUp .45s
/// с задержкой 50 мс × индекс (не больше [maxIndex] шагов).
class PqStagger extends StatelessWidget {
  const PqStagger({
    super.key,
    required this.children,
    this.gap = 0,
    this.maxIndex = 6,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.baseDelay = Duration.zero,
  });

  /// Каскад экранов входа: задержка растёт до .2s.
  const PqStagger.auth({
    super.key,
    required this.children,
    this.gap = 0,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.baseDelay = Duration.zero,
  }) : maxIndex = 4;

  final List<Widget> children;
  final double gap;
  final int maxIndex;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Duration baseDelay;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0 && gap > 0) items.add(SizedBox(height: gap));
      items.add(PqAnimate(
        delay: baseDelay + PqMotion.staggerDelay(i, maxIndex: maxIndex),
        child: children[i],
      ));
    }
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: items,
    );
  }
}

/// Элемент каскада для ленивых списков (ListView.builder): задержка по индексу.
class PqStaggerItem extends StatelessWidget {
  const PqStaggerItem(
      {super.key, required this.index, required this.child, this.maxIndex = 6});

  final int index;
  final int maxIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) => PqAnimate(
        delay: PqMotion.staggerDelay(index, maxIndex: maxIndex),
        child: child,
      );
}

/// Сегментный прогресс (`.pq-seg`): каждый сегмент «наливается» слева
/// (pqFill .5s) с шагом 40 мс.
class PqSegFill extends StatelessWidget {
  const PqSegFill({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) => PqAnimate(
        fx: PqFx.fillX,
        delay: Duration(milliseconds: 40 * math.min(index, 9)),
        child: child,
      );
}

/// Базовый бесконечный/повторяющийся цикл: `animation: X dur curve delay count`.
class PqLoop extends StatefulWidget {
  const PqLoop({
    super.key,
    required this.duration,
    required this.builder,
    this.delay = Duration.zero,
    this.repeat,
    this.alternate = false,
    this.reverseStart = false,
    this.child,
    this.restValue = 0,
  });

  final Duration duration;
  final Duration delay;

  /// null — бесконечно, иначе число итераций.
  final int? repeat;

  /// `alternate`: туда-обратно.
  final bool alternate;

  /// `alternate-reverse`: начать с конца.
  final bool reverseStart;

  /// Значение t в покое (до старта, после окончания, при reduced motion).
  final double restValue;

  final Widget? child;
  final Widget Function(BuildContext context, double t, Widget? child) builder;

  @override
  State<PqLoop> createState() => _PqLoopState();
}

class _PqLoopState extends State<PqLoop> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: widget.duration);
  Timer? _timer;
  int _done = 0;
  bool _started = false;
  bool _running = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (PqMotion.reduced(context)) return;
    _timer = Timer(widget.delay, _run);
  }

  void _run() {
    if (!mounted) return;
    _running = true;
    if (widget.repeat == null) {
      if (widget.reverseStart) _c.value = 1;
      _c.repeat(reverse: widget.alternate);
      return;
    }
    _c.addStatusListener(_onStatus);
    _c.forward(from: 0);
  }

  void _onStatus(AnimationStatus s) {
    if (s != AnimationStatus.completed) return;
    _done++;
    if (_done >= widget.repeat!) {
      setState(() => _running = false);
      return;
    }
    _c.forward(from: 0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      child: widget.child,
      builder: (context, child) => RepaintBoundary(
        // Бесконечный цикл перерисовывает только себя, а не весь экран.
        child: widget.builder(context, _running ? _c.value : widget.restValue, child),
      ),
    );
  }
}

/// pqBob: покачивание вверх на 6 px (иконки пустых состояний).
class PqBob extends StatelessWidget {
  const PqBob({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 3000),
    this.delay = Duration.zero,
    this.repeat,
    this.amplitude = 6,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final int? repeat;
  final double amplitude;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        delay: delay,
        repeat: repeat,
        child: child,
        builder: (_, t, c) => Transform.translate(
          offset: Offset(0, -amplitude * kf(t, const [0, .5, 1], const [0, 1, 0], Curves.easeInOut)),
          child: c,
        ),
      );
}

/// pqBob (вариант с поворотом ±10°): «звенящий» колокольчик.
class PqRing extends StatelessWidget {
  const PqRing({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1200),
    this.delay = Duration.zero,
    this.repeat,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final int? repeat;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        delay: delay,
        repeat: repeat,
        child: child,
        builder: (_, t, c) => Transform.rotate(
          angle: kf(t, const [0, .25, .75, 1], const [0, -10, 10, 0], Curves.easeInOut) *
              math.pi /
              180,
          child: c,
        ),
      );
}

/// pqBreath: мерцание прозрачности .35↔1 (текущий шаг прогресса).
class PqBreath extends StatelessWidget {
  const PqBreath({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1600),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        restValue: .5,
        child: child,
        builder: (_, t, c) => Opacity(
          opacity: kf(t, const [0, .5, 1], const [.35, 1, .35], Curves.easeInOut),
          child: c,
        ),
      );
}

/// pqDot (вариант 1): точка «прыгает» — opacity .25→1, translateY −3 на 40%.
class PqDotBounce extends StatelessWidget {
  const PqDotBounce({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1200),
    this.repeat,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final int? repeat;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        delay: delay,
        repeat: repeat,
        restValue: .4,
        child: child,
        builder: (_, t, c) {
          final v = kf(t, const [0, .4, .8, 1], const [0, 1, 0, 0], Curves.easeInOut);
          return Opacity(
            opacity: _lerp(.25, 1, v),
            child: Transform.translate(offset: Offset(0, -3 * v), child: c),
          );
        },
      );
}

/// pqDot (вариант 2): точка-индикатор пульсирует scale 1↔1.4.
class PqDotPulse extends StatelessWidget {
  const PqDotPulse({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1200),
    this.repeat,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final int? repeat;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        delay: delay,
        repeat: repeat,
        child: child,
        builder: (_, t, c) => Transform.scale(
          scale: kf(t, const [0, .5, 1], const [1, 1.4, 1], Curves.easeInOut),
          child: c,
        ),
      );
}

/// pqDots: три точки «печатает…» — opacity .2→1→.2.
class PqTypingDots extends StatelessWidget {
  const PqTypingDots({super.key, required this.color, this.size = 6});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    Widget dot(int i) => PqLoop(
          duration: const Duration(milliseconds: 1200),
          delay: Duration(milliseconds: 150 * i),
          restValue: .5,
          builder: (_, t, __) => Opacity(
            opacity: kf(t, const [0, .2, .5, 1], const [.2, .2, 1, .2]),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        );
    return Row(mainAxisSize: MainAxisSize.min, children: [
      dot(0),
      SizedBox(width: size * .66),
      dot(1),
      SizedBox(width: size * .66),
      dot(2),
    ]);
  }
}

/// pqDrift: медленное «плавание» фонового пятна (alternate).
class PqDrift extends StatelessWidget {
  const PqDrift({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 7),
    this.reverse = false,
  });

  final Widget child;
  final Duration duration;

  /// `alternate-reverse`.
  final bool reverse;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        alternate: true,
        reverseStart: reverse,
        restValue: reverse ? 1 : 0,
        child: child,
        builder: (_, t, c) {
          final v = Curves.easeInOut.transform(t);
          return Transform.translate(
            offset: Offset(-24 * v, 18 * v),
            child: Transform.scale(scale: 1 + .12 * v, child: c),
          );
        },
      );
}

/// Кольцевая пульсация (`box-shadow` 0 → spread): pqPulse (синяя, 16 px),
/// pqRing (зелёная, 22 px), pqSel (фиолетовая, 5 px).
class PqPulseRing extends StatelessWidget {
  const PqPulseRing({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.color,
    this.spread = 16,
    this.duration = const Duration(milliseconds: 2000),
    this.delay = Duration.zero,
    this.repeat,
    this.peakAt = .7,
    this.symmetric = false,
  });

  /// pqPulse — синяя волна от основной кнопки.
  factory PqPulseRing.pulse({
    Key? key,
    required Widget child,
    required BorderRadius borderRadius,
    required Color color,
    Duration delay = Duration.zero,
    int? repeat,
  }) =>
      PqPulseRing(
        key: key,
        borderRadius: borderRadius,
        color: color.withValues(alpha: .55),
        delay: delay,
        repeat: repeat,
        child: child,
      );

  /// pqRing — зелёная волна успеха (1.2s, до 22 px).
  factory PqPulseRing.success({
    Key? key,
    required Widget child,
    required BorderRadius borderRadius,
    Duration delay = Duration.zero,
    int? repeat = 1,
  }) =>
      PqPulseRing(
        key: key,
        borderRadius: borderRadius,
        color: const Color(0x7379D384),
        spread: 22,
        duration: const Duration(milliseconds: 1200),
        delay: delay,
        repeat: repeat,
        peakAt: 1,
        child: child,
      );

  /// pqSel — выбранная клетка (фиолетовая, 5 px, туда-обратно).
  factory PqPulseRing.select({
    Key? key,
    required Widget child,
    required BorderRadius borderRadius,
  }) =>
      PqPulseRing(
        key: key,
        borderRadius: borderRadius,
        color: const Color(0x8CA78BFA),
        spread: 5,
        duration: const Duration(milliseconds: 1600),
        symmetric: true,
        child: child,
      );

  final Widget child;
  final BorderRadius borderRadius;
  final Color color;
  final double spread;
  final Duration duration;
  final Duration delay;
  final int? repeat;

  /// Доля цикла, к которой волна полностью растворяется.
  final double peakAt;

  /// pqSel: 0 → 50% максимум → 100% обратно.
  final bool symmetric;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        delay: delay,
        repeat: repeat,
        child: child,
        builder: (_, t, c) {
          if (t == 0) return c!;
          double s, a;
          if (symmetric) {
            final v = kf(t, const [0, .5, 1], const [0, 1, 0], Curves.easeInOut);
            s = spread * v;
            a = 1 - v;
          } else {
            final v = (t / peakAt).clamp(0.0, 1.0);
            s = spread * Curves.easeOut.transform(v);
            a = 1 - v;
          }
          return CustomPaint(
            painter: _RingPainter(borderRadius, s, color.withValues(alpha: color.a * a)),
            child: c,
          );
        },
      );
}

/// Кольцо box-shadow со spread: как в CSS, скругление растёт на spread
/// (у Flutter BoxShadow радиус остаётся прежним — круг стал бы «квадратом»).
class _RingPainter extends CustomPainter {
  _RingPainter(this.radius, this.spread, this.color);

  final BorderRadius radius;
  final double spread;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (spread <= 0 || color.a == 0) return;
    Radius grow(Radius r) => Radius.elliptical(r.x + spread, r.y + spread);
    final inner = radius.toRRect(Offset.zero & size);
    final outer = RRect.fromRectAndCorners(
      (Offset.zero & size).inflate(spread),
      topLeft: grow(radius.topLeft),
      topRight: grow(radius.topRight),
      bottomLeft: grow(radius.bottomLeft),
      bottomRight: grow(radius.bottomRight),
    );
    canvas.drawDRRect(outer, inner, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.spread != spread || old.color != color || old.radius != radius;
}

/// pqCaret: мигающая каретка поля ввода (1s steps(1)).
class PqCaret extends StatelessWidget {
  const PqCaret({super.key, required this.color, this.height = 20});

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: const Duration(seconds: 1),
        builder: (_, t, __) => Opacity(
          opacity: t < .5 ? 1 : 0,
          child: Container(
            width: 2,
            height: height,
            margin: const EdgeInsets.only(left: 1),
            color: color,
          ),
        ),
      );
}

/// pqSpin2: бесконечное вращение (спиннер в кнопке, обновление).
class PqSpin extends StatelessWidget {
  const PqSpin({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: duration,
        child: child,
        builder: (_, t, c) => Transform.rotate(angle: 2 * math.pi * t, child: c),
      );
}

/// Спиннер-кольцо из макета: 20×20, рамка 2.5, верхний сектор цветной.
class PqSpinner extends StatelessWidget {
  const PqSpinner({
    super.key,
    required this.color,
    this.trackColor = const Color(0x59FFFFFF),
    this.size = 20,
    this.stroke = 2.5,
  });

  final Color color;
  final Color trackColor;
  final double size;
  final double stroke;

  @override
  Widget build(BuildContext context) => PqSpin(
        child: SizedBox.square(
          dimension: size,
          child: CustomPaint(
            painter: _SpinnerPainter(color, trackColor, stroke),
          ),
        ),
      );
}

class _SpinnerPainter extends CustomPainter {
  _SpinnerPainter(this.color, this.track, this.stroke);

  final Color color;
  final Color track;
  final double stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final r = Rect.fromLTWH(stroke / 2, stroke / 2, size.width - stroke, size.height - stroke);
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    canvas.drawArc(r, 0, 2 * math.pi, false, p..color = track);
    // border-top-color: верхняя четверть окружности.
    canvas.drawArc(r, -3 * math.pi / 4, math.pi / 2, false, p..color = color);
  }

  @override
  bool shouldRepaint(_SpinnerPainter old) =>
      old.color != color || old.track != track || old.stroke != stroke;
}

/// pqLoad: бегущая полоса неопределённой загрузки (заставка).
class PqLoadBar extends StatelessWidget {
  const PqLoadBar({
    super.key,
    required this.color,
    required this.trackColor,
    this.width = 120,
    this.height = 4,
  });

  final Color color;
  final Color trackColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: Container(
          width: width,
          height: height,
          color: trackColor,
          alignment: Alignment.centerLeft,
          child: PqLoop(
            duration: const Duration(milliseconds: 1200),
            restValue: .3,
            builder: (_, t, __) {
              final v = PqMotion.load.transform(t);
              return Transform.translate(
                offset: Offset(width * .4 * _lerp(-1, 2.5, v), 0),
                child: Container(
                  width: width * .4,
                  height: height,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                ),
              );
            },
          ),
        ),
      );
}

/// pqShim: «переливающийся» скелетон загрузки.
class PqShimmer extends StatelessWidget {
  const PqShimmer({
    super.key,
    required this.base,
    required this.highlight,
    this.width,
    this.height,
    this.radius = 8,
  });

  final Color base;
  final Color highlight;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) => PqLoop(
        duration: const Duration(milliseconds: 1400),
        builder: (_, t, __) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              colors: [base, highlight, base],
              stops: const [.25, .37, .63],
              transform: _ShimmerTransform(1 - Curves.ease.transform(t)),
            ),
          ),
        ),
      );
}

/// background-size 400%, background-position p → сдвиг градиента на −3W·p.
class _ShimmerTransform extends GradientTransform {
  const _ShimmerTransform(this.p);

  final double p;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final w = bounds.width;
    return Matrix4.translationValues(bounds.left - 3 * w * p, 0, 0)
      ..multiply(Matrix4.diagonal3Values(4, 1, 1))
      ..multiply(Matrix4.translationValues(-bounds.left, 0, 0));
  }
}

/// Одна деталь конфетти (pqFall).
class PqConfettiPiece {
  const PqConfettiPiece({
    required this.left,
    required this.color,
    required this.duration,
    this.delay = Duration.zero,
    this.width = 8,
    this.height = 12,
    this.radius = 2,
    this.linear = false,
  });

  final double left;
  final Color color;
  final Duration duration;
  final Duration delay;
  final double width;
  final double height;
  final double radius;

  /// Сапёр: `linear`, падение до 560 px и поворот 620°.
  final bool linear;
}

/// Конфетти: детали падают сверху с поворотом и растворяются (однократно).
class PqConfetti extends StatelessWidget {
  const PqConfetti({super.key, required this.pieces});

  final List<PqConfettiPiece> pieces;

  /// Стандартный набор (тест пройден / регистрация): 4 колонки × 4 волны
  /// с цветами бренда — как в макетах TestPassed/RegSuccess.
  static List<PqConfettiPiece> burst({double width = 414}) {
    const colors = [
      Color(0xFF6B9EF5),
      Color(0xFFA855F7),
      Color(0xFFFDE047),
      Color(0xFF79D384),
    ];
    final out = <PqConfettiPiece>[];
    const cols = 11;
    for (var i = 0; i < cols; i++) {
      final w = 6.0 + (i % 3) * 2;
      final h = 10.0 + (i % 4) * 2;
      out.add(PqConfettiPiece(
        left: 11 + i * (width - 30) / (cols - 1),
        color: colors[i % colors.length],
        width: w,
        height: h,
        duration: Duration(milliseconds: 2200 + (i % 5) * 250),
        delay: Duration(milliseconds: (i % 7) * 120),
      ));
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    if (PqMotion.reduced(context)) return const SizedBox.shrink();
    return IgnorePointer(
      child: Stack(clipBehavior: Clip.none, children: [
        for (final p in pieces)
          Positioned(
            left: p.left,
            top: 0,
            child: _FallingPiece(piece: p),
          ),
      ]),
    );
  }
}

class _FallingPiece extends StatefulWidget {
  const _FallingPiece({required this.piece});

  final PqConfettiPiece piece;

  @override
  State<_FallingPiece> createState() => _FallingPieceState();
}

class _FallingPieceState extends State<_FallingPiece>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: widget.piece.duration);
  Timer? _t;

  @override
  void initState() {
    super.initState();
    _t = Timer(widget.piece.delay, () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _t?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.piece;
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        final t = _c.value;
        if (t == 0 || t == 1) return const SizedBox.shrink();
        final v = (p.linear ? Curves.linear : PqMotion.fall).transform(t);
        final fadeIn = p.linear ? .08 : .1;
        final opacity = t < fadeIn ? t / fadeIn : 1 - (t - fadeIn) / (1 - fadeIn);
        final y = p.linear ? _lerp(-30, 560, v) : _lerp(-40, 520, v);
        final rot = (p.linear ? 620 : 540) * v * math.pi / 180;
        return Opacity(
          opacity: opacity.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, y),
            child: Transform.rotate(
              angle: rot,
              child: Container(
                width: p.width,
                height: p.height,
                decoration: BoxDecoration(
                  color: p.color,
                  borderRadius: BorderRadius.circular(p.radius),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// pqScan: линия сканирования ходит сверху вниз и обратно.
class PqScanLine extends StatelessWidget {
  const PqScanLine({
    super.key,
    required this.color,
    this.duration = const Duration(milliseconds: 2400),
    this.thickness = 3,
  });

  final Color color;
  final Duration duration;
  final double thickness;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, box) => PqLoop(
          duration: duration,
          builder: (_, t, __) {
            final y = kf(t, const [0, .5, 1], [0, box.maxHeight - thickness, 0],
                Curves.easeInOut);
            return Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                top: y,
                child: Container(
                  height: thickness,
                  decoration: BoxDecoration(
                    color: color,
                    boxShadow: [BoxShadow(color: color, blurRadius: 12)],
                  ),
                ),
              ),
            ]);
          },
        ),
      );
}

/// Нажатие (состояние «Нажатая» в компонентах): scale .98 за .15s
/// и затемнение фона за .2s — `transition: background .2s, transform .15s`.
class PqPressable extends StatefulWidget {
  const PqPressable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.scale = .98,
    this.enabled = true,
    this.semanticLabel,
    this.behavior = HitTestBehavior.opaque,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double scale;
  final bool enabled;
  final String? semanticLabel;
  final HitTestBehavior behavior;

  @override
  State<PqPressable> createState() => _PqPressableState();
}

class _PqPressableState extends State<PqPressable> {
  bool _down = false;

  void _set(bool v) {
    if (_down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.enabled && (widget.onTap != null || widget.onLongPress != null);
    return Semantics(
      button: widget.onTap != null,
      enabled: active,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: widget.behavior,
        onTapDown: active ? (_) => _set(true) : null,
        onTapUp: active ? (_) => _set(false) : null,
        onTapCancel: active ? () => _set(false) : null,
        onTap: active ? widget.onTap : null,
        onLongPress: active ? widget.onLongPress : null,
        child: AnimatedScale(
          scale: _down ? widget.scale : 1,
          duration: const Duration(milliseconds: 150),
          curve: Curves.ease,
          child: PqPressedScope(pressed: _down, child: widget.child),
        ),
      ),
    );
  }
}

/// Сообщает потомкам, что элемент нажат (для смены фона на «нажатый»).
class PqPressedScope extends InheritedWidget {
  const PqPressedScope({super.key, required this.pressed, required super.child});

  final bool pressed;

  static bool of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PqPressedScope>()?.pressed ?? false;

  @override
  bool updateShouldNotify(PqPressedScope old) => old.pressed != pressed;
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/common.dart';
import 'tour_controller.dart';

/// Цвета тура (макеты Tour*.dc.html / Tour*Light.dc.html).
class _TourColors {
  _TourColors(PqColors pq)
    : dark = pq.isDark,
      scrim = pq.isDark ? const Color(0xC205060A) : const Color(0x9E0E1122),
      outline = pq.isDark ? const Color(0xFF6B9EF5) : Colors.white,
      card = pq.surface,
      border = pq.isDark ? const Color(0xFF2E2F3A) : const Color(0xFFE6E8EF),
      shadow = pq.isDark ? const Color(0xB3000000) : const Color(0x730E1122),
      title = pq.isDark ? const Color(0xFFE4E2ED) : const Color(0xFF14161F),
      text = pq.isDark ? const Color(0xFFC7C9D9) : const Color(0xFF374151),
      muted = pq.isDark ? const Color(0xFF8F909A) : const Color(0xFF5F6673),
      dotOff = pq.isDark ? const Color(0xFF3A3B47) : const Color(0xFFD6D9E2),
      dotOn = pq.accent,
      backBg = pq.isDark ? const Color(0x12FFFFFF) : const Color(0x0F14161F),
      nextBg = pq.accent,
      nextFg = pq.onAccent;

  final bool dark;
  final Color scrim,
      outline,
      card,
      border,
      shadow,
      title,
      text,
      muted,
      dotOff,
      dotOn;
  final Color backBg, nextBg, nextFg;

  List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: shadow,
      offset: const Offset(0, 24),
      blurRadius: 60,
      spreadRadius: -12,
    ),
  ];

  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
  );
}

/// Оверлей обучающего тура поверх всего приложения (включая нижнее меню).
class TourOverlay extends ConsumerWidget {
  const TourOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tour = ref.watch(tourProvider);
    if (!tour.active) return const SizedBox.shrink();
    final ctrl = ref.read(tourProvider.notifier);
    // Оверлей лежит рядом со Scaffold, а не внутри: без Material у текста
    // нет стиля (жёлтое подчёркивание отладки).
    return Material(
      type: MaterialType.transparency,
      child: PopScope(
        canPop: false,
        // «Назад» Android: назад по шагам; на приветствии — «Пропустить».
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          if (tour.phase == TourPhase.step && tour.index > 0) {
            ctrl.back();
          } else {
            ctrl.finish();
          }
        },
        child: switch (tour.phase) {
          TourPhase.welcome => _TourModal(
            key: const ValueKey('welcome'),
            done: false,
            role: tour.role,
          ),
          TourPhase.done => _TourModal(
            key: const ValueKey('done'),
            done: true,
            role: tour.role,
          ),
          _ => const _Spotlight(),
        },
      ),
    );
  }
}

// ── Подсветка шага ───────────────────────────────────────────────────────

class _Spotlight extends ConsumerStatefulWidget {
  const _Spotlight();

  @override
  ConsumerState<_Spotlight> createState() => _SpotlightState();
}

class _SpotlightState extends ConsumerState<_Spotlight>
    with TickerProviderStateMixin {
  /// Переезд выреза и подсказки между шагами: 450 мс, (.2,.7,.2,1).
  late final AnimationController _move = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 450),
  )..value = 1;

  /// Следим за положением цели каждый кадр (прокрутка, перестроение).
  late final Ticker _ticker = createTicker((_) => _track());

  Rect? _from;
  double _fromRadius = 20;

  /// Измеренная высота подсказки (для выбора «под целью / над целью»).
  final _tooltipKey = GlobalKey();
  double _tooltipHeight = 230;
  Rect? _live;
  double _liveRadius = 20;
  int? _index;

  @override
  void initState() {
    super.initState();
    _ticker.start();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onStep(first: true));
  }

  @override
  void dispose() {
    _ticker.dispose();
    _move.dispose();
    super.dispose();
  }

  TourStep? get _step => ref.read(tourProvider).current;

  void _track() {
    final step = _step;
    if (step == null || !mounted) return;
    final box = context.findRenderObject();
    final r = TourAnchors.rect(step.target, ancestor: box);
    if (r == null) return;
    final radius = TourAnchors.radius(step.target) + 4;
    final th = _tooltipKey.currentContext?.size?.height;
    if (r != _live || radius != _liveRadius || _move.isAnimating ||
        (th != null && th != _tooltipHeight)) {
      setState(() {
        _live = r;
        _liveRadius = radius;
        if (th != null) _tooltipHeight = th;
      });
    }
  }

  /// Новый шаг: докрутить цель в видимую область и запустить переезд.
  Future<void> _onStep({bool first = false}) async {
    final state = ref.read(tourProvider);
    if (state.phase != TourPhase.step) return;
    _index = state.index;
    final step = state.current!;
    final ctx = TourAnchors.context(step.target);
    final reduced = PqMotion.reduced(context);
    if (ctx != null && ctx.mounted && !_isTab(step.target)) {
      final r = TourAnchors.rect(
        step.target,
        ancestor: context.findRenderObject(),
      );
      final size = MediaQuery.sizeOf(context);
      final visibleBottom = size.height - kPqNavHeight - 16;
      if (r != null && (r.top < 80 || r.bottom > visibleBottom)) {
        await Scrollable.ensureVisible(
          ctx,
          alignment: .35,
          duration: reduced ? Duration.zero : const Duration(milliseconds: 350),
          curve: PqMotion.ease,
        );
      }
    }
    if (!mounted) return;
    _from = first ? null : _displayRect;
    _fromRadius = _displayRadius;
    if (reduced || first) {
      _move.value = 1;
    } else {
      _move.forward(from: 0);
    }
  }

  static bool _isTab(TourTarget t) =>
      t == TourTarget.tabChecks ||
      t == TourTarget.tabLearn ||
      t == TourTarget.tabProfile;

  Rect? get _cut => _live?.inflate(8);

  Rect? get _displayRect {
    final to = _cut;
    if (to == null) return _from;
    if (_from == null) return to;
    return Rect.lerp(_from, to, PqMotion.ease.transform(_move.value));
  }

  double get _displayRadius =>
      _from == null
          ? _liveRadius
          : _lerp(
            _fromRadius,
            _liveRadius,
            PqMotion.ease.transform(_move.value),
          );

  static double _lerp(double a, double b, double t) => a + (b - a) * t;

  @override
  Widget build(BuildContext context) {
    final tour = ref.watch(tourProvider);
    ref.listen(tourProvider, (prev, next) {
      if (next.phase == TourPhase.step && next.index != _index) _onStep();
    });
    final c = _TourColors(context.pq);
    final step = tour.current;
    final cut = _displayRect;
    final size = MediaQuery.sizeOf(context);
    final ctrl = ref.read(tourProvider.notifier);

    return AnimatedBuilder(
      animation: _move,
      builder: (context, _) {
        final radius = _displayRadius;
        return Stack(
          children: [
            // Затемнение с вырезом; нажатие по цели = «Далее», мимо — ничего.
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapUp: (d) {
                  if (cut != null && cut.contains(d.localPosition)) ctrl.next();
                },
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: _ScrimPainter(
                      cut: cut,
                      radius: radius,
                      color: c.scrim,
                      outline: c.outline,
                    ),
                  ),
                ),
              ),
            ),
            if (cut != null)
              _PulseRing(rect: cut, radius: radius, color: c.outline),
            if (step?.tapDot != null && _live != null && _move.isCompleted)
              _TapDot(center: step!.tapDot!.withinRect(_live!)),
            if (step != null && cut != null)
              _Tooltip(
                key: _tooltipKey,
                colors: c,
                height: _tooltipHeight,
                step: step,
                index: tour.index,
                total: tour.steps.length,
                cut: cut,
                target: _live ?? cut,
                screen: size,
                onSkip: ctrl.finish,
                onBack: tour.index > 0 ? ctrl.back : null,
                onNext: ctrl.next,
              ),
          ],
        );
      },
    );
  }
}

/// Затемнение `box-shadow: 0 0 0 2000px` с вырезом + обводка 2 px снаружи.
class _ScrimPainter extends CustomPainter {
  _ScrimPainter({
    required this.cut,
    required this.radius,
    required this.color,
    required this.outline,
  });

  final Rect? cut;
  final double radius;
  final Color color;
  final Color outline;

  @override
  void paint(Canvas canvas, Size size) {
    final full = Offset.zero & size;
    if (cut == null) {
      canvas.drawRect(full, Paint()..color = color);
      return;
    }
    final rr = RRect.fromRectAndRadius(cut!, Radius.circular(radius));
    final path =
        Path()
          ..fillType = PathFillType.evenOdd
          ..addRect(full)
          ..addRRect(rr);
    canvas.drawPath(path, Paint()..color = color);
    // box-shadow 0 0 0 2px: кольцо 2 px снаружи выреза (радиус растёт на 2).
    canvas.drawDRRect(
      RRect.fromRectAndRadius(cut!.inflate(2), Radius.circular(radius + 2)),
      rr,
      Paint()..color = outline,
    );
  }

  @override
  bool shouldRepaint(_ScrimPainter old) =>
      old.cut != cut ||
      old.radius != radius ||
      old.color != color ||
      old.outline != outline;
}

/// Пульс обводки: scale 1→1.12, opacity .9→0, 1.8 с, бесконечно.
class _PulseRing extends StatelessWidget {
  const _PulseRing({
    required this.rect,
    required this.radius,
    required this.color,
  });

  final Rect rect;
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final box = rect.inflate(2);
    return Positioned.fromRect(
      rect: box,
      child: IgnorePointer(
        child: PqLoop(
          duration: const Duration(milliseconds: 1800),
          builder: (_, t, __) {
            final v = Curves.easeOut.transform(t);
            return Opacity(
              opacity: (.9 * (1 - v)).clamp(0.0, 1.0),
              child: Transform.scale(
                scale: 1 + .12 * v,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(color: color, width: 2),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Точка «нажми сюда»: белая 14 + волна 28 (scale .6→2.2, 1.6 с).
class _TapDot extends StatelessWidget {
  const _TapDot({required this.center});

  final Offset center;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: center.dx - 14,
      top: center.dy - 14,
      width: 28,
      height: 28,
      child: IgnorePointer(
        child: PqAnimate(
          fx: PqFx.fade,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PqLoop(
                duration: const Duration(milliseconds: 1600),
                builder: (_, t, __) {
                  final v = Curves.easeOut.transform(t);
                  return Opacity(
                    opacity: (.9 * (1 - v)).clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: .6 + 1.6 * v,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0x59FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x66000000),
                      offset: Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Подсказка: ширина 334, радиус 22, стрелка на центр цели.
class _Tooltip extends StatelessWidget {
  const _Tooltip({
    super.key,
    required this.colors,
    required this.height,
    required this.step,
    required this.index,
    required this.total,
    required this.cut,
    required this.target,
    required this.screen,
    required this.onSkip,
    required this.onBack,
    required this.onNext,
  });

  final _TourColors colors;

  /// Высота подсказки с прошлого кадра.
  final double height;
  final TourStep step;
  final int index;
  final int total;
  final Rect cut;
  final Rect target;
  final Size screen;
  final VoidCallback onSkip;
  final VoidCallback? onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = colors;
    final width = math.min(334.0, screen.width - 80);
    final left = (screen.width - width) / 2;
    // Под целью, если подсказка помещается над нижним меню (так во всех
    // макетах; «низ выреза < 520» из спецификации расходится с DocTour2),
    // иначе — над целью.
    final below = cut.bottom + 16 + height <= screen.height - kPqNavHeight + 12;
    final arrowX = (target.center.dx - left).clamp(28.0, width - 28);
    final last = index == total - 1;

    final arrow = Positioned(
      left: arrowX - 8,
      top: below ? -8 : null,
      bottom: below ? null : -8,
      child: Transform.rotate(
        angle: (below ? 45 : 225) * math.pi / 180,
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: c.card,
            border: Border(
              left: BorderSide(color: c.border),
              top: BorderSide(color: c.border),
            ),
          ),
        ),
      ),
    );

    final card = Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: c.border),
        boxShadow: c.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l.tourStepOf(index + 1, total),
                  style: PqText.text(13, FontWeight.w600, c: c.muted),
                ),
              ),
              for (var k = 0; k < total; k++) ...[
                if (k > 0) const SizedBox(width: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: k == index ? 18 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: k == index ? c.dotOn : c.dotOff,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Text(
            step.title(l),
            style: PqText.heading(
              20,
              FontWeight.w700,
              height: 1.25,
              c: c.title,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            step.text(l),
            style: PqText.text(15, FontWeight.w400, height: 1.5, c: c.text),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              PqPressable(
                onTap: onSkip,
                semanticLabel: l.tourSkip,
                child: SizedBox(
                  height: 44,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Center(
                      child: Text(
                        l.tourSkip,
                        style: PqText.text(
                          15,
                          FontWeight.w600,
                          c: c.muted,
                        ).copyWith(fontFeatures: const []),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              if (onBack != null) ...[
                PqPressable(
                  onTap: onBack,
                  semanticLabel: l.tourBack,
                  scale: .94,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: c.backBg,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: c.border),
                    ),
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: math.pi,
                      child: PqIcon(
                        PqIcons.arrowRight,
                        size: 16,
                        strokeWidth: 2,
                        color: c.title,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              PqPressable(
                onTap: onNext,
                semanticLabel: last ? l.tourDoneStep : l.tourNext,
                scale: .96,
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: c.nextBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        last ? l.tourDoneStep : l.tourNext,
                        style: PqText.text(
                          15,
                          FontWeight.w700,
                          c: c.nextFg,
                        ).copyWith(fontFeatures: const []),
                      ),
                      const SizedBox(width: 6),
                      PqIcon(
                        PqIcons.arrowRight,
                        size: 16,
                        strokeWidth: 2,
                        color: c.nextFg,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Positioned(
      left: left,
      width: width,
      top: below ? cut.bottom + 16 : null,
      bottom: below ? null : screen.height - cut.top + 16,
      child: Semantics(
        container: true,
        label:
            '${l.tourStepOf(index + 1, total)}. ${step.title(l)}. ${step.text(l)}',
        child: _TooltipIn(
          child: Stack(clipBehavior: Clip.none, children: [arrow, card]),
        ),
      ),
    );
  }
}

/// Появление подсказки (tgIn): opacity 0→1, translateY 10→0, scale .98→1, 350 мс.
class _TooltipIn extends StatelessWidget {
  const _TooltipIn({
    required this.child,
    this.duration = const Duration(milliseconds: 350),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    if (PqMotion.reduced(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: PqMotion.ease,
      child: child,
      builder:
          (_, v, c) => Opacity(
            opacity: v.clamp(0, 1),
            child: Transform.translate(
              offset: Offset(0, 10 * (1 - v)),
              child: Transform.scale(scale: .98 + .02 * v, child: c),
            ),
          ),
    );
  }
}

// ── Приветствие и «Готово» ───────────────────────────────────────────────

class _TourModal extends ConsumerWidget {
  const _TourModal({super.key, required this.done, required this.role});

  final bool done;
  final Role role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final pq = context.pq;
    final c = _TourColors(pq);
    final ctrl = ref.read(tourProvider.notifier);
    final doc = role == Role.doctor;

    Widget gradientButton(
      String label,
      VoidCallback onTap, {
      bool arrow = false,
    }) => PqPressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          gradient: _TourColors.gradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: PqText.button(c: Colors.white)),
            if (arrow) ...[
              const SizedBox(width: 8),
              const PqIcon(
                PqIcons.arrowRight,
                size: 18,
                strokeWidth: 2,
                color: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );

    final icon =
        done
            ? PqAnimate(
              fx: PqFx.pop,
              duration: const Duration(milliseconds: 500),
              curve: const Cubic(.2, 1.4, .4, 1),
              child: Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  gradient: _TourColors.gradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Color(0x297C3AED), spreadRadius: 10),
                    BoxShadow(color: Color(0x807C3AED), blurRadius: 60),
                  ],
                ),
                alignment: Alignment.center,
                child: const PqIcon(
                  PqIcons.check,
                  size: 40,
                  strokeWidth: 2.4,
                  color: Colors.white,
                ),
              ),
            )
            : PqBob(
              duration: const Duration(seconds: 4),
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: c.card,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: c.border),
                  boxShadow: const [
                    BoxShadow(color: Color(0x1F6B9EF5), spreadRadius: 10),
                    BoxShadow(color: Color(0x737C3AED), blurRadius: 60),
                  ],
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  width: 50,
                  height: 48,
                  colorFilter:
                      pq.isDark
                          ? null
                          : const ColorFilter.mode(
                            Color(0xFF293B71),
                            BlendMode.srcIn,
                          ),
                ),
              ),
            );

    final text =
        done
            ? Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${doc ? l.tourDoneTextDoc : l.tourDoneText} ',
                  ),
                  TextSpan(
                    text: l.tourDoneNote,
                    style: TextStyle(color: c.muted),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w400, height: 1.5, c: c.text),
            )
            : Text(
              doc ? l.tourWelcomeTextDoc : l.tourWelcomeText,
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w400, height: 1.5, c: c.text),
            );

    final card = Container(
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: c.border),
        boxShadow: c.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          if (done) const Positioned.fill(child: _CardConfetti()),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(height: 22),
                Text(
                  done ? l.tourDoneTitle : l.tourWelcomeTitle,
                  textAlign: TextAlign.center,
                  style: PqText.heading(
                    24,
                    FontWeight.w700,
                    height: 1.2,
                    c: c.title,
                  ),
                ),
                const SizedBox(height: 14),
                text,
                const SizedBox(height: 24),
                if (done)
                  gradientButton(l.tourFinish, ctrl.finish)
                else ...[
                  gradientButton(l.tourStart, ctrl.begin, arrow: true),
                  const SizedBox(height: 4),
                  PqPressable(
                    onTap: ctrl.finish,
                    semanticLabel: l.tourSkipAll,
                    child: SizedBox(
                      height: 44,
                      child: Center(
                        child: Text(
                          l.tourSkipAll,
                          style: PqText.text(
                            15,
                            FontWeight.w600,
                            c: c.muted,
                          ).copyWith(fontFeatures: const []),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );

    return Stack(
      children: [
        // Затемнение tgFade .3s; нажатие мимо окна ничего не делает.
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: PqAnimate(
              fx: PqFx.fade,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: ColoredBox(color: c.scrim),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Semantics(
              scopesRoute: true,
              namesRoute: true,
              explicitChildNodes: true,
              child: _TooltipIn(
                duration: const Duration(milliseconds: 400),
                child: card,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Конфетти внутри окна «Готово» (tgFall: 0→420 px, 540°, ease-in, бесконечно).
class _CardConfetti extends StatelessWidget {
  const _CardConfetti();

  static const _colors = [
    Color(0xFF6B9EF5),
    Color(0xFFA78BFA),
    Color(0xFFFCD34D),
    Color(0xFF79D384),
    Color(0xFFF472B6),
  ];
  static const _durations = [2200, 2600, 3000, 3400];

  @override
  Widget build(BuildContext context) {
    if (PqMotion.reduced(context)) return const SizedBox.shrink();
    return IgnorePointer(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (var i = 0; i < 9; i++)
            Positioned(
              left: 40.0 + 37 * i,
              top: -10,
              child: PqLoop(
                duration: Duration(milliseconds: _durations[i % 4]),
                delay: Duration(milliseconds: 120 * i),
                builder: (_, t, __) {
                  final v = Curves.easeIn.transform(t);
                  return Opacity(
                    opacity: (.9 * (1 - t)).clamp(0.0, 1.0),
                    child: Transform.translate(
                      offset: Offset(0, 420 * v),
                      child: Transform.rotate(
                        angle: 540 * v * math.pi / 180,
                        child: Container(
                          width: 8,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _colors[i % _colors.length],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

/// Автозапуск тура, когда главная загрузилась: ставится в дерево главной.
class TourAutoStart extends ConsumerStatefulWidget {
  const TourAutoStart({super.key});

  @override
  ConsumerState<TourAutoStart> createState() => _TourAutoStartState();
}

class _TourAutoStartState extends ConsumerState<TourAutoStart> {
  @override
  void initState() {
    super.initState();
    // Даём главной доиграть каскад появления (~.75 с), затем показываем тур.
    Future<void>.delayed(const Duration(milliseconds: 900), () {
      if (mounted) ref.read(tourProvider.notifier).maybeAutoStart();
    });
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

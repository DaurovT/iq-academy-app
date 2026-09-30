import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/uploads/upload_queue.dart';
import 'rx_common.dart';

/// Съёмка бланка (макет RxCamera). Пакета `camera` в проекте нет, поэтому
/// экран — «видоискатель»-подсказка: рамка кадра, советы, кнопка затвора
/// открывает системную камеру (image_picker), кнопка слева — галерею.
/// Дальше — данные врача (необязательно) и очередь загрузки.
class RecipeCameraScreen extends ConsumerStatefulWidget {
  const RecipeCameraScreen({super.key});

  @override
  ConsumerState<RecipeCameraScreen> createState() => _RecipeCameraScreenState();
}

class _RecipeCameraScreenState extends ConsumerState<RecipeCameraScreen> {
  bool _busy = false;

  void _close() =>
      context.canPop() ? context.pop() : context.go('/app/recipes');

  Future<void> _pick(ImageSource source) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final picker = ImagePicker();
      final List<XFile> picked;
      if (source == ImageSource.gallery) {
        picked = await picker.pickMultiImage();
      } else {
        final x = await picker.pickImage(source: ImageSource.camera);
        picked = x == null ? const [] : [x];
      }
      if (picked.isEmpty || !mounted) return;

      // Данные врача — все поля необязательны (бэк переиспользует прошлые).
      final doctor = await showPqSheet<DoctorRecipeInfo>(
        context,
        scrollable: true,
        builder: (_) => const _DoctorInfoForm(),
      );
      if (!mounted) return;

      await ref.read(uploadQueueProvider.notifier).enqueueRecipe(picked, doctor);
      if (!mounted) return;
      showPqToast(context, context.l10n.recipesUploading, icon: PqIcons.check);
      context.go('/app/recipes');
    } on PlatformException {
      if (mounted) {
        showPqToast(context, context.l10n.rxCameraDenied, tone: PqTone.danger);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mq = MediaQuery.of(context);
    final top = mq.padding.top;
    final bottom = mq.padding.bottom;
    const chrome = Color(0x73000000);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: LayoutBuilder(builder: (context, box) {
          // Панель: 220 + отступ 20 сверху (content-box) = 240.
          const panel = 240.0;
          // Рамка 326×450 на экране 414×874: поля 44, сверху 150, до панели 34.
          // На высоких экранах держим пропорцию листа и центрируем по высоте.
          final width = box.maxWidth - 88;
          final areaTop = top + 150;
          final areaBottom = box.maxHeight - panel - bottom - 34;
          final height = math.max(200.0, math.min(areaBottom - areaTop, width * 450 / 326));
          final frameTop = areaTop + math.max(0.0, (areaBottom - areaTop - height) / 2);
          final frame = Rect.fromLTWH(44, frameTop, width, height);
          return Stack(fit: StackFit.expand, children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -.2),
                  radius: .9,
                  colors: [Color(0xFF3A3A3A), Color(0xFF121212)],
                  stops: [0, .7],
                ),
              ),
            ),
            Positioned(
              left: frame.left + 26,
              right: box.maxWidth - frame.right + 26,
              top: frame.top + 30,
              bottom: box.maxHeight - frame.bottom + 30,
              child: const ExcludeSemantics(child: _PaperPreview()),
            ),
            IgnorePointer(
              child: CustomPaint(painter: _ScrimHole(frame, const Color(0x8C000000))),
            ),
            Positioned.fromRect(rect: frame, child: const _FrameMarks()),
            Positioned(
              left: 16,
              right: 16,
              top: top + 16,
              child: Row(children: [
                PqIconButton(
                  icon: PqIcons.x,
                  iconSize: 22,
                  label: l10n.rxCameraClose,
                  background: chrome,
                  color: Colors.white,
                  onTap: _close,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                          color: chrome, borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        widthFactor: 1,
                        child: Text(l10n.rxCameraLabel,
                            style: PqText.buttonSmall(c: Colors.white)),
                      ),
                    ),
                  ),
                ),
                // Вспышкой управляет системная камера — слот пустой.
                const SizedBox(width: 44, height: 44),
              ]),
            ),
            Positioned(
              left: 16,
              right: 16,
              top: top + 84,
              child: Center(
                child: PqAnimate(
                  fx: PqFx.toast,
                  duration: const Duration(milliseconds: 400),
                  delay: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0x8C000000),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const PqIcon(PqIcons.stamp, size: 16, color: Colors.white),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(l10n.rxCameraTip,
                            style: PqText.text(14, FontWeight.w600, c: Colors.white)),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: panel + bottom,
              child: _ControlPanel(
                busy: _busy,
                onGallery: () => _pick(ImageSource.gallery),
                onShoot: () => _pick(ImageSource.camera),
              ),
            ),
          ]);
        }),
      ),
    );
  }
}

/// Нижняя панель: подсказка, «галерея» и затвор (pqPulse 2s после 1s).
class _ControlPanel extends StatelessWidget {
  const _ControlPanel({
    required this.busy,
    required this.onGallery,
    required this.onShoot,
  });

  final bool busy;
  final VoidCallback onGallery;
  final VoidCallback onShoot;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final dark = pq.isDark;
    final fg = dark ? Colors.white : pq.text;
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF0B0B10) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            l10n.rxCameraHold,
            textAlign: TextAlign.center,
            style: rxText14(dark ? const Color(0xB8FFFFFF) : pq.textMuted),
          ),
        ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: PqPressable(
                  onTap: busy ? null : onGallery,
                  semanticLabel: l10n.recipesFromGallery,
                  scale: .94,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: dark ? const Color(0x33FFFFFF) : pq.border),
                    ),
                    alignment: Alignment.center,
                    child: PqIcon(PqIcons.image, size: 22, color: fg),
                  ),
                ),
              ),
            ),
            PqPulseRing.pulse(
              borderRadius: BorderRadius.circular(38),
              color: const Color(0xFF6B9EF5),
              delay: const Duration(seconds: 1),
              child: PqPressable(
                onTap: busy ? null : onShoot,
                semanticLabel: l10n.rxCameraShoot,
                scale: .94,
                child: Container(
                  width: 76,
                  height: 76,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: pq.accent, width: 4),
                  ),
                  child: Container(
                    decoration:
                        BoxDecoration(color: pq.accent, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: busy
                        ? PqSpinner(color: pq.onAccent, size: 22)
                        : null,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ]),
        ),
      ]),
    );
  }
}

/// Уголки рамки кадра 40×40 (линия 4, скругление 20) и место для печати.
class _FrameMarks extends StatelessWidget {
  const _FrameMarks();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Positioned.fill(child: CustomPaint(painter: _CornersPainter())),
      Positioned(
        left: 24,
        right: 24,
        bottom: 26,
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _line(90),
            const SizedBox(height: 6),
            _line(60),
          ]),
          const Spacer(),
          SizedBox.square(
            dimension: 56,
            child: CustomPaint(
              painter: const _DashedCircle(Color(0xB3FFFFFF)),
              child: const Center(
                child: PqIcon(PqIcons.stamp, size: 24, color: Color(0xD9FFFFFF)),
              ),
            ),
          ),
        ]),
      ),
    ]);
  }

  static Widget _line(double w) => Container(
        width: w,
        height: 6,
        decoration: BoxDecoration(
          color: const Color(0x59FFFFFF),
          borderRadius: BorderRadius.circular(3),
        ),
      );
}

/// Иллюстрация листа бланка под рамкой (повёрнут на −2°).
class _PaperPreview extends StatelessWidget {
  const _PaperPreview();

  static const _widths = [.6, .4, .8, .7, .9, .5, .75, .65, .85, .45];

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -2 * math.pi / 180,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF3F1EA), Color(0xFFE6E2D6)],
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x80000000), offset: Offset(0, 20), blurRadius: 40),
          ],
        ),
        child: LayoutBuilder(builder: (context, box) {
          // Строки по 6 px с шагом 16 — сколько помещается в лист.
          final n = math.max(0, math.min(_widths.length, ((box.maxHeight + 10) / 16).floor()));
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (var i = 0; i < n; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              FractionallySizedBox(
                widthFactor: _widths[i],
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB9B4A6),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ]);
        }),
      ),
    );
  }
}

/// Затемнение вокруг рамки (`box-shadow: 0 0 0 999px rgba(0,0,0,.55)`).
class _ScrimHole extends CustomPainter {
  const _ScrimHole(this.frame, this.color);

  final Rect frame;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Offset.zero & size)
      ..addRRect(RRect.fromRectAndRadius(frame, const Radius.circular(20)));
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_ScrimHole old) => old.frame != frame || old.color != color;
}

class _CornersPainter extends CustomPainter {
  const _CornersPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    const l = 40.0;
    const r = 20.0;
    const h = 2.0; // половина линии: рамка рисуется внутри
    final w = size.width;
    final ht = size.height;
    // левый верхний
    canvas.drawPath(
        Path()
          ..moveTo(h, l)
          ..lineTo(h, r)
          ..arcToPoint(const Offset(r, h), radius: const Radius.circular(r - h))
          ..lineTo(l, h),
        p);
    // правый верхний
    canvas.drawPath(
        Path()
          ..moveTo(w - l, h)
          ..lineTo(w - r, h)
          ..arcToPoint(Offset(w - h, r), radius: const Radius.circular(r - h))
          ..lineTo(w - h, l),
        p);
    // левый нижний
    canvas.drawPath(
        Path()
          ..moveTo(l, ht - h)
          ..lineTo(r, ht - h)
          ..arcToPoint(Offset(h, ht - r), radius: const Radius.circular(r - h))
          ..lineTo(h, ht - l),
        p);
    // правый нижний
    canvas.drawPath(
        Path()
          ..moveTo(w - h, ht - l)
          ..lineTo(w - h, ht - r)
          ..arcToPoint(Offset(w - r, ht - h), radius: const Radius.circular(r - h))
          ..lineTo(w - l, ht - h),
        p);
  }

  @override
  bool shouldRepaint(_CornersPainter old) => false;
}

class _DashedCircle extends CustomPainter {
  const _DashedCircle(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final rect = (Offset.zero & size).deflate(1);
    const dashes = 22;
    const sweep = 2 * math.pi / dashes;
    for (var i = 0; i < dashes; i++) {
      canvas.drawArc(rect, i * sweep, sweep * .55, false, p);
    }
  }

  @override
  bool shouldRepaint(_DashedCircle old) => old.color != color;
}

/// Лист «Данные врача»: четыре необязательных поля, «Отправить» / «Пропустить».
class _DoctorInfoForm extends StatefulWidget {
  const _DoctorInfoForm();

  @override
  State<_DoctorInfoForm> createState() => _DoctorInfoFormState();
}

class _DoctorInfoFormState extends State<_DoctorInfoForm> {
  final _name = TextEditingController();
  final _workplace = TextEditingController();
  final _city = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _workplace.dispose();
    _city.dispose();
    _phone.dispose();
    super.dispose();
  }

  static String? _v(TextEditingController c) {
    final t = c.text.trim();
    return t.isEmpty ? null : t;
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.recipesDoctorInfoTitle, style: PqText.sheetTitle(c: pq.text)),
        const SizedBox(height: 16),
        PqTextField(
          controller: _name,
          label: l10n.recipesDoctorName,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(height: 12),
        PqTextField(
          controller: _workplace,
          label: l10n.recipesDoctorWorkplace,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 12),
        PqTextField(
          controller: _city,
          label: l10n.recipesDoctorCity,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(height: 12),
        PqTextField(
          controller: _phone,
          label: l10n.recipesDoctorPhone,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 24),
        PqButton(
          label: l10n.recipesSend,
          onPressed: () => Navigator.of(context).pop(DoctorRecipeInfo(
            name: _v(_name),
            workplace: _v(_workplace),
            city: _v(_city),
            phone: _v(_phone),
          )),
        ),
        const SizedBox(height: 8),
        PqButton(
          label: l10n.recipesSkip,
          kind: PqButtonKind.text,
          onPressed: () => Navigator.of(context).pop(const DoctorRecipeInfo()),
        ),
      ],
    );
  }
}

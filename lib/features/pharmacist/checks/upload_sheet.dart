import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/uploads/upload_queue.dart';
import '../../../widgets/local_photo.dart';
import 'camera_access.dart';
import 'check_ui.dart';

/// Максимум фото в одном чеке (макет Upload: «Фото: 3 из 3»).
const kChecksMaxPhotos = 3;

/// Открывает лист «Новый чек» (макеты UploadPick → UploadPhotos → UploadDone).
/// Фото уходят в [uploadQueueProvider] — очередь сама догрузит их при сети.
Future<void> showCheckUploadSheet(
  BuildContext context, {
  @visibleForTesting List<XFile> initialPhotos = const [],
}) =>
    showPqSheet<void>(
      context,
      // Макет Upload: поля 10/20/28, рамка сверху, выезд .38s и
      // затемнение rgba(5,6,10,.62) в обеих темах.
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
      bordered: true,
      duration: const Duration(milliseconds: 380),
      scrim: const Color(0x9E05060A),
      builder: (_) => CheckUploadSheet(initialPhotos: initialPhotos),
    );

enum _Step { pick, photos, done }

class _Picked {
  _Picked(this.id, this.file, this.delay);
  final int id;
  final XFile file;

  /// Задержка «обработки» миниатюры: фото из одной пачки идут по очереди.
  final Duration delay;
}

/// Содержимое листа «Новый чек» (высота 480 в макете).
class CheckUploadSheet extends ConsumerStatefulWidget {
  const CheckUploadSheet({super.key, this.initialPhotos = const []});

  /// Уже выбранные фото (визуальные тесты шага «Фото»).
  @visibleForTesting
  final List<XFile> initialPhotos;

  @override
  ConsumerState<CheckUploadSheet> createState() => _CheckUploadSheetState();
}

class _CheckUploadSheetState extends ConsumerState<CheckUploadSheet> {
  final _picker = ImagePicker();
  final List<_Picked> _photos = [];
  _Step _step = _Step.pick;
  int _seq = 0;

  @override
  void initState() {
    super.initState();
    _put(widget.initialPhotos);
  }

  bool _busy = false;

  int get _left => kChecksMaxPhotos - _photos.length;

  void _add(List<XFile> files) {
    if (files.isEmpty || !mounted) return;
    setState(() => _put(files));
  }

  void _put(List<XFile> files) {
    final take = files.take(_left).toList();
    for (var i = 0; i < take.length; i++) {
      _photos.add(_Picked(++_seq, take[i], Duration(milliseconds: 1400 * i)));
    }
    if (_photos.isNotEmpty) _step = _Step.photos;
  }

  Future<void> _camera() async {
    if (_left <= 0) return;
    if (!await CameraPrimerFlag.shown()) {
      if (!mounted) return;
      final allow = await context.push<bool>(kChecksCameraPrimerPath);
      await CameraPrimerFlag.markShown();
      if (allow != true || !mounted) return;
    }
    try {
      final x = await _picker.pickImage(source: ImageSource.camera);
      if (x != null) _add([x]);
    } on PlatformException catch (e) {
      if (!e.code.contains('access_denied') || !mounted) return;
      final r = await context.push<String>(kChecksCameraDeniedPath);
      if (r == kChecksPickGallery) await _gallery();
    }
  }

  Future<void> _gallery() async {
    final left = _left;
    if (left <= 0) return;
    try {
      if (left == 1) {
        final x = await _picker.pickImage(source: ImageSource.gallery);
        if (x != null) _add([x]);
      } else {
        _add(await _picker.pickMultiImage(limit: left));
      }
    } on PlatformException catch (_) {
      // Пользователь закрыл выбор или нет доступа — ничего не делаем.
    }
  }

  void _remove(_Picked p) => setState(() {
    _photos.remove(p);
    if (_photos.isEmpty) _step = _Step.pick;
  });

  Future<void> _send() async {
    if (_photos.isEmpty || _busy) return;
    setState(() => _busy = true);
    final failed = context.l10n.checksSendFailed;
    try {
      await ref.read(uploadQueueProvider.notifier).enqueueCheck([
        for (final p in _photos) p.file,
      ]);
      if (mounted) setState(() => _step = _Step.done);
    } catch (_) {
      if (mounted) showPqToast(context, failed, tone: PqTone.danger);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _reset() => setState(() {
    _photos.clear();
    _step = _Step.pick;
  });

  @override
  Widget build(BuildContext context) {
    // 480 в макете минус поля листа (10 + ручка 5 + 16 + 28).
    // Шаги выбора и фото появляются pqUp .3s; «Готово» анимирует части сам.
    return SizedBox(
      height: 421,
      child:
          _step == _Step.done
              ? KeyedSubtree(
                key: const ValueKey(_Step.done),
                child: _done(context),
              )
              : PqAnimate(
                key: ValueKey(_step),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child:
                    _step == _Step.pick ? _pick(context) : _photosView(context),
              ),
    );
  }

  /// Шаг листа: верх прокручивается (длинные переводы не ломают вёрстку),
  /// кнопки прижаты к низу (`margin-top: auto` в макете).
  Widget _layout(List<Widget> top, List<Widget> bottom) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: top,
          ),
        ),
      ),
      const SizedBox(height: 16),
      ...bottom,
    ],
  );

  Widget _header(BuildContext context, String subtitle) {
    final pq = context.pq;
    final l = context.l10n;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                header: true,
                child: Text(
                  l.checksNewCheckTitle,
                  style: PqText.emptyTitle(c: pq.text),
                ),
              ),
              const SizedBox(height: 2),
              Text(subtitle, style: PqText.body(c: pq.textMuted)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        PqIconButton(
          icon: PqIcons.x,
          iconSize: 18,
          background: pq.surfaceAlt,
          label: l.checksClose,
          onTap: () => Navigator.of(context).maybePop(),
        ),
      ],
    );
  }

  Widget _pick(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    Widget corner(Alignment a) {
      final top = a.y < 0;
      final left = a.x < 0;
      final side = BorderSide(color: pq.accentText, width: 3);
      return Positioned(
        top: top ? 14 : null,
        bottom: top ? null : 14,
        left: left ? 14 : null,
        right: left ? null : 14,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            border: Border(
              top: top ? side : BorderSide.none,
              bottom: top ? BorderSide.none : side,
              left: left ? side : BorderSide.none,
              right: left ? BorderSide.none : side,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(top && left ? 10 : 0),
              topRight: Radius.circular(top && !left ? 10 : 0),
              bottomLeft: Radius.circular(!top && left ? 10 : 0),
              bottomRight: Radius.circular(!top && !left ? 10 : 0),
            ),
          ),
        ),
      );
    }

    Widget tip(String text) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PqIcon(PqIcons.check, size: 16, color: pq.success),
        const SizedBox(width: 8),
        Text(text, style: PqText.body(c: pq.textSecondary)),
      ],
    );

    return _layout(
      [
        _header(context, l.checksPickSubtitle),
        const SizedBox(height: 16),
        Container(
          height: 168,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: pq.surfaceAlt,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              corner(Alignment.topLeft),
              corner(Alignment.topRight),
              corner(Alignment.bottomLeft),
              corner(Alignment.bottomRight),
              const ReceiptPaper(width: 78, height: 112),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 6,
          children: [
            tip(l.checksTipWhole),
            tip(l.checksTipFlat),
            tip(l.checksTipGlare),
          ],
        ),
      ],
      [
        PqButton(
          label: l.checksTakePhotoCta,
          icon: PqIcons.camera,
          iconGap: 12,
          onPressed: _camera,
        ),
        const SizedBox(height: 8),
        PqButton(
          label: l.checksPickGallery,
          icon: PqIcons.image,
          kind: PqButtonKind.secondary,
          height: 52,
          fontWeight: FontWeight.w600,
          iconGap: 12,
          onPressed: _gallery,
        ),
      ],
    );
  }

  Widget _photosView(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return _layout(
      [
        _header(context, l.checksPhotosOf(_photos.length, kChecksMaxPhotos)),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, box) {
            final w = (box.maxWidth - 24) / 3;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (var i = 0; i < _photos.length; i++)
                  SizedBox(
                    key: ValueKey(_photos[i].id),
                    width: w,
                    child: _Thumb(
                      photo: _photos[i],
                      rotation: const [-3.0, 2.0, -1.0][i % 3],
                      onRemove: () => _remove(_photos[i]),
                    ),
                  ),
                if (_left > 0)
                  SizedBox(width: w, child: _AddMore(onTap: _gallery)),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: pq.surfaceAlt,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              PqIcon(PqIcons.sparkle, size: 18, color: pq.accentText),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l.checksPhotosHint,
                  style: PqText.body(c: pq.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ],
      [
        PqButton(
          label: l.checksSubmitForReview,
          loading: _busy,
          loadingLabel: l.checksSending,
          onPressed: _send,
        ),
      ],
    );
  }

  Widget _done(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    const up = Duration(milliseconds: 400);
    return _layout(
      [
        const SizedBox(height: 8),
        Center(
          child: PqAnimate(
            fx: PqFx.pop,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: pq.successSoft,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: PqIcon(PqIcons.check, size: 38, color: pq.success),
            ),
          ),
        ),
        const SizedBox(height: 12),
        PqAnimate(
          duration: up,
          curve: Curves.easeOut,
          delay: const Duration(milliseconds: 150),
          child: Column(
            children: [
              Semantics(
                liveRegion: true,
                header: true,
                child: Text(
                  l.checksSentTitle,
                  textAlign: TextAlign.center,
                  style: PqText.emptyTitle(c: pq.text),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l.checksSentText,
                textAlign: TextAlign.center,
                style: PqText.text(
                  15,
                  FontWeight.w400,
                  height: 1.45,
                  c: pq.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        PqAnimate(
          duration: up,
          curve: Curves.easeOut,
          delay: const Duration(milliseconds: 250),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: pq.surfaceAlt,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const CheckSteps(
              stage: CheckStage.review,
              gap: 8,
              animate: false,
            ),
          ),
        ),
      ],
      [
        PqAnimate(
          duration: up,
          curve: Curves.easeOut,
          delay: const Duration(milliseconds: 350),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PqButton(
                label: l.checksDone,
                onPressed: () => Navigator.of(context).maybePop(),
              ),
              const SizedBox(height: 8),
              PqButton(
                label: l.checksSendAnother,
                kind: PqButtonKind.text,
                height: 52,
                fontWeight: FontWeight.w600,
                onPressed: _reset,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Миниатюра фото (pqThumb): лист с фото под наклоном, полоса «обработки»
/// (pqLoad 1.2s), затем галочка (pqIn). Фото из одной пачки ждут очереди.
class _Thumb extends StatelessWidget {
  const _Thumb({
    required this.photo,
    required this.rotation,
    required this.onRemove,
  });

  final _Picked photo;
  final double rotation;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final base = photo.delay;
    Duration at(int ms) => base + Duration(milliseconds: ms);
    return PqAnimate(
      fx: PqFx.thumb,
      child: SizedBox(
        height: 128,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: pq.surfaceAlt,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: ReceiptPaper(
                  width: 64,
                  height: 88,
                  rotation: rotation,
                  photo: localPhoto(photo.file.path, width: 64, height: 88),
                ),
              ),
            ),
            // Полоса «обработки»: наливается и исчезает.
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: PqAnimate(
                fx: PqFx.gone,
                delay: at(1400),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0x40000000),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: PqAnimate(
                    fx: PqFx.fillX,
                    delay: at(200),
                    duration: const Duration(milliseconds: 1200),
                    curve: const Cubic(.4, .1, .3, 1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pq.accent,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 6,
              bottom: 6,
              child: PqAnimate(
                fx: PqFx.zoomIn,
                delay: at(1450),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: pq.success,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: PqIcon(PqIcons.check, size: 14, color: pq.bg),
                ),
              ),
            ),
            // «Ждёт» — пока до фото не дошла очередь.
            if (base > Duration.zero)
              Positioned.fill(
                child: IgnorePointer(
                  child: PqAnimate(
                    fx: PqFx.gone,
                    delay: base,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x59000000),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        l.checksPhotoWaiting,
                        style: PqText.tag(c: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              top: -16,
              right: -16,
              child: PqPressable(
                onTap: onRemove,
                semanticLabel: l.checksRemovePhoto,
                scale: .94,
                child: SizedBox.square(
                  dimension: 44,
                  child: Center(
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: pq.surfaceAlt,
                        shape: BoxShape.circle,
                        border: Border.all(color: pq.surface, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: PqIcon(PqIcons.x, size: 13, color: pq.text),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Плитка «Ещё фото»: пунктир 2px, плюс 22.
class _AddMore extends StatelessWidget {
  const _AddMore({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqPressable(
      onTap: onTap,
      semanticLabel: l.checksAddMoreA11y,
      child: CustomPaint(
        painter: _DashedRRect(pq.borderStrong),
        child: SizedBox(
          height: 128,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PqIcon(PqIcons.plus, size: 22, color: pq.textMuted),
              const SizedBox(height: 8),
              Text(l.checksAddMore, style: PqText.link(c: pq.textMuted)),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedRRect extends CustomPainter {
  _DashedRRect(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;
    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            const Offset(1, 1) & Size(size.width - 2, size.height - 2),
            const Radius.circular(16),
          ),
        );
    for (final m in path.computeMetrics()) {
      for (double d = 0; d < m.length; d += 10) {
        canvas.drawPath(m.extractPath(d, math.min(d + 6, m.length)), p);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRect old) => old.color != color;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';

/// Полноэкранный просмотр фото (чек/рецепт) — макет PhotoViewer:
/// чёрный фон, сверху «Закрыть · заголовок / Фото N из M · Сохранить»,
/// масштаб в процентах при зуме, снизу подсказка и точки страниц.
///
/// [title] — заголовок над счётчиком («Чек №23156»), необязателен.
void showPhotoLightbox(
  BuildContext context,
  List<String> urls, {
  int initialIndex = 0,
  String? title,
}) {
  if (urls.isEmpty) return;
  showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    barrierColor: Colors.black,
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (_, a, __, child) => FadeTransition(
      opacity: CurvedAnimation(parent: a, curve: Curves.easeOut),
      child: child,
    ),
    pageBuilder: (_, __, ___) => _PhotoLightbox(
      urls: urls,
      initialIndex: initialIndex.clamp(0, urls.length - 1),
      title: title,
    ),
  );
}

class _PhotoLightbox extends StatefulWidget {
  const _PhotoLightbox({required this.urls, required this.initialIndex, this.title});

  final List<String> urls;
  final int initialIndex;
  final String? title;

  @override
  State<_PhotoLightbox> createState() => _PhotoLightboxState();
}

class _PhotoLightboxState extends State<_PhotoLightbox> {
  late final PageController _pc = PageController(initialPage: widget.initialIndex);
  late int _i = widget.initialIndex;
  late final List<TransformationController> _zoom = [
    for (final _ in widget.urls) TransformationController()..addListener(_onZoom),
  ];
  double _scale = 1;

  void _onZoom() {
    final s = _zoom[_i].value.getMaxScaleOnAxis();
    if ((s - _scale).abs() > .005) setState(() => _scale = s);
  }

  @override
  void dispose() {
    _pc.dispose();
    for (final z in _zoom) {
      z.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    // Отдельного плагина сохранения в галерею нет — открываем оригинал
    // в системном браузере/просмотрщике, откуда его можно сохранить.
    try {
      await launchUrl(Uri.parse(widget.urls[_i]), mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final pad = MediaQuery.paddingOf(context);
    final n = widget.urls.length;
    const white = Colors.white;
    const glass = Color(0x24FFFFFF);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        color: Colors.black,
        child: Stack(children: [
          PageView.builder(
            controller: _pc,
            itemCount: n,
            physics: _scale > 1.01 ? const NeverScrollableScrollPhysics() : null,
            onPageChanged: (v) => setState(() {
              _zoom[_i].value = Matrix4.identity();
              _i = v;
              _scale = 1;
            }),
            itemBuilder: (_, idx) => InteractiveViewer(
              transformationController: _zoom[idx],
              minScale: 1,
              maxScale: 5,
              child: Center(
                child: Image.network(
                  widget.urls[idx],
                  fit: BoxFit.contain,
                  frameBuilder: (_, child, frame, sync) => sync
                      ? child
                      : AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: child,
                        ),
                  loadingBuilder: (_, child, prog) => prog == null
                      ? child
                      : const Center(
                          child: PqSpinner(color: white, trackColor: Color(0x33FFFFFF), size: 28),
                        ),
                  errorBuilder: (_, __, ___) =>
                      const Center(child: PqIcon(PqIcons.image, size: 48, color: Color(0x80FFFFFF))),
                ),
              ),
            ),
          ),
          // Затемнение сверху и снизу.
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 110,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xCC000000), Color(0x00000000)],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                height: 150 + pad.bottom,
                padding: EdgeInsets.only(bottom: 34 + pad.bottom * .5),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xD9000000), Color(0x00000000)],
                  ),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(l.checksViewerZoomHint,
                      textAlign: TextAlign.center,
                      style: PqText.body(c: const Color(0xCCFFFFFF))),
                  if (n > 1) ...[
                    const SizedBox(height: 14),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      for (var k = 0; k < n; k++) ...[
                        if (k > 0) const SizedBox(width: 6),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: PqMotion.ease,
                          width: k == _i ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: k == _i ? white : const Color(0x66FFFFFF),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ]),
                  ],
                ]),
              ),
            ),
          ),
          // Верхняя панель: закрыть · заголовок · сохранить.
          Positioned(
            left: 12,
            right: 12,
            top: pad.top + 16,
            child: Row(children: [
              PqIconButton(
                icon: PqIcons.x,
                iconSize: 22,
                background: glass,
                color: white,
                label: l.checksClose,
                onTap: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  if (widget.title != null)
                    Text(widget.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.heading(16, FontWeight.w700, c: white)),
                  Text(l.checksViewerPhotoOf(_i + 1, n),
                      style: PqText.caption(c: const Color(0xBFFFFFFF))),
                ]),
              ),
              const SizedBox(width: 8),
              PqIconButton(
                icon: PqIcons.download,
                background: glass,
                color: white,
                label: l.checksViewerSave,
                onTap: _save,
              ),
            ]),
          ),
          // Масштаб «120%» — только при зуме.
          Positioned(
            right: 16,
            top: pad.top + 84,
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: _scale > 1.01 ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x29FFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('${(_scale * 100).round()}%', style: PqText.tag(c: white)),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

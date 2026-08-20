import 'package:flutter/material.dart';

/// Полноэкранный просмотр фото (чек/рецепт) с зумом (пинч) и листанием.
void showPhotoLightbox(BuildContext context, List<String> urls, {int initialIndex = 0}) {
  if (urls.isEmpty) return;
  showDialog<void>(
    context: context,
    barrierColor: Colors.black,
    useSafeArea: false,
    builder: (_) => _PhotoLightbox(urls: urls, initialIndex: initialIndex),
  );
}

class _PhotoLightbox extends StatefulWidget {
  const _PhotoLightbox({required this.urls, required this.initialIndex});
  final List<String> urls;
  final int initialIndex;

  @override
  State<_PhotoLightbox> createState() => _PhotoLightboxState();
}

class _PhotoLightboxState extends State<_PhotoLightbox> {
  late final PageController _pc = PageController(initialPage: widget.initialIndex);
  late int _i = widget.initialIndex;

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final many = widget.urls.length > 1;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          // фон + закрытие по тапу
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const ColoredBox(color: Colors.black),
            ),
          ),
          PageView.builder(
            controller: _pc,
            itemCount: widget.urls.length,
            onPageChanged: (v) => setState(() => _i = v),
            itemBuilder: (_, idx) => InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Center(
                child: Image.network(
                  widget.urls[idx],
                  fit: BoxFit.contain,
                  loadingBuilder: (_, child, prog) => prog == null
                      ? child
                      : const Center(child: CircularProgressIndicator(color: Colors.white)),
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(Icons.broken_image_outlined, color: Colors.white54, size: 48),
                  ),
                ),
              ),
            ),
          ),
          // счётчик
          if (many)
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Text('${_i + 1} / ${widget.urls.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
          // кнопка закрытия
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 12,
            child: Material(
              color: const Color(0x33FFFFFF),
              shape: const CircleBorder(),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import 'video_source.dart';

/// Плеер урока на вебе. webview_flutter веб не поддерживает, но там он и не
/// нужен: тот же embed-плеер отлично живёт в обычном iframe.
/// Прямые видеофайлы отдаём через srcdoc — это та же HTML-обёртка с запретом
/// перемотки вперёд, что и на мобильных.
class VideoFrame extends StatelessWidget {
  const VideoFrame({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return HtmlElementView.fromTagName(
      tagName: 'iframe',
      onElementCreated: (element) {
        final iframe = element as web.HTMLIFrameElement;
        iframe
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allow = 'autoplay; fullscreen; picture-in-picture'
          ..allowFullscreen = true;
        if (isEmbeddable(url)) {
          iframe.src = embedUrl(url);
        } else {
          iframe.srcdoc = noSeekHtml(url).toJS;
        }
      },
    );
  }
}

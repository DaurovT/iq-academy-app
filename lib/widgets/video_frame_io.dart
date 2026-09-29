import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'video_source.dart';

/// Плеер урока на мобильных — WebView с embed-плеером или нашей HTML-обёрткой.
class VideoFrame extends StatefulWidget {
  const VideoFrame({super.key, required this.url});

  final String url;

  @override
  State<VideoFrame> createState() => _VideoFrameState();
}

class _VideoFrameState extends State<VideoFrame> {
  late final WebViewController _ctrl = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0xFF0B0F1A));

  @override
  void initState() {
    super.initState();
    if (isEmbeddable(widget.url)) {
      _ctrl.loadRequest(Uri.parse(embedUrl(widget.url)));
    } else {
      // прямой файл — свой плеер с запретом перемотки вперёд
      _ctrl.loadHtmlString(noSeekHtml(widget.url));
    }
  }

  @override
  Widget build(BuildContext context) => WebViewWidget(controller: _ctrl);
}

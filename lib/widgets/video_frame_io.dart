import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'video_source.dart';

/// Плеер урока на мобильных — WebView с embed-плеером или нашей HTML-обёрткой.
class VideoFrame extends StatefulWidget {
  const VideoFrame({super.key, required this.url, this.onProgress});

  final String url;

  /// Позиция и длительность видео в секундах, `ended` — досмотрено до конца.
  /// Приходит примерно раз в секунду, пока видео играет (JS-канал к `<video>`
  /// на странице плеера — у Vimeo, YouTube и нашей HTML-обёртки он есть).
  final VideoProgressCallback? onProgress;

  @override
  State<VideoFrame> createState() => _VideoFrameState();
}

/// Последний созданный контроллер — для проверки воспроизведения в
/// integration_test/video_play_test.dart.
@visibleForTesting
WebViewController? debugLastVideoController;

class _VideoFrameState extends State<VideoFrame> {
  late final WebViewController _ctrl = _createController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0xFF0B0F1A))
    ..addJavaScriptChannel('PqVideo', onMessageReceived: _onMessage)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (_) => _ctrl.runJavaScript(videoProgressJs),
      ),
    );

  void _onMessage(JavaScriptMessage m) {
    final cb = widget.onProgress;
    if (cb == null || !mounted) return;
    try {
      final d = jsonDecode(m.message) as Map<String, dynamic>;
      cb(
        (d['t'] as num).toDouble(),
        (d['d'] as num).toDouble(),
        d['e'] == 1,
      );
    } catch (_) {}
  }

  /// Без этих настроек WebView не даёт плееру играть: iOS по умолчанию
  /// открывает видео только на весь экран и ждёт нажатия, Android требует
  /// жест пользователя для звука — видео «грузится и не играет».
  static WebViewController _createController() {
    final PlatformWebViewControllerCreationParams params =
        WebViewPlatform.instance is WebKitWebViewPlatform
            ? WebKitWebViewControllerCreationParams(
                allowsInlineMediaPlayback: true,
                mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
              )
            : const PlatformWebViewControllerCreationParams();
    final ctrl = WebViewController.fromPlatformCreationParams(params);
    final platform = ctrl.platform;
    if (platform is AndroidWebViewController) {
      platform.setMediaPlaybackRequiresUserGesture(false);
    }
    return ctrl;
  }

  @override
  void initState() {
    super.initState();
    debugLastVideoController = _ctrl;
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

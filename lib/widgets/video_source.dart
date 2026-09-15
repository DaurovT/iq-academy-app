/// Разбор ссылки на видео урока — общий для мобильного WebView и веб-iframe.
library;

/// Приводит ссылку к встраиваемому виду (Vimeo/YouTube → embed-плеер).
String embedUrl(String url) {
  final vimeo = RegExp(r'vimeo\.com/(?:video/)?(\d+)').firstMatch(url);
  if (vimeo != null) {
    // приватный хеш (`?h=...`) обязателен для видео с ограниченным доступом —
    // без него Vimeo отвечает «Because of its privacy settings...»
    final h = RegExp(r'[?&]h=([0-9a-zA-Z]+)').firstMatch(url)?.group(1);
    final hash = h != null ? '&h=$h' : '';
    return 'https://player.vimeo.com/video/${vimeo.group(1)}'
        '?autoplay=1&title=0&byline=0$hash';
  }
  final yt = RegExp(r'(?:youtu\.be/|youtube\.com/watch\?v=)([\w-]+)')
      .firstMatch(url);
  if (yt != null) {
    return 'https://www.youtube.com/embed/${yt.group(1)}?autoplay=1&playsinline=1';
  }
  return url;
}

/// true, если ссылка ведёт на Vimeo/YouTube (там играем их embed-плеером).
bool isEmbeddable(String url) =>
    RegExp(r'vimeo\.com|youtu\.be/|youtube\.com').hasMatch(url);

/// HTML-обёртка для прямых видеофайлов: стандартные контролы, но перемотка
/// вперёд заблокирована — можно мотать только в пределах уже просмотренного.
String noSeekHtml(String url) => '''
<!DOCTYPE html><html><head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<style>html,body{margin:0;padding:0;background:#0B0F1A;height:100%;overflow:hidden}
video{width:100%;height:100%;object-fit:contain;background:#0B0F1A}</style></head>
<body>
<video src="$url" controls autoplay playsinline
  controlsList="nodownload noplaybackrate"></video>
<script>
  var v = document.querySelector('video');
  var watched = 0; // максимальная просмотренная позиция
  v.addEventListener('timeupdate', function () {
    if (!v.seeking) watched = Math.max(watched, v.currentTime);
  });
  v.addEventListener('seeking', function () {
    // вперёд дальше просмотренного нельзя; назад — можно
    if (v.currentTime > watched + 0.5) v.currentTime = watched;
  });
</script>
</body></html>
''';

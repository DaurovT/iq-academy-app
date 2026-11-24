import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/widgets/video_source.dart';

/// Ключ закрытого видео Vimeo должен попадать в ссылку плеера в любом виде
/// (жалоба 25.11.2026: «Доритрицин» — «Because of its privacy settings…»).
void main() {
  const player = 'https://player.vimeo.com/video/928873498';

  test('ключ сегментом пути', () {
    expect(embedUrl('https://vimeo.com/928873498/f468bbcba0'),
        allOf(startsWith(player), contains('&h=f468bbcba0')));
  });

  test('ключ параметром h', () {
    expect(embedUrl('https://vimeo.com/928873498?h=f468bbcba0'), contains('&h=f468bbcba0'));
    expect(embedUrl('https://player.vimeo.com/video/928873498?h=f468bbcba0&badge=0'),
        contains('&h=f468bbcba0'));
  });

  test('открытое видео — без ключа, с автозапуском и playsinline', () {
    final u = embedUrl('https://vimeo.com/896838487');
    expect(u, startsWith('https://player.vimeo.com/video/896838487?autoplay=1&playsinline=1'));
    expect(u, isNot(contains('&h=')));
  });
}

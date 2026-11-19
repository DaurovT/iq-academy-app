// Видео урока должно само запускаться в плеере приложения (жалоба 13.11.2026:
// «грузится и не играет»). Запуск на симуляторе или устройстве:
//   flutter test integration_test/video_play_test.dart -d <device>
// Пакет integration_test в pubspec не держим — иначе его модуль попадает в
// сборку для магазинов. Перед запуском добавьте в dev_dependencies:
//   integration_test:
//     sdk: flutter
// и не коммитьте это изменение.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:platform_app/widgets/video_frame_io.dart';

/// Публичное видео урока «Тонзилгон Н» (библиотека LMS, id 65).
const _url = 'https://vimeo.com/896838487';

const _probe = '''
(function () {
  var v = document.querySelector('video');
  if (!v) return JSON.stringify({video: false, url: location.href,
    title: document.title, ready: document.readyState,
    text: (document.body ? document.body.innerText : '').slice(0, 160),
    ua: navigator.userAgent});
  return JSON.stringify({video: true, paused: v.paused, time: v.currentTime,
    ready: v.readyState, muted: v.muted});
})()
''';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('видео урока Vimeo запускается само', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SizedBox(width: 390, height: 220, child: VideoFrame(url: _url)),
      ),
    ));
    Map<String, dynamic> state = {};
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(seconds: 1));
      await Future<void>.delayed(const Duration(seconds: 1));
      final raw = await debugLastVideoController!.runJavaScriptReturningResult(_probe);
      var text = raw.toString();
      if (text.startsWith('"')) text = jsonDecode(text) as String;
      state = jsonDecode(text) as Map<String, dynamic>;
      // ignore: avoid_print
      print('t+${i * 2}s $state');
      if (state['video'] == true &&
          state['paused'] == false &&
          (state['time'] as num) > 1) {
        break;
      }
    }
    expect(state['video'], isTrue, reason: 'плеер Vimeo не загрузился');
    expect(state['paused'], isFalse, reason: 'видео не запустилось');
    expect(state['time'] as num, greaterThan(1), reason: 'видео не идёт');
  }, timeout: const Timeout(Duration(minutes: 3)));

  // Экран курса засчитывает видео, когда плеер сообщил «досмотрено»
  // (макеты CoursePlay1–3): JS-канал PqVideo должен присылать прогресс.
  testWidgets('плеер сообщает прогресс и конец видео', (tester) async {
    var pos = 0.0, dur = 0.0;
    var ended = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 390,
          height: 220,
          child: VideoFrame(
            url: _url,
            onProgress: (p, d, e) {
              pos = p;
              dur = d;
              ended = ended || e;
            },
          ),
        ),
      ),
    ));
    for (var i = 0; i < 40 && pos < 2; i++) {
      await tester.pump(const Duration(seconds: 1));
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    // ignore: avoid_print
    print('прогресс: $pos из $dur');
    expect(dur, greaterThan(0), reason: 'длительность не пришла');
    expect(pos, greaterThan(1), reason: 'прогресс не приходит');

    // перематываем к концу — должно прийти «досмотрено»
    await debugLastVideoController!.runJavaScript(
        "var v=document.querySelector('video'); v.currentTime=v.duration-1.5; v.play();");
    for (var i = 0; i < 20 && !ended; i++) {
      await tester.pump(const Duration(seconds: 1));
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    // ignore: avoid_print
    print('конец: $ended, позиция $pos из $dur');
    expect(ended, isTrue, reason: 'событие конца видео не пришло');
  }, timeout: const Timeout(Duration(minutes: 3)));
}

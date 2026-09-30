// Визуальная сверка обучающего тура с макетами Tour*.dc.html / DocTour*.dc.html.
//   PQ_SHOTS_DIR=… flutter test --no-pub test/visual/tour_visual_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/features/doctor/home_screen.dart';
import 'package:platform_app/features/pharmacist/home_screen.dart';
import 'package:platform_app/features/tour/tour_controller.dart';
import 'package:platform_app/features/tour/tour_overlay.dart';

import 'fixtures/doctor_fixtures.dart';
import 'fixtures/home_fixtures.dart';
import 'pq_shot.dart';

/// Как в AppShell: экран + нижнее меню с якорями вкладок + оверлей тура.
Widget _shell(Widget home, List<PqNavItem> nav) {
  const targets = {1: TourTarget.tabChecks, 3: TourTarget.tabLearn, 4: TourTarget.tabProfile};
  return Stack(children: [
    Scaffold(
      extendBody: true,
      body: home,
      bottomNavigationBar: PqBottomNav(
        items: nav,
        selected: 0,
        onSelect: (_) {},
        wrapItem: (i, item) => targets[i] == null
            ? item
            : TourAnchor(target: targets[i]!, radius: 16, child: item),
      ),
    ),
    const Positioned.fill(child: TourOverlay()),
  ]);
}

/// Шаг макета N (1 — приветствие, 2–7 — подсветка, 8 — «Готово»).
Future<void> _goTo(WidgetTester t, int board) async {
  // Главная загрузилась и доиграла появление.
  for (var i = 0; i < 15; i++) {
    await t.pump(const Duration(milliseconds: 100));
  }
  final container = ProviderScope.containerOf(t.element(find.byType(TourOverlay)));
  final tour = container.read(tourProvider.notifier);
  tour.start();
  await t.pump();
  for (var k = 1; k < board; k++) {
    tour.next();
    await t.pump();
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 100));
    }
  }
}

void main() {
  for (var board = 1; board <= 8; board++) {
    pqShotBoth('Tour$board', (t, dark) => pqShot(t,
        name: 'Tour$board',
        dark: dark,
        height: 896,
        screen: _shell(const PharmacistHome(), pharmacistNav),
        overrides: homeOverrides(),
        before: (t) => _goTo(t, board),
        settle: const Duration(milliseconds: 1500)));
    pqShotBoth('DocTour$board', (t, dark) => pqShot(t,
        name: 'DocTour$board',
        dark: dark,
        height: 896,
        screen: _shell(const DoctorHome(), doctorNav),
        overrides: doctorOverrides(),
        before: (t) => _goTo(t, board),
        settle: const Duration(milliseconds: 1500)));
  }
}

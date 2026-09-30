// Визуальная сверка раздела «Роль врача» с макетами 1.2.
//   PQ_SHOTS_DIR=… flutter test --no-pub test/visual/doctor_visual_test.dart
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/features/doctor/home_screen.dart';
import 'package:platform_app/features/doctor/recipe_camera_screen.dart';
import 'package:platform_app/features/doctor/recipe_detail_screen.dart';
import 'package:platform_app/features/doctor/recipe_text_screen.dart';
import 'package:platform_app/features/doctor/recipes_screen.dart';

import 'fixtures/doctor_fixtures.dart';
import 'pq_shot.dart';

/// Моноширинный шрифт экрана RxOcr: в тестах системных шрифтов нет,
/// подгружаем SF Mono (им рисует макет — `ui-monospace`) под именем Menlo.
Future<void> _loadMono() async {
  final f = File('/System/Library/Fonts/SFNSMono.ttf');
  if (!f.existsSync()) return;
  final l = FontLoader('Menlo')
    ..addFont(Future.value(ByteData.sublistView(f.readAsBytesSync())));
  await l.load();
}

void main() {
  setUpAll(_loadMono);

  pqShotBoth('DocHome', (t, dark) => pqShot(t,
      name: 'DocHome',
      dark: dark,
      height: 1810,
      screen: const DoctorHome(),
      overrides: doctorOverrides(),
      nav: doctorNav,
      // pqPulse кнопки «Отправить бланк»: 3 × 2s после .8s.
      settle: const Duration(seconds: 8)));

  pqShotBoth('RxList', (t, dark) => pqShot(t,
      name: 'RxList',
      dark: dark,
      height: 960,
      screen: const RecipesScreen(),
      overrides: doctorOverrides(recipes: const [rx4, rx2, rx3List, rx1], unread: 0),
      nav: doctorNav,
      navIndex: 1));

  pqShotBoth('RxEmpty', (t, dark) => pqShot(t,
      name: 'RxEmpty',
      dark: dark,
      screen: const RecipesScreen(),
      overrides: doctorOverrides(recipes: const [], unread: 0),
      nav: doctorNav,
      navIndex: 1));

  for (final (name, id, h) in [
    ('RxPending', 2, 1160.0),
    ('RxApproved', 4, 1520.0),
    ('RxCredited', 1, 1510.0),
    ('RxRejected', 3, 1000.0),
  ]) {
    pqShotBoth(name, (t, dark) => pqShot(t,
        name: name,
        dark: dark,
        height: h,
        screen: RecipeDetailScreen(id: id),
        overrides: doctorOverrides(),
        nav: doctorNav,
        navIndex: 1));
  }

  pqShotBoth('RxCamera', (t, dark) => pqShot(t,
      name: 'RxCamera',
      dark: dark,
      screen: const RecipeCameraScreen(),
      overrides: doctorOverrides()));

  pqShotBoth('RxOcr', (t, dark) => pqShot(t,
      name: 'RxOcr',
      dark: dark,
      screen: const RecipeTextScreen(id: 1),
      overrides: doctorOverrides()));
}

// Стенд визуальной сверки редизайна 1.2: рендерит экран в размере макета
// (414 px, DPR 1) с настоящими шрифтами Onest/Inter и пишет PNG.
// Снимки пишутся, только если задан PQ_SHOTS_DIR:
//   PQ_SHOTS_DIR=/path flutter test --no-pub test/visual
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/core/l10n/l10n.dart';
import 'package:platform_app/core/l10n/locale_controller.dart';
import 'package:platform_app/core/theme/app_theme.dart';

final shotsDir = Platform.environment['PQ_SHOTS_DIR'];

bool _fontsLoaded = false;

/// Загружает шрифты приложения (в тестах по умолчанию — Ahem-квадраты).
Future<void> loadPqFonts() async {
  if (_fontsLoaded) return;
  const files = {
    'Onest': ['Medium', 'SemiBold', 'Bold', 'ExtraBold'],
    'Inter': ['Regular', 'Medium', 'SemiBold', 'Bold', 'ExtraBold'],
  };
  for (final e in files.entries) {
    final loader = FontLoader(e.key);
    for (final w in e.value) {
      loader.addFont(rootBundle.load('assets/fonts/${e.key}-$w.ttf'));
    }
    await loader.load();
  }
  _fontsLoaded = true;
}

/// Нижнее меню фармацевта из макетов (для экранов с меню).
const pharmacistNav = [
  PqNavItem(icon: PqIcons.home, label: 'Главная'),
  PqNavItem(icon: PqIcons.fileText, label: 'Чеки'),
  PqNavItem(icon: PqIcons.target, label: 'Квесты'),
  PqNavItem(icon: PqIcons.bookOpen, label: 'Обучение'),
  PqNavItem(icon: PqIcons.user, label: 'Профиль'),
];
const doctorNav = [
  PqNavItem(icon: PqIcons.home, label: 'Главная'),
  PqNavItem(icon: PqIcons.fileText, label: 'Рецепты'),
  PqNavItem(icon: PqIcons.target, label: 'Квесты'),
  PqNavItem(icon: PqIcons.bookOpen, label: 'Обучение'),
  PqNavItem(icon: PqIcons.user, label: 'Профиль'),
];
const medrepNav = [
  PqNavItem(icon: PqIcons.barChart, label: 'Портфель'),
  PqNavItem(icon: PqIcons.users, label: 'Команда'),
  PqNavItem(icon: PqIcons.target, label: 'Квесты'),
  PqNavItem(icon: PqIcons.award, label: 'Рейтинг'),
  PqNavItem(icon: PqIcons.user, label: 'Профиль'),
];

/// Рендерит [screen] и сохраняет `<name>.png` (тёмная) / `<name>Light.png`.
/// [name] — имя макета (как у .dc.html), [height] — высота артборда.
/// [nav] — нижнее меню (null — экран без меню), [navIndex] — активный пункт.
/// [before] — действия после первой отрисовки (открыть лист, ввести текст).
Future<void> pqShot(
  WidgetTester tester, {
  required String name,
  required Widget screen,
  required bool dark,
  double height = 874,
  List overrides = const [],
  List<PqNavItem>? nav,
  int navIndex = 0,
  List<RouteBase> extraRoutes = const [],
  Future<void> Function(WidgetTester t)? before,
  Duration settle = const Duration(seconds: 4),
}) async {
  await loadPqFonts();
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = Size(414, height);
  addTearDown(tester.view.reset);

  final key = GlobalKey();
  Widget body(BuildContext _) => nav == null
      ? screen
      : Scaffold(
          extendBody: true,
          body: screen,
          bottomNavigationBar:
              PqBottomNav(items: nav, selected: navIndex, onSelect: (_) {}),
        );
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (c, _) => body(c)),
    ...extraRoutes,
  ]);
  await tester.pumpWidget(RepaintBoundary(
    key: key,
    child: ProviderScope(
      overrides: overrides.cast(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: dark ? ThemeMode.dark : ThemeMode.light,
        locale: const Locale('ru'),
        supportedLocales: supportedAppLocales,
        localizationsDelegates: appLocalizationDelegates,
        routerConfig: router,
      ),
    ),
  ));
  await tester.pump();
  if (before != null) await before(tester);
  // Прокручиваем все анимации появления к конечному состоянию.
  for (var i = 0; i < settle.inMilliseconds ~/ 100; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  if (shotsDir != null) {
    final boundary =
        key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    await tester.runAsync(() async {
      final ui.Image img = await boundary.toImage(pixelRatio: 1);
      final data = await img.toByteData(format: ui.ImageByteFormat.png);
      final file = File('$shotsDir/$name${dark ? '' : 'Light'}.png');
      await file.parent.create(recursive: true);
      await file.writeAsBytes(data!.buffer.asUint8List());
    });
  }
  // Снимаем дерево и дожидаемся таймеров анимаций.
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(seconds: 30));
}

/// Регистрирует тесты для обеих тем.
void pqShotBoth(
  String name,
  Future<void> Function(WidgetTester t, bool dark) body,
) {
  for (final dark in [true, false]) {
    testWidgets('$name ${dark ? 'dark' : 'light'}', (t) => body(t, dark));
  }
}

import 'package:go_router/go_router.dart';

import '../../../features/mini_apps/mini_apps_screens.dart';
import '../../../features/mini_apps/sapper_game_screen.dart';
import '../../../features/mini_apps/sapper_rules_screen.dart';
import 'route_utils.dart';

/// Мини-приложения и «Супер Сапёр» — полноэкранные, без нижнего меню
/// (макеты MiniApps, SapperIntro, SapperGame, SapperResult).
final miniAppsFullscreenRoutes = <RouteBase>[
  GoRoute(path: '/app/mini-apps', builder: (_, __) => const MiniAppsHubScreen()),
  GoRoute(path: '/app/sapper', builder: (_, __) => const SapperDrawsScreen()),
  GoRoute(path: '/app/sapper-rules', builder: (_, __) => const SapperRulesScreen()),
  // Активное поле (SapperGame) и итоги после вскрытия (SapperResult) — один экран.
  GoRoute(
      path: '/app/sapper/:id',
      builder: (_, s) => SapperGameScreen(id: intParam(s, 'id'))),
];

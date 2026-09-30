import 'package:go_router/go_router.dart';

import '../../../features/news/news_screen.dart';
import '../../../features/shared/home/home_screen.dart';
import 'route_utils.dart';

/// Главная (с нижним меню). Владелец — раздел «Главная».
final homeShellRoutes = <RouteBase>[
  GoRoute(path: '/app', builder: (_, __) => const HomeScreen()),
];

/// Новости, опросы — полноэкранные, без нижнего меню.
final homeFullscreenRoutes = <RouteBase>[
  GoRoute(path: '/app/news', builder: (_, __) => const NewsScreen()),
  GoRoute(
      path: '/app/news/:id',
      builder: (_, s) => NewsDetailScreen(id: intParam(s, 'id'))),
];

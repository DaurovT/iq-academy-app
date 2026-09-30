import '../app_modules.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_controller.dart';
import '../../features/shell/app_shell.dart';
import 'routes/auth_routes.dart';
import 'routes/brand_routes.dart';
import 'routes/checks_routes.dart';
import 'routes/doctor_routes.dart';
import 'routes/home_routes.dart';
import 'routes/learn_routes.dart';
import 'routes/medrep_routes.dart';
import 'routes/mini_apps_routes.dart';
import 'routes/profile_routes.dart';
import 'routes/quests_routes.dart';
import 'routes/wallet_routes.dart';

/// Роутер приложения. redirect — единый гвард по состоянию авторизации.
///
/// Маршруты разнесены по разделам (routes/*_routes.dart): `*ShellRoutes` —
/// экраны с нижним меню, `*FullscreenRoutes` — без него (как в макетах 1.2).
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier(0);
  ref.listen(authControllerProvider, (_, __) => refresh.value++);
  ref.listen(appModulesProvider, (_, __) => refresh.value++);  // раздел скрыли, пока он открыт
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refresh,
    routes: [
      ...authRoutes,

      // Полноэкранные — раньше оболочки, чтобы не попасть под нижнее меню.
      ...homeFullscreenRoutes,
      ...checksFullscreenRoutes,
      ...questsFullscreenRoutes,
      ...learnFullscreenRoutes,
      ...walletFullscreenRoutes,
      ...profileFullscreenRoutes,
      ...doctorFullscreenRoutes,
      ...medrepFullscreenRoutes,
      ...miniAppsFullscreenRoutes,

      // Основное приложение под оболочкой с нижней навигацией.
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: _instantTabs([
          ...homeShellRoutes,
          ...checksShellRoutes,
          ...questsShellRoutes,
          ...learnShellRoutes,
          ...walletShellRoutes,
          ...profileShellRoutes,
          ...doctorShellRoutes,
          ...medrepShellRoutes,
          ...brandShellRoutes,
        ]),
      ),
    ],
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final loc = state.matchedLocation;

      if (auth.isLoading) return loc == '/splash' ? null : '/splash';

      final s = auth.asData?.value ?? const AuthState();

      if (!s.isAuthed) return isGuestPath(loc) ? null : '/login';
      if (s.needsRole) return loc == '/role' ? null : '/role';

      if (isGatePath(loc)) return '/app';

      // Раздел скрыт в админке → на главную (в т.ч. переход из уведомления или ссылки).
      final module = moduleForPath(loc);
      final modules = ref.read(appModulesProvider).asData?.value;
      if (module != null && modules != null && !modules.isVisible(module, s.activeRole)) {
        return '/app';
      }
      return null;
    },
  );
});

/// Корни вкладок нижнего меню.
const _tabRoots = {
  '/app', '/app/checks', '/app/quests', '/app/learn', '/app/profile', '/app/wallet',
  '/app/recipes', '/app/portfolio', '/app/medrep/quests', '/app/leaderboard',
  '/app/brand/quests', '/app/brand/products', '/app/brand/brands',
};

/// Вкладки переключаются без перехода страницы (как в макетах: меняется
/// только содержимое с каскадом появления). Вложенные экраны — обычный
/// платформенный переход с жестом «назад».
List<RouteBase> _instantTabs(List<RouteBase> routes) => [
      for (final r in routes)
        if (r is GoRoute && r.builder != null && _tabRoots.contains(r.path))
          GoRoute(
            path: r.path,
            redirect: r.redirect,
            routes: r.routes,
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: r.builder!(context, state)),
          )
        else
          r,
    ];

import '../../core/app_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/l10n/l10n.dart';
import '../../core/design/design.dart';
import '../../core/uploads/upload_queue.dart';
import '../tour/tour_controller.dart';
import '../tour/tour_overlay.dart';
import 'nav_config.dart';

/// Оболочка приложения: контент + нижняя навигация под активную роль.
/// Свою шапку (AppBar) рисует каждый экран — так у него свой заголовок и
/// действия. Зеркало нижней навигации из web/app/layouts/AppShell.tsx.
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  int _selectedIndex(List<NavItem> tabs, String location) {
    var best = 0;
    var bestLen = -1;
    for (var i = 0; i < tabs.length; i++) {
      final p = tabs[i].path;
      final match = p == '/app' ? location == '/app' : location.startsWith(p);
      if (match && p.length > bestLen) {
        best = i;
        bestLen = p.length;
      }
    }
    return best;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Держим очередь загрузок живой: стартует ретраи/слушает сеть.
    ref.watch(uploadQueueProvider);

    final role = ref.watch(authControllerProvider).asData?.value.activeRole;
    if (role == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l10n = context.l10n;
    // скрытые в админке разделы не показываем в меню (пока грузится — показываем всё)
    final modules =
        ref.watch(appModulesProvider).asData?.value ?? AppModules.empty;
    final tabs = [
      ...navConfig(l10n)[role]!.where(
        (i) =>
            i.tab && (i.module == null || modules.isVisible(i.module!, role)),
      ),
      NavItem(
        path: '/app/profile',
        label: l10n.navProfile,
        icon: Icons.person_outline,
        iconAsset: 'assets/nav/profile.svg',
        pqIcon: PqIcons.user,
      ),
    ];
    final location = GoRouterState.of(context).uri.path;
    final selected = _selectedIndex(tabs, location);

    // Вкладки — цели обучающего тура.
    TourTarget? tourTargetOf(String path) => switch (path) {
      '/app/checks' || '/app/recipes' => TourTarget.tabChecks,
      '/app/learn' => TourTarget.tabLearn,
      '/app/profile' => TourTarget.tabProfile,
      _ => null,
    };

    return Stack(
      children: [
        Scaffold(
          body: child,
          extendBody: true,
          bottomNavigationBar: PqBottomNav(
            selected: selected,
            onSelect: (i) => context.go(tabs[i].path),
            items: [
              for (final t in tabs)
                PqNavItem(icon: t.pqIcon ?? PqIcons.grid, label: t.label),
            ],
            wrapItem: (i, item) {
              final target = tourTargetOf(tabs[i].path);
              return target == null
                  ? item
                  : TourAnchor(target: target, radius: 16, child: item);
            },
          ),
        ),
        // Обучающий тур — поверх экрана и нижнего меню.
        const Positioned.fill(child: TourOverlay()),
      ],
    );
  }
}

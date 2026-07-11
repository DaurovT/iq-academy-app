import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/uploads/upload_queue.dart';
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

    final tabs = [
      ...kRoleNav[role]!.where((i) => i.tab),
      const NavItem(
        path: '/app/profile',
        label: 'Профиль',
        icon: Icons.person_outline,
      ),
    ];
    final location = GoRouterState.of(context).uri.path;
    final selected = _selectedIndex(tabs, location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => context.go(tabs[i].path),
        destinations: [
          for (final t in tabs)
            NavigationDestination(icon: Icon(t.icon), label: t.label),
        ],
      ),
    );
  }
}

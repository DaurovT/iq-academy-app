import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:platform_app/core/router/open_link.dart';

/// Ссылки из уведомлений: карточка вкладки открывается поверх своего списка,
/// чтобы системное «назад» не закрывало приложение (найдено 19.11.2026 на Android).
void main() {
  GoRouter router() => GoRouter(
        initialLocation: '/app',
        routes: [
          GoRoute(path: '/app/notifications', builder: (_, __) => const Text('notif')),
          ShellRoute(
            builder: (_, __, child) => Scaffold(body: child),
            routes: [
              GoRoute(path: '/app', builder: (_, __) => const Text('home')),
              GoRoute(path: '/app/recipes', builder: (_, __) => const Text('list')),
              GoRoute(path: '/app/recipes/:id', builder: (_, s) => Text('rx ${s.pathParameters['id']}')),
            ],
          ),
        ],
      );

  testWidgets('карточка из уведомления: «назад» ведёт к списку', (t) async {
    final r = router();
    await t.pumpWidget(MaterialApp.router(routerConfig: r));
    r.push('/app/notifications');
    await t.pumpAndSettle();
    expect(find.text('notif'), findsOneWidget);

    openAppLink(r, '/app/recipes/6971');
    await t.pumpAndSettle();
    expect(find.text('rx 6971'), findsOneWidget);
    expect(r.canPop(), isTrue, reason: '«назад» не должно закрывать приложение');

    r.pop();
    await t.pumpAndSettle();
    expect(find.text('list'), findsOneWidget);
  });

  testWidgets('корень вкладки открывается как раньше', (t) async {
    final r = router();
    await t.pumpWidget(MaterialApp.router(routerConfig: r));
    openAppLink(r, '/app/recipes');
    await t.pumpAndSettle();
    expect(find.text('list'), findsOneWidget);
  });

  testWidgets('полноэкранный экран — push поверх текущего', (t) async {
    final r = router();
    await t.pumpWidget(MaterialApp.router(routerConfig: r));
    openAppLink(r, '/app/notifications');
    await t.pumpAndSettle();
    expect(find.text('notif'), findsOneWidget);
    expect(r.canPop(), isTrue);
  });
}

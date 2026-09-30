import 'package:go_router/go_router.dart';

import '../../../features/pharmacist/quest_detail_screen.dart';
import '../../../features/pharmacist/quests/quest_search_screen.dart';
import '../../../features/pharmacist/quests_screen.dart';
import 'route_utils.dart';

/// Квесты (с нижним меню). Статичные пути — раньше параметрических.
final questsShellRoutes = <RouteBase>[
  GoRoute(
    path: '/app/quests',
    builder:
        (_, s) => QuestsScreen(
          initialTab:
              s.uri.queryParameters['tab'] == 'done'
                  ? QuestsTab.done
                  : QuestsTab.active,
        ),
  ),
  // История участия = вкладка «Завершённые» (макет QuestsDone).
  GoRoute(
    path: '/app/quests/history',
    builder: (_, __) => const QuestsScreen(initialTab: QuestsTab.done),
  ),
  GoRoute(
    path: '/app/quests/search',
    builder: (_, __) => const QuestSearchScreen(),
  ),
  GoRoute(
    path: '/app/quests/:id',
    builder: (_, s) => QuestDetailScreen(id: intParam(s, 'id')),
  ),
];

/// Экранов квестов без нижнего меню нет.
final questsFullscreenRoutes = <RouteBase>[];

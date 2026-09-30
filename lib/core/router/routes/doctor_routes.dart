import 'package:go_router/go_router.dart';

import '../../../features/doctor/recipe_camera_screen.dart';
import '../../../features/doctor/recipe_detail_screen.dart';
import '../../../features/doctor/recipe_text_screen.dart';
import '../../../features/doctor/recipes_screen.dart';
import '../../../features/doctor/rx_common.dart';
import 'route_utils.dart';

/// Врач: «Мои бланки» и экран бланка (с нижним меню).
/// Владелец — раздел «Роль врача». Главную врача рисует диспетчер /app.
final doctorShellRoutes = <RouteBase>[
  GoRoute(path: '/app/recipes', builder: (_, __) => const RecipesScreen()),
  GoRoute(
      path: '/app/recipes/:id',
      builder: (_, s) => RecipeDetailScreen(id: intParam(s, 'id'))),
];

/// Съёмка бланка и распознанный текст — без нижнего меню.
/// Подключены раньше оболочки, поэтому `/app/recipes/camera` не попадает
/// в `/app/recipes/:id`.
final doctorFullscreenRoutes = <RouteBase>[
  GoRoute(path: kRxCameraPath, builder: (_, __) => const RecipeCameraScreen()),
  GoRoute(
      path: '/app/recipes/:id/text',
      builder: (_, s) => RecipeTextScreen(id: intParam(s, 'id'))),
];

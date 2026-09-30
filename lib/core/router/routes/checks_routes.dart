import 'package:go_router/go_router.dart';

import '../../../features/pharmacist/check_detail_screen.dart';
import '../../../features/pharmacist/checks/camera_access.dart';
import '../../../features/pharmacist/checks_screen.dart';
import 'route_utils.dart';

/// Чеки фармацевта (с нижним меню). Владелец — раздел «Чеки».
/// `/app/checks/upload` — «Мои чеки» с открытым листом «Новый чек»
/// (точка входа для главной/пушей); стоит раньше `/app/checks/:id`.
final checksShellRoutes = <RouteBase>[
  GoRoute(path: '/app/checks', builder: (_, __) => const ChecksScreen()),
  GoRoute(
      path: kChecksUploadPath,
      builder: (_, __) => const ChecksScreen(openUpload: true)),
  GoRoute(
      path: '/app/checks/:id',
      builder: (_, s) => CheckDetailScreen(id: intParam(s, 'id'))),
];

/// Доступ к камере (праймер и «доступ запрещён») — без нижнего меню.
final checksFullscreenRoutes = <RouteBase>[
  GoRoute(
      path: kChecksCameraPrimerPath,
      builder: (_, __) => const CameraPrimerScreen()),
  GoRoute(
      path: kChecksCameraDeniedPath,
      builder: (_, __) => const CameraDeniedScreen()),
];

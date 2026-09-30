import 'package:go_router/go_router.dart';

import '../../../features/shared/login/login_screen.dart';
import '../../../features/shared/login/oauth_link_screen.dart';
import '../../../features/shared/login/sms_code_screen.dart';
import '../../../features/shared/onboarding/force_update_screen.dart';
import '../../../features/shared/onboarding/push_primer_screen.dart';
import '../../../features/shared/onboarding/welcome_screen.dart';
import '../../../features/shared/register/register_screen.dart';
import '../../../features/shared/role_select/role_select_screen.dart';
import '../../../features/shared/splash/splash_screen.dart';
import '../../push/push_service.dart';

/// Вход, регистрация, выбор роли, служебные экраны (обновление, праймер
/// уведомлений). Владелец — раздел «Вход и регистрация».
final authRoutes = <RouteBase>[
  GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
  GoRoute(path: '/welcome', builder: (_, __) => const WelcomeScreen()),
  GoRoute(
    path: '/login',
    builder: (_, __) => const LoginScreen(),
    routes: [
      GoRoute(
        path: 'code',
        builder: (_, s) => SmsCodeScreen(phone: s.uri.queryParameters['phone'] ?? ''),
      ),
    ],
  ),
  GoRoute(
    path: '/register',
    builder:
        (_, s) => RegisterScreen(
          phone: s.uri.queryParameters['phone'],
          linkToken: s.uri.queryParameters['link'],
        ),
  ),
  GoRoute(
    path: '/oauth-link',
    builder:
        (_, s) => OAuthLinkScreen(
          linkToken: s.uri.queryParameters['token'] ?? '',
          fullName: s.uri.queryParameters['name'],
        ),
  ),
  GoRoute(path: '/role', builder: (_, __) => const RoleSelectScreen()),
  // Принудительное обновление: доступно и гостю, и после входа.
  GoRoute(
    path: '/force-update',
    builder: (_, s) => ForceUpdateScreen(minVersion: s.uri.queryParameters['min']),
  ),
  // Праймер перед системным запросом разрешения на пуши (после входа).
  GoRoute(
    path: '/push-primer',
    builder: (_, __) => const PushPrimerScreen(onRequested: PushService.syncToken),
  ),
];

/// Экраны, доступные без входа. Новые гостевые экраны — под `/login/…`
/// или `/register/…`, либо добавьте путь сюда.
bool isGuestPath(String loc) =>
    loc == '/login' ||
    loc.startsWith('/login/') ||
    loc == '/register' ||
    loc.startsWith('/register/') ||
    loc == '/oauth-link' ||
    loc == '/welcome' ||
    loc == '/force-update';

/// Экраны «ворот»: после входа с них уводим на /app.
/// `/force-update` — гостевой, но не «ворота»: держит и вошедшего.
bool isGatePath(String loc) =>
    loc != '/force-update' && (loc == '/splash' || loc == '/role' || isGuestPath(loc));

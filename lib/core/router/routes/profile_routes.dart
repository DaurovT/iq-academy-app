import 'package:go_router/go_router.dart';

import '../../../features/shared/notifications/notifications_screen.dart';
import '../../../features/shared/profile/account_deleted_screen.dart';
import '../../../features/shared/profile/delete_account_sheet.dart';
import '../../../features/shared/profile/edit_profile_screen.dart';
import '../../../features/shared/profile/privacy_full_screen.dart';
import '../../../features/shared/profile/privacy_screen.dart';
import '../../../features/shared/profile/profile_screen.dart';
import '../../../features/shared/settings/notification_settings_screen.dart';
import '../../../features/shared/support/support_screen.dart';

/// Профиль (с нижним меню). Владелец — раздел «Профиль».
final profileShellRoutes = <RouteBase>[
  GoRoute(path: '/app/profile', builder: (_, __) => const ProfileScreen()),
];

/// Уведомления, поддержка, настройки, личные данные, конфиденциальность —
/// без нижнего меню. «Сменить роль», «Удалить аккаунт» и «Настройки
/// уведомлений» — нижние листы поверх экрана (без своих маршрутов, кроме
/// `/app/settings/notifications` для открытия ссылкой).
final profileFullscreenRoutes = <RouteBase>[
  GoRoute(
      path: '/app/notifications',
      builder: (_, __) => const NotificationsScreen()),
  GoRoute(path: '/app/support', builder: (_, __) => const SupportScreen()),
  GoRoute(
      path: '/app/settings/notifications',
      builder: (_, __) => const NotificationSettingsScreen()),
  GoRoute(
      path: '/app/profile/edit',
      builder: (_, __) => const EditProfileScreen()),
  GoRoute(
    path: '/app/privacy',
    builder: (_, __) => const PrivacyScreen(),
    routes: [
      GoRoute(path: 'full', builder: (_, __) => const PrivacyFullScreen()),
    ],
  ),
  // Та же политика для гостя (ссылка «#privacy» на экранах регистрации).
  GoRoute(
    path: '/register/privacy',
    builder: (_, __) => const PrivacyScreen(),
    routes: [
      GoRoute(path: 'full', builder: (_, __) => const PrivacyFullScreen()),
    ],
  ),
  // После удаления сессии нет — экран гостевой (/login/…).
  GoRoute(
      path: kAccountDeletedPath,
      builder: (_, __) => const AccountDeletedScreen()),
];

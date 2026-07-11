import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/common.dart';
import '../../../core/theme/theme_controller.dart';
import '../providers.dart';

/// Шапка главного экрана с глобальными действиями: тема, уведомления,
/// переключение роли (если ролей несколько).
class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authControllerProvider).asData?.value.account;
    final themeMode = ref.watch(themeModeProvider);

    return AppBar(
      title: const Text('IQ Academy'),
      actions: [
        IconButton(
          icon: Icon(themeMode == ThemeMode.dark
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined),
          onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
        ),
        _NotificationBell(
          count: ref.watch(unreadCountProvider).asData?.value ?? 0,
          onTap: () => context.go('/app/notifications'),
        ),
        if ((account?.roles.length ?? 0) > 1)
          PopupMenuButton<Role>(
            icon: const Icon(Icons.badge_outlined),
            tooltip: 'Сменить роль',
            onSelected: (r) =>
                ref.read(authControllerProvider.notifier).setActiveRole(r),
            itemBuilder: (_) => [
              for (final r in account!.roles)
                PopupMenuItem(value: r, child: Text(r.label)),
            ],
          ),
      ],
    );
  }
}

/// Колокольчик уведомлений с бейджем непрочитанных.
class _NotificationBell extends StatelessWidget {
  const _NotificationBell({required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Badge(
        isLabelVisible: count > 0,
        label: Text(count > 99 ? '99+' : '$count'),
        child: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}

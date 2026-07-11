import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/common.dart';

/// Выбор активной роли — показывается, если у аккаунта их несколько.
class RoleSelectScreen extends ConsumerWidget {
  const RoleSelectScreen({super.key});

  IconData _icon(Role role) => switch (role) {
        Role.pharmacist => Icons.local_pharmacy_outlined,
        Role.doctor => Icons.medical_services_outlined,
        Role.medrep => Icons.people_alt_outlined,
        Role.productOwner => Icons.storefront_outlined,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roles = ref.watch(authControllerProvider).asData?.value.account?.roles ??
        const <Role>[];

    return Scaffold(
      appBar: AppBar(title: const Text('Выберите роль')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final role in roles)
            Card(
              child: ListTile(
                leading: Icon(_icon(role)),
                title: Text(role.label),
                trailing: const Icon(Icons.chevron_right),
                onTap: () =>
                    ref.read(authControllerProvider.notifier).setActiveRole(role),
              ),
            ),
        ],
      ),
    );
  }
}

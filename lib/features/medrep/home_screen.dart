import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../widgets/async_view.dart';
import '../../widgets/stat_tile.dart';
import '../shared/widgets/home_app_bar.dart';
import 'providers.dart';

/// Обзор медпреда: ключевые метрики + быстрые переходы.
class MedrepHome extends ConsumerWidget {
  const MedrepHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(authControllerProvider).asData?.value.account?.fullName ?? '';
    final metrics = ref.watch(medrepMetricsProvider);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(medrepMetricsProvider),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Обзор', style: Theme.of(context).textTheme.bodyMedium),
            Text(name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            AsyncView(
              value: metrics,
              onRetry: () => ref.invalidate(medrepMetricsProvider),
              data: (m) => StatGrid(tiles: [
                StatTile(value: '${m.pharmCount}', label: 'Аптек', icon: Icons.people_alt_outlined),
                StatTile(value: '${m.checksCount}', label: 'Чеков', icon: Icons.receipt_long_outlined),
                StatTile(value: '${m.approvedPacksSum}', label: 'Упаковок (одобрено)', icon: Icons.inventory_2_outlined),
                StatTile(value: '${m.questsDone}', label: 'Квестов выполнено', icon: Icons.flag_outlined),
              ]),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.people_alt_outlined),
                title: const Text('Портфель аптек'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/app/portfolio'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.person_add_alt_outlined),
                title: const Text('Заявки рефералов'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/app/referrals'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.business_outlined),
                title: const Text('Компании'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/app/companies'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

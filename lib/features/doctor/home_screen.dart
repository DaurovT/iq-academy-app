import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/format.dart';
import '../../core/models/quest.dart';
import '../../widgets/async_view.dart';
import '../shared/widgets/home_app_bar.dart';
import '../pharmacist/providers.dart';

/// Главная врача: баланс, загрузка рецепта, обучение, квесты (цель — рецепты).
class DoctorHome extends ConsumerWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(authControllerProvider).asData?.value.account?.fullName ?? '';
    final wallet = ref.watch(walletProvider);
    final quests = ref.watch(questsListProvider(QuestTarget.recipes));

    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(walletProvider);
          ref.invalidate(questsListProvider(QuestTarget.recipes));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Здравствуйте,', style: Theme.of(context).textTheme.bodyMedium),
            Text(name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            AsyncView(
              value: wallet,
              onRetry: () => ref.invalidate(walletProvider),
              data: (w) => Card(
                child: ListTile(
                  leading: const Icon(Icons.account_balance_wallet_outlined, size: 32),
                  title: Text(formatIqc(w.balanceIqc),
                      style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text('≈ ${formatUzs(w.balanceUzs)}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/app/wallet'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                child: _QuickAction(
                  icon: Icons.add_a_photo_outlined,
                  label: 'Загрузить рецепт',
                  onTap: () => context.go('/app/recipes'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickAction(
                  icon: Icons.school_outlined,
                  label: 'Обучение',
                  onTap: () => context.go('/app/learn'),
                ),
              ),
            ]),
            const SizedBox(height: 24),
            Row(children: [
              Text('Активные квесты', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton(onPressed: () => context.go('/app/quests'), child: const Text('Все')),
            ]),
            const SizedBox(height: 8),
            AsyncView(
              value: quests,
              onRetry: () => ref.invalidate(questsListProvider(QuestTarget.recipes)),
              data: (list) => list.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: Text('Нет активных квестов')))
                  : Column(children: [
                      for (final q in list.take(3))
                        Card(
                          child: ListTile(
                            title: Text(q.name,
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                    value: q.progress.clamp(0, 1), minHeight: 6),
                              ),
                            ),
                            trailing:
                                Text('${(q.progress * 100).round()}%'),
                            onTap: () => context.push('/app/quests/${q.id}'),
                          ),
                        ),
                    ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            Icon(icon, size: 28),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/format.dart';
import '../../widgets/async_view.dart';
import '../../widgets/stat_tile.dart';
import 'providers.dart';

class BrandQuestsScreen extends ConsumerWidget {
  const BrandQuestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quests = ref.watch(brandQuestsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Квесты бренда')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(brandQuestsProvider),
        child: AsyncView(
          value: quests,
          onRetry: () => ref.invalidate(brandQuestsProvider),
          data: (list) => list.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 300, child: EmptyState(text: 'Квестов нет')),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final q = list[i];
                    return Card(
                      child: ListTile(
                        title: Text(q.name),
                        subtitle: Text('${q.sponsor} · ${q.completions}/${q.participants} вып.'),
                        trailing: Chip(
                          label: Text(q.status.name == 'active' ? 'Активен' : 'Выкл'),
                          visualDensity: VisualDensity.compact,
                        ),
                        onTap: () => context.go('/app/brand/quests/${q.id}'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class BrandQuestDetailScreen extends ConsumerWidget {
  const BrandQuestDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quest = ref.watch(brandQuestProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text('Квест бренда')),
      body: AsyncView(
        value: quest,
        onRetry: () => ref.invalidate(brandQuestProvider(id)),
        data: (q) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(q.name, style: Theme.of(context).textTheme.headlineSmall),
            Text('Спонсор: ${q.sponsor}'),
            const SizedBox(height: 16),
            StatGrid(tiles: [
              StatTile(value: '${q.participants}', label: 'Участников'),
              StatTile(value: '${q.completions}', label: 'Выполнений'),
              StatTile(value: formatUzs(q.budgetFunded), label: 'Бюджет'),
              StatTile(value: formatUzs(q.budgetSpent), label: 'Потрачено'),
            ]),
            const SizedBox(height: 16),
            Text('Продукты', style: Theme.of(context).textTheme.titleMedium),
            Wrap(
              spacing: 8,
              children: [for (final p in q.products) Chip(label: Text(p))],
            ),
            const SizedBox(height: 12),
            ListTile(
              dense: true,
              title: const Text('МХИК'),
              trailing: Text(q.mxik),
            ),
            ListTile(
              dense: true,
              title: const Text('Награда'),
              trailing: Text('+${q.prizeIqc} IQC'),
            ),
            ListTile(
              dense: true,
              title: const Text('Период'),
              trailing: Text('${formatDate(q.startDate)}'
                  '${q.endDate != null ? ' – ${formatDate(q.endDate!)}' : ''}'),
            ),
          ],
        ),
      ),
    );
  }
}

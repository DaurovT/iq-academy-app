import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/quest.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Детальная карточка квеста: механика, прогресс, топ-продавцы.
class QuestDetailScreen extends ConsumerWidget {
  const QuestDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(questDetailProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text('Квест')),
      body: AsyncView(
        value: detail,
        onRetry: () => ref.invalidate(questDetailProvider(id)),
        data: (q) => _Body(q: q),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.q});
  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(q.name, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(q.description, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Прогресс: ${q.myCount} из ${q.goal}',
                    style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: q.goal == 0 ? 0 : (q.myCount / q.goal).clamp(0, 1),
                    minHeight: 10,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(spacing: 8, children: [
                  Chip(label: Text('Награда: +${q.prizeIqc} IQC')),
                  Chip(label: Text('Участников: ${q.participants}')),
                  if (q.rewardReceived) const Chip(label: Text('Награда получена')),
                ]),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Механика', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final m in q.mechanics)
          ListTile(
            dense: true,
            leading: const Icon(Icons.medication_outlined),
            title: Text(m.drug),
            trailing: Text('× ${m.qty}'),
          ),
        if (q.topSellers.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text('Топ продавцов', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final t in q.topSellers)
            ListTile(
              dense: true,
              leading: CircleAvatar(child: Text('${t.rank}')),
              title: Text(t.name),
              subtitle: Text(t.shop),
              trailing: Text('${t.total}'),
            ),
        ],
      ],
    );
  }
}

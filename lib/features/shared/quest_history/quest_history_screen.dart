import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/format.dart';
import '../../../widgets/async_view.dart';
import '../../pharmacist/providers.dart';

/// История выполнений квестов (types.ts: QuestParticipation).
class QuestHistoryScreen extends ConsumerWidget {
  const QuestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(questParticipationsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('История квестов')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(questParticipationsProvider),
        child: AsyncView(
          value: items,
          onRetry: () => ref.invalidate(questParticipationsProvider),
          data: (list) => list.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 300, child: EmptyState(text: 'История пуста')),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final p = list[i];
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          p.rewardReceived ? Icons.check_circle : Icons.hourglass_bottom,
                          color: p.rewardReceived ? Colors.green : Colors.orange,
                        ),
                        title: Text(p.questName),
                        subtitle: Text('Завершён: ${formatDate(p.completedAt)}'),
                        trailing: Text('+${p.rewardIqc} IQC'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/quest.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Список квестов фармацевта (цель — чеки). Эталонный экран на Riverpod:
/// провайдер + AsyncView дают загрузку/ошибку/данные; pull-to-refresh — через
/// инвалидацию провайдера.
class QuestsScreen extends ConsumerWidget {
  const QuestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quests = ref.watch(questsListProvider(QuestTarget.checks));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Квесты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'История',
            onPressed: () => context.go('/app/quests/history'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            ref.invalidate(questsListProvider(QuestTarget.checks)),
        child: AsyncView(
          value: quests,
          onRetry: () => ref.invalidate(questsListProvider(QuestTarget.checks)),
          data: (list) {
            if (list.isEmpty) {
              return const _ScrollableEmpty(text: 'Пока нет активных квестов');
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => QuestCard(quest: list[i]),
            );
          },
        ),
      ),
    );
  }
}

/// Карточка квеста с прогрессом и наградой.
class QuestCard extends StatelessWidget {
  const QuestCard({super.key, required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => context.go('/app/quests/${quest.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(quest.name,
                        style: theme.textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Chip(
                    label: Text('+${quest.prizeIqc} IQC'),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              if (quest.description.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(quest.description,
                    style: theme.textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: quest.progress.clamp(0, 1),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 6),
              Text('Выполнено: ${(quest.progress * 100).round()}%',
                  style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScrollableEmpty extends StatelessWidget {
  const _ScrollableEmpty({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    // Обёртка, чтобы RefreshIndicator работал даже на пустом списке.
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: EmptyState(text: text, icon: Icons.flag_outlined),
        ),
      ],
    );
  }
}

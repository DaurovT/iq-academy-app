import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Квесты компании медпреда с разбивкой по участникам-аптекам.
class MedrepQuestsScreen extends ConsumerWidget {
  const MedrepQuestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quests = ref.watch(medrepQuestsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Квесты компании')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(medrepQuestsProvider),
        child: AsyncView(
          value: quests,
          onRetry: () => ref.invalidate(medrepQuestsProvider),
          data: (list) => list.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 300, child: EmptyState(text: 'Квестов нет')),
                ])
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (final q in list)
                      Card(
                        child: ExpansionTile(
                          title: Text(q.name),
                          subtitle: Text('Цель: ${q.goal} · участников: ${q.participants.length}'),
                          children: [
                            for (final p in q.participants)
                              ListTile(
                                dense: true,
                                title: Text(p.name),
                                subtitle: Text('${p.shop} · ${p.collected}/${p.goal}'),
                                trailing: SizedBox(
                                  width: 60,
                                  child: LinearProgressIndicator(
                                      value: p.progress.clamp(0, 1)),
                                ),
                              ),
                            if (q.participants.isEmpty)
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('Пока нет участников'),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Квесты компании медпреда с разбивкой по участникам-аптекам.
class MedrepQuestsScreen extends ConsumerWidget {
  const MedrepQuestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quests = ref.watch(medrepQuestsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.medrepQuestsTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(medrepQuestsProvider),
        child: AsyncView(
          value: quests,
          onRetry: () => ref.invalidate(medrepQuestsProvider),
          data: (list) => list.isEmpty
              ? ListView(children: [
                  SizedBox(
                      height: 300,
                      child: EmptyState(text: context.l10n.medrepQuestsEmpty)),
                ])
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (final q in list)
                      Card(
                        child: ExpansionTile(
                          title: Text(q.name),
                          subtitle: Text(context.l10n.medrepQuestsSubtitle(
                              q.goal, q.participants.length)),
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
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                    context.l10n.medrepQuestsNoParticipants),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class ReferralsScreen extends ConsumerWidget {
  const ReferralsScreen({super.key});

  Future<void> _act(
      BuildContext context, WidgetRef ref, int id, bool accept) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    try {
      final api = ref.read(apiProvider).medrep;
      accept ? await api.acceptReferral(id) : await api.rejectReferral(id);
      ref.invalidate(referralsProvider);
      messenger.showSnackBar(SnackBar(
          content: Text(
              accept ? l10n.referralsAccepted : l10n.referralsRejected)));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(referralsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.referralsTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(referralsProvider),
        child: AsyncView(
          value: list,
          onRetry: () => ref.invalidate(referralsProvider),
          data: (items) => items.isEmpty
              ? ListView(children: [
                  SizedBox(
                      height: 300,
                      child: EmptyState(text: context.l10n.referralsEmpty)),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final r = items[i];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(r.name, style: Theme.of(context).textTheme.titleMedium),
                            Text('${r.phone}${r.shop != null ? ' · ${r.shop}' : ''}'),
                            Text(
                                context.l10n
                                    .referralsDate(formatDate(r.requestedAt)),
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () => _act(context, ref, r.id, false),
                                    child: Text(context.l10n.referralsDecline)),
                                const SizedBox(width: 8),
                                FilledButton(
                                    onPressed: () => _act(context, ref, r.id, true),
                                    child: Text(context.l10n.referralsAccept)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

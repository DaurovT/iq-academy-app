import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class SalesLogScreen extends ConsumerWidget {
  const SalesLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rows = ref.watch(salesLogProvider(null));
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.salesLogTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(salesLogProvider(null)),
        child: AsyncView(
          value: rows,
          onRetry: () => ref.invalidate(salesLogProvider(null)),
          data: (list) => list.isEmpty
              ? ListView(children: [
                  SizedBox(
                      height: 300,
                      child: EmptyState(text: context.l10n.salesLogEmpty)),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final r = list[i];
                    return ListTile(
                      title: Text('${r.product} ×${r.qty}'),
                      subtitle: Text('${r.pharmacist} · ${r.shop} · ${r.region}'),
                      trailing: Text(formatDate(r.date)),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

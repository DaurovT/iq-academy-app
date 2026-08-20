import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class CompaniesScreen extends ConsumerWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(companiesProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.companiesTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(companiesProvider),
        child: AsyncView(
          value: list,
          onRetry: () => ref.invalidate(companiesProvider),
          data: (items) => items.isEmpty
              ? ListView(children: [
                  SizedBox(
                      height: 300,
                      child: EmptyState(text: context.l10n.companiesEmpty)),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final c = items[i];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.business_outlined),
                        title: Text(c.name),
                        subtitle:
                            Text(context.l10n.companiesCode(c.labelCode)),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

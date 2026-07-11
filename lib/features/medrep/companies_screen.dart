import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class CompaniesScreen extends ConsumerWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(companiesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Компании')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(companiesProvider),
        child: AsyncView(
          value: list,
          onRetry: () => ref.invalidate(companiesProvider),
          data: (items) => items.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 300, child: EmptyState(text: 'Компаний нет')),
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
                        subtitle: Text('Код: ${c.labelCode}'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

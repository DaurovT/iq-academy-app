import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class BrandProductsScreen extends ConsumerWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(brandProductsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.brandProductsTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(brandProductsProvider),
        child: AsyncView(
          value: products,
          onRetry: () => ref.invalidate(brandProductsProvider),
          data: (list) => list.isEmpty
              ? ListView(children: [
                  SizedBox(
                      height: 300,
                      child:
                          EmptyState(text: context.l10n.brandProductsEmpty)),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final p = list[i];
                    return Card(
                      child: ListTile(
                        leading: p.imageUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(p.imageUrl!,
                                    width: 44, height: 44, fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.medication_outlined)),
                              )
                            : const Icon(Icons.medication_outlined),
                        title: Text(p.name),
                        subtitle: Text('${p.brand} · ${p.format}'),
                        trailing: Text(
                            context.l10n.brandProductsQuestCount(p.questCount)),
                        onTap: () => context.go('/app/brand/products/${p.id}'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class BrandProductDetailScreen extends ConsumerWidget {
  const BrandProductDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(brandProductProvider(id));
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.brandProductsDetailTitle)),
      body: AsyncView(
        value: product,
        onRetry: () => ref.invalidate(brandProductProvider(id)),
        data: (p) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (p.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(p.imageUrl!,
                    height: 180, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink()),
              ),
            const SizedBox(height: 12),
            Text(p.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            ListTile(
                dense: true,
                title: Text(context.l10n.brandProductsBrand),
                trailing: Text(p.brand)),
            ListTile(
                dense: true,
                title: Text(context.l10n.brandProductsFormat),
                trailing: Text(p.format)),
            ListTile(
                dense: true,
                title: Text(context.l10n.brandProductsMxik),
                trailing: Text(p.mxik)),
            ListTile(
                dense: true,
                title: Text(context.l10n.brandProductsDivisible),
                trailing: Text(p.divisible
                    ? context.l10n.brandProductsYes
                    : context.l10n.brandProductsNo)),
            ListTile(
                dense: true,
                title: Text(context.l10n.brandProductsQuests),
                trailing: Text('${p.questCount}')),
          ],
        ),
      ),
    );
  }
}

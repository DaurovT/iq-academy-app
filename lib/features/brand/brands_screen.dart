import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class BrandsScreen extends ConsumerWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(brandsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.brandsTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(brandsProvider),
        child: AsyncView(
          value: brands,
          onRetry: () => ref.invalidate(brandsProvider),
          data: (list) => list.isEmpty
              ? ListView(children: [
                  SizedBox(
                      height: 300,
                      child: EmptyState(text: context.l10n.brandsEmpty)),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final b = list[i];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.sell_outlined),
                        title: Text(b.name),
                        subtitle: Text(b.manufacturer),
                        trailing:
                            Text(context.l10n.brandsQuestCount(b.questCount)),
                        onTap: () => context.go('/app/brand/brands/${b.id}'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class BrandDetailScreen extends ConsumerWidget {
  const BrandDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brand = ref.watch(brandInfoProvider(id));
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.brandsDetailTitle)),
      body: AsyncView(
        value: brand,
        onRetry: () => ref.invalidate(brandInfoProvider(id)),
        data: (b) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (b.bannerUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(b.bannerUrl!,
                    height: 140, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink()),
              ),
            const SizedBox(height: 12),
            Text(b.name, style: Theme.of(context).textTheme.headlineSmall),
            Text(b.manufacturer),
            const SizedBox(height: 16),
            if (b.subBrands.isNotEmpty) ...[
              Text(context.l10n.brandsSubBrands,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [for (final s in b.subBrands) Chip(label: Text(s))],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

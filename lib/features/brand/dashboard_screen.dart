import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/l10n/l10n.dart';
import '../../widgets/async_view.dart';
import '../../widgets/stat_tile.dart';
import '../shared/widgets/home_app_bar.dart';
import 'providers.dart';

/// Дашборд бренда: сводные метрики, топ-продукты, топ-продавцы, регионы.
class BrandDashboardScreen extends ConsumerWidget {
  const BrandDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dash = ref.watch(brandDashboardProvider);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(brandDashboardProvider),
        child: AsyncView(
          value: dash,
          onRetry: () => ref.invalidate(brandDashboardProvider),
          data: (d) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(context.l10n.brandDashTitle,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              StatGrid(tiles: [
                StatTile(
                    value: '${d.checksTotal}',
                    label: context.l10n.brandDashChecks,
                    icon: Icons.receipt_long_outlined),
                StatTile(
                    value: '${d.packsTotal}',
                    label: context.l10n.brandDashPacks,
                    icon: Icons.inventory_2_outlined),
                StatTile(
                    value: '${d.activeQuests}',
                    label: context.l10n.brandDashActiveQuests,
                    icon: Icons.flag_outlined),
                StatTile(
                    value: '${d.participants}',
                    label: context.l10n.brandDashParticipants,
                    icon: Icons.people_alt_outlined),
              ]),
              const SizedBox(height: 16),
              _Section(
                title: context.l10n.brandDashSegmentation,
                child: Row(children: [
                  Expanded(
                    child: _SegBar(
                      label: context.l10n.brandDashRetail,
                      count: d.segmentation.retail.count,
                      pct: d.segmentation.retail.pct,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SegBar(
                      label: context.l10n.brandDashChain,
                      count: d.segmentation.chain.count,
                      pct: d.segmentation.chain.pct,
                    ),
                  ),
                ]),
              ),
              if (d.topProducts.isNotEmpty)
                _Section(
                  title: context.l10n.brandDashTopProducts,
                  child: Column(children: [
                    for (final p in d.topProducts)
                      ListTile(
                        dense: true,
                        leading: const Icon(Icons.medication_outlined),
                        title: Text(p.name),
                        trailing: Text('${p.total}'),
                      ),
                  ]),
                ),
              if (d.topSellers.isNotEmpty)
                _Section(
                  title: context.l10n.brandDashTopSellers,
                  child: Column(children: [
                    for (final t in d.topSellers)
                      ListTile(
                        dense: true,
                        leading: CircleAvatar(child: Text('${t.rank}')),
                        title: Text(t.name),
                        subtitle: Text(t.shop),
                        trailing: Text('${t.total}'),
                      ),
                  ]),
                ),
              if (d.regions.isNotEmpty)
                _Section(
                  title: context.l10n.brandDashRegions,
                  child: Column(children: [
                    for (final r in d.regions)
                      ListTile(
                        dense: true,
                        leading: const Icon(Icons.location_on_outlined),
                        title: Text(r.region),
                        trailing: Text('${r.value}'),
                      ),
                  ]),
                ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.list_alt_outlined),
                  title: Text(context.l10n.brandDashSalesLogs),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/app/brand/logs'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        child,
        const SizedBox(height: 8),
      ],
    );
  }
}

class _SegBar extends StatelessWidget {
  const _SegBar({required this.label, required this.count, required this.pct});
  final String label;
  final int count;
  final double pct;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('${pct.toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.headlineSmall),
            Text('$count', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

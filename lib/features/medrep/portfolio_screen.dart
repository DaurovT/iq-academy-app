import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  Future<void> _shareReflink(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final url = await ref.read(apiProvider).medrep.reflink();
      if (!context.mounted) return;
      showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Реферальная ссылка'),
          content: SelectableText(url),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Закрыть')),
          ],
        ),
      );
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(portfolioProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Портфель аптек'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Реф. ссылка',
            onPressed: () => _shareReflink(context, ref),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(portfolioProvider),
        child: AsyncView(
          value: list,
          onRetry: () => ref.invalidate(portfolioProvider),
          data: (items) => items.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 300, child: EmptyState(text: 'Аптек пока нет')),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final p = items[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text(p.name.isNotEmpty ? p.name[0] : '?')),
                        title: Text(p.name),
                        subtitle: Text('${p.shop} · ${p.city}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Чеков: ${p.checks}'),
                            Text('Квестов: ${p.quests}'),
                          ],
                        ),
                        onTap: () => context.go('/app/portfolio/${p.telegramId}'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

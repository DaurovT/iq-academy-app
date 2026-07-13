import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../core/models/news.dart';
import '../../core/img.dart';
import '../../widgets/async_view.dart';

final newsListProvider = FutureProvider<List<NewsItem>>((ref) {
  return ref.watch(apiProvider).news.list();
});
final newsDetailProvider = FutureProvider.family<NewsDetail, int>((ref, id) {
  return ref.watch(apiProvider).news.get(id);
});

String _fmt(String? s) {
  if (s == null) return '';
  final d = DateTime.tryParse(s);
  if (d == null) return '';
  const mon = ['', 'янв', 'фев', 'мар', 'апр', 'мая', 'июн', 'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'];
  return '${d.day} ${mon[d.month]} ${d.year}';
}

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(newsListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Новости')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(newsListProvider),
        child: AsyncView<List<NewsItem>>(
          value: v,
          onRetry: () => ref.invalidate(newsListProvider),
          data: (items) {
            if (items.isEmpty) {
              return ListView(children: const [
                SizedBox(height: 120),
                Center(child: Text('Пока нет новостей', style: TextStyle(color: Colors.grey))),
              ]);
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => _NewsCard(item: items[i]),
            );
          },
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.item});
  final NewsItem item;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/app/news/${item.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.coverUrl != null && item.coverUrl!.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(imgThumb(item.coverUrl, w: 560)!, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink()),
              ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.pinned)
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: const Color(0xFF7C5CFF), borderRadius: BorderRadius.circular(999)),
                      child: const Text('ВАЖНОЕ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
                    ),
                  Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  if (item.summary != null && item.summary!.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(item.summary!, maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, height: 1.4, color: scheme.onSurfaceVariant)),
                  ],
                  const SizedBox(height: 8),
                  Text(_fmt(item.publishedAt), style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetailScreen extends ConsumerWidget {
  const NewsDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(newsDetailProvider(id));
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Новость')),
      body: AsyncView<NewsDetail>(
        value: v,
        onRetry: () => ref.invalidate(newsDetailProvider(id)),
        data: (n) => ListView(
          padding: EdgeInsets.zero,
          children: [
            if (n.coverUrl != null && n.coverUrl!.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(imgThumb(n.coverUrl, w: 900)!, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink()),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (n.pinned)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: const Color(0xFF7C5CFF), borderRadius: BorderRadius.circular(999)),
                      child: const Text('ВАЖНОЕ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
                    ),
                  Text(n.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text(_fmt(n.publishedAt), style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                  if (n.summary != null && n.summary!.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Text(n.summary!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.4)),
                  ],
                  const SizedBox(height: 14),
                  Text(n.body, style: const TextStyle(fontSize: 15, height: 1.6)),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/img.dart';
import 'news_screen.dart';

/// Последняя новость компактным превью на главной + кнопка «Все новости».
class NewsHomeBlock extends ConsumerWidget {
  const NewsHomeBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(newsListProvider);
    return v.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (items) {
        if (items.isEmpty) return const SizedBox.shrink();
        final n = items.first;
        final scheme = Theme.of(context).colorScheme;
        final cover = imgThumb(n.coverUrl, w: 160);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Новости', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                TextButton(
                  onPressed: () => context.push('/app/news'),
                  style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 6), minimumSize: const Size(0, 32)),
                  child: const Text('Все новости →'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Material(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(14),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => context.push('/app/news/${n.id}'),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (cover != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(cover, width: 60, height: 60, fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(width: 60, height: 60, color: scheme.surfaceContainerHighest)),
                        ),
                      if (cover != null) const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(children: [
                              if (n.pinned)
                                Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFF7C5CFF), borderRadius: BorderRadius.circular(999)),
                                  child: const Text('ВАЖНОЕ', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Colors.white)),
                                ),
                              Expanded(child: Text(n.title, maxLines: 1, overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700))),
                            ]),
                            if (n.summary != null && n.summary!.isNotEmpty) ...[
                              const SizedBox(height: 3),
                              Text(n.summary!, maxLines: 1, overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                            ],
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

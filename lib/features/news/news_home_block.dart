import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/img.dart';
import '../../core/l10n/l10n.dart';
import '../../core/theme/app_colors.dart';
import 'news_screen.dart';

/// Блок «Новости» на главной. Перенесён 1:1 из макета Figma
/// (news-card, ноды 180:9 / 181:23): заголовок секции + карточка последней
/// новости с превью, датой и ссылкой «Подробнее →».
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
        final p = PharmPalette.of(context);
        final cover = imgThumb(n.coverUrl, w: 200);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.newsTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: p.textPrimary,
                  ),
                ),
                InkWell(
                  onTap: () => context.push('/app/news'),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      context.l10n.newsAll,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: p.accent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Material(
              color: p.newsCardBg,
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => context.push('/app/news/${n.id}'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: p.softBorder),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: cover != null
                            ? Image.network(
                                cover,
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    _thumbPlaceholder(p),
                              )
                            : _thumbPlaceholder(p),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              n.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                fontWeight: FontWeight.w600,
                                color: p.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatNewsDate(n.publishedAt),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: p.textMuted,
                                  ),
                                ),
                                Text(
                                  context.l10n.newsMore,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: p.accent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Widget _thumbPlaceholder(PharmPalette p) => Container(
        width: 72,
        height: 72,
        color: p.miniIconBg,
        child: Icon(Icons.article_outlined, color: p.accent, size: 28),
      );

  String _formatNewsDate(String? raw) {
    if (raw == null || raw.isEmpty) return '';
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw;
    String two(int x) => x.toString().padLeft(2, '0');
    return '${two(dt.day)}.${two(dt.month)}.${dt.year}';
  }
}

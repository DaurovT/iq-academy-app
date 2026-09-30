import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/img.dart';
import '../../core/l10n/l10n.dart';
import 'news_screen.dart';

/// Блок «Новости» на главной (макет Refined): заголовок секции со ссылкой
/// «Все новости» + карточка последней новости (превью 76, заголовок, дата).
class NewsHomeBlock extends ConsumerWidget {
  const NewsHomeBlock({super.key, this.padding = EdgeInsets.zero});

  /// Отступ вокруг блока — только когда он виден (новости есть).
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(newsListProvider).asData?.value;
    if (items == null || items.isEmpty) return const SizedBox.shrink();
    final n = items.first;
    final pq = context.pq;
    final l = context.l10n;
    return Padding(
      padding: padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      PqSectionHeader(
        l.newsTitle,
        actionLabel: l.newsAll,
        onAction: () => context.push('/app/news'),
      ),
      const SizedBox(height: 12),
      PqCard(
        padding: const EdgeInsets.all(12),
        onTap: () => context.push('/app/news/${n.id}'),
        child: Row(children: [
          NewsThumb(url: n.coverUrl, size: 76, radius: 12),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(n.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.heading(16, FontWeight.w600, height: 1.35, c: pq.text)),
              if (n.publishedAt != null && n.publishedAt!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(formatDate(n.publishedAt!), style: PqText.caption(c: pq.textMuted)),
              ],
            ]),
          ),
          const SizedBox(width: 14),
          PqIcon(PqIcons.chevronRight,
              size: 18, color: pq.isDark ? pq.textMuted : const Color(0xFF9CA3AF)),
        ]),
      ),
    ]),
    );
  }
}

/// Превью новости: обложка из API (через thumbnail-прокси) или плитка
/// с иконкой газеты, если обложки нет.
class NewsThumb extends StatelessWidget {
  const NewsThumb({
    super.key,
    required this.url,
    required this.size,
    required this.radius,
    this.tone = PqTone.accent,
  });

  final String? url;
  final double size;
  final double radius;
  final PqTone tone;

  @override
  Widget build(BuildContext context) {
    final src = imgThumb(url, w: (size * 3).round());
    final fallback = PqIconTile(PqIcons.newspaper,
        tone: tone, size: size, radius: radius, iconSize: 26);
    if (src == null) return fallback;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        src,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => fallback,
        frameBuilder: (_, child, frame, sync) => sync || frame != null
            ? child
            : PqSkeleton(width: size, height: size, radius: radius),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/img.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/news.dart';
import '../../widgets/pq_states.dart';
import 'news_home_block.dart' show NewsThumb;

final newsListProvider = FutureProvider<List<NewsItem>>((ref) {
  return ref.watch(apiProvider).news.list();
});
final newsDetailProvider = FutureProvider.family<NewsDetail, int>((ref, id) {
  return ref.watch(apiProvider).news.get(id);
});

void _back(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go('/app');
  }
}

/// Список новостей (макет NewsList): верхняя панель, первая новость — крупной
/// карточкой с обложкой 190, остальные — строками в общей карточке.
class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final v = ref.watch(newsListProvider);
    Future<void> refresh() async {
      try {
        ref.invalidate(newsListProvider);
        await ref.read(newsListProvider.future);
      } catch (_) {}
    }

    return PqScreen(
      child: Column(children: [
        PqTopBar(
          title: l.newsTitle,
          backLabel: l.newsBack,
          onBack: () => _back(context),
        ),
        Expanded(
          child: PqAsync<List<NewsItem>>(
            value: v,
            onRetry: () => ref.invalidate(newsListProvider),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            data: (items) => PqRefresh(
              onRefresh: refresh,
              child: items.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        PqEmptyState(
                          icon: PqIcons.newspaper,
                          title: l.newsEmpty,
                          message: l.newsEmptyText,
                        ),
                      ],
                    )
                  : ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                      children: [
                        PqAnimate(
                          delay: PqMotion.staggerDelay(0),
                          child: _HeroCard(item: items.first),
                        ),
                        if (items.length > 1) ...[
                          const SizedBox(height: 16),
                          PqAnimate(
                            delay: PqMotion.staggerDelay(1),
                            child: PqListCard(children: [
                              for (final n in items.skip(1)) _NewsRow(item: n),
                            ]),
                          ),
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.item});

  final NewsItem item;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final cover = imgThumb(item.coverUrl, w: 900);
    return PqPressable(
      onTap: () => context.push('/app/news/${item.id}'),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: pq.border),
          boxShadow: pq.cardShadow,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          if (cover != null)
            SizedBox(
              height: 190,
              child: Image.network(
                cover,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => ColoredBox(color: pq.surfaceAlt),
                frameBuilder: (_, child, frame, sync) => sync || frame != null
                    ? child
                    : const PqSkeleton(height: 190, radius: 0),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _NewsMeta(item: item, dateStyle: PqText.caption(c: pq.textMuted)),
              const SizedBox(height: 8),
              Text(item.title,
                  style: PqText.heading(20, FontWeight.w700, height: 1.3, c: pq.text)),
            ]),
          ),
        ]),
      ),
    );
  }
}

/// Капсула «Важное» (если новость закреплена) + дата и время чтения.
class _NewsMeta extends StatelessWidget {
  const _NewsMeta({required this.item, required this.dateStyle, this.readMin});

  final NewsItem item;
  final TextStyle dateStyle;
  final int? readMin;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final date = item.publishedAt == null || item.publishedAt!.isEmpty
        ? null
        : formatDate(item.publishedAt!);
    final meta = [
      if (date != null) date,
      if (readMin != null) l.newsReadTime(readMin!),
    ].join(' · ');
    return Row(children: [
      if (item.pinned) ...[
        PqPill(l.newsPinned, tone: PqTone.accent),
        const SizedBox(width: 8),
      ],
      Flexible(child: Text(meta, style: dateStyle)),
    ]);
  }
}

class _NewsRow extends StatelessWidget {
  const _NewsRow({required this.item});

  final NewsItem item;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final date = item.publishedAt == null || item.publishedAt!.isEmpty
        ? null
        : formatDate(item.publishedAt!);
    return PqPressable(
      onTap: () => context.push('/app/news/${item.id}'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          NewsThumb(url: item.coverUrl, size: 64, radius: 14),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (date != null) ...[
                Text(
                  item.pinned ? '${context.l10n.newsPinned} · $date' : date,
                  style: PqText.caption(c: pq.textMuted),
                ),
                const SizedBox(height: 4),
              ],
              Text(item.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.rowTitle(c: pq.text)),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ── Статья (макет NewsArticle) ──────────────────────────────────────────

class NewsDetailScreen extends ConsumerWidget {
  const NewsDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(newsDetailProvider(id));
    final n = v.asData?.value;
    if (n != null) {
      return _Article(n: n);
    }
    final l = context.l10n;
    return PqScreen(
      child: Column(children: [
        PqTopBar(
          title: l.newsDetailTitle,
          backLabel: l.newsBackToList,
          onBack: () => _back(context),
        ),
        Expanded(
          child: PqAsync<NewsDetail>(
            value: v,
            onRetry: () => ref.invalidate(newsDetailProvider(id)),
            data: (_) => const SizedBox.shrink(),
          ),
        ),
      ]),
    );
  }
}

class _Article extends StatelessWidget {
  const _Article({required this.n});

  final NewsDetail n;

  static const _heroH = 260.0;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final top = MediaQuery.paddingOf(context).top;
    final cover = imgThumb(n.coverUrl, w: 1000);
    final words = n.body.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
    final readMin = words == 0 ? null : (words / 180).ceil();

    final content = _ArticleBody(n: n, readMin: readMin);

    if (cover == null) {
      // Без обложки — обычная верхняя панель и текст статьи.
      return PqScreen(
        child: Column(children: [
          PqTopBar(
            title: l.newsDetailTitle,
            backLabel: l.newsBackToList,
            onBack: () => _back(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
              child: content,
            ),
          ),
        ]),
      );
    }

    // Обложка уходит под статус-бар, поэтому без SafeArea сверху.
    return Scaffold(
      backgroundColor: pq.bg,
      body: DefaultTextStyle(
        style: PqText.body(c: pq.text),
        child: Stack(children: [
          ListView(
            padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 16),
            children: [
              SizedBox(
                height: _heroH + top,
                child: Stack(fit: StackFit.expand, children: [
                  Image.network(
                    cover,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => ColoredBox(color: pq.surfaceAlt),
                    frameBuilder: (_, child, frame, sync) => sync || frame != null
                        ? child
                        : PqSkeleton(height: _heroH + top, radius: 0),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x59000000), Color(0x00000000)],
                        stops: [0, .4],
                      ),
                    ),
                  ),
                ]),
              ),
              // margin-top: -24 — лист текста наезжает на обложку.
              Transform.translate(
                offset: const Offset(0, -24),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  decoration: BoxDecoration(
                    color: pq.bg,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: content,
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: top + 16,
            child: PqIconButton(
              icon: PqIcons.chevronLeft,
              label: l.newsBackToList,
              onTap: () => _back(context),
              background: const Color(0x73000000),
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({required this.n, required this.readMin});

  final NewsDetail n;
  final int? readMin;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final para = PqText.text(16, FontWeight.w400, height: 1.6, c: pq.textSecondary);
    return PqStagger(gap: 16, children: [
      _NewsMeta(item: n, readMin: readMin, dateStyle: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
      Text(n.title,
          style: PqText.heading(26, FontWeight.w700, height: 1.25, c: pq.text)),
      if (n.summary != null && n.summary!.trim().isNotEmpty)
        Text(n.summary!.trim(), style: para),
      ..._blocks(context, n.body, para),
    ]);
  }

  /// Простая разметка текста: абзацы через пустую строку, «## » — подзаголовок,
  /// строки с «- », «• », «* » — маркированный список.
  List<Widget> _blocks(BuildContext context, String body, TextStyle para) {
    final pq = context.pq;
    final out = <Widget>[];
    for (final raw in body.replaceAll('\r\n', '\n').split(RegExp(r'\n\s*\n'))) {
      final block = raw.trim();
      if (block.isEmpty) continue;
      final lines = block.split('\n').map((e) => e.trim()).toList();
      final heading = RegExp(r'^#{1,6}\s+');
      final bullet = RegExp(r'^([-•*])\s+');
      if (lines.length == 1 && heading.hasMatch(lines.first)) {
        out.add(Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(lines.first.replaceFirst(heading, ''),
              style: PqText.heading(20, FontWeight.w700, c: pq.text)),
        ));
      } else if (lines.every(bullet.hasMatch)) {
        out.add(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < lines.length; i++)
            Padding(
              // li { margin-bottom: 8px } — и после последнего пункта тоже.
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 20,
                  child: Text('•',
                      style: PqText.text(16, FontWeight.w400, height: 1.5, c: pq.textSecondary)),
                ),
                Expanded(
                  child: Text(lines[i].replaceFirst(bullet, ''),
                      style: PqText.text(16, FontWeight.w400,
                          height: 1.5, c: pq.textSecondary)),
                ),
              ]),
            ),
        ]));
      } else {
        out.add(Text(lines.join('\n'), style: para));
      }
    }
    return out;
  }
}

/// Новостная статья (список). Простая модель без freezed — только чтение с бэка.
class NewsItem {
  const NewsItem({
    required this.id,
    required this.title,
    this.summary,
    this.coverUrl,
    this.pinned = false,
    this.views = 0,
    this.publishedAt,
  });

  final int id;
  final String title;
  final String? summary;
  final String? coverUrl;
  final bool pinned;
  final int views;
  final String? publishedAt;

  factory NewsItem.fromJson(Map<String, dynamic> j) => NewsItem(
        id: (j['id'] as num).toInt(),
        title: j['title'] as String? ?? '',
        summary: j['summary'] as String?,
        coverUrl: j['coverUrl'] as String?,
        pinned: j['pinned'] as bool? ?? false,
        views: (j['views'] as num?)?.toInt() ?? 0,
        publishedAt: j['publishedAt'] as String?,
      );
}

class NewsDetail extends NewsItem {
  const NewsDetail({
    required super.id,
    required super.title,
    super.summary,
    super.coverUrl,
    super.pinned,
    super.views,
    super.publishedAt,
    required this.body,
    this.author,
  });

  final String body;
  final String? author;

  factory NewsDetail.fromJson(Map<String, dynamic> j) => NewsDetail(
        id: (j['id'] as num).toInt(),
        title: j['title'] as String? ?? '',
        summary: j['summary'] as String?,
        coverUrl: j['coverUrl'] as String?,
        pinned: j['pinned'] as bool? ?? false,
        views: (j['views'] as num?)?.toInt() ?? 0,
        publishedAt: j['publishedAt'] as String?,
        body: j['body'] as String? ?? '',
        author: j['author'] as String?,
      );
}

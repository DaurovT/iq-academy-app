/// Тип отложенной загрузки.
enum UploadKind { check, recipe }

/// Отложенная загрузка фото (чек/рецепт), переживающая перезапуск и офлайн.
/// Файлы копируются в постоянную папку, поэтому список путей стабилен.
class PendingUpload {
  PendingUpload({
    required this.id,
    required this.kind,
    required this.filePaths,
    required this.fields,
    required this.createdAt,
    this.attempts = 0,
    this.lastError,
  });

  final String id; // = idempotencyKey
  final UploadKind kind;
  final List<String> filePaths;
  final Map<String, String> fields; // doctorName и т.п. для рецептов
  final String createdAt;
  int attempts;
  String? lastError;

  Map<String, dynamic> toJson() => {
        'id': id,
        'kind': kind.name,
        'filePaths': filePaths,
        'fields': fields,
        'createdAt': createdAt,
        'attempts': attempts,
        'lastError': lastError,
      };

  factory PendingUpload.fromJson(Map<String, dynamic> j) => PendingUpload(
        id: j['id'] as String,
        kind: UploadKind.values.byName(j['kind'] as String),
        filePaths: (j['filePaths'] as List).cast<String>(),
        fields: (j['fields'] as Map).cast<String, String>(),
        createdAt: j['createdAt'] as String,
        attempts: (j['attempts'] as int?) ?? 0,
        lastError: j['lastError'] as String?,
      );
}

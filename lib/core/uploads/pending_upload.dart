/// Тип отложенной загрузки.
enum UploadKind { check, recipe }

/// Состояние элемента очереди (макет ChecksQueue).
enum UploadState {
  /// Ждёт отправки: нет сети или сервер временно недоступен — повторим сами.
  waiting,

  /// Сервер отказал по существу (4xx) — повтор не поможет: «Удалить» / «Переснять».
  rejected,

  /// Файлов фото больше нет (например, iOS сменил папку приложения при
  /// обновлении) — отправлять нечего: «Удалить» / «Переснять».
  missing,
}

/// Отложенная загрузка фото (чек/рецепт), переживающая перезапуск и офлайн.
///
/// В [filePaths] на мобильных хранятся только ИМЕНА файлов в папке очереди:
/// iOS меняет путь контейнера приложения при обновлении, и абсолютный путь
/// после этого указывает в никуда. Полный путь собирает хранилище.
class PendingUpload {
  PendingUpload({
    required this.id,
    required this.kind,
    required this.filePaths,
    required this.fields,
    required this.createdAt,
    this.attempts = 0,
    this.lastError,
    this.state = UploadState.waiting,
  });

  final String id; // = idempotencyKey
  final UploadKind kind;
  final List<String> filePaths;
  final Map<String, String> fields; // doctorName и т.п. для рецептов
  final String createdAt;
  int attempts;
  String? lastError;
  UploadState state;

  /// Повтор не поможет — нужно действие человека.
  bool get stuck => state != UploadState.waiting;

  Map<String, dynamic> toJson() => {
    'id': id,
    'kind': kind.name,
    'filePaths': filePaths,
    'fields': fields,
    'createdAt': createdAt,
    'attempts': attempts,
    'lastError': lastError,
    'state': state.name,
  };

  factory PendingUpload.fromJson(Map<String, dynamic> j) => PendingUpload(
    id: j['id'] as String,
    kind: UploadKind.values.byName(j['kind'] as String),
    filePaths: (j['filePaths'] as List).cast<String>(),
    fields: (j['fields'] as Map).cast<String, String>(),
    createdAt: j['createdAt'] as String,
    attempts: (j['attempts'] as int?) ?? 0,
    lastError: j['lastError'] as String?,
    state:
        UploadState.values.where((s) => s.name == j['state']).firstOrNull ??
        UploadState.waiting,
  );
}

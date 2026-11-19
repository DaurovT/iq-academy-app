import 'package:go_router/go_router.dart';

/// Смещение id ваучеров из очереди в «Мои награды» (сервер: client.py `_QUEUE_VOUCHER_OFFSET`).
const kQueueVoucherOffset = 2000000000;

/// Переход по ссылке из уведомления или пуша.
///
/// Экраны вкладок (с нижним меню) живут внутри ShellRoute. Если открыть такой
/// экран через `push` поверх полноэкранного (например, «Уведомлений»), go_router
/// создаёт вторую оболочку с тем же ключом навигатора — Flutter падает на
/// `!keyReservation.contains(key)`, и пользователь видит пустой экран.
/// Поэтому вкладки открываем через `go`, а полноэкранные — через `push`
/// (чтобы «назад» вернул туда, откуда пришли).
///
/// `go` заменяет всю историю, и на экране-карточке («Бланк №6971») системное
/// «назад» Android закрывало приложение. Поэтому для карточки сначала
/// открываем её список-родитель (`/app/recipes`), а карточку кладём сверху —
/// «назад» возвращает к списку.
void openAppLink(GoRouter router, String link) {
  final uri = Uri.parse(link);
  if (!_inShell(router, uri)) {
    router.push(link);
    return;
  }
  final parent = _shellParent(router, uri);
  if (parent == null) {
    router.go(link);
  } else {
    router.go(parent);
    router.push(link);
  }
}

bool _inShell(GoRouter router, Uri uri) => router.configuration
    .findMatch(uri)
    .matches
    .any((m) => m is ShellRouteMatch);

/// Ближайший родительский путь (без последних сегментов), который тоже экран
/// вкладки, — или null, если ссылка уже ведёт на корень вкладки.
String? _shellParent(GoRouter router, Uri uri) {
  final segs = uri.pathSegments.where((s) => s.isNotEmpty).toList();
  // /app/<вкладка> — корень, родителя нет.
  for (var n = segs.length - 1; n >= 2; n--) {
    final path = '/${segs.take(n).join('/')}';
    final m = router.configuration.findMatch(Uri.parse(path));
    if (m.isNotEmpty && _inShell(router, Uri.parse(path))) return path;
  }
  return null;
}

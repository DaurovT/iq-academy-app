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
void openAppLink(GoRouter router, String link) {
  final inShell = router.configuration
      .findMatch(Uri.parse(link))
      .matches
      .any((m) => m is ShellRouteMatch);
  if (inShell) {
    router.go(link);
  } else {
    router.push(link);
  }
}

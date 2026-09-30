import 'package:go_router/go_router.dart';

import '../../../features/pharmacist/voucher_screen.dart';
import '../../../features/pharmacist/wallet/voucher_archive_screen.dart';
import '../../../features/pharmacist/wallet/voucher_queue_screen.dart';
import '../../../features/pharmacist/wallet/voucher_shop_screen.dart';
import '../../../features/pharmacist/wallet/wallet_history_screen.dart';
import '../../../features/pharmacist/wallet_screen.dart';
import 'route_utils.dart';

/// Кошелёк (с нижним меню). Владелец — раздел «Кошелёк».
final walletShellRoutes = <RouteBase>[
  GoRoute(path: '/app/wallet', builder: (_, __) => const WalletScreen()),
];

/// Ваучер, история, обмен, очередь, архив — без нижнего меню.
final walletFullscreenRoutes = <RouteBase>[
  GoRoute(
      path: '/app/wallet/history',
      builder: (_, __) => const WalletHistoryScreen()),
  GoRoute(
      path: '/app/wallet/shop', builder: (_, __) => const VoucherShopScreen()),
  GoRoute(
      path: '/app/wallet/queue', builder: (_, __) => const VoucherQueueScreen()),
  GoRoute(
      path: '/app/wallet/archive',
      builder: (_, __) => const VoucherArchiveScreen()),
  GoRoute(
      path: '/app/wallet/voucher/:id',
      builder: (_, s) => VoucherScreen(id: intParam(s, 'id'))),
];

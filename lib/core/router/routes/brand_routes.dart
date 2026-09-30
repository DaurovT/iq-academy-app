import 'package:go_router/go_router.dart';

import '../../../features/brand/brand_products_screen.dart';
import '../../../features/brand/brand_quests_screen.dart';
import '../../../features/brand/brands_screen.dart';
import '../../../features/brand/sales_log_screen.dart';
import 'route_utils.dart';

/// Бренд / продукт-оунер (в макетах 1.2 нет — прежние экраны).
final brandShellRoutes = <RouteBase>[
  GoRoute(path: '/app/brand/quests', builder: (_, __) => const BrandQuestsScreen()),
  GoRoute(
      path: '/app/brand/quests/:id',
      builder: (_, s) => BrandQuestDetailScreen(id: intParam(s, 'id'))),
  GoRoute(path: '/app/brand/products', builder: (_, __) => const BrandProductsScreen()),
  GoRoute(
      path: '/app/brand/products/:id',
      builder: (_, s) => BrandProductDetailScreen(id: intParam(s, 'id'))),
  GoRoute(path: '/app/brand/brands', builder: (_, __) => const BrandsScreen()),
  GoRoute(
      path: '/app/brand/brands/:id',
      builder: (_, s) => BrandDetailScreen(id: intParam(s, 'id'))),
  GoRoute(path: '/app/brand/logs', builder: (_, __) => const SalesLogScreen()),
];

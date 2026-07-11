import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/brand.dart';

final brandDashboardProvider = FutureProvider<BrandDashboard>((ref) {
  return ref.watch(apiProvider).brand.dashboard();
});

final brandQuestsProvider = FutureProvider<List<BrandQuest>>((ref) {
  return ref.watch(apiProvider).brand.quests();
});

final brandQuestProvider = FutureProvider.family<BrandQuest, int>((ref, id) {
  return ref.watch(apiProvider).brand.quest(id);
});

final brandProductsProvider = FutureProvider<List<BrandProduct>>((ref) {
  return ref.watch(apiProvider).brand.products();
});

final brandProductProvider = FutureProvider.family<BrandProduct, int>((ref, id) {
  return ref.watch(apiProvider).brand.product(id);
});

final brandsProvider = FutureProvider<List<BrandInfo>>((ref) {
  return ref.watch(apiProvider).brand.brands();
});

final brandInfoProvider = FutureProvider.family<BrandInfo, int>((ref, id) {
  return ref.watch(apiProvider).brand.brandInfo(id);
});

final salesLogProvider = FutureProvider.family<List<SalesLogRow>, int?>((ref, questId) {
  return ref.watch(apiProvider).brand.salesLog(questId);
});

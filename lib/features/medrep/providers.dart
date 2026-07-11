import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/medrep.dart';

final medrepMetricsProvider = FutureProvider<MedrepMetrics>((ref) {
  return ref.watch(apiProvider).medrep.metrics();
});

final portfolioProvider = FutureProvider<List<PortfolioPharmacist>>((ref) {
  return ref.watch(apiProvider).medrep.portfolio();
});

final pharmacistDetailProvider =
    FutureProvider.family<PharmacistDetail, int>((ref, telegramId) {
  return ref.watch(apiProvider).medrep.pharmacist(telegramId);
});

final medrepQuestsProvider = FutureProvider<List<MedrepQuest>>((ref) {
  return ref.watch(apiProvider).medrep.quests();
});

/// Лидерборд по метрике: 'checks' | 'pharm' | 'quests'.
final leaderboardProvider =
    FutureProvider.family<Leaderboard, String>((ref, metric) {
  return ref.watch(apiProvider).medrep.leaderboard(metric);
});

final referralsProvider = FutureProvider<List<PendingReferral>>((ref) {
  return ref.watch(apiProvider).medrep.pendingReferrals();
});

final companiesProvider = FutureProvider<List<Company>>((ref) {
  return ref.watch(apiProvider).medrep.companies();
});

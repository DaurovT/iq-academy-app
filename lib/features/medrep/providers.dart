import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/medrep.dart';

/// Метрики медпреда за период: 'all' | '30' | '7'.
final medrepMetricsProvider =
    FutureProvider.family<MedrepMetrics, String>((ref, period) {
  String? dateFrom;
  if (period != 'all') {
    final days = period == '7' ? 7 : 30;
    final from = DateTime.now().subtract(Duration(days: days));
    dateFrom = '${from.year.toString().padLeft(4, '0')}-'
        '${from.month.toString().padLeft(2, '0')}-'
        '${from.day.toString().padLeft(2, '0')}';
  }
  return ref.watch(apiProvider).medrep.metrics(dateFrom: dateFrom);
});

/// Реферальная ссылка медпреда для привязки провизоров.
final medrepReflinkProvider = FutureProvider<String>((ref) {
  return ref.watch(apiProvider).medrep.reflink();
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

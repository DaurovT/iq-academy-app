import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/quest.dart';
import '../../core/models/wallet.dart';
import '../../core/models/check.dart';
import '../../core/models/learn.dart';

// ── Квесты ──
final questsListProvider =
    FutureProvider.family<List<Quest>, QuestTarget?>((ref, target) {
  return ref.watch(apiProvider).quests.list(target);
});

final questDetailProvider =
    FutureProvider.family<QuestDetail, int>((ref, id) {
  return ref.watch(apiProvider).quests.get(id);
});

final questParticipationsProvider =
    FutureProvider<List<QuestParticipation>>((ref) {
  return ref.watch(apiProvider).quests.participations();
});

// ── Кошелёк ──
final walletProvider = FutureProvider<Wallet>((ref) {
  return ref.watch(apiProvider).wallet.get();
});

final walletTxnsProvider = FutureProvider<List<WalletTxn>>((ref) {
  return ref.watch(apiProvider).wallet.transactions();
});

final availableVouchersProvider =
    FutureProvider<List<VoucherDenomination>>((ref) {
  return ref.watch(apiProvider).wallet.availableVouchers();
});

final myVouchersProvider = FutureProvider<List<IssuedVoucher>>((ref) {
  return ref.watch(apiProvider).wallet.myVouchers();
});

final pendingAccrualsProvider = FutureProvider<List<PendingAccrual>>((ref) {
  return ref.watch(apiProvider).wallet.pendingAccruals();
});

// ── Чеки ──
final checksProvider = FutureProvider<List<Check>>((ref) {
  return ref.watch(apiProvider).checks.mine();
});

final checkDetailProvider = FutureProvider.family<CheckDetail, int>((ref, id) {
  return ref.watch(apiProvider).checks.get(id);
});

// ── Обучение ──
final coursesProvider = FutureProvider<List<Course>>((ref) {
  return ref.watch(apiProvider).catalog.courses();
});

final courseDetailProvider =
    FutureProvider.family<CourseDetail, int>((ref, id) {
  return ref.watch(apiProvider).catalog.course(id);
});

/// Квиз урока. Ключ семейства — (courseId, lessonId).
final quizProvider =
    FutureProvider.family<Quiz, (int, int)>((ref, key) {
  return ref.watch(apiProvider).catalog.quiz(key.$1, key.$2);
});

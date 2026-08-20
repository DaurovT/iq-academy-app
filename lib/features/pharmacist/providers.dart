import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/models/quest.dart';
import '../../core/models/wallet.dart';
import '../../core/models/check.dart';
import '../../core/models/learn.dart';

// ── Квесты ──
// Фильтруем по target и на клиенте: фармацевт (checks) не должен видеть
// врачебные квесты (recipes) и наоборот, даже если бэкенд вернёт все.
final questsListProvider =
    FutureProvider.family<List<Quest>, QuestTarget?>((ref, target) async {
  final list = await ref.watch(apiProvider).quests.list(target);
  if (target == null) return list;
  return list.where((q) => q.target == target).toList();
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
// Курсы фильтруются по активной роли, чтобы фармацевт не видел врачебные
// уроки и наоборот.
final coursesProvider = FutureProvider<List<Course>>((ref) {
  final role = ref.watch(authControllerProvider).asData?.value.activeRole;
  return ref.watch(apiProvider).catalog.courses(role);
});

final courseDetailProvider =
    FutureProvider.family<CourseDetail, int>((ref, id) {
  final role = ref.watch(authControllerProvider).asData?.value.activeRole;
  return ref.watch(apiProvider).catalog.course(id, role);
});

/// Квиз урока. Ключ семейства — (courseId, lessonId).
final quizProvider =
    FutureProvider.family<Quiz, (int, int)>((ref, key) {
  return ref.watch(apiProvider).catalog.quiz(key.$1, key.$2);
});

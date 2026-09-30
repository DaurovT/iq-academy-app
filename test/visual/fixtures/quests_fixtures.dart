// Данные макетов раздела «Квесты» (Quests, QuestsDone, QuestDetail, QuestSearch).
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/core/models/quest.dart';
import 'package:platform_app/features/pharmacist/providers.dart';
import 'package:platform_app/features/shared/providers.dart';

class _PharmacistAuth extends AuthController {
  @override
  Future<AuthState> build() async =>
      const AuthState(activeRole: Role.pharmacist);
}

const questMagnerot = Quest(
  id: 1,
  name: 'Магнерот N50',
  description: 'Все аптеки · без лимита',
  status: QuestStatus.active,
  rewardType: RewardType.iqc,
  target: QuestTarget.checks,
  prizeIqc: 60,
  progress: .6,
  completedCount: 6,
  startDate: '2026-06-01',
  endDate: '2026-06-30',
);

const questDoritricin = Quest(
  id: 2,
  name: 'Доритрицин N10',
  description: '🛒 Korzinka — 100 000 сум',
  status: QuestStatus.active,
  rewardType: RewardType.voucher,
  target: QuestTarget.checks,
  prizeIqc: 100000,
  progress: 0,
  completedCount: 0,
  brand: 'Только аптеки Андижана',
  startDate: '2026-06-17',
  endDate: '2026-07-18',
);

Quest _other(int id, String drug) => Quest(
  id: id,
  name: '$drug N20',
  description: '',
  status: QuestStatus.active,
  rewardType: RewardType.iqc,
  target: QuestTarget.checks,
  prizeIqc: 30,
  progress: 0,
  completedCount: 0,
  drug: drug,
);

QuestDetail detailOf(Quest q, {String? brand}) => QuestDetail(
  id: q.id,
  name: q.name,
  description: q.description,
  status: q.status,
  rewardType: q.rewardType,
  target: q.target,
  prizeIqc: q.prizeIqc,
  progress: q.progress,
  completedCount: q.completedCount,
  brand: brand ?? q.brand,
  drug: q.drug,
  mechanics: const [],
  startDate: q.startDate ?? '2026-06-01',
  endDate: q.endDate,
  repeatability: 'unlimited',
  participants: 95,
  topSellers: const [],
  goal: 10,
  myCount: q.completedCount,
  rewardReceived: false,
);

/// Общие подмены: роль, колокольчик без непрочитанного, квесты, история.
List questsOverrides({
  List<Quest> quests = const [questMagnerot, questDoritricin],
  List<QuestParticipation> participations = const [],
  QuestDetail Function(int id)? detail,
}) => [
  authControllerProvider.overrideWith(_PharmacistAuth.new),
  unreadCountProvider.overrideWith((ref) async => 0),
  questsListProvider.overrideWith((ref, target) async => quests),
  questParticipationsProvider.overrideWith((ref) async => participations),
  questDetailProvider.overrideWith(
    (ref, id) async =>
        detail?.call(id) ??
        detailOf(
          quests.firstWhere((q) => q.id == id, orElse: () => questMagnerot),
        ),
  ),
];

const doneParticipations = [
  QuestParticipation(
    questId: 7,
    questName: 'Цинкорот N50 (июнь)',
    completedAt: '2026-07-01T10:00:00',
    rewardType: RewardType.iqc,
    rewardIqc: 60,
    rewardReceived: true,
  ),
];

const searchParticipations = [
  QuestParticipation(
    questId: 8,
    questName: 'Магнерот N50 (май)',
    completedAt: '2026-05-31T10:00:00',
    rewardType: RewardType.iqc,
    rewardIqc: 60,
    rewardReceived: true,
  ),
];

final searchQuests = [
  questMagnerot.copyWith(drug: 'Магнерот'),
  questDoritricin.copyWith(drug: 'Доритрицин'),
  _other(3, 'Цинкорот'),
  _other(4, 'Бронхипрет'),
  _other(5, 'Канефрон'),
];

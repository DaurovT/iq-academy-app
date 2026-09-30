// Фикстуры визуальной сверки раздела «Роль медпреда»: данные — как в макетах
// MedHome / MedPharmacists / MedPharmacist / MedPhChecks / MedRating / MedQuests /
// MedQuestDetail / MedPending / MedCompanies / MedCompany / MedReward.
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/account.dart';
import 'package:platform_app/core/models/check.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/core/models/medrep.dart';
import 'package:platform_app/features/medrep/medrep_widgets.dart';
import 'package:platform_app/features/medrep/providers.dart';
import 'package:platform_app/features/shared/providers.dart';

class _Auth extends AuthController {
  @override
  Future<AuthState> build() async => const AuthState(
        account: Account(
          id: 1,
          phone: '+998900000000',
          fullName: 'Дауров',
          language: Language.ru,
          roles: [Role.medrep],
        ),
        activeRole: Role.medrep,
      );
}

/// В макетах главной нет пункта «Врачи» — прячем модуль.
class _Modules extends AppModulesController {
  @override
  Future<AppModules> build() async => const AppModules({
        'medrep_doctors': (visible: false, hiddenRoles: <String>[]),
      });
}

/// Портфель: 17 провизоров, 6 сетей, 8 аптек (id подобраны так, чтобы
/// градиенты аватаров совпали с макетами: id % 5).
const portfolio = [
  PortfolioPharmacist(telegramId: 100, name: 'Зиёда Азизова', shop: 'MARXAMAT MED FARM №4', city: 'Ташкент', checks: 89, quests: 0),
  PortfolioPharmacist(telegramId: 101, name: 'Ботир Каримов', shop: 'GRAND PHARM №1', city: 'Самарканд', checks: 66, quests: 2),
  PortfolioPharmacist(telegramId: 102, name: 'Дилфуза Олимова', shop: 'JOY MED №2', city: 'Ташкент', checks: 60, quests: 0),
  PortfolioPharmacist(telegramId: 103, name: 'Алишер Хакимов', shop: 'DORIXONA MIX', city: 'Бухара', checks: 41, quests: 0),
  PortfolioPharmacist(telegramId: 104, name: 'Малика Саидова', shop: 'NOVA FARM', city: 'Ташкент', checks: 38, quests: 1),
  PortfolioPharmacist(telegramId: 105, name: 'Умид Рахимов', shop: 'LIFE PHARM', city: 'Навои', checks: 27, quests: 0),
  PortfolioPharmacist(telegramId: 109, name: 'Дилноза Рахимова', shop: 'GRAND PHARM №1', city: 'Самарканд', checks: 28, quests: 0),
  PortfolioPharmacist(telegramId: 107, name: 'Нодира Юсупова', shop: 'DORIXONA MIX', city: 'Бухара', checks: 22, quests: 0),
  PortfolioPharmacist(telegramId: 108, name: 'Сардор Турсунов', shop: 'GRAND PHARM №3', city: 'Самарканд', checks: 18, quests: 0),
  PortfolioPharmacist(telegramId: 106, name: 'Жасур Алиев', shop: 'JOY MED №5', city: 'Ташкент', checks: 14, quests: 0),
  PortfolioPharmacist(telegramId: 110, name: 'Шерзод Каримов', shop: 'NOVA FARM', city: 'Ташкент', checks: 9, quests: 0),
  PortfolioPharmacist(telegramId: 111, name: 'Гавхар Ниязова', shop: 'NOVA FARM', city: 'Ташкент', checks: 5, quests: 0),
  PortfolioPharmacist(telegramId: 112, name: 'Азиз Раҳимов', shop: 'LIFE PHARM', city: 'Навои', checks: 14, quests: 0),
  PortfolioPharmacist(telegramId: 113, name: 'Феруза Каримова', shop: 'DORIXONA MIX', city: 'Бухара', checks: 0, quests: 0),
  PortfolioPharmacist(telegramId: 114, name: 'Санжар Олимов', shop: 'DORIXONA MIX', city: 'Бухара', checks: 0, quests: 0),
  PortfolioPharmacist(telegramId: 115, name: 'Лола Тошева', shop: 'LIFE PHARM', city: 'Навои', checks: 0, quests: 0),
  PortfolioPharmacist(telegramId: 116, name: 'Отабек Назаров', shop: 'LIFE PHARM', city: 'Навои', checks: 0, quests: 0),
];


const metrics = MedrepMetrics(
  mode: AttributionMode.shared,
  pharmCount: 17,
  checksCount: 206,
  approvedPacksSum: 266,
  questsDone: 0,
);

Leaderboard board({int myRank = 4}) => Leaderboard(
      mode: AttributionMode.shared,
      metric: 'checks',
      myRank: myRank,
      company: 'Bionorica SE',
      items: [
        const LeaderRow(rank: 1, name: 'Дилфуза Б.', value: 471),
        const LeaderRow(rank: 2, name: 'Махфуза Б.', value: 314),
        const LeaderRow(rank: 3, name: 'Лобар Маматова', value: 271),
        if (myRank == 4)
          const LeaderRow(rank: 4, name: 'Дауров Т.', value: 206, isMe: true),
        LeaderRow(rank: myRank == 4 ? 5 : 4, name: 'Абдурахмон', value: 193),
        LeaderRow(rank: myRank == 4 ? 6 : 5, name: 'ШГБ', value: 60),
        for (var i = myRank == 4 ? 7 : 6; i <= 32; i++)
          LeaderRow(rank: i, name: 'Медпред $i', value: 40 - i),
      ],
    );

final pharmacist = PharmacistDetail(
  telegramId: 100,
  name: 'Зиёда Азизова',
  shop: 'MARXAMAT MED FARM №4',
  city: 'Ташкент',
  checks: 89,
  quests: 0,
  approvedPacks: 88,
  lastActivity: '2026-06-29',
  recentChecks: const [
    RecentCheck(id: 23131, createdAt: '2026-06-29T14:05:00', status: CheckStatus.approved, packs: 1),
    RecentCheck(id: 23089, createdAt: '2026-06-28T11:22:00', status: CheckStatus.approved, packs: 1),
    RecentCheck(id: 23045, createdAt: '2026-06-27T16:40:00', status: CheckStatus.approved, packs: 2),
    RecentCheck(id: 22990, createdAt: '2026-06-25T10:05:00', status: CheckStatus.pending, packs: 1),
    RecentCheck(id: 22871, createdAt: '2026-06-21T12:02:00', status: CheckStatus.rejected, packs: 1),
    RecentCheck(id: 22803, createdAt: '2026-06-19T18:40:00', status: CheckStatus.approved, packs: 1),
  ],
);

MedrepQuestParticipant _p(int id, String name, {int done = 0, int collected = 0, required int packs}) =>
    MedrepQuestParticipant(
      telegramId: id,
      name: name,
      phone: '',
      shop: '',
      done: done,
      collected: collected,
      goal: 10,
      progress: collected / 10,
      perDrug: [MedrepQuestParticipantDrug(drug: 'Магнерот N50', got: packs, need: 10)],
    );

final quests = [
  MedrepQuest(
    id: 1,
    name: 'Магнерот N50',
    goal: 10,
    startDate: '2026-06-01',
    endDate: '2026-06-30',
    drugs: const [MedrepQuestDrug(drug: 'Магнерот N50', need: 300, got: 186)],
    empty: false,
    participants: [
      _p(100, 'Зиёда Азизова', done: 1, packs: 42),
      _p(101, 'Ботир Каримов', done: 1, packs: 35),
      _p(102, 'Дилфуза Олимова', done: 1, packs: 28),
      _p(104, 'Малика Саидова', collected: 8, packs: 21),
      _p(103, 'Алишер Хакимов', collected: 7, packs: 18),
      _p(105, 'Умид Рахимов', collected: 5, packs: 14),
      _p(109, 'Дилноза Рахимова', packs: 10),
      _p(107, 'Нодира Юсупова', packs: 8),
      _p(108, 'Сардор Турсунов', packs: 5),
      _p(106, 'Жасур Алиев', packs: 3),
      _p(110, 'Шерзод Каримов', packs: 2),
    ],
  ),
  MedrepQuest(
    id: 2,
    name: 'Доритрицин N10',
    goal: 10,
    startDate: '2026-06-17',
    endDate: '2026-07-18',
    drugs: const [MedrepQuestDrug(drug: 'Доритрицин N10', need: 170, got: 22)],
    empty: false,
    participants: [
      for (var i = 0; i < 4; i++) _p(100 + i, 'Провизор $i', collected: 5, packs: 5),
    ],
  ),
  MedrepQuest(
    id: 3,
    name: 'Цинкорот N50',
    goal: 10,
    startDate: '2026-05-15',
    endDate: '2026-06-15',
    drugs: const [MedrepQuestDrug(drug: 'Цинкорот N50', need: 240, got: 240)],
    empty: false,
    participants: [
      for (var i = 0; i < 9; i++) _p(100 + i, 'Провизор $i', done: 1, packs: 26),
    ],
  ),
];

const referrals = [
  PendingReferral(id: 101, name: 'Шахноза Нурматова', phone: '+998901112233', shop: 'SHIFO PLUS №3', requestedAt: '2026-06-30T10:00:00'),
  PendingReferral(id: 103, name: 'Отабек Юсупов', phone: '+998901112244', shop: 'MED LINE', requestedAt: '2026-06-29T09:00:00'),
  PendingReferral(id: 104, name: 'Гулнора Раджабова', phone: '+998901112255', shop: 'DORIXONA MIX', requestedAt: '2026-06-28T09:00:00'),
];

/// Все подмены раздела. [now] — «сегодня» макетов.
List<Override> medrepOverrides({
  List<PortfolioPharmacist> pf = portfolio,
  int myRank = 4,
  DateTime? now,
}) =>
    [
      authControllerProvider.overrideWith(_Auth.new),
      appModulesProvider.overrideWith(_Modules.new),
      unreadCountProvider.overrideWith((_) async => 0),
      medrepNowProvider.overrideWithValue(() => now ?? DateTime(2026, 6, 30, 12)),
      portfolioProvider.overrideWith((_) async => pf),
      medrepMetricsProvider.overrideWith((ref, p) async => metrics),
      medrepReflinkProvider
          .overrideWith((_) async => 'https://t.me/PharmQuestBot?start=ref_…'),
      leaderboardProvider.overrideWith((ref, m) async => board(myRank: myRank)),
      companiesProvider.overrideWith((_) async => const <Company>[]),
      medrepQuestsProvider.overrideWith((_) async => quests),
      pharmacistDetailProvider.overrideWith((ref, id) async => pharmacist),
      referralsProvider.overrideWith((_) async => referrals),
    ];

// Фикстуры визуальной сверки раздела «Роль врача»: данные — как в макетах
// DocHome / RxList / RxEmpty / RxPending / RxApproved / RxCredited /
// RxRejected / RxOcr.
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/account.dart';
import 'package:platform_app/core/models/check.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/core/models/news.dart';
import 'package:platform_app/core/models/quest.dart';
import 'package:platform_app/core/models/survey.dart';
import 'package:platform_app/core/models/wallet.dart';
import 'package:platform_app/features/doctor/providers.dart';
import 'package:platform_app/features/doctor/rx_common.dart';
import 'package:platform_app/features/news/news_screen.dart';
import 'package:platform_app/features/news/survey_home_block.dart';
import 'package:platform_app/features/pharmacist/providers.dart';
import 'package:platform_app/features/shared/providers.dart';

class _Auth extends AuthController {
  @override
  Future<AuthState> build() async => const AuthState(
        account: Account(
          id: 1,
          phone: '+998900000000',
          fullName: 'Дауров',
          language: Language.ru,
          roles: [Role.doctor],
        ),
        activeRole: Role.doctor,
      );
}

class _Modules extends AppModulesController {
  @override
  Future<AppModules> build() async => AppModules.empty;
}

const docQuest = Quest(
  id: 1,
  name: 'Доритрицин N10',
  description: 'Фақат Андижон дорихоналари учун',
  status: QuestStatus.active,
  rewardType: RewardType.voucher,
  target: QuestTarget.recipes,
  prizeIqc: 0,
  progress: 0,
  completedCount: 0,
);

const docQuestDetail = QuestDetail(
  id: 1,
  name: 'Доритрицин N10',
  description: 'Фақат Андижон дорихоналари учун',
  status: QuestStatus.active,
  rewardType: RewardType.voucher,
  target: QuestTarget.recipes,
  prizeIqc: 0,
  progress: 0,
  completedCount: 0,
  mechanics: [],
  startDate: '2026-06-01',
  repeatability: 'once',
  participants: 0,
  topSellers: [],
  goal: 10,
  myCount: 0,
  rewardReceived: false,
);

// ── Бланки ──
const rx1 = Recipe(
    id: 1,
    status: CheckStatus.approved,
    createdAt: '2026-06-08T13:16:00',
    photoCount: 1,
    drugs: [RecipeDrug(name: 'Pechak barglari', qty: 16)]);
const rx2 = Recipe(
    id: 2,
    status: CheckStatus.pending,
    createdAt: '2026-06-27T10:40:00',
    photoCount: 1,
    drugs: []);
const rx3Home = Recipe(
    id: 3,
    status: CheckStatus.rejected,
    createdAt: '2026-06-20T16:05:00',
    photoCount: 1,
    drugs: [],
    rejectReason: 'Нет печати и подписи');
const rx3List = Recipe(
    id: 3,
    status: CheckStatus.rejected,
    createdAt: '2026-06-20T16:05:00',
    photoCount: 1,
    drugs: [],
    rejectReason: 'Фото нечёткое');
const rx4 = Recipe(
    id: 4,
    status: CheckStatus.approved,
    createdAt: '2026-06-30T18:38:00',
    photoCount: 1,
    drugs: [RecipeDrug(name: 'Доритрицин N10', qty: 2)]);

const _photo = [Photo(id: 1, url: 'https://example.invalid/rx.jpg')];

const ocrText = 'DMED · Oddiy · Bemor tomonidan to\'lanadi\n'
    'Retsept ID: MAB109333\n'
    'Himoya kodi: 794-96\n'
    'Bemor: П*** З. А.\n'
    'Yosh: 59\n'
    'Muassasa: 10-sonli oilaviy poliklinika\n'
    '\n'
    '1. Retsept MAB109333\n'
    'Rp.: Pechak barglari, jidkiy ekstrakt\n'
    'Quruq ekstrakti (150 mg)\n'
    'Chiqarilish shakli: sirop\n'
    'D.S.: og\'iz orqali\n'
    'Bir martalik doza';

final details = <int, RecipeDetail>{
  1: const RecipeDetail(
      id: 1,
      status: CheckStatus.approved,
      createdAt: '2026-06-08T13:16:00',
      photoCount: 1,
      drugs: [RecipeDrug(name: 'Pechak barglari, жидкий экстракт', qty: 16)],
      photos: _photo,
      aiText: ocrText),
  2: const RecipeDetail(
      id: 2,
      status: CheckStatus.pending,
      createdAt: '2026-06-27T10:40:00',
      photoCount: 1,
      drugs: [],
      photos: _photo),
  3: const RecipeDetail(
      id: 3,
      status: CheckStatus.rejected,
      createdAt: '2026-06-20T16:05:00',
      photoCount: 1,
      drugs: [],
      rejectReason: 'На фото не видно печати и подписи',
      photos: _photo),
  4: const RecipeDetail(
      id: 4,
      status: CheckStatus.approved,
      createdAt: '2026-06-30T18:38:00',
      photoCount: 1,
      drugs: [RecipeDrug(name: 'Доритрицин N10', qty: 2)],
      photos: _photo,
      aiText: ocrText),
};

const _news = [
  NewsItem(
      id: 1,
      title: 'Новые правила оформления рецептов в 2026 году',
      publishedAt: '2026-07-10'),
];

const _survey = Survey(
  id: 1,
  questionType: 'single_choice',
  questionText: 'Какой препарат вы чаще всего рекомендуете при ОРВИ?',
  rewardIqc: 3,
  options: [SurveyOption(id: 1, text: 'Эргоферон')],
);

/// Провайдеры раздела врача. [credits] — начисления (API их пока не
/// отдаёт; в макетах бланк №1 — «Начислено +10 IQC»).
List<Override> doctorOverrides({
  List<Recipe> recipes = const [rx1, rx2, rx3Home],
  Map<int, int> credits = const {1: 10},
  int unread = 1,
}) =>
    [
      authControllerProvider.overrideWith(_Auth.new),
      appModulesProvider.overrideWith(_Modules.new),
      walletProvider.overrideWith(
          (_) async => const Wallet(balanceUzs: 0, balanceIqc: 10)),
      questsListProvider.overrideWith((_, __) async => const [docQuest]),
      questDetailProvider.overrideWith((_, __) async => docQuestDetail),
      recipesProvider.overrideWith((_) async => recipes),
      recipeDetailProvider.overrideWith((_, id) async => details[id]!),
      recipeCreditsProvider.overrideWithValue(credits),
      unreadCountProvider.overrideWith((_) async => unread),
      newsListProvider.overrideWith((_) async => _news),
      surveyNextProvider.overrideWith((_) async => _survey),
    ];

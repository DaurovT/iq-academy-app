// Фикстуры визуальной сверки раздела «Главная, новости, опросы»:
// данные — ровно как в макетах Refined / HomeNew / Surveys / NewsList / NewsArticle.
import 'dart:async';

import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/account.dart';
import 'package:platform_app/core/models/check.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/core/models/learn.dart';
import 'package:platform_app/core/models/news.dart';
import 'package:platform_app/core/models/quest.dart';
import 'package:platform_app/core/models/survey.dart';
import 'package:platform_app/core/models/wallet.dart';
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
          roles: [Role.pharmacist],
        ),
        activeRole: Role.pharmacist,
      );
}

class _Modules extends AppModulesController {
  @override
  Future<AppModules> build() async => AppModules.empty;
}

// ── Refined ──
const refinedQuest = Quest(
  id: 1,
  name: 'Доритрицин N10',
  description: 'Фақат Андижон дорихоналари учун',
  status: QuestStatus.active,
  rewardType: RewardType.voucher,
  target: QuestTarget.checks,
  prizeIqc: 0,
  progress: 0,
  completedCount: 0,
);

QuestDetail questDetail(Quest q, {required int goal}) => QuestDetail(
      id: q.id,
      name: q.name,
      description: q.description,
      status: q.status,
      rewardType: q.rewardType,
      target: q.target,
      prizeIqc: q.prizeIqc,
      progress: q.progress,
      completedCount: q.completedCount,
      mechanics: const [],
      startDate: '2026-06-01',
      repeatability: 'once',
      participants: 0,
      topSellers: const [],
      goal: goal,
      myCount: 0,
      rewardReceived: false,
    );

const refinedChecks = [
  Check(
      id: 23156,
      status: CheckStatus.approved,
      createdAt: '2026-06-29T18:15:00',
      photoCount: 1,
      drugs: [CheckDrug(name: 'Цинкорот №50', packs: 0)]),
  Check(
      id: 11203,
      status: CheckStatus.pending,
      createdAt: '2026-06-28T09:12:00',
      photoCount: 1,
      drugs: []),
  Check(
      id: 12594,
      status: CheckStatus.rejected,
      createdAt: '2026-01-15T19:54:00',
      photoCount: 1,
      drugs: [],
      rejectReason: 'Чек размыт или обрезан'),
];

const refinedNews = [
  NewsItem(
      id: 1,
      title: 'Новые правила оформления рецептов в 2026 году',
      coverUrl: 'https://example.invalid/cover.jpg',
      publishedAt: '2026-07-10'),
];

const surveyOptions = [
  SurveyOption(id: 1, text: 'Эргоферон'),
  SurveyOption(id: 2, text: 'Ингавирин'),
  SurveyOption(id: 3, text: 'Арбидол'),
  SurveyOption(id: 4, text: 'Кагоцел'),
  SurveyOption(id: 5, text: 'Другой — напишу свой'),
];

const refinedSurvey = Survey(
  id: 1,
  questionType: 'single_choice',
  questionText: 'Какой препарат вы чаще всего рекомендуете при ОРВИ?',
  rewardIqc: 3,
  options: surveyOptions,
);

const textSurvey = Survey(
  id: 2,
  questionType: 'open_text',
  questionText: 'Какой препарат вы рекомендуете при головной боли?',
  rewardIqc: 3,
);

const ratingSurvey = Survey(
  id: 3,
  questionType: 'star_rating',
  questionText: 'Оцените качество обслуживания в аптеке',
  rewardIqc: 3,
);

// ── HomeNew ──
const newCourse = Course(
  id: 7,
  title: 'Доритрицин (Андижан)',
  description: '',
  lessonCount: 2,
  progress: 0,
);

const newCourseDetail = CourseDetail(
  id: 7,
  title: 'Доритрицин (Андижан)',
  description: '',
  lessonCount: 2,
  progress: 0,
  lessons: [
    Lesson(id: 1, title: 'Видео', kind: 'video', durationMin: 6, completed: false, rewardIqc: 0),
    Lesson(id: 2, title: 'Тест', kind: 'quiz', durationMin: 3, completed: false, rewardIqc: 30),
  ],
);

const startQuest = Quest(
  id: 2,
  name: 'Магнерот N50',
  description: '',
  status: QuestStatus.active,
  rewardType: RewardType.iqc,
  target: QuestTarget.checks,
  prizeIqc: 10,
  progress: 0,
  completedCount: 0,
);

// ── NewsList / NewsArticle ──
const newsList = [
  NewsItem(
      id: 1,
      pinned: true,
      title: 'Новые правила оформления рецептов в 2026 году',
      coverUrl: 'https://example.invalid/cover.jpg',
      publishedAt: '2026-07-10'),
  NewsItem(
      id: 2,
      title: 'Новый курс: Доритрицин (Андижан) — +30 IQC за прохождение',
      publishedAt: '2026-06-18'),
  NewsItem(
      id: 3,
      title: 'Запустили «Супер Сапёр»: занимайте клетки и выигрывайте призы',
      publishedAt: '2026-06-15'),
  NewsItem(
      id: 4,
      title: 'Новые стандарты лечения респираторных инфекций',
      publishedAt: '2026-05-10'),
];

const newsArticle = NewsDetail(
  id: 1,
  title: 'Новые правила оформления рецептов в 2026 году',
  publishedAt: '2026-07-10',
  pinned: true,
  coverUrl: 'https://example.invalid/cover.jpg',
  summary:
      'С 2026 года меняется порядок оформления рецептов. Рассказываем главное, что нужно знать фармацевту и врачу.',
  body: '## Что изменилось\n\n'
      '- Рецепт выписывается в электронном виде через DMED\n'
      '- На рецепте должен быть защитный код\n'
      '- Срок действия указывается на бланке\n\n'
      'При отпуске препарата проверяйте защитный код рецепта. Если код не совпадает, рецепт считается недействительным.',
);

/// Провайдеры главной фармацевта.
List<Override> homeOverrides({
  int balance = 0,
  List<Check> checks = refinedChecks,
  List<Quest> quests = const [refinedQuest],
  Map<int, int> goals = const {1: 10, 2: 10},
  List<Course> courses = const [newCourse],
  List<NewsItem> news = refinedNews,
  Survey? survey = refinedSurvey,
  int unread = 3,
  bool walletLoading = false,
  bool refreshHangs = false,
}) {
  var walletCalls = 0;
  return [
    authControllerProvider.overrideWith(_Auth.new),
    appModulesProvider.overrideWith(_Modules.new),
    walletProvider.overrideWith((_) {
      walletCalls++;
      if (walletLoading || (refreshHangs && walletCalls > 1)) {
        return Completer<Wallet>().future;
      }
      return Future.value(Wallet(balanceUzs: 0, balanceIqc: balance));
    }),
    checksProvider.overrideWith((_) async => checks),
    questsListProvider.overrideWith((_, __) async => quests),
    questDetailProvider.overrideWith((_, id) async =>
        questDetail(quests.firstWhere((q) => q.id == id), goal: goals[id] ?? 10)),
    coursesProvider.overrideWith((_) async => courses),
    courseDetailProvider.overrideWith((_, id) async => newCourseDetail),
    quizProvider.overrideWith((_, key) async => Quiz(
          title: 'Тест',
          passScore: 4,
          questions: [
            for (var i = 1; i <= 5; i++)
              QuizQuestion(id: i, type: QuizQuestionType.values.first, text: 'Вопрос $i'),
          ],
        )),
    unreadCountProvider.overrideWith((_) async => unread),
    newsListProvider.overrideWith((_) async => news),
    surveyNextProvider.overrideWith((_) async => survey),
  ];
}

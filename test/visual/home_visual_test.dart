// Визуальная сверка раздела «Главная, новости, опросы» с макетами 1.2.
//   PQ_SHOTS_DIR=… flutter test --no-pub test/visual/home_visual_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/features/news/news_screen.dart';
import 'package:platform_app/features/news/survey_home_block.dart';
import 'package:platform_app/features/pharmacist/home_screen.dart';

import 'fixtures/home_fixtures.dart';
import 'pq_shot.dart';

Future<void> _scrollTo(WidgetTester t, Finder f) async {
  await t.scrollUntilVisible(f, 200, scrollable: find.byType(Scrollable).first);
  await t.pump();
}

void main() {
  pqShotBoth('Refined', (t, dark) => pqShot(t,
      name: 'Refined',
      dark: dark,
      height: 1628,
      screen: const PharmacistHome(),
      overrides: homeOverrides(),
      nav: pharmacistNav));

  pqShotBoth('HomeNew', (t, dark) => pqShot(t,
      name: 'HomeNew',
      dark: dark,
      height: 1110,
      screen: const PharmacistHome(),
      overrides: homeOverrides(
          checks: const [], quests: const [startQuest], unread: 0),
      nav: pharmacistNav));

  pqShotBoth('SkelHome', (t, dark) => pqShot(t,
      name: 'SkelHome',
      dark: dark,
      screen: const PharmacistHome(),
      overrides: homeOverrides(walletLoading: true, unread: 0),
      nav: pharmacistNav));

  pqShotBoth('PullRefresh', (t, dark) => pqShot(t,
      name: 'PullRefresh',
      dark: dark,
      screen: const PharmacistHome(),
      overrides: homeOverrides(refreshHangs: true, unread: 0),
      nav: pharmacistNav,
      before: (t) async {
        await t.pump(const Duration(seconds: 1));
        await t.fling(find.byType(Scrollable).first, const Offset(0, 400), 1000);
        for (var i = 0; i < 10; i++) {
          await t.pump(const Duration(milliseconds: 100));
        }
      }));

  pqShotBoth('SurveySheet', (t, dark) => pqShot(t,
      name: 'SurveySheet',
      dark: dark,
      screen: const PharmacistHome(),
      overrides: homeOverrides(unread: 0),
      nav: pharmacistNav,
      before: (t) async {
        await t.pump(const Duration(seconds: 1));
        final pick = find.text('Выберите вариант ответа');
        await _scrollTo(t, pick);
        await t.ensureVisible(pick);
        await t.pump();
        await t.tap(pick);
        await t.pump();
        await t.pump(const Duration(seconds: 1));
        await t.tap(find.text('Ингавирин'));
        await t.pump();
      }));

  pqShotBoth('Surveys', (t, dark) => pqShot(t,
      name: 'Surveys',
      dark: dark,
      height: 1140,
      screen: const _SurveysBoard(),
      overrides: homeOverrides(survey: textSurvey),
      before: (t) async {
        await t.pump(const Duration(seconds: 1));
        final stars = find.byWidgetPredicate((w) => w is PqIcon && w.icon == PqIcons.star);
        await t.tap(stars.at(7));
        await t.pump();
      }));

  pqShotBoth('NewsList', (t, dark) => pqShot(t,
      name: 'NewsList',
      dark: dark,
      screen: const NewsScreen(),
      overrides: homeOverrides(news: newsList)));

  pqShotBoth('NewsArticle', (t, dark) => pqShot(t,
      name: 'NewsArticle',
      dark: dark,
      height: 900,
      screen: const NewsDetailScreen(id: 1),
      overrides: [newsDetailProvider.overrideWith((_, __) async => newsArticle)]));
}

/// Витрина макета Surveys: три состояния карточки опроса на главной.
class _SurveysBoard extends StatelessWidget {
  const _SurveysBoard();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    Widget label(String s) => Text(s.toUpperCase(),
        style: PqText.text(12, FontWeight.w700, ls: 1, c: pq.textMuted));
    Widget scoped(Widget child, Object survey) => ProviderScope(
          overrides: [surveyNextProvider.overrideWith((_) async => survey as dynamic)],
          child: child,
        );
    return PqScreen(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const PqPageTitle('Опросы', subtitle: 'Карточка на главной. Три состояния'),
          const SizedBox(height: 24),
          label('Свободный ответ'),
          const SizedBox(height: 12),
          scoped(const SurveyHomeBlock(), textSurvey),
          const SizedBox(height: 36),
          label('Оценка'),
          const SizedBox(height: 12),
          scoped(const SurveyHomeBlock(), ratingSurvey),
          const SizedBox(height: 36),
          label('После отправки'),
          const SizedBox(height: 12),
          const SurveyThanksCard(reward: 3),
        ]),
      ),
    );
  }
}

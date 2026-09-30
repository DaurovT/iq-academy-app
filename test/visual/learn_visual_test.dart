import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/features/pharmacist/course_detail_screen.dart';
import 'package:platform_app/features/pharmacist/learn/quiz_result_views.dart';
import 'package:platform_app/features/pharmacist/learn_screen.dart';
import 'package:platform_app/features/pharmacist/lesson_view_screen.dart';
import 'package:platform_app/features/pharmacist/providers.dart';
import 'package:platform_app/features/pharmacist/quiz_screen.dart';
import 'package:platform_app/features/shared/providers.dart';

import 'fixtures/learn_fixtures.dart';
import 'pq_shot.dart';

List _overrides({
  List<dynamic> courses = const [learnCourse],
  String? description,
}) => [
  coursesProvider.overrideWith((_) async => courses.cast()),
  courseDetailProvider.overrideWith(
    (_, __) async =>
        description == null
            ? learnDetail()
            : learnDetail(description: description),
  ),
  quizProvider.overrideWith((_, __) async => learnQuiz),
  unreadCountProvider.overrideWith((_) async => 0),
];

void main() {
  pqShotBoth(
    'Learn',
    (t, dark) => pqShot(
      t,
      name: 'Learn',
      dark: dark,
      height: 880,
      screen: const LearnScreen(),
      overrides: _overrides(),
      nav: pharmacistNav,
      navIndex: 3,
    ),
  );

  pqShotBoth(
    'LearnEmpty',
    (t, dark) => pqShot(
      t,
      name: 'LearnEmpty',
      dark: dark,
      screen: const LearnScreen(),
      overrides: _overrides(courses: const []),
      nav: pharmacistNav,
      navIndex: 3,
    ),
  );

  pqShotBoth(
    'LearnNoResults',
    (t, dark) => pqShot(
      t,
      name: 'LearnNoResults',
      dark: dark,
      screen: const LearnScreen(),
      overrides: _overrides(courses: learnSearchCourses),
      nav: pharmacistNav,
      navIndex: 3,
      before: (t) async {
        await t.pump(const Duration(milliseconds: 100));
        await t.tap(
          find.byWidgetPredicate(
            (w) => w is PqPressable && w.semanticLabel == 'Поиск курсов',
          ),
        );
        await t.pump(const Duration(milliseconds: 400));
        await t.enterText(find.byType(TextField), 'Амоксиклав');
        await t.pump(const Duration(milliseconds: 100));
        await t.tap(find.text('Пройденные'));
        await t.pump(const Duration(milliseconds: 100));
      },
    ),
  );

  pqShotBoth(
    'Course',
    (t, dark) => pqShot(
      t,
      name: 'Course',
      dark: dark,
      screen: const CourseDetailScreen(id: 7),
      overrides: _overrides(),
    ),
  );

  pqShotBoth(
    'Lesson',
    (t, dark) => pqShot(
      t,
      name: 'Lesson',
      dark: dark,
      height: 920,
      screen: const LessonViewScreen(courseId: 7, lessonId: 11),
      overrides: _overrides(description: lessonText),
    ),
  );

  pqShotBoth(
    'Test',
    (t, dark) => pqShot(
      t,
      name: 'Test',
      dark: dark,
      screen: const QuizScreen(courseId: 7, lessonId: 12),
      overrides: _overrides(),
      before: (t) async {
        await t.pump(const Duration(milliseconds: 100));
        await t.tap(find.text('Инфекций верхних дыхательных путей'));
        await t.pump(const Duration(milliseconds: 100));
      },
    ),
  );

  pqShotBoth(
    'TestPassed',
    (t, dark) => pqShot(
      t,
      name: 'TestPassed',
      dark: dark,
      screen: PqScreen(
        safeBottom: false,
        child: QuizPassedView(
          title: learnTitle,
          score: 5,
          total: 5,
          reward: 30,
          courseDone: true,
          onBack: () {},
          onWallet: () {},
          onContinue: () {},
        ),
      ),
    ),
  );

  pqShotBoth(
    'TestFailed',
    (t, dark) => pqShot(
      t,
      name: 'TestFailed',
      dark: dark,
      screen: PqScreen(
        safeBottom: false,
        child: QuizFailedView(
          title: learnTitle,
          score: 2,
          total: 5,
          reward: 30,
          onBack: () {},
          onRetry: () {},
          onRewatch: () {},
        ),
      ),
    ),
  );
}

import 'package:go_router/go_router.dart';

import '../../../features/pharmacist/course_detail_screen.dart';
import '../../../features/pharmacist/learn_screen.dart';
import '../../../features/pharmacist/lesson_view_screen.dart';
import '../../../features/pharmacist/quiz_screen.dart';
import 'route_utils.dart';

/// Обучение: список курсов — с нижним меню.
final learnShellRoutes = <RouteBase>[
  GoRoute(path: '/app/learn', builder: (_, __) => const LearnScreen()),
];

/// Курс, урок, тест — полноэкранные (в макетах без меню).
final learnFullscreenRoutes = <RouteBase>[
  GoRoute(
      path: '/app/learn/:id',
      builder: (_, s) => CourseDetailScreen(id: intParam(s, 'id'))),
  GoRoute(
      path: '/app/learn/:courseId/lesson/:lessonId',
      builder: (_, s) => LessonViewScreen(
            courseId: intParam(s, 'courseId'),
            lessonId: intParam(s, 'lessonId'),
          )),
  GoRoute(
      path: '/app/learn/:courseId/quiz/:lessonId',
      builder: (_, s) => QuizScreen(
            courseId: intParam(s, 'courseId'),
            lessonId: intParam(s, 'lessonId'),
          )),
];

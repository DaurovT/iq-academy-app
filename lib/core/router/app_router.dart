import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_controller.dart';
import '../../features/shared/splash/splash_screen.dart';
import '../../features/shared/login/login_screen.dart';
import '../../features/shared/register/register_screen.dart';
import '../../features/shared/role_select/role_select_screen.dart';
import '../../features/shared/home/home_screen.dart';
import '../../features/shared/notifications/notifications_screen.dart';
import '../../features/shared/profile/profile_screen.dart';
import '../../features/shared/support/support_screen.dart';
import '../../features/shared/settings/notification_settings_screen.dart';
import '../../features/shell/app_shell.dart';
import '../../features/pharmacist/checks_screen.dart';
import '../../features/pharmacist/check_detail_screen.dart';
import '../../features/pharmacist/quests_screen.dart';
import '../../features/pharmacist/quest_detail_screen.dart';
import '../../features/pharmacist/wallet_screen.dart';
import '../../features/pharmacist/voucher_screen.dart';
import '../../features/pharmacist/learn_screen.dart';
import '../../features/pharmacist/course_detail_screen.dart';
import '../../features/pharmacist/lesson_view_screen.dart';
import '../../features/pharmacist/quiz_screen.dart';
import '../../features/doctor/recipes_screen.dart';
import '../../features/doctor/recipe_detail_screen.dart';
import '../../features/shared/quest_history/quest_history_screen.dart';
import '../../features/medrep/portfolio_screen.dart';
import '../../features/medrep/pharmacist_detail_screen.dart';
import '../../features/medrep/quests_screen.dart';
import '../../features/medrep/leaderboard_screen.dart';
import '../../features/medrep/referrals_screen.dart';
import '../../features/medrep/companies_screen.dart';
import '../../features/brand/brand_quests_screen.dart';
import '../../features/brand/brand_products_screen.dart';
import '../../features/brand/brands_screen.dart';
import '../../features/brand/sales_log_screen.dart';

int _intParam(GoRouterState s, String key) =>
    int.tryParse(s.pathParameters[key] ?? '') ?? 0;

/// Роутер приложения. redirect — единый гвард по состоянию авторизации.
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier(0);
  ref.listen(authControllerProvider, (_, __) => refresh.value++);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refresh,
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(
          path: '/register',
          builder: (_, s) =>
              RegisterScreen(phone: s.uri.queryParameters['phone'])),
      GoRoute(path: '/role', builder: (_, __) => const RoleSelectScreen()),

      // Основное приложение под оболочкой с нижней навигацией.
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/app', builder: (_, __) => const HomeScreen()),

          // Фармацевт: чеки
          GoRoute(path: '/app/checks', builder: (_, __) => const ChecksScreen()),
          GoRoute(
              path: '/app/checks/:id',
              builder: (_, s) => CheckDetailScreen(id: _intParam(s, 'id'))),

          // Квесты (static раньше параметрического)
          GoRoute(path: '/app/quests', builder: (_, __) => const QuestsScreen()),
          GoRoute(
              path: '/app/quests/history',
              builder: (_, __) => const QuestHistoryScreen()),
          GoRoute(
              path: '/app/quests/:id',
              builder: (_, s) => QuestDetailScreen(id: _intParam(s, 'id'))),

          // Кошелёк
          GoRoute(path: '/app/wallet', builder: (_, __) => const WalletScreen()),
          GoRoute(
              path: '/app/wallet/voucher/:id',
              builder: (_, s) => VoucherScreen(id: _intParam(s, 'id'))),

          // Обучение
          GoRoute(path: '/app/learn', builder: (_, __) => const LearnScreen()),
          GoRoute(
              path: '/app/learn/:id',
              builder: (_, s) => CourseDetailScreen(id: _intParam(s, 'id'))),
          GoRoute(
              path: '/app/learn/:courseId/lesson/:lessonId',
              builder: (_, s) => LessonViewScreen(
                    courseId: _intParam(s, 'courseId'),
                    lessonId: _intParam(s, 'lessonId'),
                  )),
          GoRoute(
              path: '/app/learn/:courseId/quiz/:lessonId',
              builder: (_, s) => QuizScreen(
                    courseId: _intParam(s, 'courseId'),
                    lessonId: _intParam(s, 'lessonId'),
                  )),

          // Врач: рецепты
          GoRoute(path: '/app/recipes', builder: (_, __) => const RecipesScreen()),
          GoRoute(
              path: '/app/recipes/:id',
              builder: (_, s) => RecipeDetailScreen(id: _intParam(s, 'id'))),

          // Медпред
          GoRoute(path: '/app/portfolio', builder: (_, __) => const PortfolioScreen()),
          GoRoute(
              path: '/app/portfolio/:telegramId',
              builder: (_, s) => MedrepPharmacistDetailScreen(
                  telegramId: _intParam(s, 'telegramId'))),
          GoRoute(path: '/app/leaderboard', builder: (_, __) => const LeaderboardScreen()),
          GoRoute(path: '/app/medrep/quests', builder: (_, __) => const MedrepQuestsScreen()),
          GoRoute(path: '/app/referrals', builder: (_, __) => const ReferralsScreen()),
          GoRoute(path: '/app/companies', builder: (_, __) => const CompaniesScreen()),

          // Бренд/Owner
          GoRoute(path: '/app/brand/quests', builder: (_, __) => const BrandQuestsScreen()),
          GoRoute(
              path: '/app/brand/quests/:id',
              builder: (_, s) => BrandQuestDetailScreen(id: _intParam(s, 'id'))),
          GoRoute(path: '/app/brand/products', builder: (_, __) => const BrandProductsScreen()),
          GoRoute(
              path: '/app/brand/products/:id',
              builder: (_, s) => BrandProductDetailScreen(id: _intParam(s, 'id'))),
          GoRoute(path: '/app/brand/brands', builder: (_, __) => const BrandsScreen()),
          GoRoute(
              path: '/app/brand/brands/:id',
              builder: (_, s) => BrandDetailScreen(id: _intParam(s, 'id'))),
          GoRoute(path: '/app/brand/logs', builder: (_, __) => const SalesLogScreen()),

          // Общее
          GoRoute(
              path: '/app/notifications',
              builder: (_, __) => const NotificationsScreen()),
          GoRoute(
              path: '/app/profile', builder: (_, __) => const ProfileScreen()),
          GoRoute(
              path: '/app/support', builder: (_, __) => const SupportScreen()),
          GoRoute(
              path: '/app/settings/notifications',
              builder: (_, __) => const NotificationSettingsScreen()),
        ],
      ),
    ],
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final loc = state.matchedLocation;

      if (auth.isLoading) return loc == '/splash' ? null : '/splash';

      final s = auth.asData?.value ?? const AuthState();

      if (!s.isAuthed) {
        return (loc == '/login' || loc == '/register') ? null : '/login';
      }
      if (s.needsRole) return loc == '/role' ? null : '/role';

      const gate = {'/splash', '/login', '/register', '/role'};
      return gate.contains(loc) ? '/app' : null;
    },
  );
});

import 'package:go_router/go_router.dart';

import '../../../features/medrep/companies_screen.dart';
import '../../../features/medrep/company_screen.dart';
import '../../../features/medrep/doctors_screen.dart';
import '../../../features/medrep/leaderboard_screen.dart';
import '../../../features/medrep/pharmacist_checks_screen.dart';
import '../../../features/medrep/pharmacist_detail_screen.dart';
import '../../../features/medrep/portfolio_screen.dart';
import '../../../features/medrep/quest_detail_screen.dart';
import '../../../features/medrep/quests_screen.dart';
import '../../../features/medrep/referrals_screen.dart';
import 'route_utils.dart';

/// Медпред (все экраны в макетах — с нижним меню). Владелец — «Роль медпреда».
final medrepShellRoutes = <RouteBase>[
  GoRoute(path: '/app/portfolio', builder: (_, __) => const PortfolioScreen()),
  GoRoute(
      path: '/app/portfolio/:telegramId',
      builder: (_, s) => MedrepPharmacistDetailScreen(
          telegramId: intParam(s, 'telegramId'))),
  GoRoute(
      path: '/app/portfolio/:telegramId/checks',
      builder: (_, s) => MedrepPharmacistChecksScreen(
          telegramId: intParam(s, 'telegramId'))),
  GoRoute(path: '/app/doctors', builder: (_, __) => const DoctorsScreen()),
  GoRoute(path: '/app/leaderboard', builder: (_, __) => const LeaderboardScreen()),
  GoRoute(path: '/app/medrep/quests', builder: (_, __) => const MedrepQuestsScreen()),
  GoRoute(
      path: '/app/medrep/quests/:id',
      builder: (_, s) => MedrepQuestDetailScreen(questId: intParam(s, 'id'))),
  GoRoute(path: '/app/referrals', builder: (_, __) => const ReferralsScreen()),
  GoRoute(path: '/app/companies', builder: (_, __) => const CompaniesScreen()),
  GoRoute(
      path: '/app/companies/:chain',
      builder: (_, s) =>
          MedrepCompanyScreen(chain: s.pathParameters['chain'] ?? '')),
];

final medrepFullscreenRoutes = <RouteBase>[];

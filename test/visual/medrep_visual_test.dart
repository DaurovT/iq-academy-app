// Визуальная сверка раздела «Роль медпреда» с макетами 1.2.
//   PQ_SHOTS_DIR=… flutter test --no-pub test/visual/medrep_visual_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/features/medrep/companies_screen.dart';
import 'package:platform_app/features/medrep/company_screen.dart';
import 'package:platform_app/features/medrep/doctor_detail_screen.dart';
import 'package:platform_app/features/medrep/home_screen.dart';
import 'package:platform_app/features/medrep/invite_screen.dart';
import 'package:platform_app/features/medrep/leaderboard_screen.dart';
import 'package:platform_app/features/medrep/pharmacist_checks_screen.dart';
import 'package:platform_app/features/medrep/pharmacist_detail_screen.dart';
import 'package:platform_app/features/medrep/portfolio_screen.dart';
import 'package:platform_app/features/medrep/quest_detail_screen.dart';
import 'package:platform_app/features/medrep/quests_screen.dart';
import 'package:platform_app/features/medrep/referrals_screen.dart';

import 'fixtures/medrep_fixtures.dart';
import 'pq_shot.dart';

void shot(String name, double height, int nav, Widget screen,
    {List? overrides, Future<void> Function(WidgetTester t)? before}) {
  pqShotBoth(name, (t, dark) => pqShot(t,
      name: name,
      dark: dark,
      height: height,
      screen: screen,
      overrides: overrides ?? medrepOverrides(),
      nav: medrepNav,
      navIndex: nav,
      before: before));
}

void main() {
  shot('MedHome', 1530, 0, const MedrepHome());
  shot('MedEmpty', 880, 0, const MedrepHome(), overrides: medrepOverrides(pf: const []));
  shot('MedPharmacists', 1210, 1, const PortfolioScreen());
  shot('MedSearchEmpty', 874, 1, const PortfolioScreen(), before: (t) async {
    await t.pump(const Duration(milliseconds: 300));
    await t.enterText(find.byType(TextField), 'Шахноза');
    await t.pump();
  });
  shot('MedInvite', 980, 1, const MedrepInviteScreen());
  shot('MedDoctor', 874, 1, const MedrepDoctorDetailScreen(doctorKey: 'a2003'));
  shot('MedPharmacist', 874, 1, const MedrepPharmacistDetailScreen(telegramId: 100));
  shot('MedPhChecks', 874, 1, const MedrepPharmacistChecksScreen(telegramId: 100),
      overrides: medrepOverrides(now: DateTime(2026, 7, 3, 12)));
  shot('MedRating', 940, 3, const LeaderboardScreen());
  shot('MedNotRanked', 900, 3, const LeaderboardScreen(),
      overrides: medrepOverrides(myRank: 0));
  shot('MedQuests', 1100, 2, const MedrepQuestsScreen());
  shot('MedQuestDetail', 1100, 2, const MedrepQuestDetailScreen(questId: 1));
  shot('MedPending', 874, 0, const ReferralsScreen());
  shot('MedCompanies', 874, 0, const CompaniesScreen());
  shot('MedCompany', 940, 0, const MedrepCompanyScreen(chain: 'GRAND PHARM'));
  shot('MedReward', 874, 1, const MedrepPharmacistDetailScreen(telegramId: 100),
      before: (t) async {
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 100));
    }
    await t.tap(find.text('Поощрить'));
    for (var i = 0; i < 5; i++) {
      await t.pump(const Duration(milliseconds: 100));
    }
    await t.enterText(find.byType(TextField), 'Спасибо за отличные продажи в июне!');
    FocusManager.instance.primaryFocus?.unfocus();
    await t.pump();
  });
}

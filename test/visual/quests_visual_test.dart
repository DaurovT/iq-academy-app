import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/features/pharmacist/quest_detail_screen.dart';
import 'package:platform_app/features/pharmacist/quests/quest_search_screen.dart';
import 'package:platform_app/features/pharmacist/quests_screen.dart';

import 'fixtures/quests_fixtures.dart';
import 'pq_shot.dart';

void main() {
  pqShotBoth(
    'Quests',
    (t, dark) => pqShot(
      t,
      name: 'Quests',
      dark: dark,
      height: 1070,
      screen: const QuestsScreen(),
      overrides: questsOverrides(),
      nav: pharmacistNav,
      navIndex: 2,
    ),
  );

  pqShotBoth(
    'QuestsDone',
    (t, dark) => pqShot(
      t,
      name: 'QuestsDone',
      dark: dark,
      height: 874,
      screen: const QuestsScreen(initialTab: QuestsTab.done),
      overrides: questsOverrides(participations: doneParticipations),
      nav: pharmacistNav,
      navIndex: 2,
    ),
  );

  pqShotBoth(
    'QuestDetail',
    (t, dark) => pqShot(
      t,
      name: 'QuestDetail',
      dark: dark,
      height: 1470,
      screen: const QuestDetailScreen(id: 2),
      overrides: questsOverrides(
        detail:
            (id) => detailOf(
              questDoritricin,
              brand: 'Фақат Андижон дорихоналари учун · только аптеки Андижана',
            ),
      ),
      nav: pharmacistNav,
      navIndex: 2,
    ),
  );

  pqShotBoth(
    'QuestSearch',
    (t, dark) => pqShot(
      t,
      name: 'QuestSearch',
      dark: dark,
      height: 874,
      screen: const QuestSearchScreen(),
      overrides: questsOverrides(
        quests: searchQuests,
        participations: searchParticipations,
      ),
      nav: pharmacistNav,
      navIndex: 2,
      before: (t) async {
        await t.pump(const Duration(milliseconds: 100));
        await t.enterText(find.byType(TextField), 'магн');
      },
    ),
  );
}

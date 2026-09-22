import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/models/medrep.dart';

/// Реальный ответ /client/medrep/doctors (медпред Бионорики) должен
/// разбираться в модели без потерь — числа приходят как 15.0, а не 15.
void main() {
  test('DoctorsOverview парсит живой ответ бэкенда', () {
    final raw = jsonDecode(File('test/doctors_fixture.json').readAsStringSync());
    final o = DoctorsOverview.fromJson(raw as Map<String, dynamic>);

    expect(o.available, isTrue);
    expect(o.questId, isNotNull);
    expect(o.quests, isNotEmpty);
    expect(o.totals.doctors,
        o.regions.fold<int>(0, (s, g) => s + g.items.length));
    expect(o.totals.completed + o.totals.inProgress + o.totals.idle,
        o.totals.doctors);
    final d = o.regions.first.items.first;
    expect(d.goal, greaterThan(0));
    expect(d.progress, inInclusiveRange(0, 1));
  });

  test('недоступный раздел (другая компания) тоже парсится', () {
    final o = DoctorsOverview.fromJson({
      'available': false, 'companyName': 'Worwag', 'quests': [],
      'questId': null,
      'totals': {'doctors': 0, 'completed': 0, 'inProgress': 0, 'idle': 0},
      'regions': [],
    });
    expect(o.available, isFalse);
    expect(o.regions, isEmpty);
  });
}

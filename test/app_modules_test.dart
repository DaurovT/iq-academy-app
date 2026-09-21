import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/models/common.dart';

void main() {
  test('раздел по пути: самое длинное совпадение по сегментам', () {
    expect(moduleForPath('/app/checks'), 'checks');
    expect(moduleForPath('/app/checks/15'), 'checks');
    expect(moduleForPath('/app/sapper/3'), 'sapper');
    expect(moduleForPath('/app/sapper-rules'), 'sapper');
    expect(moduleForPath('/app/medrep/quests'), 'medrep_quests');
    expect(moduleForPath('/app/quests/history'), 'quests');
    expect(moduleForPath('/app'), isNull);
    expect(moduleForPath('/app/profile'), isNull);
    expect(moduleForPath('/app/checksXYZ'), isNull);
  });

  test('видимость: для всех, по ролям, без данных', () {
    final m = AppModules.fromJson({
      'modules': {
        'sapper': {'visible': true, 'hiddenRoles': ['doctor']},
        'news': {'visible': false, 'hiddenRoles': []},
      }
    });
    expect(m.isVisible('sapper', Role.doctor), isFalse);
    expect(m.isVisible('sapper', Role.pharmacist), isTrue);
    expect(m.isVisible('news', Role.pharmacist), isFalse);
    expect(m.isVisible('unknown', Role.doctor), isTrue); // нет данных — показываем
    expect(AppModules.empty.isVisible('checks', Role.pharmacist), isTrue);
  });

  test('кэш переживает сериализацию', () {
    final m = AppModules.fromJson({'modules': {'wallet': {'visible': false, 'hiddenRoles': []}}});
    expect(AppModules.fromJson(m.toJson()).isVisible('wallet', Role.doctor), isFalse);
  });
}

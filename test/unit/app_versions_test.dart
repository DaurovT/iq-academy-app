import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/models/medrep.dart';
import 'package:platform_app/features/medrep/medrep_widgets.dart';

void main() {
  test('сравнение версий по числам', () {
    expect(compareVersions('1.2.10', '1.2.9'), greaterThan(0));
    expect(compareVersions('1.2.5', '1.2.5'), 0);
    expect(compareVersions('1.2', '1.2.1'), lessThan(0));
    expect(compareVersions('1.2.5+9', '1.2.6'), lessThan(0));
  });

  test('версии из app-config: подсказка и обязательное обновление', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final cfg = AppModules.fromJson({
      'modules': {},
      'appVersions': {
        'android': {'latest': '1.2.7', 'min': '1.2.5'},
        'ios': {'latest': '1.2.6'},
      },
    });
    expect(cfg.latestVersion, '1.2.7');
    expect(hasNewerVersion(cfg, '1.2.6'), isTrue);
    expect(hasNewerVersion(cfg, '1.2.7'), isFalse);
    expect(needsForceUpdate(cfg, '1.2.4'), isTrue);
    expect(needsForceUpdate(cfg, '1.2.5'), isFalse);
    expect(needsForceUpdate(cfg, ''), isFalse, reason: 'отладочная сборка без версии');
    // кэш переживает toJson → fromJson
    expect(AppModules.fromJson(cfg.toJson()).minVersion, '1.2.5');
    // старый ответ сервера без appVersions — ничего не предлагаем
    expect(hasNewerVersion(AppModules.fromJson({'modules': {}}), '1.0.0'), isFalse);
  });

  test('рейтинг по бланкам, если бланков больше чеков', () {
    MedrepMetrics m({int checks = 0, int? recipes, int? approved}) => MedrepMetrics(
          mode: AttributionMode.shared,
          pharmCount: 3,
          checksCount: checks,
          approvedPacksSum: 0,
          questsDone: 0,
          recipesCount: recipes,
          approvedRecipes: approved,
        );
    expect(medPrefersBlanks(m(checks: 0, recipes: 78, approved: 58)), isTrue);
    expect(medPrefersBlanks(m(checks: 87, recipes: 84, approved: 84)), isFalse);
    expect(medPrefersBlanks(m(checks: 5)), isFalse, reason: 'сервер без бланков');
    expect(medPrefersBlanks(null), isFalse);
  });
}

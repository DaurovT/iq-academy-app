// Плашка «Доступна новая версия» (задача 9 в docs/SERVER_TASKS.md).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/features/shell/update_banner.dart';

import 'pq_shot.dart';

class _Cfg extends AppModulesController {
  @override
  Future<AppModules> build() async => AppModules.fromJson({
        'modules': {},
        'appVersions': {
          'android': {'latest': '1.2.6'},
          'ios': {'latest': '1.2.6'},
        },
      });
}

void main() {
  pqShotBoth('UpdateBanner', (t, dark) => pqShot(
        t,
        name: 'UpdateBanner',
        dark: dark,
        height: 300,
        screen: const PqScreen(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: UpdateBanner(currentVersion: '1.2.5'),
            ),
          ),
        ),
        overrides: [appModulesProvider.overrideWith(_Cfg.new)],
      ));
}

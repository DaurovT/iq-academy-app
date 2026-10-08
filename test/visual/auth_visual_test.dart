// Визуальная сверка раздела «Вход и регистрация» с макетами 1.2.
//   PQ_SHOTS_DIR=… flutter test --no-pub test/visual/auth_visual_test.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/api/providers.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/core/l10n/locale_controller.dart';
import 'package:platform_app/features/shared/login/login_screen.dart';
import 'package:platform_app/features/shared/login/sms_code_screen.dart';
import 'package:platform_app/features/shared/onboarding/force_update_screen.dart';
import 'package:platform_app/features/shared/onboarding/push_primer_screen.dart';
import 'package:platform_app/features/shared/onboarding/welcome_screen.dart';
import 'package:platform_app/features/shared/pickers/city_picker.dart';
import 'package:platform_app/features/shared/pickers/map_picker.dart';
import 'package:platform_app/features/shared/providers.dart';
import 'package:platform_app/features/shared/register/register_screen.dart';
import 'package:platform_app/features/shared/register/register_success.dart';
import 'package:platform_app/features/shared/role_select/role_select_screen.dart';
import 'package:platform_app/features/shared/splash/splash_screen.dart';

import 'fixtures/auth_fixtures.dart';
import 'pq_shot.dart';

/// Экран с системной клавиатурой высотой [inset] (как в макетах
/// LoginKeyboard/SmsCode): сама клавиатура не рисуется.
Widget _withKeyboard(Widget child, double inset) => Builder(
  builder:
      (c) => MediaQuery(
        data: MediaQuery.of(c).copyWith(viewInsets: EdgeInsets.only(bottom: inset)),
        child: child,
      ),
);

/// Отрисовка с платформой iOS (кнопка Apple, как в макете Login).
Future<void> _ios(Future<void> Function() body) async {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  try {
    await body();
  } finally {
    debugDefaultTargetPlatformOverride = null;
  }
}

void main() {
  final base = [
    localeProvider.overrideWith(FixedLocale.new),
    welcomeSeenProvider.overrideWith(SeenWelcome.new),
    apiProvider.overrideWithValue(FakeApi()),
    citiesProvider.overrideWith((_) async => fixtureCities),
  ];

  pqShotBoth(
    'Splash',
    (t, dark) => pqShot(
      t,
      name: 'Splash',
      dark: dark,
      overrides: base,
      screen: const SplashScreen(version: '[X.Y]'),
    ),
  );

  pqShotBoth(
    'Welcome',
    (t, dark) =>
        pqShot(t, name: 'Welcome', dark: dark, overrides: base, screen: const WelcomeScreen()),
  );

  pqShotBoth(
    'Login',
    (t, dark) => _ios(
      () => pqShot(t, name: 'Login', dark: dark, overrides: base, screen: const LoginScreen()),
    ),
  );

  pqShotBoth(
    'LoginKeyboard',
    (t, dark) => _ios(
      () => pqShot(
        t,
        name: 'LoginKeyboard',
        dark: dark,
        overrides: base,
        screen: _withKeyboard(const LoginScreen(), 254),
        before: (t) async {
          await t.pump(const Duration(milliseconds: 500));
          await t.enterText(find.byType(TextField), '9012345');
        },
      ),
    ),
  );

  pqShotBoth(
    'LoginError',
    (t, dark) => _ios(
      () => pqShot(
        t,
        name: 'LoginError',
        dark: dark,
        overrides: base,
        screen: const LoginScreen(),
        before: (t) async {
          await t.pump(const Duration(milliseconds: 500));
          await t.enterText(find.byType(TextField), '901234567');
          await t.pump();
          await t.tap(find.text('Получить код'));
          await t.pump();
        },
      ),
    ),
  );

  pqShotBoth(
    'SmsCode',
    (t, dark) => pqShot(
      t,
      name: 'SmsCode',
      dark: dark,
      overrides: base,
      screen: _withKeyboard(const SmsCodeScreen(phone: '+998901234567'), 302),
      before: (t) async {
        await t.pump(const Duration(milliseconds: 100));
        await t.enterText(find.byType(TextField), '47');
      },
    ),
  );

  pqShotBoth(
    'RoleLogin',
    (t, dark) => pqShot(
      t,
      name: 'RoleLogin',
      dark: dark,
      overrides: [...base, authControllerProvider.overrideWith(MultiRoleAuth.new)],
      screen: const RoleSelectScreen(),
    ),
  );

  pqShotBoth(
    'RegRole',
    (t, dark) => pqShot(
      t,
      name: 'RegRole',
      dark: dark,
      overrides: base,
      screen: const RegisterScreen(),
      before: (t) async {
        await t.pump(const Duration(milliseconds: 500));
        await t.tap(find.text('Фармацевт'));
      },
    ),
  );

  // RegDoctor — верное кодовое слово, RegDoctorCode — такого слова нет.
  for (final (name, doctor, code, h) in [
    ('RegPharmacist', false, null, 1130.0),
    ('RegDoctor', true, 'DAUROV', 1360.0),
    ('RegDoctorCode', true, 'DAUROF', 1290.0),
  ]) {
    pqShotBoth(
      name,
      (t, dark) => pqShot(
        t,
        name: name,
        dark: dark,
        height: h,
        overrides: [
          ...base,
          registrationSchemaProvider.overrideWith((ref, role) async => fixtureSchema(role)),
        ],
        screen: const RegisterScreen(phone: '+998901234567'),
        before: (t) async {
          await t.pump(const Duration(milliseconds: 500));
          await t.tap(find.text(doctor ? 'Врач' : 'Фармацевт'));
          await t.pump(const Duration(milliseconds: 300));
          await t.tap(find.text('Продолжить'));
          for (var i = 0; i < 5; i++) {
            await t.pump(const Duration(milliseconds: 100));
          }
          if (doctor) {
            await t.tap(find.text('Педиатр'));
            await t.pump();
            await t.tap(find.text('Терапевт'));
            await t.pump();
            // Поля: ФИО, телефон, клиника, кодовое слово.
            await t.enterText(find.byType(TextField).at(3), code!);
            FocusManager.instance.primaryFocus?.unfocus();
            for (var i = 0; i < 6; i++) {
              await t.pump(const Duration(milliseconds: 100));
            }
          } else {
            await t.tap(find.byType(TextField).first);
          }
        },
      ),
    );
  }

  pqShotBoth(
    'RegSuccess',
    (t, dark) => pqShot(
      t,
      name: 'RegSuccess',
      dark: dark,
      overrides: base,
      screen: RegisterSuccess(firstName: 'Тимур', completing: false, onStart: () {}, onHome: () {}),
    ),
  );

  pqShotBoth(
    'CityPicker',
    (t, dark) => pqShot(
      t,
      name: 'CityPicker',
      dark: dark,
      overrides: base,
      screen: const CityPickerHost(),
      before: (t) async {
        final ctx = t.element(find.byType(CityPickerHost));
        showPqCityPicker(ctx, selectedValue: 'andijan');
        await t.pump();
      },
    ),
  );

  pqShotBoth(
    'MapPicker',
    (t, dark) =>
        pqShot(t, name: 'MapPicker', dark: dark, overrides: base, screen: const MapPickerScreen()),
  );

  pqShotBoth(
    'ForceUpdate',
    (t, dark) => pqShot(
      t,
      name: 'ForceUpdate',
      dark: dark,
      overrides: base,
      screen: const ForceUpdateScreen(minVersion: '[X.Y]', currentVersion: '[X.Y]'),
    ),
  );

  pqShotBoth(
    'PermNotif',
    (t, dark) =>
        pqShot(t, name: 'PermNotif', dark: dark, overrides: base, screen: const PushPrimerScreen()),
  );
}

/// Фон макета CityPicker: шапка «Регистрация» и 4 плашки-скелетона 80 px.
class CityPickerHost extends StatelessWidget {
  const CityPickerHost({super.key});

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PqTopBar(title: 'Регистрация'),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: Column(
              children: [
                for (var i = 0; i < 4; i++) ...[
                  if (i > 0) const SizedBox(height: 20),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: pq.surfaceAlt,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

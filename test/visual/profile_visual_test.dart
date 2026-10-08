import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/features/shared/notifications/notifications_screen.dart';
import 'package:platform_app/features/shared/profile/account_deleted_screen.dart';
import 'package:platform_app/features/shared/profile/delete_account_sheet.dart';
import 'package:platform_app/features/shared/profile/edit_profile_screen.dart';
import 'package:platform_app/features/shared/profile/privacy_full_screen.dart';
import 'package:platform_app/features/shared/profile/privacy_screen.dart';
import 'package:platform_app/features/shared/profile/profile_role_sheet.dart';
import 'package:platform_app/features/shared/profile/profile_screen.dart';
import 'package:platform_app/features/shared/settings/notification_settings_screen.dart';
import 'package:platform_app/features/shared/support/support_screen.dart';

import 'fixtures/profile_fixtures.dart';
import 'pq_shot.dart';

/// Открыть нижний лист от контекста экрана [type].
Future<void> Function(WidgetTester) _sheet(
        Type type, Future<void> Function(BuildContext) open) =>
    (t) async {
      await t.pump(const Duration(milliseconds: 300));
      open(t.element(find.byType(type)));
      await t.pump();
    };

void main() {
  pqShotBoth('Profile', (t, dark) => pqShot(t,
      name: 'Profile',
      dark: dark,
      height: 1460,
      screen: const ProfileScreen(),
      overrides: profileOverrides(dark: dark),
      nav: pharmacistNav,
      navIndex: 4));

  pqShotBoth('ProfileNew', (t, dark) => pqShot(t,
      name: 'ProfileNew',
      dark: dark,
      height: 1950,
      screen: const ProfileScreen(),
      overrides: profileOverrides(
          dark: dark, acc: account(name: '', phone: '+998901234567'), tgLinked: false),
      nav: pharmacistNav,
      navIndex: 4));

  pqShotBoth('DocProfile', (t, dark) => pqShot(t,
      name: 'DocProfile',
      dark: dark,
      height: 1564,
      screen: const ProfileScreen(),
      overrides: profileOverrides(
          dark: dark, acc: account(roles: [Role.doctor]), role: Role.doctor),
      nav: doctorNav,
      navIndex: 4));

  pqShotBoth('MedProfile', (t, dark) => pqShot(t,
      name: 'MedProfile',
      dark: dark,
      height: 1530,
      screen: const ProfileScreen(),
      overrides: profileOverrides(
          dark: dark, acc: account(roles: [Role.medrep]), role: Role.medrep),
      nav: medrepNav,
      navIndex: 4));

  pqShotBoth('ProfileRole', (t, dark) => pqShot(t,
      name: 'ProfileRole',
      dark: dark,
      screen: const ProfileScreen(),
      overrides: profileOverrides(
          dark: dark,
          acc: account(roles: [Role.pharmacist, Role.doctor, Role.medrep])),
      before: _sheet(ProfileScreen, showProfileRoleSheet)));

  pqShotBoth('EditProfile', (t, dark) => pqShot(t,
      name: 'EditProfile',
      dark: dark,
      screen: const EditProfileScreen(),
      overrides: profileOverrides(dark: dark, acc: account(name: 'Тошматов Аралбек')),
      before: (t) async {
        await t.pump(const Duration(milliseconds: 300));
        await t.enterText(find.byType(TextField).at(1), 'Аптека №12');
        FocusManager.instance.primaryFocus?.unfocus();
      }));

  pqShotBoth('Privacy', (t, dark) => pqShot(t,
      name: 'Privacy',
      dark: dark,
      height: 1000,
      screen: const PrivacyScreen(),
      overrides: profileOverrides(dark: dark)));

  pqShotBoth('PrivacyFull', (t, dark) => pqShot(t,
      name: 'PrivacyFull',
      dark: dark,
      height: 2370,
      screen: const PrivacyFullScreen(),
      overrides: profileOverrides(dark: dark)));

  pqShotBoth('DeleteAccount', (t, dark) => pqShot(t,
      name: 'DeleteAccount',
      dark: dark,
      screen: const PqScreen(child: SizedBox.expand()),
      overrides: profileOverrides(dark: dark),
      before: _sheet(PqScreen, showDeleteAccountSheet)));

  pqShotBoth('AccountDeleted', (t, dark) => pqShot(t,
      name: 'AccountDeleted',
      dark: dark,
      screen: const AccountDeletedScreen(),
      overrides: profileOverrides(dark: dark)));

  pqShotBoth('NotifSettings', (t, dark) => pqShot(t,
      name: 'NotifSettings',
      dark: dark,
      screen: const NotificationsScreen(),
      overrides: profileOverrides(dark: dark),
      before: _sheet(NotificationsScreen, showNotificationSettingsSheet)));

  pqShotBoth('Notif', (t, dark) => pqShot(t,
      name: 'Notif',
      dark: dark,
      height: 990,
      screen: const NotificationsScreen(),
      overrides: profileOverrides(dark: dark)));

  pqShotBoth('NotifEmpty', (t, dark) => pqShot(t,
      name: 'NotifEmpty',
      dark: dark,
      screen: const NotificationsScreen(),
      overrides: profileOverrides(dark: dark, notifications: const [])));

  pqShotBoth('Support', (t, dark) => pqShot(t,
      name: 'Support',
      dark: dark,
      screen: const SupportScreen(),
      overrides: profileOverrides(dark: dark)));

  pqShotBoth('SupportDialog', (t, dark) => pqShot(t,
      name: 'SupportDialog',
      dark: dark,
      screen: const SupportScreen(),
      overrides: profileOverrides(dark: dark, thread: supportDialog),
      before: (t) async {
        await t.pump(const Duration(milliseconds: 300));
        await t.enterText(find.byType(TextField), 'Спасибо!');
      }));
}

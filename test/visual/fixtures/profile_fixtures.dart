// Данные макетов раздела «Профиль, уведомления, поддержка».
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_app/core/api/providers.dart';
import 'package:platform_app/core/api/token_store.dart';
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/account.dart';
import 'package:platform_app/core/models/check.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/core/models/medrep.dart';
import 'package:platform_app/core/models/notification.dart';
import 'package:platform_app/core/models/support.dart';
import 'package:platform_app/core/models/wallet.dart';
import 'package:platform_app/core/theme/theme_controller.dart';
import 'package:platform_app/features/doctor/providers.dart';
import 'package:platform_app/features/medrep/providers.dart';
import 'package:platform_app/features/pharmacist/providers.dart';
import 'package:platform_app/features/shared/providers.dart';

/// Хранилище без платформенного канала: всё пусто, запись — no-op.
class _MemStorage implements FlutterSecureStorage {
  @override
  dynamic noSuchMethod(Invocation i) => Future<String?>.value(null);
}

class _Auth extends AuthController {
  _Auth(this.s);
  final AuthState s;
  @override
  Future<AuthState> build() async => s;
}

class _Theme extends ThemeModeController {
  _Theme(this.mode);
  final ThemeMode mode;
  @override
  ThemeMode build() => mode;
}

class _Modules extends AppModulesController {
  @override
  Future<AppModules> build() async => AppModules.empty;
}

Account account({
  String name = 'Аралбек Тошматов',
  String phone = '+998903196963',
  List<Role> roles = const [Role.pharmacist],
}) =>
    Account(id: 1, phone: phone, fullName: name, language: Language.ru, roles: roles);

const notifSettings =
    NotificationSettings(checks: true, quests: true, learning: true, marketing: false);

final _now = DateTime.now();
String _today(int h, int m) =>
    DateTime(_now.year, _now.month, _now.day, h, m).toIso8601String();

const notifItems = [
  AppNotification(
      id: 1,
      type: 'quest_completed',
      title: 'Квест выполнен',
      body: 'Цинкорот N50 (июнь) — награда в IQC уже в пути',
      isRead: false,
      createdAt: '2026-07-01'),
  AppNotification(
      id: 2,
      type: 'check_credited',
      title: 'Начислено +144 IQC',
      body: 'Чек №23156 · Цинкорот №50',
      isRead: false,
      createdAt: '2026-06-29T18:15:00'),
  AppNotification(
      id: 3,
      type: 'voucher_issued',
      title: 'Ваучер выдан',
      body: 'Korzinka · 100 000 сум — покажите QR на кассе',
      isRead: true,
      createdAt: '2026-06-25T14:41:00',
      link: '/app/wallet'),
  AppNotification(
      id: 4,
      type: 'course_new',
      title: 'Новый курс',
      body: 'Доритрицин (Андижан) · +30 IQC за прохождение',
      isRead: true,
      createdAt: '2026-06-18'),
  AppNotification(
      id: 5,
      type: 'check_rejected',
      title: 'Чек отклонён',
      body: '№12594: чек размыт или обрезан. Переснимите — баллы ещё можно получить',
      isRead: true,
      createdAt: '2026-01-15T19:54:00',
      link: '/app/checks/12594'),
];

final supportDialog = [
  SupportMessage(id: 1, from: 'admin', text: 'Здравствуйте! Чем можем помочь?', createdAt: _today(17, 14)),
  SupportMessage(
      id: 2,
      from: 'user',
      text: 'Отправил чек два дня назад, а IQC так и не пришли\nЧек №23156',
      createdAt: _today(17, 16)),
  SupportMessage(
      id: 3,
      from: 'admin',
      text:
          'Нашли ваш чек — он ещё на проверке. Как только её закончат, IQC придут на баланс автоматически, а вам придёт уведомление',
      createdAt: _today(17, 21)),
];

const checks = [
  Check(id: 23156, status: CheckStatus.pending, createdAt: '2026-06-29T12:00:00', photoCount: 1, drugs: []),
];

/// Общие подмены раздела.
List profileOverrides({
  required bool dark,
  Account? acc,
  Role role = Role.pharmacist,
  bool tgLinked = true,
  List<AppNotification> notifications = notifItems,
  List<SupportMessage> thread = const [],
}) {
  final a = acc ?? account();
  return [
    tokenStoreProvider.overrideWithValue(TokenStore(_MemStorage())),
    authControllerProvider.overrideWith(() => _Auth(AuthState(account: a, activeRole: role))),
    themeModeProvider.overrideWith(() => _Theme(dark ? ThemeMode.dark : ThemeMode.light)),
    appModulesProvider.overrideWith(_Modules.new),
    unreadCountProvider.overrideWith((ref) async => 0),
    accountSettingsProvider.overrideWith((ref) async => AccountSettings(telegramLinked: tgLinked)),
    notificationSettingsProvider.overrideWith((ref) async => notifSettings),
    notificationsProvider.overrideWith((ref) async => notifications),
    supportThreadProvider.overrideWith((ref) async => thread),
    companiesProvider.overrideWith(
        (ref) async => const [Company(id: 1, name: 'Bionorica SE', labelCode: 'BIO')]),
    medrepCodeProvider.overrideWith(
        (ref) async => const MedrepCode(code: 'DAUROV', username: 'daurov_a')),
    walletProvider.overrideWith((ref) async => const Wallet(balanceUzs: 0, balanceIqc: 2840)),
    myVouchersProvider.overrideWith((ref) async => [
          for (var i = 0; i < 3; i++)
            IssuedVoucher(id: i, code: 'V$i', amountUzs: 100000, status: 'issued', issuedAt: '2026-06-25'),
        ]),
    checksProvider.overrideWith((ref) async => checks),
    recipesProvider.overrideWith((ref) async => const <Recipe>[]),
  ];
}

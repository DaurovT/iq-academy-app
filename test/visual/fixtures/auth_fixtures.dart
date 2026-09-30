// Данные макетов раздела «Вход и регистрация» для визуальной сверки.
import 'dart:ui';

import 'package:platform_app/core/api/platform_api.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/l10n/locale_controller.dart';
import 'package:platform_app/core/models/account.dart';
import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/core/models/registration.dart';
import 'package:platform_app/features/shared/onboarding/welcome_screen.dart';

/// Язык без чтения защищённого хранилища.
class FixedLocale extends LocaleController {
  @override
  Locale build() => const Locale('ru');

  @override
  void set(Locale locale) => state = locale;
}

class SeenWelcome extends WelcomeGate {
  @override
  Future<bool> build() async => true;
}

/// Вошедший пользователь с тремя ролями (макет RoleLogin).
class MultiRoleAuth extends AuthController {
  @override
  Future<AuthState> build() async => const AuthState(
    account: Account(
      id: 1,
      phone: '+998901234567',
      fullName: 'Дауров Тимур',
      language: Language.ru,
      roles: [Role.medrep, Role.pharmacist, Role.doctor],
    ),
  );
}

/// API без сети: номер «не зарегистрирован» (макет LoginError).
class FakeApi implements PlatformApi {
  @override
  AuthApi get auth => _FakeAuth();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeAuth implements AuthApi {
  @override
  Future<({bool exists})> checkNumber(String phone) async => (exists: false);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

LocalizedText _t(String ru) => LocalizedText(ru: ru);

const _cityNames = [
  'Андижан',
  'Бухара',
  'Гулистан',
  'Джизак',
  'Карши',
  'Навои',
  'Наманган',
  'Нукус',
  'Самарканд',
  'Ташкент',
  'Термез',
  'Ургенч',
  'Фергана',
];

final fixtureCities = [
  for (var i = 0; i < _cityNames.length; i++)
    RefItem(value: i == 0 ? 'andijan' : 'c$i', label: _t(_cityNames[i])),
];

const _specialties = [
  'Врач общей практики',
  'Гастроэнтеролог',
  'Гинеколог',
  'Дерматолог',
  'Кардиолог',
  'ЛОР',
  'Невролог',
  'Офтальмолог',
  'Педиатр',
  'Пульмонолог',
  'Терапевт',
  'Уролог',
  'Хирург',
  'Эндокринолог',
];

/// Схема регистрации с полями макетов RegPharmacist / RegDoctor.
RegistrationSchema fixtureSchema(Role role) => RegistrationSchema(
  version: '1',
  role: role,
  fields: [
    RegField(name: 'full_name', type: RegFieldType.text, label: _t('ФИО'), required: true),
    RegField(name: 'phone', type: RegFieldType.phone, label: _t('Телефон'), required: true),
    RegField(
      name: 'city',
      type: RegFieldType.select,
      label: _t('Город'),
      required: true,
      options: [for (final c in fixtureCities) RegOption(value: c.value, label: c.label)],
    ),
    if (role == Role.doctor) ...[
      RegField(
        name: 'specialties',
        type: RegFieldType.multiselect,
        label: _t('Специальности'),
        required: true,
        options: [
          for (var i = 0; i < _specialties.length; i++)
            RegOption(value: 's$i', label: _t(_specialties[i])),
        ],
      ),
      RegField(name: 'clinic', type: RegFieldType.text, label: _t('Клиника'), required: true),
    ] else
      RegField(
        name: 'workplace',
        type: RegFieldType.text,
        label: _t('Аптека / место работы'),
        required: true,
      ),
    RegField(
      name: 'consent',
      type: RegFieldType.consent,
      label: _t('Согласие'),
      required: true,
      consentUrl: '/privacy',
    ),
  ],
);

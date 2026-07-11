import 'package:json_annotation/json_annotation.dart';

/// Роли пользователя. JSON-значения совпадают с platform_api (types.ts: Role).
enum Role {
  @JsonValue('pharmacist')
  pharmacist,
  @JsonValue('doctor')
  doctor,
  @JsonValue('medrep')
  medrep,
  @JsonValue('product_owner')
  productOwner;

  /// Человекочитаемая метка (пока по-русски; позже — через i18n).
  String get label => switch (this) {
        Role.pharmacist => 'Фармацевт',
        Role.doctor => 'Врач',
        Role.medrep => 'Мед. представитель',
        Role.productOwner => 'Бренд / Продукт-оунер',
      };

  /// Значение роли для API (совпадает с @JsonValue).
  String get apiValue => switch (this) {
        Role.pharmacist => 'pharmacist',
        Role.doctor => 'doctor',
        Role.medrep => 'medrep',
        Role.productOwner => 'product_owner',
      };
}

/// Язык интерфейса аккаунта.
enum Language {
  @JsonValue('ru')
  ru,
  @JsonValue('uz')
  uz,
  @JsonValue('kz')
  kz;

  String get code => name;
}

/// Локализованный текст: с бэка приходит либо строкой, либо объектом
/// {ru, uz, kz} (types.ts: LocalizedText). Разбираем оба варианта.
class LocalizedText {
  const LocalizedText({this.ru, this.uz, this.kz});

  final String? ru;
  final String? uz;
  final String? kz;

  factory LocalizedText.from(Object? v) {
    if (v is String) return LocalizedText(ru: v);
    if (v is Map) {
      return LocalizedText(
        ru: v['ru'] as String?,
        uz: v['uz'] as String?,
        kz: v['kz'] as String?,
      );
    }
    return const LocalizedText();
  }

  /// Текст на нужном языке с откатом на любой доступный.
  String resolve([Language lang = Language.ru]) {
    final byLang = switch (lang) {
      Language.ru => ru,
      Language.uz => uz,
      Language.kz => kz,
    };
    return byLang ?? ru ?? uz ?? kz ?? '';
  }
}

/// Конвертер для использования LocalizedText в freezed-моделях.
class LocalizedTextConverter
    implements JsonConverter<LocalizedText, Object?> {
  const LocalizedTextConverter();

  @override
  LocalizedText fromJson(Object? json) => LocalizedText.from(json);

  @override
  Object? toJson(LocalizedText t) => {'ru': t.ru, 'uz': t.uz, 'kz': t.kz};
}

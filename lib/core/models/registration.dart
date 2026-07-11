import 'package:freezed_annotation/freezed_annotation.dart';
import 'common.dart';

part 'registration.freezed.dart';
part 'registration.g.dart';

enum RegFieldType {
  @JsonValue('text')
  text,
  @JsonValue('phone')
  phone,
  @JsonValue('select')
  select,
  @JsonValue('multiselect')
  multiselect,
  @JsonValue('consent')
  consent,
}

@freezed
abstract class RegOption with _$RegOption {
  const factory RegOption({
    required String value,
    @LocalizedTextConverter() required LocalizedText label,
  }) = _RegOption;

  factory RegOption.fromJson(Map<String, dynamic> json) =>
      _$RegOptionFromJson(json);
}

@freezed
abstract class RegField with _$RegField {
  const factory RegField({
    required String name,
    required RegFieldType type,
    @LocalizedTextConverter() required LocalizedText label,
    required bool required,
    List<RegOption>? options,
    String? consentUrl,
  }) = _RegField;

  factory RegField.fromJson(Map<String, dynamic> json) =>
      _$RegFieldFromJson(json);
}

@freezed
abstract class RegistrationSchema with _$RegistrationSchema {
  const factory RegistrationSchema({
    required String version,
    required Role role,
    required List<RegField> fields,
  }) = _RegistrationSchema;

  factory RegistrationSchema.fromJson(Map<String, dynamic> json) =>
      _$RegistrationSchemaFromJson(json);
}

/// Элемент справочника (города, специальности): значение + локализованная метка.
@freezed
abstract class RefItem with _$RefItem {
  const factory RefItem({
    required String value,
    @LocalizedTextConverter() required LocalizedText label,
  }) = _RefItem;

  factory RefItem.fromJson(Map<String, dynamic> json) =>
      _$RefItemFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegOption _$RegOptionFromJson(Map<String, dynamic> json) => _RegOption(
  value: json['value'] as String,
  label: const LocalizedTextConverter().fromJson(json['label']),
);

Map<String, dynamic> _$RegOptionToJson(_RegOption instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': const LocalizedTextConverter().toJson(instance.label),
    };

_RegField _$RegFieldFromJson(Map<String, dynamic> json) => _RegField(
  name: json['name'] as String,
  type: $enumDecode(_$RegFieldTypeEnumMap, json['type']),
  label: const LocalizedTextConverter().fromJson(json['label']),
  required: json['required'] as bool,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => RegOption.fromJson(e as Map<String, dynamic>))
          .toList(),
  consentUrl: json['consentUrl'] as String?,
);

Map<String, dynamic> _$RegFieldToJson(_RegField instance) => <String, dynamic>{
  'name': instance.name,
  'type': _$RegFieldTypeEnumMap[instance.type]!,
  'label': const LocalizedTextConverter().toJson(instance.label),
  'required': instance.required,
  'options': instance.options,
  'consentUrl': instance.consentUrl,
};

const _$RegFieldTypeEnumMap = {
  RegFieldType.text: 'text',
  RegFieldType.phone: 'phone',
  RegFieldType.select: 'select',
  RegFieldType.multiselect: 'multiselect',
  RegFieldType.consent: 'consent',
};

_RegistrationSchema _$RegistrationSchemaFromJson(Map<String, dynamic> json) =>
    _RegistrationSchema(
      version: json['version'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      fields:
          (json['fields'] as List<dynamic>)
              .map((e) => RegField.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RegistrationSchemaToJson(_RegistrationSchema instance) =>
    <String, dynamic>{
      'version': instance.version,
      'role': _$RoleEnumMap[instance.role]!,
      'fields': instance.fields,
    };

const _$RoleEnumMap = {
  Role.pharmacist: 'pharmacist',
  Role.doctor: 'doctor',
  Role.medrep: 'medrep',
  Role.productOwner: 'product_owner',
};

_RefItem _$RefItemFromJson(Map<String, dynamic> json) => _RefItem(
  value: json['value'] as String,
  label: const LocalizedTextConverter().fromJson(json['label']),
);

Map<String, dynamic> _$RefItemToJson(_RefItem instance) => <String, dynamic>{
  'value': instance.value,
  'label': const LocalizedTextConverter().toJson(instance.label),
};

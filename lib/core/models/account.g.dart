// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String,
  fullName: json['fullName'] as String,
  language: $enumDecode(_$LanguageEnumMap, json['language']),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RoleEnumMap, e))
          .toList(),
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'fullName': instance.fullName,
  'language': _$LanguageEnumMap[instance.language]!,
  'roles': instance.roles.map((e) => _$RoleEnumMap[e]!).toList(),
};

const _$LanguageEnumMap = {
  Language.ru: 'ru',
  Language.uz: 'uz',
  Language.kz: 'kz',
};

const _$RoleEnumMap = {
  Role.pharmacist: 'pharmacist',
  Role.doctor: 'doctor',
  Role.medrep: 'medrep',
  Role.productOwner: 'product_owner',
};

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  token: json['token'] as String,
  account: Account.fromJson(json['account'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'token': instance.token,
  'account': instance.account,
};

_TgLoginStart _$TgLoginStartFromJson(Map<String, dynamic> json) =>
    _TgLoginStart(
      nonce: json['nonce'] as String,
      botUrl: json['botUrl'] as String,
      deepLink: json['deepLink'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$TgLoginStartToJson(_TgLoginStart instance) =>
    <String, dynamic>{
      'nonce': instance.nonce,
      'botUrl': instance.botUrl,
      'deepLink': instance.deepLink,
      'expiresIn': instance.expiresIn,
    };

TgPollPending _$TgPollPendingFromJson(Map<String, dynamic> json) =>
    TgPollPending($type: json['status'] as String?);

Map<String, dynamic> _$TgPollPendingToJson(TgPollPending instance) =>
    <String, dynamic>{'status': instance.$type};

TgPollExpired _$TgPollExpiredFromJson(Map<String, dynamic> json) =>
    TgPollExpired($type: json['status'] as String?);

Map<String, dynamic> _$TgPollExpiredToJson(TgPollExpired instance) =>
    <String, dynamic>{'status': instance.$type};

TgPollDone _$TgPollDoneFromJson(Map<String, dynamic> json) => TgPollDone(
  token: json['token'] as String,
  account: Account.fromJson(json['account'] as Map<String, dynamic>),
  $type: json['status'] as String?,
);

Map<String, dynamic> _$TgPollDoneToJson(TgPollDone instance) =>
    <String, dynamic>{
      'token': instance.token,
      'account': instance.account,
      'status': instance.$type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportMessage _$SupportMessageFromJson(Map<String, dynamic> json) =>
    _SupportMessage(
      id: (json['id'] as num).toInt(),
      from: json['from'] as String,
      text: json['text'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$SupportMessageToJson(_SupportMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'text': instance.text,
      'createdAt': instance.createdAt,
    };

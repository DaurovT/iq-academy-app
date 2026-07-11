// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'link': instance.link,
    };

_AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) =>
    _AccountSettings(telegramLinked: json['telegramLinked'] as bool);

Map<String, dynamic> _$AccountSettingsToJson(_AccountSettings instance) =>
    <String, dynamic>{'telegramLinked': instance.telegramLinked};

_NotificationSettings _$NotificationSettingsFromJson(
  Map<String, dynamic> json,
) => _NotificationSettings(
  checks: json['checks'] as bool,
  quests: json['quests'] as bool,
  learning: json['learning'] as bool,
  marketing: json['marketing'] as bool,
);

Map<String, dynamic> _$NotificationSettingsToJson(
  _NotificationSettings instance,
) => <String, dynamic>{
  'checks': instance.checks,
  'quests': instance.quests,
  'learning': instance.learning,
  'marketing': instance.marketing,
};

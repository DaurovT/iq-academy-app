// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quest _$QuestFromJson(Map<String, dynamic> json) => _Quest(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  status: $enumDecode(_$QuestStatusEnumMap, json['status']),
  rewardType: $enumDecode(_$RewardTypeEnumMap, json['rewardType']),
  target: $enumDecode(_$QuestTargetEnumMap, json['target']),
  prizeIqc: (json['prizeIqc'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  completedCount: (json['completedCount'] as num).toInt(),
  brand: json['brand'] as String?,
  drug: json['drug'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
);

Map<String, dynamic> _$QuestToJson(_Quest instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'status': _$QuestStatusEnumMap[instance.status]!,
  'rewardType': _$RewardTypeEnumMap[instance.rewardType]!,
  'target': _$QuestTargetEnumMap[instance.target]!,
  'prizeIqc': instance.prizeIqc,
  'progress': instance.progress,
  'completedCount': instance.completedCount,
  'brand': instance.brand,
  'drug': instance.drug,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
};

const _$QuestStatusEnumMap = {
  QuestStatus.active: 'active',
  QuestStatus.disabled: 'disabled',
};

const _$RewardTypeEnumMap = {
  RewardType.iqc: 'iqc',
  RewardType.voucher: 'voucher',
};

const _$QuestTargetEnumMap = {
  QuestTarget.checks: 'checks',
  QuestTarget.recipes: 'recipes',
};

_QuestMechanic _$QuestMechanicFromJson(Map<String, dynamic> json) =>
    _QuestMechanic(
      drug: json['drug'] as String,
      qty: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$QuestMechanicToJson(_QuestMechanic instance) =>
    <String, dynamic>{'drug': instance.drug, 'qty': instance.qty};

_TopSeller _$TopSellerFromJson(Map<String, dynamic> json) => _TopSeller(
  rank: (json['rank'] as num).toInt(),
  name: json['name'] as String,
  shop: json['shop'] as String,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$TopSellerToJson(_TopSeller instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'name': instance.name,
      'shop': instance.shop,
      'total': instance.total,
    };

_QuestDetail _$QuestDetailFromJson(Map<String, dynamic> json) => _QuestDetail(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  status: $enumDecode(_$QuestStatusEnumMap, json['status']),
  rewardType: $enumDecode(_$RewardTypeEnumMap, json['rewardType']),
  target: $enumDecode(_$QuestTargetEnumMap, json['target']),
  prizeIqc: (json['prizeIqc'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  completedCount: (json['completedCount'] as num).toInt(),
  brand: json['brand'] as String?,
  drug: json['drug'] as String?,
  mechanics:
      (json['mechanics'] as List<dynamic>)
          .map((e) => QuestMechanic.fromJson(e as Map<String, dynamic>))
          .toList(),
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
  repeatability: json['repeatability'] as String,
  perUserLimit: (json['perUserLimit'] as num?)?.toInt(),
  participantLimit: (json['participantLimit'] as num?)?.toInt(),
  participants: (json['participants'] as num).toInt(),
  topSellers:
      (json['topSellers'] as List<dynamic>)
          .map((e) => TopSeller.fromJson(e as Map<String, dynamic>))
          .toList(),
  goal: (json['goal'] as num).toInt(),
  myCount: (json['myCount'] as num).toInt(),
  rewardReceived: json['rewardReceived'] as bool,
);

Map<String, dynamic> _$QuestDetailToJson(_QuestDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': _$QuestStatusEnumMap[instance.status]!,
      'rewardType': _$RewardTypeEnumMap[instance.rewardType]!,
      'target': _$QuestTargetEnumMap[instance.target]!,
      'prizeIqc': instance.prizeIqc,
      'progress': instance.progress,
      'completedCount': instance.completedCount,
      'brand': instance.brand,
      'drug': instance.drug,
      'mechanics': instance.mechanics,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'repeatability': instance.repeatability,
      'perUserLimit': instance.perUserLimit,
      'participantLimit': instance.participantLimit,
      'participants': instance.participants,
      'topSellers': instance.topSellers,
      'goal': instance.goal,
      'myCount': instance.myCount,
      'rewardReceived': instance.rewardReceived,
    };

_QuestParticipation _$QuestParticipationFromJson(Map<String, dynamic> json) =>
    _QuestParticipation(
      questId: (json['questId'] as num).toInt(),
      questName: json['questName'] as String,
      completedAt: json['completedAt'] as String,
      rewardType: $enumDecode(_$RewardTypeEnumMap, json['rewardType']),
      rewardIqc: (json['rewardIqc'] as num).toInt(),
      rewardReceived: json['rewardReceived'] as bool,
    );

Map<String, dynamic> _$QuestParticipationToJson(_QuestParticipation instance) =>
    <String, dynamic>{
      'questId': instance.questId,
      'questName': instance.questName,
      'completedAt': instance.completedAt,
      'rewardType': _$RewardTypeEnumMap[instance.rewardType]!,
      'rewardIqc': instance.rewardIqc,
      'rewardReceived': instance.rewardReceived,
    };

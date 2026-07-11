// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckDrug _$CheckDrugFromJson(Map<String, dynamic> json) => _CheckDrug(
  name: json['name'] as String,
  packs: (json['packs'] as num).toInt(),
);

Map<String, dynamic> _$CheckDrugToJson(_CheckDrug instance) =>
    <String, dynamic>{'name': instance.name, 'packs': instance.packs};

_Photo _$PhotoFromJson(Map<String, dynamic> json) =>
    _Photo(id: (json['id'] as num).toInt(), url: json['url'] as String);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
};

_Check _$CheckFromJson(Map<String, dynamic> json) => _Check(
  id: (json['id'] as num).toInt(),
  status: $enumDecode(_$CheckStatusEnumMap, json['status']),
  createdAt: json['createdAt'] as String,
  photoCount: (json['photoCount'] as num).toInt(),
  drugs:
      (json['drugs'] as List<dynamic>)
          .map((e) => CheckDrug.fromJson(e as Map<String, dynamic>))
          .toList(),
  rejectReason: json['rejectReason'] as String?,
);

Map<String, dynamic> _$CheckToJson(_Check instance) => <String, dynamic>{
  'id': instance.id,
  'status': _$CheckStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt,
  'photoCount': instance.photoCount,
  'drugs': instance.drugs,
  'rejectReason': instance.rejectReason,
};

const _$CheckStatusEnumMap = {
  CheckStatus.pending: 'pending',
  CheckStatus.aiDetected: 'ai_detected',
  CheckStatus.aiWrong: 'ai_wrong',
  CheckStatus.approved: 'approved',
  CheckStatus.rejected: 'rejected',
};

_CheckAllocation _$CheckAllocationFromJson(Map<String, dynamic> json) =>
    _CheckAllocation(
      questId: (json['questId'] as num).toInt(),
      questName: json['questName'] as String,
      packs: (json['packs'] as num).toInt(),
    );

Map<String, dynamic> _$CheckAllocationToJson(_CheckAllocation instance) =>
    <String, dynamic>{
      'questId': instance.questId,
      'questName': instance.questName,
      'packs': instance.packs,
    };

_CheckDetail _$CheckDetailFromJson(Map<String, dynamic> json) => _CheckDetail(
  id: (json['id'] as num).toInt(),
  status: $enumDecode(_$CheckStatusEnumMap, json['status']),
  createdAt: json['createdAt'] as String,
  photoCount: (json['photoCount'] as num).toInt(),
  drugs:
      (json['drugs'] as List<dynamic>)
          .map((e) => CheckDrug.fromJson(e as Map<String, dynamic>))
          .toList(),
  rejectReason: json['rejectReason'] as String?,
  photos:
      (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
  aiText: json['aiText'] as String?,
  allocations:
      (json['allocations'] as List<dynamic>)
          .map((e) => CheckAllocation.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CheckDetailToJson(_CheckDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$CheckStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
      'photoCount': instance.photoCount,
      'drugs': instance.drugs,
      'rejectReason': instance.rejectReason,
      'photos': instance.photos,
      'aiText': instance.aiText,
      'allocations': instance.allocations,
    };

_RecipeDrug _$RecipeDrugFromJson(Map<String, dynamic> json) => _RecipeDrug(
  name: json['name'] as String,
  qty: (json['qty'] as num).toInt(),
);

Map<String, dynamic> _$RecipeDrugToJson(_RecipeDrug instance) =>
    <String, dynamic>{'name': instance.name, 'qty': instance.qty};

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: (json['id'] as num).toInt(),
  status: $enumDecode(_$CheckStatusEnumMap, json['status']),
  createdAt: json['createdAt'] as String,
  photoCount: (json['photoCount'] as num).toInt(),
  drugs:
      (json['drugs'] as List<dynamic>)
          .map((e) => RecipeDrug.fromJson(e as Map<String, dynamic>))
          .toList(),
  rejectReason: json['rejectReason'] as String?,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'status': _$CheckStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt,
  'photoCount': instance.photoCount,
  'drugs': instance.drugs,
  'rejectReason': instance.rejectReason,
};

_RecipeDetail _$RecipeDetailFromJson(Map<String, dynamic> json) =>
    _RecipeDetail(
      id: (json['id'] as num).toInt(),
      status: $enumDecode(_$CheckStatusEnumMap, json['status']),
      createdAt: json['createdAt'] as String,
      photoCount: (json['photoCount'] as num).toInt(),
      drugs:
          (json['drugs'] as List<dynamic>)
              .map((e) => RecipeDrug.fromJson(e as Map<String, dynamic>))
              .toList(),
      rejectReason: json['rejectReason'] as String?,
      photos:
          (json['photos'] as List<dynamic>)
              .map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList(),
      aiText: json['aiText'] as String?,
    );

Map<String, dynamic> _$RecipeDetailToJson(_RecipeDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$CheckStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
      'photoCount': instance.photoCount,
      'drugs': instance.drugs,
      'rejectReason': instance.rejectReason,
      'photos': instance.photos,
      'aiText': instance.aiText,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medrep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedrepMetrics _$MedrepMetricsFromJson(Map<String, dynamic> json) =>
    _MedrepMetrics(
      mode: $enumDecode(_$AttributionModeEnumMap, json['mode']),
      pharmCount: (json['pharmCount'] as num).toInt(),
      checksCount: (json['checksCount'] as num).toInt(),
      approvedPacksSum: (json['approvedPacksSum'] as num).toInt(),
      questsDone: (json['questsDone'] as num).toInt(),
    );

Map<String, dynamic> _$MedrepMetricsToJson(_MedrepMetrics instance) =>
    <String, dynamic>{
      'mode': _$AttributionModeEnumMap[instance.mode]!,
      'pharmCount': instance.pharmCount,
      'checksCount': instance.checksCount,
      'approvedPacksSum': instance.approvedPacksSum,
      'questsDone': instance.questsDone,
    };

const _$AttributionModeEnumMap = {
  AttributionMode.shared: 'shared',
  AttributionMode.primary: 'primary',
};

_MedrepQuestDrug _$MedrepQuestDrugFromJson(Map<String, dynamic> json) =>
    _MedrepQuestDrug(
      drug: json['drug'] as String,
      need: (json['need'] as num).toInt(),
      got: (json['got'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MedrepQuestDrugToJson(_MedrepQuestDrug instance) =>
    <String, dynamic>{
      'drug': instance.drug,
      'need': instance.need,
      'got': instance.got,
    };

_MedrepQuestParticipantDrug _$MedrepQuestParticipantDrugFromJson(
  Map<String, dynamic> json,
) => _MedrepQuestParticipantDrug(
  drug: json['drug'] as String,
  got: (json['got'] as num).toInt(),
  need: (json['need'] as num).toInt(),
);

Map<String, dynamic> _$MedrepQuestParticipantDrugToJson(
  _MedrepQuestParticipantDrug instance,
) => <String, dynamic>{
  'drug': instance.drug,
  'got': instance.got,
  'need': instance.need,
};

_MedrepQuestParticipant _$MedrepQuestParticipantFromJson(
  Map<String, dynamic> json,
) => _MedrepQuestParticipant(
  telegramId: (json['telegramId'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String,
  shop: json['shop'] as String,
  done: (json['done'] as num).toInt(),
  collected: (json['collected'] as num).toInt(),
  goal: (json['goal'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  perDrug:
      (json['perDrug'] as List<dynamic>)
          .map(
            (e) =>
                MedrepQuestParticipantDrug.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$MedrepQuestParticipantToJson(
  _MedrepQuestParticipant instance,
) => <String, dynamic>{
  'telegramId': instance.telegramId,
  'name': instance.name,
  'phone': instance.phone,
  'shop': instance.shop,
  'done': instance.done,
  'collected': instance.collected,
  'goal': instance.goal,
  'progress': instance.progress,
  'perDrug': instance.perDrug,
};

_MedrepQuest _$MedrepQuestFromJson(Map<String, dynamic> json) => _MedrepQuest(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  goal: (json['goal'] as num).toInt(),
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  drugs:
      (json['drugs'] as List<dynamic>)
          .map((e) => MedrepQuestDrug.fromJson(e as Map<String, dynamic>))
          .toList(),
  participants:
      (json['participants'] as List<dynamic>)
          .map(
            (e) => MedrepQuestParticipant.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  empty: json['empty'] as bool,
);

Map<String, dynamic> _$MedrepQuestToJson(_MedrepQuest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'goal': instance.goal,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'drugs': instance.drugs,
      'participants': instance.participants,
      'empty': instance.empty,
    };

_PortfolioPharmacist _$PortfolioPharmacistFromJson(Map<String, dynamic> json) =>
    _PortfolioPharmacist(
      telegramId: (json['telegramId'] as num).toInt(),
      name: json['name'] as String,
      shop: json['shop'] as String,
      city: json['city'] as String,
      checks: (json['checks'] as num).toInt(),
      quests: (json['quests'] as num).toInt(),
    );

Map<String, dynamic> _$PortfolioPharmacistToJson(
  _PortfolioPharmacist instance,
) => <String, dynamic>{
  'telegramId': instance.telegramId,
  'name': instance.name,
  'shop': instance.shop,
  'city': instance.city,
  'checks': instance.checks,
  'quests': instance.quests,
};

_LeaderRow _$LeaderRowFromJson(Map<String, dynamic> json) => _LeaderRow(
  rank: (json['rank'] as num).toInt(),
  name: json['name'] as String,
  value: (json['value'] as num).toInt(),
  isMe: json['isMe'] as bool?,
);

Map<String, dynamic> _$LeaderRowToJson(_LeaderRow instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'name': instance.name,
      'value': instance.value,
      'isMe': instance.isMe,
    };

_Leaderboard _$LeaderboardFromJson(Map<String, dynamic> json) => _Leaderboard(
  mode: $enumDecode(_$AttributionModeEnumMap, json['mode']),
  metric: json['metric'] as String,
  items:
      (json['items'] as List<dynamic>)
          .map((e) => LeaderRow.fromJson(e as Map<String, dynamic>))
          .toList(),
  myRank: (json['myRank'] as num).toInt(),
  company: json['company'] as String?,
);

Map<String, dynamic> _$LeaderboardToJson(_Leaderboard instance) =>
    <String, dynamic>{
      'mode': _$AttributionModeEnumMap[instance.mode]!,
      'metric': instance.metric,
      'items': instance.items,
      'myRank': instance.myRank,
      'company': instance.company,
    };

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  labelCode: json['labelCode'] as String,
);

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'labelCode': instance.labelCode,
};

_PendingReferral _$PendingReferralFromJson(Map<String, dynamic> json) =>
    _PendingReferral(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      shop: json['shop'] as String?,
      requestedAt: json['requestedAt'] as String,
    );

Map<String, dynamic> _$PendingReferralToJson(_PendingReferral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'shop': instance.shop,
      'requestedAt': instance.requestedAt,
    };

_RecentCheck _$RecentCheckFromJson(Map<String, dynamic> json) => _RecentCheck(
  id: (json['id'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  status: $enumDecode(_$CheckStatusEnumMap, json['status']),
  packs: (json['packs'] as num).toInt(),
);

Map<String, dynamic> _$RecentCheckToJson(_RecentCheck instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'status': _$CheckStatusEnumMap[instance.status]!,
      'packs': instance.packs,
    };

const _$CheckStatusEnumMap = {
  CheckStatus.pending: 'pending',
  CheckStatus.aiDetected: 'ai_detected',
  CheckStatus.aiWrong: 'ai_wrong',
  CheckStatus.approved: 'approved',
  CheckStatus.rejected: 'rejected',
};

_PharmacistDetail _$PharmacistDetailFromJson(Map<String, dynamic> json) =>
    _PharmacistDetail(
      telegramId: (json['telegramId'] as num).toInt(),
      name: json['name'] as String,
      shop: json['shop'] as String,
      city: json['city'] as String,
      checks: (json['checks'] as num).toInt(),
      quests: (json['quests'] as num).toInt(),
      approvedPacks: (json['approvedPacks'] as num).toInt(),
      lastActivity: json['lastActivity'] as String,
      recentChecks:
          (json['recentChecks'] as List<dynamic>)
              .map((e) => RecentCheck.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PharmacistDetailToJson(_PharmacistDetail instance) =>
    <String, dynamic>{
      'telegramId': instance.telegramId,
      'name': instance.name,
      'shop': instance.shop,
      'city': instance.city,
      'checks': instance.checks,
      'quests': instance.quests,
      'approvedPacks': instance.approvedPacks,
      'lastActivity': instance.lastActivity,
      'recentChecks': instance.recentChecks,
    };

_DoctorQuestDrug _$DoctorQuestDrugFromJson(Map<String, dynamic> json) =>
    _DoctorQuestDrug(
      drug: json['drug'] as String,
      need: (json['need'] as num).toDouble(),
      got: (json['got'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$DoctorQuestDrugToJson(_DoctorQuestDrug instance) =>
    <String, dynamic>{
      'drug': instance.drug,
      'need': instance.need,
      'got': instance.got,
    };

_DoctorQuestInfo _$DoctorQuestInfoFromJson(Map<String, dynamic> json) =>
    _DoctorQuestInfo(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      goal: (json['goal'] as num).toDouble(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      drugs:
          (json['drugs'] as List<dynamic>?)
              ?.map((e) => DoctorQuestDrug.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DoctorQuestInfoToJson(_DoctorQuestInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'goal': instance.goal,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'drugs': instance.drugs,
    };

_DoctorRow _$DoctorRowFromJson(Map<String, dynamic> json) => _DoctorRow(
  telegramId: (json['telegramId'] as num).toInt(),
  name: json['name'] as String,
  workplace: json['workplace'] as String,
  city: json['city'] as String,
  phone: json['phone'] as String,
  recipes: (json['recipes'] as num).toInt(),
  approvedRecipes: (json['approvedRecipes'] as num).toInt(),
  lastRecipeAt: json['lastRecipeAt'] as String?,
  done: (json['done'] as num).toInt(),
  collected: (json['collected'] as num).toDouble(),
  goal: (json['goal'] as num).toDouble(),
  progress: (json['progress'] as num).toDouble(),
  perDrug:
      (json['perDrug'] as List<dynamic>?)
          ?.map((e) => DoctorQuestDrug.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DoctorRowToJson(_DoctorRow instance) =>
    <String, dynamic>{
      'telegramId': instance.telegramId,
      'name': instance.name,
      'workplace': instance.workplace,
      'city': instance.city,
      'phone': instance.phone,
      'recipes': instance.recipes,
      'approvedRecipes': instance.approvedRecipes,
      'lastRecipeAt': instance.lastRecipeAt,
      'done': instance.done,
      'collected': instance.collected,
      'goal': instance.goal,
      'progress': instance.progress,
      'perDrug': instance.perDrug,
    };

_DoctorRegionGroup _$DoctorRegionGroupFromJson(Map<String, dynamic> json) =>
    _DoctorRegionGroup(
      region: json['region'] as String,
      doctors: (json['doctors'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => DoctorRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DoctorRegionGroupToJson(_DoctorRegionGroup instance) =>
    <String, dynamic>{
      'region': instance.region,
      'doctors': instance.doctors,
      'completed': instance.completed,
      'items': instance.items,
    };

_DoctorTotals _$DoctorTotalsFromJson(Map<String, dynamic> json) =>
    _DoctorTotals(
      doctors: (json['doctors'] as num?)?.toInt() ?? 0,
      completed: (json['completed'] as num?)?.toInt() ?? 0,
      inProgress: (json['inProgress'] as num?)?.toInt() ?? 0,
      idle: (json['idle'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DoctorTotalsToJson(_DoctorTotals instance) =>
    <String, dynamic>{
      'doctors': instance.doctors,
      'completed': instance.completed,
      'inProgress': instance.inProgress,
      'idle': instance.idle,
    };

_DoctorsOverview _$DoctorsOverviewFromJson(Map<String, dynamic> json) =>
    _DoctorsOverview(
      available: json['available'] as bool,
      companyName: json['companyName'] as String?,
      questId: (json['questId'] as num?)?.toInt(),
      quests:
          (json['quests'] as List<dynamic>?)
              ?.map((e) => DoctorQuestInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totals:
          json['totals'] == null
              ? const DoctorTotals()
              : DoctorTotals.fromJson(json['totals'] as Map<String, dynamic>),
      regions:
          (json['regions'] as List<dynamic>?)
              ?.map(
                (e) => DoctorRegionGroup.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DoctorsOverviewToJson(_DoctorsOverview instance) =>
    <String, dynamic>{
      'available': instance.available,
      'companyName': instance.companyName,
      'questId': instance.questId,
      'quests': instance.quests,
      'totals': instance.totals,
      'regions': instance.regions,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

enum QuestStatus {
  @JsonValue('active')
  active,
  @JsonValue('disabled')
  disabled,
}

enum RewardType {
  @JsonValue('iqc')
  iqc,
  @JsonValue('voucher')
  voucher,
}

/// Цель квеста: чеки (фармацевт) | рецепты (врач).
enum QuestTarget {
  @JsonValue('checks')
  checks,
  @JsonValue('recipes')
  recipes;

  String get code => name;
}

@freezed
abstract class Quest with _$Quest {
  const factory Quest({
    required int id,
    required String name,
    required String description,
    required QuestStatus status,
    required RewardType rewardType,
    required QuestTarget target,
    required int prizeIqc,
    required double progress,
    required int completedCount,
    String? brand,
    String? drug,
    String? startDate,
    String? endDate,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
}

@freezed
abstract class QuestMechanic with _$QuestMechanic {
  const factory QuestMechanic({
    required String drug,
    required int qty,
  }) = _QuestMechanic;

  factory QuestMechanic.fromJson(Map<String, dynamic> json) =>
      _$QuestMechanicFromJson(json);
}

@freezed
abstract class TopSeller with _$TopSeller {
  const factory TopSeller({
    required int rank,
    required String name,
    required String shop,
    required int total,
  }) = _TopSeller;

  factory TopSeller.fromJson(Map<String, dynamic> json) =>
      _$TopSellerFromJson(json);
}

/// Детальная карточка квеста (в TS расширяет Quest — здесь поля плоско).
@freezed
abstract class QuestDetail with _$QuestDetail {
  const factory QuestDetail({
    required int id,
    required String name,
    required String description,
    required QuestStatus status,
    required RewardType rewardType,
    required QuestTarget target,
    required int prizeIqc,
    required double progress,
    required int completedCount,
    String? brand,
    String? drug,
    required List<QuestMechanic> mechanics,
    required String startDate,
    String? endDate,
    required String repeatability, // 'once' | 'unlimited'
    int? perUserLimit,
    int? participantLimit,
    required int participants,
    required List<TopSeller> topSellers,
    required int goal,
    required int myCount,
    required bool rewardReceived,
  }) = _QuestDetail;

  factory QuestDetail.fromJson(Map<String, dynamic> json) =>
      _$QuestDetailFromJson(json);
}

@freezed
abstract class QuestParticipation with _$QuestParticipation {
  const factory QuestParticipation({
    required int questId,
    required String questName,
    required String completedAt,
    required RewardType rewardType,
    required int rewardIqc,
    required bool rewardReceived,
  }) = _QuestParticipation;

  factory QuestParticipation.fromJson(Map<String, dynamic> json) =>
      _$QuestParticipationFromJson(json);
}

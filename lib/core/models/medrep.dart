import 'package:freezed_annotation/freezed_annotation.dart';
import 'check.dart';

part 'medrep.freezed.dart';
part 'medrep.g.dart';

/// Режим атрибуции медпреда: общий пул | первичный.
enum AttributionMode {
  @JsonValue('shared')
  shared,
  @JsonValue('primary')
  primary,
}

@freezed
abstract class MedrepMetrics with _$MedrepMetrics {
  const factory MedrepMetrics({
    required AttributionMode mode,
    required int pharmCount,
    required int checksCount,
    required int approvedPacksSum,
    required int questsDone,
  }) = _MedrepMetrics;

  factory MedrepMetrics.fromJson(Map<String, dynamic> json) =>
      _$MedrepMetricsFromJson(json);
}

@freezed
abstract class MedrepQuestDrug with _$MedrepQuestDrug {
  const factory MedrepQuestDrug({
    required String drug,
    required int need,
    int? got,
  }) = _MedrepQuestDrug;

  factory MedrepQuestDrug.fromJson(Map<String, dynamic> json) =>
      _$MedrepQuestDrugFromJson(json);
}

@freezed
abstract class MedrepQuestParticipantDrug with _$MedrepQuestParticipantDrug {
  const factory MedrepQuestParticipantDrug({
    required String drug,
    required int got,
    required int need,
  }) = _MedrepQuestParticipantDrug;

  factory MedrepQuestParticipantDrug.fromJson(Map<String, dynamic> json) =>
      _$MedrepQuestParticipantDrugFromJson(json);
}

@freezed
abstract class MedrepQuestParticipant with _$MedrepQuestParticipant {
  const factory MedrepQuestParticipant({
    required int telegramId,
    required String name,
    required String phone,
    required String shop,
    required int done,
    required int collected,
    required int goal,
    required double progress,
    required List<MedrepQuestParticipantDrug> perDrug,
  }) = _MedrepQuestParticipant;

  factory MedrepQuestParticipant.fromJson(Map<String, dynamic> json) =>
      _$MedrepQuestParticipantFromJson(json);
}

@freezed
abstract class MedrepQuest with _$MedrepQuest {
  const factory MedrepQuest({
    required int id,
    required String name,
    required int goal,
    String? startDate,
    String? endDate,
    required List<MedrepQuestDrug> drugs,
    required List<MedrepQuestParticipant> participants,
    required bool empty,
  }) = _MedrepQuest;

  factory MedrepQuest.fromJson(Map<String, dynamic> json) =>
      _$MedrepQuestFromJson(json);
}

@freezed
abstract class PortfolioPharmacist with _$PortfolioPharmacist {
  const factory PortfolioPharmacist({
    required int telegramId,
    required String name,
    required String shop,
    required String city,
    required int checks,
    required int quests,
  }) = _PortfolioPharmacist;

  factory PortfolioPharmacist.fromJson(Map<String, dynamic> json) =>
      _$PortfolioPharmacistFromJson(json);
}

@freezed
abstract class LeaderRow with _$LeaderRow {
  const factory LeaderRow({
    required int rank,
    required String name,
    required int value,
    bool? isMe,
  }) = _LeaderRow;

  factory LeaderRow.fromJson(Map<String, dynamic> json) =>
      _$LeaderRowFromJson(json);
}

@freezed
abstract class Leaderboard with _$Leaderboard {
  const factory Leaderboard({
    required AttributionMode mode,
    required String metric, // 'checks' | 'pharm' | 'quests'
    required List<LeaderRow> items,
    required int myRank,
    String? company,
  }) = _Leaderboard;

  factory Leaderboard.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardFromJson(json);
}

@freezed
abstract class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    required String labelCode,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
abstract class PendingReferral with _$PendingReferral {
  const factory PendingReferral({
    required int id,
    required String name,
    required String phone,
    String? shop,
    required String requestedAt,
  }) = _PendingReferral;

  factory PendingReferral.fromJson(Map<String, dynamic> json) =>
      _$PendingReferralFromJson(json);
}

@freezed
abstract class RecentCheck with _$RecentCheck {
  const factory RecentCheck({
    required int id,
    required String createdAt,
    required CheckStatus status,
    required int packs,
  }) = _RecentCheck;

  factory RecentCheck.fromJson(Map<String, dynamic> json) =>
      _$RecentCheckFromJson(json);
}

@freezed
abstract class PharmacistDetail with _$PharmacistDetail {
  const factory PharmacistDetail({
    required int telegramId,
    required String name,
    required String shop,
    required String city,
    required int checks,
    required int quests,
    required int approvedPacks,
    required String lastActivity,
    required List<RecentCheck> recentChecks,
  }) = _PharmacistDetail;

  factory PharmacistDetail.fromJson(Map<String, dynamic> json) =>
      _$PharmacistDetailFromJson(json);
}

// ── Врачи компании медпреда (рецептурные проекты) ───────────────────────────
// Прямой связки «медпред → врач» в данных пока нет, поэтому бэкенд отдаёт всех
// врачей рецептурного проекта КОМПАНИИ медпреда, сгруппированных по регионам.

@freezed
abstract class DoctorQuestDrug with _$DoctorQuestDrug {
  const factory DoctorQuestDrug({
    required String drug,
    required double need,
    @Default(0) double got,
  }) = _DoctorQuestDrug;

  factory DoctorQuestDrug.fromJson(Map<String, dynamic> json) =>
      _$DoctorQuestDrugFromJson(json);
}

/// Рецептурный квест компании — по нему считается прогресс врачей.
@freezed
abstract class DoctorQuestInfo with _$DoctorQuestInfo {
  const factory DoctorQuestInfo({
    required int id,
    required String name,
    required double goal,
    String? startDate,
    String? endDate,
    @Default([]) List<DoctorQuestDrug> drugs,
  }) = _DoctorQuestInfo;

  factory DoctorQuestInfo.fromJson(Map<String, dynamic> json) =>
      _$DoctorQuestInfoFromJson(json);
}

@freezed
abstract class DoctorRow with _$DoctorRow {
  const factory DoctorRow({
    required int telegramId,
    required String name,
    required String workplace,
    required String city,
    required String phone,
    required int recipes,
    required int approvedRecipes,
    String? lastRecipeAt,

    /// Сколько раз квест выполнен целиком.
    required int done,

    /// Набрано в текущем заходе (с капом по норме) и норма квеста.
    required double collected,
    required double goal,
    required double progress,
    @Default([]) List<DoctorQuestDrug> perDrug,
  }) = _DoctorRow;

  factory DoctorRow.fromJson(Map<String, dynamic> json) =>
      _$DoctorRowFromJson(json);
}

@freezed
abstract class DoctorRegionGroup with _$DoctorRegionGroup {
  const factory DoctorRegionGroup({
    required String region,
    required int doctors,
    required int completed,
    @Default([]) List<DoctorRow> items,
  }) = _DoctorRegionGroup;

  factory DoctorRegionGroup.fromJson(Map<String, dynamic> json) =>
      _$DoctorRegionGroupFromJson(json);
}

@freezed
abstract class DoctorTotals with _$DoctorTotals {
  const factory DoctorTotals({
    @Default(0) int doctors,
    @Default(0) int completed,
    @Default(0) int inProgress,
    @Default(0) int idle,
  }) = _DoctorTotals;

  factory DoctorTotals.fromJson(Map<String, dynamic> json) =>
      _$DoctorTotalsFromJson(json);
}

@freezed
abstract class DoctorsOverview with _$DoctorsOverview {
  const factory DoctorsOverview({
    /// false — у компании медпреда нет рецептурного проекта (это не ошибка).
    required bool available,
    String? companyName,
    int? questId,
    @Default([]) List<DoctorQuestInfo> quests,
    @Default(DoctorTotals()) DoctorTotals totals,
    @Default([]) List<DoctorRegionGroup> regions,
  }) = _DoctorsOverview;

  factory DoctorsOverview.fromJson(Map<String, dynamic> json) =>
      _$DoctorsOverviewFromJson(json);
}

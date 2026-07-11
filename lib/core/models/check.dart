import 'package:freezed_annotation/freezed_annotation.dart';

part 'check.freezed.dart';
part 'check.g.dart';

/// Статус чека/рецепта (общий для обоих).
enum CheckStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('ai_detected')
  aiDetected,
  @JsonValue('ai_wrong')
  aiWrong,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected;

  String get label => switch (this) {
        CheckStatus.pending => 'На проверке',
        CheckStatus.aiDetected => 'Распознан ИИ',
        CheckStatus.aiWrong => 'ИИ не распознал',
        CheckStatus.approved => 'Одобрен',
        CheckStatus.rejected => 'Отклонён',
      };
}

@freezed
abstract class CheckDrug with _$CheckDrug {
  const factory CheckDrug({
    required String name,
    required int packs,
  }) = _CheckDrug;

  factory CheckDrug.fromJson(Map<String, dynamic> json) =>
      _$CheckDrugFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required String url,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
abstract class Check with _$Check {
  const factory Check({
    required int id,
    required CheckStatus status,
    required String createdAt,
    required int photoCount,
    required List<CheckDrug> drugs,
    String? rejectReason,
  }) = _Check;

  factory Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);
}

@freezed
abstract class CheckAllocation with _$CheckAllocation {
  const factory CheckAllocation({
    required int questId,
    required String questName,
    required int packs,
  }) = _CheckAllocation;

  factory CheckAllocation.fromJson(Map<String, dynamic> json) =>
      _$CheckAllocationFromJson(json);
}

@freezed
abstract class CheckDetail with _$CheckDetail {
  const factory CheckDetail({
    required int id,
    required CheckStatus status,
    required String createdAt,
    required int photoCount,
    required List<CheckDrug> drugs,
    String? rejectReason,
    required List<Photo> photos,
    String? aiText,
    required List<CheckAllocation> allocations,
  }) = _CheckDetail;

  factory CheckDetail.fromJson(Map<String, dynamic> json) =>
      _$CheckDetailFromJson(json);
}

// ── Рецепты врача ──

@freezed
abstract class RecipeDrug with _$RecipeDrug {
  const factory RecipeDrug({
    required String name,
    required int qty,
  }) = _RecipeDrug;

  factory RecipeDrug.fromJson(Map<String, dynamic> json) =>
      _$RecipeDrugFromJson(json);
}

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required CheckStatus status,
    required String createdAt,
    required int photoCount,
    required List<RecipeDrug> drugs,
    String? rejectReason,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
abstract class RecipeDetail with _$RecipeDetail {
  const factory RecipeDetail({
    required int id,
    required CheckStatus status,
    required String createdAt,
    required int photoCount,
    required List<RecipeDrug> drugs,
    String? rejectReason,
    required List<Photo> photos,
    String? aiText,
  }) = _RecipeDetail;

  factory RecipeDetail.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailFromJson(json);
}

/// Онбординг врача при отправке рецепта (все поля опциональны).
class DoctorRecipeInfo {
  const DoctorRecipeInfo({this.name, this.workplace, this.city, this.phone});

  final String? name;
  final String? workplace;
  final String? city;
  final String? phone;
}

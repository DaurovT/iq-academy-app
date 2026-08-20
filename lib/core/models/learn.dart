import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet.dart';

part 'learn.freezed.dart';
part 'learn.g.dart';

@freezed
abstract class Course with _$Course {
  const factory Course({
    required int id,
    required String title,
    required String description,
    required int lessonCount,
    required double progress,
    String? ownerBrand,
    String? coverUrl,
    String? category,
    String? targetCity,
    String? targetSpecialty,
    bool? mandatory,
    bool? isNew,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required int id,
    required String title,
    required String kind, // 'video' | 'quiz'
    required int durationMin,
    required bool completed,
    required int rewardIqc,
    int? videoDurationSec,
    String? videoUrl,
    bool? locked,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

@freezed
abstract class CourseDetail with _$CourseDetail {
  const factory CourseDetail({
    required int id,
    required String title,
    required String description,
    required int lessonCount,
    required double progress,
    String? ownerBrand,
    String? coverUrl,
    String? category,
    String? targetCity,
    String? targetSpecialty,
    bool? mandatory,
    bool? isNew,
    required List<Lesson> lessons,
  }) = _CourseDetail;

  factory CourseDetail.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailFromJson(json);
}

enum QuizQuestionType {
  @JsonValue('single')
  single,
  @JsonValue('multi')
  multi,
  @JsonValue('numeric')
  numeric,
  @JsonValue('ordering')
  ordering,
  @JsonValue('matching')
  matching,
}

@freezed
abstract class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required int id,
    required QuizQuestionType type,
    required String text,
    String? imageUrl,
    List<String>? options,
    String? numericHint,
    List<String>? matchLeft,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}

@freezed
abstract class QuizAttempt with _$QuizAttempt {
  const factory QuizAttempt({
    required int score,
    required int total,
    required bool passed,
    required String at,
  }) = _QuizAttempt;

  factory QuizAttempt.fromJson(Map<String, dynamic> json) =>
      _$QuizAttemptFromJson(json);
}

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({
    required String title,
    required int passScore,
    required List<QuizQuestion> questions,
    int? timeLimitSec,
    int? attemptsAllowed,
    int? attemptsUsed,
    List<QuizAttempt>? history,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
abstract class QuizReviewItem with _$QuizReviewItem {
  const factory QuizReviewItem({
    required int questionId,
    required bool correct,
    required String correctText,
    required String yourText,
  }) = _QuizReviewItem;

  factory QuizReviewItem.fromJson(Map<String, dynamic> json) =>
      _$QuizReviewItemFromJson(json);
}

@freezed
abstract class QuizResult with _$QuizResult {
  const factory QuizResult({
    required bool passed,
    required int score,
    required int total,
    required int rewardIqc,
    required Wallet wallet,
    required int attemptsLeft,
    required List<QuizReviewItem> review,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) =>
      _$QuizResultFromJson(json);
}

/// Ответ на вопрос квиза: индекс (single) | индексы (multi/ordering/matching)
/// | строка (numeric). Отправляется как есть — тип динамический.
class QuizAnswer {
  const QuizAnswer(this.value);
  final Object value; // int | List<int> | String
  Object toJson() => value;
}

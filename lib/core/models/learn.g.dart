// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Course _$CourseFromJson(Map<String, dynamic> json) => _Course(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  lessonCount: (json['lessonCount'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  ownerBrand: json['ownerBrand'] as String?,
  category: json['category'] as String?,
  targetCity: json['targetCity'] as String?,
  targetSpecialty: json['targetSpecialty'] as String?,
  mandatory: json['mandatory'] as bool?,
  isNew: json['isNew'] as bool?,
);

Map<String, dynamic> _$CourseToJson(_Course instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'lessonCount': instance.lessonCount,
  'progress': instance.progress,
  'ownerBrand': instance.ownerBrand,
  'category': instance.category,
  'targetCity': instance.targetCity,
  'targetSpecialty': instance.targetSpecialty,
  'mandatory': instance.mandatory,
  'isNew': instance.isNew,
};

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  kind: json['kind'] as String,
  durationMin: (json['durationMin'] as num).toInt(),
  completed: json['completed'] as bool,
  rewardIqc: (json['rewardIqc'] as num).toInt(),
  videoDurationSec: (json['videoDurationSec'] as num?)?.toInt(),
  videoUrl: json['videoUrl'] as String?,
  locked: json['locked'] as bool?,
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'kind': instance.kind,
  'durationMin': instance.durationMin,
  'completed': instance.completed,
  'rewardIqc': instance.rewardIqc,
  'videoDurationSec': instance.videoDurationSec,
  'videoUrl': instance.videoUrl,
  'locked': instance.locked,
};

_CourseDetail _$CourseDetailFromJson(Map<String, dynamic> json) =>
    _CourseDetail(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      lessonCount: (json['lessonCount'] as num).toInt(),
      progress: (json['progress'] as num).toDouble(),
      ownerBrand: json['ownerBrand'] as String?,
      category: json['category'] as String?,
      targetCity: json['targetCity'] as String?,
      targetSpecialty: json['targetSpecialty'] as String?,
      mandatory: json['mandatory'] as bool?,
      isNew: json['isNew'] as bool?,
      lessons:
          (json['lessons'] as List<dynamic>)
              .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CourseDetailToJson(_CourseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'lessonCount': instance.lessonCount,
      'progress': instance.progress,
      'ownerBrand': instance.ownerBrand,
      'category': instance.category,
      'targetCity': instance.targetCity,
      'targetSpecialty': instance.targetSpecialty,
      'mandatory': instance.mandatory,
      'isNew': instance.isNew,
      'lessons': instance.lessons,
    };

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$QuizQuestionTypeEnumMap, json['type']),
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numericHint: json['numericHint'] as String?,
      matchLeft:
          (json['matchLeft'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$QuizQuestionTypeEnumMap[instance.type]!,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'options': instance.options,
      'numericHint': instance.numericHint,
      'matchLeft': instance.matchLeft,
    };

const _$QuizQuestionTypeEnumMap = {
  QuizQuestionType.single: 'single',
  QuizQuestionType.multi: 'multi',
  QuizQuestionType.numeric: 'numeric',
  QuizQuestionType.ordering: 'ordering',
  QuizQuestionType.matching: 'matching',
};

_QuizAttempt _$QuizAttemptFromJson(Map<String, dynamic> json) => _QuizAttempt(
  score: (json['score'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  passed: json['passed'] as bool,
  at: json['at'] as String,
);

Map<String, dynamic> _$QuizAttemptToJson(_QuizAttempt instance) =>
    <String, dynamic>{
      'score': instance.score,
      'total': instance.total,
      'passed': instance.passed,
      'at': instance.at,
    };

_Quiz _$QuizFromJson(Map<String, dynamic> json) => _Quiz(
  title: json['title'] as String,
  passScore: (json['passScore'] as num).toInt(),
  questions:
      (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
  timeLimitSec: (json['timeLimitSec'] as num?)?.toInt(),
  attemptsAllowed: (json['attemptsAllowed'] as num?)?.toInt(),
  attemptsUsed: (json['attemptsUsed'] as num?)?.toInt(),
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => QuizAttempt.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$QuizToJson(_Quiz instance) => <String, dynamic>{
  'title': instance.title,
  'passScore': instance.passScore,
  'questions': instance.questions,
  'timeLimitSec': instance.timeLimitSec,
  'attemptsAllowed': instance.attemptsAllowed,
  'attemptsUsed': instance.attemptsUsed,
  'history': instance.history,
};

_QuizReviewItem _$QuizReviewItemFromJson(Map<String, dynamic> json) =>
    _QuizReviewItem(
      questionId: (json['questionId'] as num).toInt(),
      correct: json['correct'] as bool,
      correctText: json['correctText'] as String,
      yourText: json['yourText'] as String,
    );

Map<String, dynamic> _$QuizReviewItemToJson(_QuizReviewItem instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
      'correctText': instance.correctText,
      'yourText': instance.yourText,
    };

_QuizResult _$QuizResultFromJson(Map<String, dynamic> json) => _QuizResult(
  passed: json['passed'] as bool,
  score: (json['score'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  rewardIqc: (json['rewardIqc'] as num).toInt(),
  wallet: Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
  attemptsLeft: (json['attemptsLeft'] as num).toInt(),
  review:
      (json['review'] as List<dynamic>)
          .map((e) => QuizReviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$QuizResultToJson(_QuizResult instance) =>
    <String, dynamic>{
      'passed': instance.passed,
      'score': instance.score,
      'total': instance.total,
      'rewardIqc': instance.rewardIqc,
      'wallet': instance.wallet,
      'attemptsLeft': instance.attemptsLeft,
      'review': instance.review,
    };

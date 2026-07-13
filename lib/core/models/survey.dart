/// Опрос за IQC (витрина у пользователя). Простая модель без freezed — только чтение с бэка.
class SurveyOption {
  const SurveyOption({required this.id, required this.text});
  final int id;
  final String text;

  factory SurveyOption.fromJson(Map<String, dynamic> j) => SurveyOption(
        id: (j['id'] as num).toInt(),
        text: j['text'] as String? ?? '',
      );
}

class Survey {
  const Survey({
    required this.id,
    required this.questionType,
    required this.questionText,
    required this.rewardIqc,
    this.options = const [],
  });

  final int id;
  final String questionType; // single_choice / open_text / star_rating
  final String questionText;
  final int rewardIqc;
  final List<SurveyOption> options;

  factory Survey.fromJson(Map<String, dynamic> j) => Survey(
        id: (j['id'] as num).toInt(),
        questionType: j['questionType'] as String? ?? 'single_choice',
        questionText: j['questionText'] as String? ?? '',
        rewardIqc: (j['rewardIqc'] as num?)?.toInt() ?? 0,
        options: ((j['options'] as List?) ?? [])
            .map((e) => SurveyOption.fromJson((e as Map).cast<String, dynamic>()))
            .toList(),
      );
}

class SurveyAnswerResult {
  const SurveyAnswerResult({required this.rewardIqc, required this.balanceIqc, required this.balanceUzs});
  final int rewardIqc;
  final num balanceIqc;
  final int balanceUzs;

  factory SurveyAnswerResult.fromJson(Map<String, dynamic> j) => SurveyAnswerResult(
        rewardIqc: (j['rewardIqc'] as num?)?.toInt() ?? 0,
        balanceIqc: (j['balanceIqc'] as num?) ?? 0,
        balanceUzs: (j['balanceUzs'] as num?)?.toInt() ?? 0,
      );
}

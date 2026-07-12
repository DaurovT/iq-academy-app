import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api/providers.dart';
import '../../core/models/learn.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Тест урока. Перенесён один в один из макета Figma
/// «pharmiq-learning-testing» + экраны результата (успех/провал).
class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key, required this.courseId, required this.lessonId});

  final int courseId;
  final int lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider((courseId, lessonId)));
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D1117) : const Color(0xFFF5F6FA),
      body: SafeArea(
        bottom: false,
        child: AsyncView(
          value: quiz,
          onRetry: () => ref.invalidate(quizProvider((courseId, lessonId))),
          data: (q) => _QuizRunner(
              quiz: q, courseId: courseId, lessonId: lessonId),
        ),
      ),
    );
  }
}

class _QuizRunner extends ConsumerStatefulWidget {
  const _QuizRunner(
      {required this.quiz, required this.courseId, required this.lessonId});

  final Quiz quiz;
  final int courseId;
  final int lessonId;

  @override
  ConsumerState<_QuizRunner> createState() => _QuizRunnerState();
}

class _QuizRunnerState extends ConsumerState<_QuizRunner> {
  final Map<int, dynamic> _answers = {};
  int _index = 0;
  bool _submitting = false;
  QuizResult? _result;

  Future<void> _submit() async {
    if (_submitting) return;
    setState(() => _submitting = true);
    final answers = <QuizAnswer>[];
    for (final q in widget.quiz.questions) {
      final a = _answers[q.id];
      answers.add(QuizAnswer(a ?? _emptyFor(q)));
    }
    final messenger = ScaffoldMessenger.of(context);
    try {
      final res = await ref
          .read(apiProvider)
          .catalog
          .submitQuiz(widget.courseId, widget.lessonId, answers);
      ref.invalidate(courseDetailProvider(widget.courseId));
      ref.invalidate(walletProvider);
      if (mounted) setState(() => _result = res);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Object _emptyFor(QuizQuestion q) => switch (q.type) {
        QuizQuestionType.single => -1,
        QuizQuestionType.numeric => '',
        _ => <int>[],
      };

  bool _answered(QuizQuestion q) {
    final a = _answers[q.id];
    return switch (q.type) {
      QuizQuestionType.single => a is int && a >= 0,
      QuizQuestionType.numeric => a is String && a.isNotEmpty,
      _ => a is List && a.isNotEmpty,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_result != null) {
      return _result!.passed
          ? _SuccessView(
              result: _result!,
              title: widget.quiz.title,
              onHome: () => context.go('/app'),
            )
          : _FailView(
              result: _result!,
              total: widget.quiz.questions.length,
              passScore: widget.quiz.passScore,
              onRetry: () => setState(() {
                _result = null;
                _index = 0;
                _answers.clear();
              }),
              onBack: () =>
                  context.canPop() ? context.pop() : context.go('/app/learn'),
            );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? const Color(0xFFE4E2ED) : const Color(0xFF1A1D26);
    final muted = isDark ? const Color(0xFF8B949E) : const Color(0xFF6B7280);
    final n = widget.quiz.questions.length;
    final q = widget.quiz.questions[_index];
    final isLast = _index == n - 1;
    final frac = (_index + 1) / n;

    return Column(
      children: [
        // top-app-bar
        SizedBox(
          height: 56,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () => _index > 0
                        ? setState(() => _index--)
                        : context.canPop()
                            ? context.pop()
                            : context.go('/app/learn'),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0x14FFFFFF)
                              : const Color(0xFFEEF2FF),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.arrow_back, size: 20, color: text),
                    ),
                  ),
                ),
              ),
              Text('Тестирование',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: text)),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            children: [
              // progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Вопрос ${_index + 1} из $n',
                            style: TextStyle(fontSize: 13, color: muted)),
                        Text('${(frac * 100).round()}%',
                            style: TextStyle(fontSize: 13, color: muted)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        height: 6,
                        color: const Color(0xFF1E2535),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: frac,
                            child: const ColoredBox(color: Color(0xFF1D4068)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // question card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF131A28) : Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(q.text,
                      style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          color: text)),
                ),
              ),
              const SizedBox(height: 16),
              // options
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _Options(
                  question: q,
                  answer: _answers[q.id],
                  isDark: isDark,
                  onChanged: (v) => setState(() => _answers[q.id] = v),
                ),
              ),
            ],
          ),
        ),
        // footer
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 52,
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF1D4068),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      const Color(0xFF1D4068).withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: !_answered(q) || _submitting
                    ? null
                    : isLast
                        ? _submit
                        : () => setState(() => _index++),
                child: _submitting
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : Text(isLast ? 'ЗАВЕРШИТЬ ТЕСТ' : 'СЛЕДУЮЩИЙ ВОПРОС →',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Options extends StatelessWidget {
  const _Options({
    required this.question,
    required this.answer,
    required this.isDark,
    required this.onChanged,
  });

  final QuizQuestion question;
  final dynamic answer;
  final bool isDark;
  final ValueChanged<dynamic> onChanged;

  static const _letters = ['A', 'B', 'C', 'D', 'E', 'F'];

  @override
  Widget build(BuildContext context) {
    final options = question.options ?? const [];
    final text = isDark ? const Color(0xFFE4E2ED) : const Color(0xFF1A1D26);

    if (question.type == QuizQuestionType.numeric) {
      return TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(color: text),
        decoration: InputDecoration(
          labelText: 'Ответ',
          suffixText: question.numericHint,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      );
    }

    final multi = question.type == QuizQuestionType.multi;
    final selectedSingle = answer is int ? answer as int : -1;
    final selectedMulti = (answer as List?)?.cast<int>() ?? const <int>[];

    return Column(
      children: [
        for (var i = 0; i < options.length; i++) ...[
          _OptionTile(
            letter: i < _letters.length ? _letters[i] : '${i + 1}',
            label: options[i],
            selected: multi ? selectedMulti.contains(i) : selectedSingle == i,
            isDark: isDark,
            onTap: () {
              if (multi) {
                final list = [...selectedMulti];
                list.contains(i) ? list.remove(i) : list.add(i);
                list.sort();
                onChanged(list);
              } else {
                onChanged(i);
              }
            },
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.letter,
    required this.label,
    required this.selected,
    required this.isDark,
    required this.onTap,
  });

  final String letter;
  final String label;
  final bool selected;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = isDark ? const Color(0xFFE4E2ED) : const Color(0xFF1A1D26);
    final base = isDark ? const Color(0xFF0D1520) : Colors.white;
    final border = isDark ? const Color(0xFF1E2535) : const Color(0xFFEBEDF0);
    const accent = Color(0xFF1D4068);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? accent.withValues(alpha: 0.25) : base,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: selected ? const Color(0xFF6B9EF5) : border,
              width: selected ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF6B9EF5) : const Color(0xFF1E2535),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(letter,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : text)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: text)),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Результат: успех ────────────────────────────────────────────────────

class _SuccessView extends StatelessWidget {
  const _SuccessView(
      {required this.result, required this.title, required this.onHome});

  final QuizResult result;
  final String title;
  final VoidCallback onHome;

  @override
  Widget build(BuildContext context) {
    final pct = result.total == 0
        ? 0
        : (result.score / result.total * 100).round();
    return Container(
      color: const Color(0xFF0A0F1E),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          children: [
            // cap
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFF59E0B),
                borderRadius: BorderRadius.circular(70),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x54F59E0B),
                      blurRadius: 36,
                      offset: Offset(0, 12)),
                ],
              ),
              child: const Icon(Icons.school, size: 64, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text('Поздравляем!',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            const SizedBox(height: 8),
            const Text('Тест успешно пройден!',
                style: TextStyle(fontSize: 16, color: Color(0xFF9CA3AF))),
            const SizedBox(height: 24),
            // reward card
            _Card(
              child: Column(
                children: [
                  const Text('Вы заработали',
                      style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF))),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('+ ${result.rewardIqc}',
                          style: const TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFF59E0B))),
                      const SizedBox(width: 10),
                      const Text('IQC',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF59E0B))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0x1AFFFFFF), height: 1),
                  const SizedBox(height: 12),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFF9CA3AF))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _Stat(
                        value: '${result.score}/${result.total}',
                        label: 'ПРАВИЛЬНЫХ',
                        color: Colors.white)),
                const SizedBox(width: 16),
                Expanded(
                    child: _Stat(
                        value: '$pct%',
                        label: 'РЕЗУЛЬТАТ',
                        color: const Color(0xFFF59E0B))),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)]),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onHome,
                    borderRadius: BorderRadius.circular(14),
                    child: const Center(
                      child: Text('НА ГЛАВНЫЙ ЭКРАН',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => launchUrl(
                  Uri.parse('https://pharmiq.uz/certificates'),
                  mode: LaunchMode.externalApplication),
              child: const Text('Посмотреть сертификат →',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF59E0B),
                      decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Результат: провал ───────────────────────────────────────────────────

class _FailView extends StatelessWidget {
  const _FailView({
    required this.result,
    required this.total,
    required this.passScore,
    required this.onRetry,
    required this.onBack,
  });

  final QuizResult result;
  final int total;
  final int passScore;
  final VoidCallback onRetry;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final pct = total == 0 ? 0 : (result.score / total * 100).round();
    final passPct = total == 0 ? 0 : (passScore / total * 100).round();
    return Container(
      color: const Color(0xFF0A0F1E),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444),
                borderRadius: BorderRadius.circular(36),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x33EF4444),
                      blurRadius: 24,
                      offset: Offset(0, 12)),
                ],
              ),
              child: const Icon(Icons.close, size: 36, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text('Попробуйте ещё раз',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            const SizedBox(height: 8),
            const Text('Тест не пройден',
                style: TextStyle(fontSize: 16, color: Color(0xFF9CA3AF))),
            const SizedBox(height: 24),
            _Card(
              child: Column(
                children: [
                  const Text('Ваш результат',
                      style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF))),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${result.score}/$total',
                          style: const TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFEF4444))),
                      const SizedBox(width: 10),
                      const Text('правильных',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFEF4444))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0x1AFFFFFF), height: 1),
                  const SizedBox(height: 12),
                  Text('Минимум для прохождения: $passScore/$total ($passPct%)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFF9CA3AF))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _Stat(
                        value: '${result.score}/$total',
                        label: 'ПРАВИЛЬНЫХ',
                        color: const Color(0xFFEF4444))),
                const SizedBox(width: 16),
                Expanded(
                    child: _Stat(
                        value: '$pct%',
                        label: 'РЕЗУЛЬТАТ',
                        color: const Color(0xFFEF4444))),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: onRetry,
                child: const Text('↺ ПРОЙТИ ЗАНОВО',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800)),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: onBack,
              child: const Text('Вернуться к уроку →',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9CA3AF),
                      decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 354),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1220),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x1AFFFFFF)),
      ),
      child: child,
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(
      {required this.value, required this.label, required this.color});
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1220),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x1AFFFFFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w800, color: color)),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9CA3AF))),
        ],
      ),
    );
  }
}

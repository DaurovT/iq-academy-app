import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/learn.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key, required this.courseId, required this.lessonId});

  final int courseId;
  final int lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider((courseId, lessonId)));
    return Scaffold(
      appBar: AppBar(title: const Text('Тест')),
      body: AsyncView(
        value: quiz,
        onRetry: () => ref.invalidate(quizProvider((courseId, lessonId))),
        data: (q) => _QuizRunner(
          quiz: q,
          courseId: courseId,
          lessonId: lessonId,
        ),
      ),
    );
  }
}

class _QuizRunner extends ConsumerStatefulWidget {
  const _QuizRunner({required this.quiz, required this.courseId, required this.lessonId});

  final Quiz quiz;
  final int courseId;
  final int lessonId;

  @override
  ConsumerState<_QuizRunner> createState() => _QuizRunnerState();
}

class _QuizRunnerState extends ConsumerState<_QuizRunner> {
  /// Ответы по id вопроса: индекс, список индексов или строка.
  final Map<int, dynamic> _answers = {};
  Timer? _timer;
  int _remaining = 0;
  bool _submitting = false;
  QuizResult? _result;

  @override
  void initState() {
    super.initState();
    final limit = widget.quiz.timeLimitSec;
    if (limit != null && limit > 0) {
      _remaining = limit;
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (!mounted) return;
        setState(() => _remaining--);
        if (_remaining <= 0) {
          t.cancel();
          _submit();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_submitting) return;
    setState(() => _submitting = true);
    _timer?.cancel();

    // Собираем ответы в порядке вопросов; отсутствующие → пустые.
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

  @override
  Widget build(BuildContext context) {
    if (_result != null) {
      return _QuizResultView(result: _result!, quiz: widget.quiz);
    }

    return Column(
      children: [
        if (_timer != null)
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondaryContainer,
            padding: const EdgeInsets.all(8),
            child: Text('Осталось: ${_fmt(_remaining)}',
                textAlign: TextAlign.center),
          ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (var i = 0; i < widget.quiz.questions.length; i++)
                _QuestionCard(
                  index: i,
                  question: widget.quiz.questions[i],
                  answer: _answers[widget.quiz.questions[i].id],
                  onChanged: (v) =>
                      setState(() => _answers[widget.quiz.questions[i].id] = v),
                ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: _submitting ? null : _submit,
                child: _submitting
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Завершить тест'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _fmt(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final ss = (s % 60).toString().padLeft(2, '0');
    return '$m:$ss';
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.index,
    required this.question,
    required this.answer,
    required this.onChanged,
  });

  final int index;
  final QuizQuestion question;
  final dynamic answer;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${index + 1}. ${question.text}',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _input(context),
          ],
        ),
      ),
    );
  }

  Widget _input(BuildContext context) {
    final options = question.options ?? const [];
    switch (question.type) {
      case QuizQuestionType.single:
        return Column(
          children: [
            for (var i = 0; i < options.length; i++)
              RadioListTile<int>(
                contentPadding: EdgeInsets.zero,
                value: i,
                groupValue: answer is int ? answer as int : -1,
                title: Text(options[i]),
                onChanged: (v) => onChanged(v),
              ),
          ],
        );

      case QuizQuestionType.multi:
        final sel = (answer as List?)?.cast<int>() ?? <int>[];
        return Column(
          children: [
            for (var i = 0; i < options.length; i++)
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: sel.contains(i),
                title: Text(options[i]),
                onChanged: (on) {
                  final list = [...sel];
                  (on ?? false) ? list.add(i) : list.remove(i);
                  list.sort();
                  onChanged(list);
                },
              ),
          ],
        );

      case QuizQuestionType.numeric:
        return TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: 'Ответ',
            suffixText: question.numericHint,
          ),
          onChanged: (v) => onChanged(v),
        );

      case QuizQuestionType.ordering:
        // Текущий порядок индексов (по умолчанию исходный).
        final order = (answer as List?)?.cast<int>() ??
            List.generate(options.length, (i) => i);
        return _OrderingInput(
          options: options,
          order: order,
          onChanged: onChanged,
        );

      case QuizQuestionType.matching:
        final left = question.matchLeft ?? const [];
        final sel = (answer as List?)?.cast<int>() ??
            List.filled(left.length, -1);
        return Column(
          children: [
            for (var i = 0; i < left.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(child: Text(left[i])),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        value: sel[i] >= 0 ? sel[i] : null,
                        hint: const Text('—'),
                        items: [
                          for (var j = 0; j < options.length; j++)
                            DropdownMenuItem(value: j, child: Text(options[j])),
                        ],
                        onChanged: (v) {
                          final list = [...sel];
                          list[i] = v ?? -1;
                          onChanged(list);
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
    }
  }
}

class _OrderingInput extends StatelessWidget {
  const _OrderingInput({
    required this.options,
    required this.order,
    required this.onChanged,
  });

  final List<String> options;
  final List<int> order;
  final ValueChanged<List<int>> onChanged;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onReorder: (oldI, newI) {
        final list = [...order];
        if (newI > oldI) newI--;
        final item = list.removeAt(oldI);
        list.insert(newI, item);
        onChanged(list);
      },
      children: [
        for (var i = 0; i < order.length; i++)
          ListTile(
            key: ValueKey(order[i]),
            leading: const Icon(Icons.drag_handle),
            title: Text(options[order[i]]),
          ),
      ],
    );
  }
}

class _QuizResultView extends StatelessWidget {
  const _QuizResultView({required this.result, required this.quiz});

  final QuizResult result;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Icon(
                result.passed ? Icons.emoji_events : Icons.replay_circle_filled,
                size: 64,
                color: result.passed ? Colors.amber : scheme.error,
              ),
              const SizedBox(height: 12),
              Text(result.passed ? 'Тест пройден!' : 'Тест не пройден',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text('Результат: ${result.score} из ${result.total}'),
              if (result.passed && result.rewardIqc > 0)
                Text('+${result.rewardIqc} IQC',
                    style: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold)),
              if (!result.passed)
                Text('Осталось попыток: ${result.attemptsLeft}'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text('Разбор', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final r in result.review)
          Card(
            child: ListTile(
              leading: Icon(
                r.correct ? Icons.check_circle : Icons.cancel,
                color: r.correct ? Colors.green : scheme.error,
              ),
              title: Text('Ваш ответ: ${r.yourText}'),
              subtitle: r.correct ? null : Text('Верно: ${r.correctText}'),
            ),
          ),
      ],
    );
  }
}

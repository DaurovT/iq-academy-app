import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/learn.dart';
import '../../widgets/pq_states.dart';
import 'learn/learn_widgets.dart';
import 'learn/quiz_result_views.dart';
import 'providers.dart';

/// Тест урока (макет Test) + результаты (TestPassed / TestFailed).
class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key, required this.courseId, required this.lessonId});

  final int courseId;
  final int lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = (courseId, lessonId);
    final quiz = ref.watch(quizProvider(key));
    if (quiz.hasValue && !quiz.hasError) {
      return PqScreen(
        safeBottom: false,
        child: _QuizRunner(
          quiz: quiz.requireValue,
          courseId: courseId,
          lessonId: lessonId,
        ),
      );
    }
    final l = context.l10n;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(
            title: l.learnRowQuiz,
            backLabel: l.learnBack,
            onBack: () => learnBack(context, '/app/learn/$courseId'),
          ),
          Expanded(
            child: PqAsync<Quiz>(
              value: quiz,
              loading: PqLoadingKind.spinner,
              onRetry: () => ref.invalidate(quizProvider(key)),
              data: (_) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizRunner extends ConsumerStatefulWidget {
  const _QuizRunner({
    required this.quiz,
    required this.courseId,
    required this.lessonId,
  });

  final Quiz quiz;
  final int courseId;
  final int lessonId;

  @override
  ConsumerState<_QuizRunner> createState() => _QuizRunnerState();
}

class _QuizRunnerState extends ConsumerState<_QuizRunner> {
  final Map<int, dynamic> _answers = {};
  final Map<int, TextEditingController> _numeric = {};
  final _scroll = ScrollController();
  int _index = 0;
  bool _submitting = false;
  QuizResult? _result;

  /// Курс на момент отправки — чтобы понять, пройден ли он целиком.
  CourseDetail? _courseBefore;

  @override
  void dispose() {
    for (final c in _numeric.values) {
      c.dispose();
    }
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_submitting) return;
    setState(() => _submitting = true);
    _courseBefore =
        ref.read(courseDetailProvider(widget.courseId)).asData?.value;
    final answers = <QuizAnswer>[
      for (final q in widget.quiz.questions)
        QuizAnswer(_answers[q.id] ?? _emptyFor(q)),
    ];
    try {
      final res = await ref
          .read(apiProvider)
          .catalog
          .submitQuiz(widget.courseId, widget.lessonId, answers);
      ref.invalidate(courseDetailProvider(widget.courseId));
      ref.invalidate(walletProvider);
      if (res.passed) HapticFeedback.mediumImpact();
      if (mounted) setState(() => _result = res);
    } catch (e) {
      if (mounted) {
        showPqToast(context, learnErrorText(context, e), tone: PqTone.danger);
      }
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

  void _go(int index) {
    FocusScope.of(context).unfocus();
    setState(() => _index = index);
    if (_scroll.hasClients) _scroll.jumpTo(0);
  }

  void _back() {
    if (_result == null && _index > 0) {
      _go(_index - 1);
    } else {
      learnBack(context, '/app/learn/${widget.courseId}');
    }
  }

  void _retry() => setState(() {
    _result = null;
    _index = 0;
    _answers.clear();
    for (final c in _numeric.values) {
      c.clear();
    }
  });

  /// Следующий непройденный шаг после теста (для «Продолжить курс»).
  Lesson? _nextStep(CourseDetail? course) {
    if (course == null) return null;
    final ls = course.lessons;
    final cur = ls.indexWhere((l) => l.id == widget.lessonId);
    for (var i = cur + 1; i < ls.length; i++) {
      if (!ls[i].completed) return ls[i];
    }
    for (var i = 0; i < cur; i++) {
      if (!ls[i].completed) return ls[i];
    }
    return null;
  }

  /// Видеоурок перед тестом (для «Пересмотреть урок»).
  Lesson? _lessonBefore(CourseDetail? course) {
    if (course == null) return null;
    final ls = course.lessons;
    final cur = ls.indexWhere((l) => l.id == widget.lessonId);
    for (var i = cur - 1; i >= 0; i--) {
      if (ls[i].kind != 'quiz') return ls[i];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final course =
        ref.watch(courseDetailProvider(widget.courseId)).asData?.value;
    final lesson =
        course?.lessons.where((x) => x.id == widget.lessonId).firstOrNull;
    final reward = lesson?.rewardIqc ?? 0;

    final result = _result;
    if (result != null) {
      final before = _courseBefore ?? course;
      final courseDone =
          before != null &&
          before.lessons.every((x) => x.id == widget.lessonId || x.completed);
      final next = _nextStep(before);
      final title = before?.title ?? widget.quiz.title;
      if (result.passed) {
        return QuizPassedView(
          title: title,
          score: result.score,
          total: result.total,
          reward: result.rewardIqc,
          courseDone: courseDone || next == null,
          onBack: _back,
          onWallet: () => context.go('/app/wallet'),
          onContinue:
              courseDone || next == null
                  ? () => context.go('/app/learn')
                  : () => context.pushReplacement(
                    learnStepPath(widget.courseId, next),
                  ),
        );
      }
      final rewatch = _lessonBefore(before);
      return QuizFailedView(
        title: title,
        score: result.score,
        total: result.total,
        reward: reward,
        onBack: _back,
        onRetry: _retry,
        onRewatch:
            rewatch == null
                ? _back
                : () => context.pushReplacement(
                  learnStepPath(widget.courseId, rewatch),
                ),
      );
    }

    final n = widget.quiz.questions.length;
    if (n == 0) {
      return Column(
        children: [
          PqTopBar(
            title: widget.quiz.title,
            backLabel: l.learnBack,
            onBack: _back,
          ),
          Expanded(
            child: PqEmptyState(
              icon: PqIcons.checkSquare,
              title: widget.quiz.title,
            ),
          ),
        ],
      );
    }
    final q = widget.quiz.questions[_index];
    final isLast = _index == n - 1;
    final topTitle =
        course == null
            ? widget.quiz.title
            : l.learnTestTopBar(learnShortTitle(course.title));

    return Stack(
      children: [
        Column(
          children: [
            PqTopBar(title: topTitle, backLabel: l.learnBack, onBack: _back),
            Expanded(
              child: ListView(
                controller: _scroll,
                padding: EdgeInsets.fromLTRB(
                  16,
                  0,
                  16,
                  learnFooterClearance(context),
                ),
                children: [
                  PqAnimate(
                    child: _ProgressHeader(
                      index: _index,
                      total: n,
                      reward: reward,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Смена вопроса: новый ключ — каскад pqUp проигрывается заново.
                  KeyedSubtree(
                    key: ValueKey(_index),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PqAnimate(
                          delay: PqMotion.staggerDelay(1),
                          child: _QuestionText(question: q),
                        ),
                        const SizedBox(height: 24),
                        PqAnimate(
                          delay: PqMotion.staggerDelay(2),
                          child: _answersFor(q),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: LearnFooter(
            children: [
              LearnTrailingButton(
                label: isLast ? l.learnFinishTest : l.learnNext,
                icon: isLast ? PqIcons.check : PqIcons.chevronRight,
                loading: _submitting,
                loadingLabel: l.learnSubmitting,
                onPressed:
                    !_answered(q)
                        ? null
                        : isLast
                        ? _submit
                        : () => _go(_index + 1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _answersFor(QuizQuestion q) {
    final l = context.l10n;
    final pq = context.pq;
    if (q.type == QuizQuestionType.numeric) {
      final ctrl = _numeric.putIfAbsent(
        q.id,
        () => TextEditingController(text: _answers[q.id] as String? ?? ''),
      );
      return PqTextField(
        controller: ctrl,
        label: l.quizAnswerLabel,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textInputAction: TextInputAction.done,
        suffix:
            q.numericHint == null
                ? null
                : Text(q.numericHint!, style: PqText.field(c: pq.textMuted)),
        onChanged: (v) => setState(() => _answers[q.id] = v),
      );
    }

    final options = q.options ?? const <String>[];
    final multi = q.type != QuizQuestionType.single;
    final a = _answers[q.id];
    final single = a is int ? a : -1;
    final picked = a is List ? a.cast<int>() : const <int>[];
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _AnswerOption(
              letter: i < 26 ? String.fromCharCode(65 + i) : '${i + 1}',
              label: options[i],
              multi: multi,
              selected: multi ? picked.contains(i) : single == i,
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() {
                  if (multi) {
                    final list = [...picked];
                    list.contains(i) ? list.remove(i) : list.add(i);
                    list.sort();
                    _answers[q.id] = list;
                  } else {
                    _answers[q.id] = i;
                  }
                });
              },
            ),
          ],
        ],
      ),
    );
  }
}

/// «Вопрос 1 из 5 · Награда +30 IQC» и сегменты прогресса (pq-seg).
class _ProgressHeader extends StatelessWidget {
  const _ProgressHeader({
    required this.index,
    required this.total,
    required this.reward,
  });

  final int index;
  final int total;
  final int reward;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    // Номер вопроса выделен жирным: вставляем маркер и режем строку по нему.
    const mark = '\u0001';
    final parts = l.learnQuestionOf(mark, total).split(mark);
    final base = PqText.text(14, FontWeight.w400, c: pq.textMuted);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  style: base,
                  children: [
                    TextSpan(text: parts.first),
                    TextSpan(
                      text: '${index + 1}',
                      style: base.copyWith(
                        color: pq.text,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (parts.length > 1)
                      TextSpan(text: parts.sublist(1).join()),
                  ],
                ),
              ),
            ),
            if (reward > 0) ...[
              Text(l.learnTileReward, style: base),
              const SizedBox(width: 4),
              // Метка — inline-элемент строки: её поля (4 сверху/снизу) не
              // увеличивают высоту строки 14×1.4 — сжимаем бокс 24.8 → 19.6.
              Align(
                heightFactor: 19.6 / 24.8,
                child: PqRewardTag.iqc(l.learnIqc(reward)),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        PqSegmentProgress(
          total: total,
          filled: index + 1,
          fillColor: pq.accent,
          trackColor: pq.isDark ? pq.border : const Color(0xFFE5E7EB),
        ),
      ],
    );
  }
}

class _QuestionText extends StatelessWidget {
  const _QuestionText({required this.question});

  final QuizQuestion question;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final img = question.imageUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question.text,
          style: PqText.heading(
            22,
            FontWeight.w700,
            height: 1.15,
            ls: -.3,
            c: pq.text,
          ),
        ),
        if (img != null && img.isNotEmpty) ...[
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              img,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        ],
      ],
    );
  }
}

/// Вариант ответа (макет Test): ≥60, радиус 16, буква в круге 32; выбран —
/// рамка 2 акцентом, мягкая заливка и «нажатие» pqPress .3s.
class _AnswerOption extends StatelessWidget {
  const _AnswerOption({
    required this.letter,
    required this.label,
    required this.selected,
    required this.multi,
    required this.onTap,
  });

  final String letter;
  final String label;
  final bool selected;
  final bool multi;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final selBg = pq.isDark ? pq.accentSoft : const Color(0xFFEEF2FF);
    return Semantics(
      checked: multi ? selected : null,
      selected: multi ? null : selected,
      inMutuallyExclusiveGroup: !multi,
      child: PqPressable(
        onTap: onTap,
        child: PqAnimate(
          fx: PqFx.press,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          play: selected,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: PqMotion.ease,
            constraints: const BoxConstraints(minHeight: 60),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: selected ? selBg : pq.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? pq.accent : pq.border,
                width: selected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: selected ? pq.accent : pq.surfaceAlt,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    letter,
                    style: PqText.text(
                      14,
                      FontWeight.w700,
                      c: selected ? pq.onAccent : pq.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    // У <button> в макете line-height: normal (в Chrome у Inter 16 это 20 px).
                    style: PqText.field(
                      c: pq.text,
                      w: selected ? FontWeight.w600 : FontWeight.w500,
                    ).copyWith(height: 1.25, fontFeatures: const []),
                    child: Text(label),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import 'learn_widgets.dart';

/// Детали конфетти из макета TestPassed: left · цвет · размер · pqFall
/// длительность/задержка (ширина макета 414 — позиции масштабируются).
const _pieces = <(double, int, double, double, int, int)>[
  (11, 0xFF6B9EF5, 6, 10, 2200, 0),
  (48, 0xFFA855F7, 8, 12, 2450, 120),
  (85, 0xFFFDE047, 10, 14, 2700, 240),
  (122, 0xFF79D384, 6, 16, 2950, 360),
  (159, 0xFFF5A031, 8, 10, 3200, 480),
  (196, 0xFFFF9B8F, 10, 12, 2200, 600),
  (233, 0xFF6B9EF5, 6, 14, 2450, 720),
  (270, 0xFFA855F7, 8, 16, 2700, 0),
  (307, 0xFFFDE047, 10, 10, 2950, 120),
  (344, 0xFF79D384, 6, 12, 3200, 240),
  (381, 0xFFF5A031, 8, 14, 2200, 360),
  (22, 0xFFFF9B8F, 10, 16, 2450, 480),
  (59, 0xFF6B9EF5, 6, 10, 2700, 600),
  (96, 0xFFA855F7, 8, 12, 2950, 720),
  (133, 0xFFFDE047, 10, 14, 3200, 0),
  (170, 0xFF79D384, 6, 16, 2200, 120),
  (207, 0xFFF5A031, 8, 10, 2450, 240),
  (244, 0xFFFF9B8F, 10, 12, 2700, 360),
  (281, 0xFF6B9EF5, 6, 14, 2950, 480),
  (318, 0xFFA855F7, 8, 16, 3200, 600),
  (355, 0xFFFDE047, 10, 10, 2200, 720),
  (392, 0xFF79D384, 6, 12, 2450, 0),
];

List<PqConfettiPiece> _confetti(double width) => [
  for (final (left, color, w, h, dur, delay) in _pieces)
    PqConfettiPiece(
      left: left * width / 414,
      color: Color(color),
      width: w,
      height: h,
      duration: Duration(milliseconds: dur),
      delay: Duration(milliseconds: delay),
    ),
];

/// Каркас экрана результата: верхняя панель, контент по центру (40/24/140),
/// закреплённая кнопка; [behind] — слой под контентом (конфетти).
class _ResultScaffold extends StatelessWidget {
  const _ResultScaffold({
    required this.title,
    required this.onBack,
    required this.children,
    required this.button,
    this.behind,
  });

  final String title;
  final VoidCallback onBack;
  final List<Widget> children;
  final Widget button;
  final Widget? behind;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (behind != null)
          Positioned(left: 0, right: 0, top: 64, height: 560, child: behind!),
        Column(
          children: [
            PqTopBar(
              title: title,
              backLabel: context.l10n.learnBack,
              onBack: onBack,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  24,
                  40,
                  24,
                  learnFooterClearance(context),
                ),
                children: [
                  for (var i = 0; i < children.length; i++)
                    Padding(
                      padding: EdgeInsets.only(top: i == 0 ? 0 : 20),
                      child: Center(child: children[i]),
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
          child: LearnFooter(children: [button]),
        ),
      ],
    );
  }
}

/// Заголовок + текст результата (Onest 30/700 и 16/1.5).
class _Heading extends StatelessWidget {
  const _Heading({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: PqText.display(c: pq.text),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: PqText.bodyLarge(c: pq.textSecondary),
        ),
      ],
    );
  }
}

/// «5 из 5  правильных ответов».
class _Score extends StatelessWidget {
  const _Score({required this.score, required this.total, required this.color});

  final int score;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          l.learnScoreOf(score, total),
          style: PqText.heading(22, FontWeight.w700, c: color),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            l.learnCorrectAnswers,
            style: PqText.text(15, FontWeight.w400, c: pq.textMuted),
          ),
        ),
      ],
    );
  }
}

/// Тест пройден (макет TestPassed): конфетти pqFall, звезда pqPop .6s/.1s,
/// карточка «Начислено» pqPop .6s/.45s, остальное — каскад pqUp.
class QuizPassedView extends StatelessWidget {
  const QuizPassedView({
    super.key,
    required this.title,
    required this.score,
    required this.total,
    required this.reward,
    required this.courseDone,
    required this.onBack,
    required this.onWallet,
    required this.onContinue,
  });

  final String title;
  final int score;
  final int total;
  final int reward;
  final bool courseDone;
  final VoidCallback onBack;
  final VoidCallback onWallet;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    const pop = Duration(milliseconds: 600);
    final children = <Widget>[
      PqAnimate(
        fx: PqFx.pop,
        duration: pop,
        delay: const Duration(milliseconds: 100),
        child: Container(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            color: PqColors.reward,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const PqIcon(PqIcons.star, size: 44, color: Colors.white),
        ),
      ),
      PqAnimate(
        delay: PqMotion.staggerDelay(1),
        child: _Heading(
          title: courseDone ? l.learnCoursePassed : l.learnTestPassed,
          text: reward > 0 ? l.learnPassedText : l.learnPassedTextNoReward,
        ),
      ),
      PqAnimate(
        delay: PqMotion.staggerDelay(2),
        child: _Score(score: score, total: total, color: pq.success),
      ),
      if (reward > 0)
        PqAnimate(
          fx: PqFx.pop,
          duration: pop,
          delay: const Duration(milliseconds: 450),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: pq.walletGradient,
              ),
            ),
            child: Semantics(
              liveRegion: true,
              child: Column(
                children: [
                  Text(
                    l.learnRowRewardDone.toUpperCase(),
                    style: PqText.overline(c: pq.walletMuted),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.learnIqc(reward),
                    style: PqText.heading(
                      40,
                      FontWeight.w800,
                      height: 1.1,
                      c: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      if (reward > 0)
        PqAnimate(
          delay: PqMotion.staggerDelay(4),
          child: LearnLink(label: l.learnOpenWallet, onTap: onWallet),
        ),
    ];
    return _ResultScaffold(
      title: title,
      onBack: onBack,
      behind: LayoutBuilder(
        builder:
            (_, box) =>
                ClipRect(child: PqConfetti(pieces: _confetti(box.maxWidth))),
      ),
      button: PqButton(
        label: courseDone ? l.learnToOtherCourses : l.learnContinueCourse,
        icon: courseDone ? PqIcons.bookOpen : PqIcons.play,
        onPressed: onContinue,
      ),
      children: children,
    );
  }
}

/// Тест не пройден (макет TestFailed): иконка повтора крутится pqSpin .9s
/// после .3s, остальное — каскад pqUp.
class QuizFailedView extends StatelessWidget {
  const QuizFailedView({
    super.key,
    required this.title,
    required this.score,
    required this.total,
    required this.reward,
    required this.onBack,
    required this.onRetry,
    required this.onRewatch,
  });

  final String title;
  final int score;
  final int total;
  final int reward;
  final VoidCallback onBack;
  final VoidCallback onRetry;
  final VoidCallback onRewatch;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final children = <Widget>[
      Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          color: pq.warningSoft,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: PqAnimate(
          fx: PqFx.spin,
          delay: const Duration(milliseconds: 300),
          child: PqIcon(PqIcons.rotateCcw, size: 44, color: pq.warning),
        ),
      ),
      _Heading(title: l.learnFailedTitle, text: l.learnFailedText),
      _Score(score: score, total: total, color: pq.warning),
      if (reward > 0)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: pq.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: pq.border),
          ),
          child: Row(
            children: [
              PqIcon(PqIcons.star, size: 22, color: learnRewardFg(pq)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.learnRewardStillAvailable(reward),
                      style: PqText.text(16, FontWeight.w600, c: pq.text),
                    ),
                    const SizedBox(height: 2),
                    Text(l.learnCanRetry, style: PqText.body(c: pq.textMuted)),
                  ],
                ),
              ),
            ],
          ),
        ),
      LearnLink(label: l.learnRewatchLesson, onTap: onRewatch),
    ];
    return _ResultScaffold(
      title: title,
      onBack: onBack,
      button: PqButton(
        label: l.learnRetryTest,
        icon: PqIcons.rotateCcw,
        onPressed: onRetry,
      ),
      children: [
        for (var i = 0; i < children.length; i++)
          PqAnimate(delay: PqMotion.staggerDelay(i), child: children[i]),
      ],
    );
  }
}

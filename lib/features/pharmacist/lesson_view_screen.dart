import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/learn.dart';
import '../../widgets/pq_states.dart';
import '../../widgets/video_frame.dart';
import 'learn/learn_widgets.dart';
import 'providers.dart';

/// Просмотр урока (макет Lesson): плеер, «Урок N из M», вкладки
/// «Текст урока / Материалы», закреплённая кнопка перехода к тесту.
class LessonViewScreen extends ConsumerStatefulWidget {
  const LessonViewScreen({
    super.key,
    required this.courseId,
    required this.lessonId,
  });

  final int courseId;
  final int lessonId;

  @override
  ConsumerState<LessonViewScreen> createState() => _LessonViewScreenState();
}

class _LessonViewScreenState extends ConsumerState<LessonViewScreen> {
  int _tab = 0; // 0 — текст урока, 1 — материалы
  bool _loading = false;
  String? _videoUrl; // непусто → плеер запущен

  Future<void> _complete(CourseDetail course) async {
    setState(() => _loading = true);
    final l = context.l10n;
    try {
      final res = await ref
          .read(apiProvider)
          .catalog
          .completeLesson(widget.courseId, widget.lessonId);
      ref.invalidate(courseDetailProvider(widget.courseId));
      ref.invalidate(walletProvider);
      if (!mounted) return;
      if (res.rewardIqc > 0) {
        showPqToast(
          context,
          l.lessonCompletedReward(res.rewardIqc),
          icon: PqIcons.coins,
        );
      }
      _goNext(course);
    } catch (e) {
      if (mounted) {
        showPqToast(context, learnErrorText(context, e), tone: PqTone.danger);
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  /// Следующий ПО ПОРЯДКУ непройденный шаг после текущего (видео или тест) —
  /// не прыгаем через промежуточные видео к первому тесту.
  Lesson? _nextOf(CourseDetail course) {
    final ls = course.lessons;
    final cur = ls.indexWhere((l) => l.id == widget.lessonId);
    for (var i = cur + 1; i < ls.length; i++) {
      if (!ls[i].completed) return ls[i];
    }
    return null;
  }

  void _goNext(CourseDetail course) {
    final next = _nextOf(course);
    if (next == null) {
      learnBack(context, '/app/learn/${widget.courseId}'); // курс пройден
      return;
    }
    context.pushReplacement(learnStepPath(widget.courseId, next));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final course = ref.watch(courseDetailProvider(widget.courseId));
    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTopBar(
            title: course.asData?.value.title ?? '',
            backLabel: l.learnBack,
            onBack: () => learnBack(context, '/app/learn/${widget.courseId}'),
          ),
          Expanded(
            child: PqAsync<CourseDetail>(
              value: course,
              loading: PqLoadingKind.spinner,
              onRetry:
                  () => ref.invalidate(courseDetailProvider(widget.courseId)),
              data: (course) {
                final lesson =
                    course.lessons
                        .where((l) => l.id == widget.lessonId)
                        .firstOrNull;
                if (lesson == null) {
                  return PqEmptyState(
                    icon: PqIcons.video,
                    title: l.lessonNotFound,
                  );
                }
                return _body(context, course, lesson);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, CourseDetail course, Lesson lesson) {
    final pq = context.pq;
    final l = context.l10n;
    final videos = course.lessons.where((x) => x.kind != 'quiz').toList();
    final pos = videos.indexWhere((x) => x.id == lesson.id);
    final url = lesson.videoUrl;
    final hasVideo = url != null && url.isNotEmpty;
    final next = _nextOf(course);

    final sections = <Widget>[
      _Player(
        lesson: lesson,
        duration: learnLessonDuration(context, lesson),
        playingUrl: _videoUrl,
        onPlay: hasVideo ? () => setState(() => _videoUrl = url) : null,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pos >= 0) ...[
            Text(
              l.learnLessonOf(pos + 1, videos.length).toUpperCase(),
              style: PqText.overline(c: pq.textMuted),
            ),
            const SizedBox(height: 6),
          ],
          Text(
            lesson.title,
            style: PqText.heading(
              22,
              FontWeight.w700,
              height: 1.15,
              ls: -.3,
              c: pq.text,
            ),
          ),
        ],
      ),
      PqSegmented<int>(
        values: const [0, 1],
        selected: _tab,
        labelOf:
            (i) => i == 0 ? l.learnLessonTabText : l.learnLessonTabMaterials,
        onChanged: (i) => setState(() => _tab = i),
      ),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: PqMotion.ease,
        layoutBuilder:
            (cur, prev) => Stack(
              alignment: Alignment.topLeft,
              children: [...prev, if (cur != null) cur],
            ),
        child: Text(
          _tab == 0
              ? (course.description.trim().isEmpty
                  ? l.lessonNoMaterials
                  : course.description)
              : l.lessonNoMaterials,
          key: ValueKey(_tab),
          style: PqText.text(
            16,
            FontWeight.w400,
            height: 1.55,
            c: pq.textSecondary,
          ),
        ),
      ),
    ];

    // Кнопка: урок пройден → к следующему шагу; видео запущено (или его нет)
    // → «Завершить урок»; иначе — неактивное «Начать тест» с подсказкой.
    final Widget button;
    String? hint;
    if (lesson.completed) {
      final quizNext = next?.kind == 'quiz';
      button = PqButton(
        label:
            next == null
                ? l.learnBackToCourse
                : quizNext
                ? l.learnStartTest
                : l.learnNextLesson,
        icon:
            next == null
                ? PqIcons.bookOpen
                : quizNext
                ? PqIcons.checkSquare
                : PqIcons.play,
        onPressed: () => _goNext(course),
      );
    } else if (_videoUrl != null || !hasVideo) {
      hint = l.learnLessonHintFinish;
      button = PqButton(
        label: l.learnFinishLesson,
        icon: PqIcons.check,
        loading: _loading,
        loadingLabel: l.learnFinishingLesson,
        onPressed: () => _complete(course),
      );
    } else {
      hint = l.learnLessonHintLocked;
      button = PqButton(
        label: l.learnStartTest,
        icon: PqIcons.lock,
        onPressed: null,
      );
    }

    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            learnFooterClearance(context) + 40,
          ),
          children: [
            for (var i = 0; i < sections.length; i++)
              Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : 20),
                child: PqAnimate(
                  delay: PqMotion.staggerDelay(i),
                  child: sections[i],
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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child:
                    hint == null
                        ? const SizedBox.shrink()
                        : Padding(
                          key: ValueKey(hint),
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            hint,
                            textAlign: TextAlign.center,
                            style: PqText.text(
                              14,
                              FontWeight.w400,
                              c: pq.textMuted,
                            ),
                          ),
                        ),
              ),
              button,
            ],
          ),
        ),
      ],
    );
  }
}

/// Плеер (макет Lesson): тёмная карточка 20, заставка 210 с радиальным
/// свечением, кнопка 64 с пульсацией pqPulse, длительность, полоса 4.
/// Цвета плеера одинаковы в обеих темах.
class _Player extends StatelessWidget {
  const _Player({
    required this.lesson,
    required this.duration,
    required this.playingUrl,
    required this.onPlay,
  });

  final Lesson lesson;
  final String? duration;
  final String? playingUrl;
  final VoidCallback? onPlay;

  static const _bg = Color(0xFF07080C);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: _bg,
        child: Column(
          children: [
            SizedBox(
              height: 210,
              width: double.infinity,
              child:
                  playingUrl != null
                      ? VideoFrame(url: playingUrl!)
                      : DecoratedBox(
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment(0, -.1),
                            radius: .74,
                            colors: [Color(0xFF2A2350), _bg],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child:
                                  onPlay == null
                                      ? Semantics(
                                        label: l.learnVideoUnavailable,
                                        child: _playFace(PqIcons.video, .35),
                                      )
                                      : PqPulseRing.pulse(
                                        borderRadius: BorderRadius.circular(32),
                                        color: const Color(0xFF6B9EF5),
                                        delay: const Duration(
                                          milliseconds: 600,
                                        ),
                                        child: PqPressable(
                                          onTap: onPlay,
                                          semanticLabel: l.learnWatchVideo,
                                          scale: .94,
                                          child: _playFace(PqIcons.play, 1),
                                        ),
                                      ),
                            ),
                            if (duration != null)
                              Positioned(
                                left: 12,
                                bottom: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0x99000000),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    duration!,
                                    style: PqText.caption(
                                      c: Colors.white,
                                      w: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
            ),
            Container(
              height: 4,
              color: const Color(0xFF2E2F3A),
              alignment: Alignment.centerLeft,
              child:
                  lesson.completed
                      ? const PqAnimate(
                        fx: PqFx.fillX,
                        child: SizedBox(
                          width: double.infinity,
                          height: 4,
                          child: ColoredBox(color: Color(0xFF6B9EF5)),
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _playFace(PqIcons icon, double opacity) => Opacity(
    opacity: opacity,
    child: Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        color: Color(0x2EFFFFFF),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: PqIcon(icon, size: 26, color: Colors.white),
    ),
  );
}

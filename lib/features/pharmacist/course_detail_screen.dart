import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/img.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/learn.dart';
import '../../widgets/pq_states.dart';
import '../../widgets/video_frame.dart';
import 'learn/learn_widgets.dart';
import 'providers.dart';

/// Сколько видео урока просмотрено (0…1) — за сессию приложения, чтобы
/// прогресс в «Программе курса» не терялся при уходе с экрана.
final _watched = <int, double>{};

/// Для снимков: задать просмотренную долю видео урока.
@visibleForTesting
void debugSetVideoWatched(int lessonId, double fraction) =>
    _watched[lessonId] = fraction;

/// Экран курса (макеты CoursePlay1–3): видео играет прямо в обложке, под ней
/// название, метаданные, описание и «Программа курса». Видео досмотрено до
/// конца — урок засчитывается сам и открывается тест («Пройти тест»).
class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final detail = ref.watch(courseDetailProvider(id));
    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTopBar(
            title: l.learnCourseTitle,
            backLabel: l.learnBack,
            onBack: () => learnBack(context, '/app/learn'),
          ),
          Expanded(
            child: PqAsync<CourseDetail>(
              value: detail,
              loading: PqLoadingKind.spinner,
              onRetry: () => ref.invalidate(courseDetailProvider(id)),
              data: (course) => _Body(course: course),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({required this.course});

  final CourseDetail course;

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  final _scroll = ScrollController();

  /// Видеоурок в обложке: выбранный в программе или первый непросмотренный.
  int? _selectedId;
  bool _playing = false;
  bool _completing = false;

  /// Плеер не сообщает прогресс (веб, чужой плеер) — показываем ручное
  /// «Завершить урок», как раньше на экране урока.
  bool _manual = false;
  bool _gotProgress = false;
  Timer? _noProgress;

  CourseDetail get course => widget.course;

  @override
  void dispose() {
    _noProgress?.cancel();
    _scroll.dispose();
    super.dispose();
  }

  static bool _hasVideo(Lesson l) =>
      l.kind != 'quiz' && (l.videoUrl?.isNotEmpty ?? false);

  Lesson? get _current {
    final videos = course.lessons.where(_hasVideo).toList();
    if (videos.isEmpty) return null;
    return videos.where((l) => l.id == _selectedId).firstOrNull ??
        videos.where((l) => !l.completed).firstOrNull ??
        videos.last;
  }

  void _play(Lesson lesson) {
    _noProgress?.cancel();
    setState(() {
      _selectedId = lesson.id;
      _playing = true;
      _gotProgress = false;
      _manual = kIsWeb && !lesson.completed;
    });
    if (!kIsWeb && !lesson.completed) {
      _noProgress = Timer(const Duration(seconds: 8), () {
        if (mounted && _playing && !_gotProgress) {
          setState(() => _manual = true);
        }
      });
    }
    if (_scroll.hasClients && _scroll.offset > 0) {
      _scroll.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: PqMotion.ease);
    }
  }

  void _onProgress(Lesson lesson, double pos, double dur, bool ended) {
    if (dur <= 0) return;
    _gotProgress = true;
    final frac = (pos / dur).clamp(0.0, 1.0);
    final prev = _watched[lesson.id] ?? 0;
    final done = ended || pos >= dur - 1;
    if (frac > prev || done) {
      setState(() => _watched[lesson.id] = done ? 1 : frac);
    }
    if (done && !lesson.completed) _complete(lesson);
  }

  Future<void> _complete(Lesson lesson) async {
    if (_completing) return;
    setState(() => _completing = true);
    final l = context.l10n;
    try {
      final res = await ref
          .read(apiProvider)
          .catalog
          .completeLesson(course.id, lesson.id);
      _watched[lesson.id] = 1;
      ref.invalidate(courseDetailProvider(course.id));
      ref.invalidate(coursesProvider);
      ref.invalidate(walletProvider);
      if (!mounted) return;
      _noProgress?.cancel();
      setState(() {
        _playing = false;
        _manual = false;
      });
      if (res.rewardIqc > 0) {
        showPqToast(
          context,
          l.lessonCompletedReward(res.rewardIqc),
          icon: PqIcons.coins,
        );
      }
    } catch (e) {
      if (mounted) {
        showPqToast(context, learnErrorText(context, e), tone: PqTone.danger);
      }
    } finally {
      if (mounted) setState(() => _completing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final stats = learnStats(course.lessons);
    final done = course.progress >= 1;
    final current = _current;
    final colors = learnCoverColors(course.id);

    // Тесты курса и число вопросов (как в карточке курса).
    final quizzes = course.lessons.where((x) => x.kind == 'quiz').toList();
    int? questionsOf(Lesson q) => ref
        .watch(quizProvider((course.id, q.id)))
        .asData
        ?.value
        .questions
        .length;
    final firstQuiz = quizzes.firstOrNull;
    final firstQuestions = firstQuiz == null ? null : questionsOf(firstQuiz);
    final openQuiz = quizzes
        .where((q) => q.locked != true && !q.completed)
        .firstOrNull;

    final meta = <(PqIcons, String)>[
      if (stats.videos > 0) (PqIcons.video, l.learnMetaVideos(stats.videos)),
      if (stats.minutes > 0) (PqIcons.clock, l.learnMinutesShort(stats.minutes)),
      if (firstQuiz != null)
        (
          PqIcons.checkSquare,
          firstQuestions != null && firstQuestions > 0
              ? l.learnMetaQuiz(firstQuestions)
              : l.learnRowQuiz,
        ),
    ];

    final rows = <Widget>[
      for (final (i, lesson) in course.lessons.indexed)
        if (lesson.kind == 'quiz')
          _quizRow(context, lesson, questionsOf(lesson))
        else
          _videoRow(
            context,
            lesson,
            beforeQuiz: course.lessons.skip(i + 1).firstOrNull?.kind == 'quiz',
          ),
    ];

    // Кнопка внизу: ручное завершение (нет прогресса от плеера) → «Пройти
    // тест» (тест открыт) → для курсов без видео — переход к шагу, как раньше.
    final next = learnNextStep(course.lessons);
    Widget? cta;
    if (_manual && _playing && current != null && !current.completed) {
      cta = PqButton(
        label: l.learnFinishLesson,
        icon: PqIcons.check,
        loading: _completing,
        loadingLabel: l.learnFinishingLesson,
        onPressed: () => _complete(current),
      );
    } else if (openQuiz != null) {
      final n = questionsOf(openQuiz);
      cta = PqButton(
        label: n != null && n > 0 ? l.learnCtaQuiz(n) : l.learnStartTest,
        icon: PqIcons.checkSquare,
        onPressed: () => context.push(learnStepPath(course.id, openQuiz)),
      );
    } else if (current == null && !done && next != null) {
      cta = PqButton(
        label: course.progress > 0 ? l.learnCtaContinue : l.learnCtaStart,
        icon: PqIcons.play,
        onPressed: () => context.push(learnStepPath(course.id, next)),
      );
    }

    final sections = <Widget>[
      _Cover(
        course: course,
        lesson: current,
        colors: colors,
        playing: _playing,
        duration: current == null ? null : learnLessonDuration(context, current),
        onPlay: current == null ? null : () => _play(current),
        onProgress: current == null
            ? null
            : (p, d, e) => _onProgress(current, p, d, e),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  course.title,
                  style: PqText.heading(26, FontWeight.w700,
                      height: 1.15, ls: -.3, c: pq.text),
                ),
              ),
              if (done || stats.reward > 0) ...[
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: _Pill(
                    text: done ? l.learnCompleted : l.learnIqc(stats.reward),
                    bg: done
                        ? pq.successSoft
                        : (pq.isDark
                            ? const Color(0xFF2B1F4D)
                            : const Color(0xFFEDE9FE)),
                    fg: done ? pq.success : learnRewardFg(pq),
                  ),
                ),
              ],
            ],
          ),
          if (meta.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 16,
              runSpacing: 6,
              children: [
                for (final (icon, text) in meta)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PqIcon(icon, size: 16, color: pq.textMuted),
                      const SizedBox(width: 6),
                      Text(text,
                          style: PqText.text(14, FontWeight.w400,
                              c: pq.textMuted)),
                    ],
                  ),
              ],
            ),
          ],
          if (course.description.trim().isNotEmpty) ...[
            const SizedBox(height: 12),
            _Description(text: course.description.trim()),
          ],
        ],
      ),
      if (rows.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.learnProgram, style: PqText.section(c: pq.text)),
            const SizedBox(height: 10),
            PqCard(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  for (var i = 0; i < rows.length; i++)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: i < rows.length - 1
                            ? Border(bottom: BorderSide(color: pq.divider))
                            : null,
                      ),
                      child: rows[i],
                    ),
                ],
              ),
            ),
          ],
        ),
    ];

    return Stack(
      children: [
        ListView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            cta == null
                ? 40 + MediaQuery.viewPaddingOf(context).bottom
                : learnFooterClearance(context),
          ),
          children: [
            for (var i = 0; i < sections.length; i++)
              Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : 24),
                child: PqAnimate(
                  delay: PqMotion.staggerDelay(i),
                  child: sections[i],
                ),
              ),
          ],
        ),
        if (cta != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: LearnFooter(children: [cta]),
          ),
      ],
    );
  }

  Widget _videoRow(BuildContext context, Lesson lesson,
      {required bool beforeQuiz}) {
    final pq = context.pq;
    final l = context.l10n;
    final watched = _watched[lesson.id] ?? 0;
    final inProgress = !lesson.completed && watched > 0;
    final duration = learnLessonDuration(context, lesson);
    return _ProgramRow(
      icon: lesson.completed ? PqIcons.check : PqIcons.play,
      tileBg: lesson.completed ? pq.successSoft : pq.accentSoft,
      tileFg: lesson.completed ? pq.success : pq.accentText,
      title: l.learnRowVideo,
      subtitle: lesson.completed
          ? l.learnRowWatched
          : inProgress && beforeQuiz
              ? l.learnRowWatchToEnd
              : lesson.title,
      trailing: inProgress
          ? _WatchBar(fraction: watched)
          : duration == null
              ? null
              : Text(duration,
                  style: PqText.text(14, FontWeight.w600, c: pq.textMuted)),
      onTap: () => _hasVideo(lesson)
          ? _play(lesson)
          : context.push(learnStepPath(course.id, lesson)),
    );
  }

  Widget _quizRow(BuildContext context, Lesson quiz, int? questions) {
    final pq = context.pq;
    final l = context.l10n;
    final locked = quiz.locked == true;
    final count =
        questions != null && questions > 0 ? l.learnRowQuizQuestions(questions) : null;
    final String subtitle;
    if (quiz.completed) {
      subtitle = l.learnCompleted;
    } else if (locked) {
      subtitle = count == null
          ? l.learnRowQuizLocked
          : '$count · ${l.learnRowQuizLockedShort}';
    } else {
      subtitle = count == null
          ? l.learnRowQuizReady
          : '$count · ${l.learnRowQuizReady}';
    }
    return _ProgramRow(
      icon: quiz.completed
          ? PqIcons.check
          : locked
              ? PqIcons.lock
              : PqIcons.checkSquare,
      tileBg: quiz.completed
          ? pq.successSoft
          : locked
              ? pq.surfaceAlt
              : pq.accentSoft,
      tileFg: quiz.completed
          ? pq.success
          : locked
              ? pq.textMuted
              : pq.accentText,
      title: l.learnRowQuiz,
      subtitle: subtitle,
      trailing: !locked && !quiz.completed
          ? PqBreath(
              child: Container(
                width: 8,
                height: 8,
                decoration:
                    BoxDecoration(color: pq.accent, shape: BoxShape.circle),
              ),
            )
          : null,
      onTap: locked ? null : () => context.push(learnStepPath(course.id, quiz)),
    );
  }
}

// ── Обложка с плеером ───────────────────────────────────────────────────

/// Обложка 216/22 (макеты CoursePlay1–3): градиент курса с кругом и листом
/// (или фото обложки), метка бренда. Не начато — белая кнопка ▶ 64 и
/// длительность; играет — плеер на всю обложку; просмотрено — затемнение,
/// галочка и «Посмотреть ещё раз».
class _Cover extends StatelessWidget {
  const _Cover({
    required this.course,
    required this.lesson,
    required this.colors,
    required this.playing,
    required this.duration,
    required this.onPlay,
    required this.onProgress,
  });

  final CourseDetail course;
  final Lesson? lesson;
  final List<Color> colors;
  final bool playing;
  final String? duration;
  final VoidCallback? onPlay;
  final VideoProgressCallback? onProgress;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final url = lesson?.videoUrl;
    final watched = lesson?.completed ?? false;
    final label = course.ownerBrand ?? course.category;
    final cover = imgThumb(course.coverUrl, w: 900);

    final Widget face;
    if (playing && url != null && url.isNotEmpty) {
      face = ColoredBox(
        color: const Color(0xFF0B0F1A),
        child: VideoFrame(
          key: ValueKey(lesson!.id),
          url: url,
          onProgress: onProgress,
        ),
      );
    } else {
      face = Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-.82, -1),
                end: const Alignment(.82, 1),
                colors: colors,
              ),
            ),
          ),
          if (cover == null) ...[
            const Positioned(
              right: -30,
              top: -40,
              child: _Circle(size: 200, color: Color(0x24FFFFFF)),
            ),
            Positioned(
              right: 40,
              bottom: -30,
              child: Transform.rotate(
                angle: -8 * 3.1415926 / 180,
                child: Container(
                  width: 96,
                  height: 128,
                  decoration: BoxDecoration(
                    color: const Color(0x40FFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ] else
            Image.network(
              cover,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ColoredBox(
            color: watched
                ? Color.lerp(Colors.black, colors.first, .12)!
                    .withValues(alpha: .55)
                : const Color(0x2E000000),
          ),
          if (label != null && label.isNotEmpty)
            Positioned(
              left: 12,
              top: 12,
              child: _Badge(text: label, bg: const Color(0x8C111827)),
            ),
          if (watched)
            Center(
              child: PqPressable(
                onTap: onPlay,
                semanticLabel: l.learnWatchAgain,
                scale: .97,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PqAnimate(
                      fx: PqFx.pop,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF22C55E),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const PqIcon(PqIcons.check,
                            size: 24, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(l.learnVideoWatched,
                        style: PqText.text(15, FontWeight.w700,
                            c: Colors.white)),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: .85,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const PqIcon(PqIcons.rotateCcw,
                              size: 14, color: Colors.white),
                          const SizedBox(width: 6),
                          Text(l.learnWatchAgain,
                              style: PqText.text(13, FontWeight.w400,
                                  c: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (lesson != null)
            Center(
              child: PqPressable(
                onTap: onPlay,
                semanticLabel: l.learnWatchVideo,
                scale: .94,
                child: Container(
                  width: 64,
                  height: 64,
                  padding: const EdgeInsets.only(left: 4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x73000000),
                        offset: Offset(0, 10),
                        blurRadius: 24,
                        spreadRadius: -8,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: PqIcon(PqIcons.play, size: 26, color: colors.first),
                ),
              ),
            ),
          if (!watched && lesson != null && duration != null)
            Positioned(
              right: 12,
              bottom: 12,
              child: _Badge(text: duration!, bg: const Color(0xB3111827)),
            ),
        ],
      );
    }

    return Container(
      height: 216,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x99000000),
            offset: Offset(0, 14),
            blurRadius: 30,
            spreadRadius: -18,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: KeyedSubtree(
            key: ValueKey((playing, watched, lesson?.id)),
            child: face,
          ),
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

/// Метка на обложке: 12/700 белым, поля 3/8, радиус 6.
class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.bg});

  final String text;
  final Color bg;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(text,
            style: PqText.text(12, FontWeight.w700, c: Colors.white)),
      );
}

/// «+30 IQC» / «Пройден» рядом с названием: 13/800, поля 4/10, радиус 8.
class _Pill extends StatelessWidget {
  const _Pill({required this.text, required this.bg, required this.fg});

  final String text;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: PqText.text(13, FontWeight.w800, c: fg)),
      );
}

/// Описание: три строки и «Читать полностью» / «Свернуть», если не влезает.
class _Description extends StatefulWidget {
  const _Description({required this.text});

  final String text;

  @override
  State<_Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<_Description> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final style =
        PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textSecondary);
    return LayoutBuilder(builder: (context, box) {
      final tp = TextPainter(
        text: TextSpan(text: widget.text, style: style),
        maxLines: 3,
        textDirection: Directionality.of(context),
        textScaler: MediaQuery.textScalerOf(context),
      )..layout(maxWidth: box.maxWidth);
      final long = tp.didExceedMaxLines;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: PqMotion.ease,
            alignment: Alignment.topCenter,
            child: Text(
              widget.text,
              maxLines: _open ? null : 3,
              overflow: _open ? null : TextOverflow.ellipsis,
              style: style,
            ),
          ),
          if (long)
            PqPressable(
              onTap: () => setState(() => _open = !_open),
              child: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: Text(
                  _open ? l.learnReadLess : l.learnReadMore,
                  style: PqText.text(14, FontWeight.w600, c: pq.accent),
                ),
              ),
            ),
        ],
      );
    });
  }
}

/// Прогресс просмотра в строке видео: «37%» 13/700 и полоса 70×4.
class _WatchBar extends StatelessWidget {
  const _WatchBar({required this.fraction});

  final double fraction;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return SizedBox(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('${(fraction * 100).round()}%',
              style: PqText.text(13, FontWeight.w700, c: pq.accentText)),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
              height: 4,
              color: pq.surfaceAlt,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: fraction.clamp(0.0, 1.0),
                heightFactor: 1,
                child: ColoredBox(color: pq.accent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Строка программы: плитка 40/12 · заголовок 16/600 + подпись 13 · справа
/// длительность, прогресс или точка «можно начинать».
class _ProgramRow extends StatelessWidget {
  const _ProgramRow({
    required this.icon,
    required this.tileBg,
    required this.tileFg,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final PqIcons icon;
  final Color tileBg;
  final Color tileFg;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          PqIconTile(
            icon,
            size: 40,
            radius: 12,
            iconSize: 18,
            background: tileBg,
            foreground: tileFg,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: PqText.text(16, FontWeight.w600, c: pq.text)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.text(13, FontWeight.w400, c: pq.textMuted),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 14),
            trailing!,
          ],
        ],
      ),
    );
    return onTap == null
        ? row
        : PqPressable(
            onTap: onTap,
            semanticLabel: '$title. $subtitle',
            child: row,
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/learn.dart';
import '../../widgets/pq_states.dart';
import 'learn/learn_widgets.dart';
import 'providers.dart';

/// Экран курса (макет Course): обложка, название и метаданные, описание,
/// «Программа курса» (видео · тест · награда) и закреплённая кнопка.
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

class _Body extends StatelessWidget {
  const _Body({required this.course});

  final CourseDetail course;

  void _open(BuildContext context, Lesson l) =>
      context.push(learnStepPath(course.id, l));

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final stats = learnStats(course.lessons);
    final next = learnNextStep(course.lessons);
    final done = course.progress >= 1;

    final meta = <(PqIcons, String)>[
      if (stats.videos > 0) (PqIcons.video, l.learnMetaVideos(stats.videos)),
      if (stats.minutes > 0) (PqIcons.clock, l.learnMetaMinutes(stats.minutes)),
    ];

    final rows = <Widget>[
      for (final lesson in course.lessons)
        _ProgramRow.lesson(
          context,
          lesson,
          onTap: lesson.locked == true ? null : () => _open(context, lesson),
        ),
      if (stats.reward > 0)
        _ProgramRow(
          icon: PqIcons.star,
          tileBg: PqColors.reward,
          tileFg: Colors.white,
          title: l.learnTileReward,
          subtitle: done ? l.learnRowRewardDone : l.learnRowRewardPending,
          trailing: l.learnIqc(stats.reward),
          trailingColor: learnRewardFg(pq),
        ),
    ];

    final sections = <Widget>[
      LearnBanner(
        title: course.title,
        brand: course.ownerBrand ?? course.category,
        coverUrl: course.coverUrl,
        height: 180,
        borderRadius: BorderRadius.circular(24),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.title, style: PqText.display(c: pq.text)),
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
                      Text(
                        text,
                        style: PqText.text(
                          14,
                          FontWeight.w400,
                          c: pq.textMuted,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
          if (course.description.trim().isNotEmpty) ...[
            const SizedBox(height: 14),
            Text(
              course.description,
              style: PqText.text(
                15,
                FontWeight.w400,
                height: 1.5,
                c: pq.textSecondary,
              ),
            ),
          ],
        ],
      ),
      if (rows.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.learnProgram, style: PqText.section(c: pq.text)),
            const SizedBox(height: 12),
            PqCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                children: [
                  for (var i = 0; i < rows.length; i++)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border:
                            i < rows.length - 1
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

    final (ctaIcon, ctaLabel) =
        done
            ? (PqIcons.rotateCcw, l.learnCtaRepeat)
            : course.progress > 0
            ? (PqIcons.play, l.learnCtaContinue)
            : (PqIcons.play, l.learnCtaStart);

    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            learnFooterClearance(context),
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
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: LearnFooter(
            children: [
              PqButton(
                label: ctaLabel,
                icon: ctaIcon,
                onPressed: next == null ? null : () => _open(context, next),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Строка программы: плитка 40/12 · заголовок 16/600 + подпись 14 · значение.
class _ProgramRow extends StatelessWidget {
  const _ProgramRow({
    required this.icon,
    required this.tileBg,
    required this.tileFg,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.trailingColor,
    this.onTap,
  });

  factory _ProgramRow.lesson(
    BuildContext context,
    Lesson lesson, {
    VoidCallback? onTap,
  }) {
    final pq = context.pq;
    final l = context.l10n;
    final quiz = lesson.kind == 'quiz';
    final locked = lesson.locked == true;
    final (bg, fg) =
        locked
            ? (pq.surfaceAlt, pq.textMuted)
            : lesson.completed
            ? (pq.successSoft, pq.success)
            : (pq.accentSoft, pq.accentText);
    final icon =
        locked
            ? PqIcons.lock
            : lesson.completed
            ? PqIcons.check
            : quiz
            ? PqIcons.checkSquare
            : PqIcons.play;
    return _ProgramRow(
      icon: icon,
      tileBg: bg,
      tileFg: fg,
      title: quiz ? l.learnRowQuiz : l.learnRowVideo,
      subtitle:
          quiz && locked
              ? l.learnRowQuizLocked
              : quiz && lesson.completed
              ? l.learnCompleted
              : lesson.title,
      trailing: quiz ? null : learnLessonDuration(context, lesson),
      onTap: onTap,
    );
  }

  final PqIcons icon;
  final Color tileBg;
  final Color tileFg;
  final String title;
  final String subtitle;
  final String? trailing;
  final Color? trailingColor;
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
                Text(
                  title,
                  style: PqText.text(16, FontWeight.w600, c: pq.text),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.body(c: pq.textMuted),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 14),
            Text(
              trailing!,
              style: PqText.text(
                14,
                FontWeight.w600,
                c: trailingColor ?? pq.textMuted,
              ),
            ),
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

import 'package:flutter/material.dart';
import '../../core/img.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/learn.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Экран курса. Перенесён один в один из макета Figma
/// «pharmiq-learning-course-detail».
class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key, required this.id});
  final int id;

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetailScreen> {
  int _tab = 0; // 0 = Описание, 1 = Содержание

  @override
  Widget build(BuildContext context) {
    final c = _CD.of(context);
    final detail = ref.watch(courseDetailProvider(widget.id));

    return Scaffold(
      backgroundColor: c.page,
      body: SafeArea(
        bottom: false,
        child: AsyncView(
          value: detail,
          onRetry: () => ref.invalidate(courseDetailProvider(widget.id)),
          data: (course) => _body(context, c, course),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, _CD c, CourseDetail course) {
    final brand = course.ownerBrand ?? course.category;
    final totalMin =
        course.lessons.fold<int>(0, (s, l) => s + l.durationMin);

    Lesson? next;
    for (final l in course.lessons) {
      if (l.locked != true && !l.completed) {
        next = l;
        break;
      }
    }
    next ??= course.lessons.isNotEmpty ? course.lessons.first : null;

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
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: c.text),
                  onPressed: () => context.canPop()
                      ? context.pop()
                      : context.go('/app/learn'),
                ),
              ),
              Text(course.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: c.text)),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // banner
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFE8621A), Color(0xFFF59F30)],
                        ),
                      ),
                      child: SizedBox.expand(),
                    ),
                    if (course.coverUrl != null && course.coverUrl!.isNotEmpty)
                      Image.network(
                        imgThumb(course.coverUrl, w: 900)!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                      ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0x99000000)],
                          stops: [0.45, 1.0],
                        ),
                      ),
                      child: SizedBox.expand(),
                    ),
                    if (brand != null)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            // плотный тёмный фон — читаемо поверх обложки любого цвета
                            color: const Color(0xCC0D1117),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: const Color(0x33FFFFFF)),
                          ),
                          child: Text(brand.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      right: 16,
                      child: Text(course.title.toUpperCase(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              // tabs
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    _Tab(
                        c: c,
                        label: 'ОПИСАНИЕ',
                        selected: _tab == 0,
                        onTap: () => setState(() => _tab = 0)),
                    const SizedBox(width: 8),
                    _Tab(
                        c: c,
                        label: 'СОДЕРЖАНИЕ',
                        selected: _tab == 1,
                        onTap: () => setState(() => _tab = 1)),
                  ],
                ),
              ),
              if (_tab == 0) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoRow(c, Icons.play_circle_outline,
                          '${course.lessonCount} ${_word(course.lessonCount)}'),
                      if (totalMin > 0) ...[
                        const SizedBox(height: 8),
                        _infoRow(c, Icons.schedule, '~$totalMin минут'),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: Text(course.description,
                      style: TextStyle(
                          fontSize: 14, height: 1.5, color: c.muted)),
                ),
              ] else
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: Column(
                    children: [
                      for (var i = 0; i < course.lessons.length; i++) ...[
                        _LessonRow(
                          c: c,
                          lesson: course.lessons[i],
                          videosBefore: course.lessons
                              .take(i)
                              .where((x) => x.kind != 'quiz')
                              .length,
                          onTap: course.lessons[i].locked == true
                              ? null
                              : () => _openLesson(context, course.lessons[i]),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ],
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: next == null ? null : () => _openLesson(context, next!),
                child: Text(
                  course.progress > 0 ? 'ПРОДОЛЖИТЬ ОБУЧЕНИЕ' : 'НАЧАТЬ ОБУЧЕНИЕ',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _openLesson(BuildContext context, Lesson l) {
    if (l.kind == 'quiz') {
      context.push('/app/learn/${widget.id}/quiz/${l.id}');
    } else {
      context.push('/app/learn/${widget.id}/lesson/${l.id}');
    }
  }

  Widget _infoRow(_CD c, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 15, color: c.muted),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 13, color: c.muted)),
      ],
    );
  }

  static String _word(int n) {
    if (n % 10 == 1 && n % 100 != 11) return 'видеоурок';
    if ([2, 3, 4].contains(n % 10) && !(n % 100 >= 12 && n % 100 <= 14)) {
      return 'видеоурока';
    }
    return 'видеоуроков';
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.c,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final _CD c;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 36,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1D4068) : c.page,
          borderRadius: BorderRadius.circular(20),
          border: selected ? null : Border.all(color: c.border),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : c.muted)),
      ),
    );
  }
}

class _LessonRow extends StatelessWidget {
  const _LessonRow(
      {required this.c,
      required this.lesson,
      required this.onTap,
      this.videosBefore = 0});
  final _CD c;
  final Lesson lesson;
  final VoidCallback? onTap;
  final int videosBefore;

  @override
  Widget build(BuildContext context) {
    final locked = lesson.locked == true;
    final isQuiz = lesson.kind == 'quiz';
    const violet = Color(0xFF7C5CFF);
    // подпись: для квиза — привязка «после урока N»; иначе длительность; награда только если >0
    final sub = isQuiz
        ? (videosBefore > 0 ? 'Тест после урока $videosBefore' : 'Тест по курсу')
        : '${lesson.durationMin} мин';
    final reward = (!lesson.completed && lesson.rewardIqc > 0) ? ' · +${lesson.rewardIqc} IQC' : '';
    return Material(
      color: isQuiz ? violet.withValues(alpha: 0.06) : c.card,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              top: BorderSide(color: c.border),
              right: BorderSide(color: c.border),
              bottom: BorderSide(color: c.border),
              left: BorderSide(
                  color: isQuiz ? violet : c.border, width: isQuiz ? 3 : 1),
            ),
          ),
          child: Row(
            children: [
              Icon(
                locked
                    ? Icons.lock_outline
                    : isQuiz
                        ? Icons.quiz_outlined
                        : Icons.play_circle_outline,
                size: 22,
                color: locked
                    ? c.muted
                    : isQuiz
                        ? violet
                        : const Color(0xFF6B9EF5),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(lesson.title,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: c.text)),
                        ),
                        if (isQuiz) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                                color: violet,
                                borderRadius: BorderRadius.circular(999)),
                            child: const Text('ТЕСТ',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('$sub$reward',
                        style: TextStyle(fontSize: 12, color: c.muted)),
                  ],
                ),
              ),
              if (lesson.completed) ...[
                const Icon(Icons.check_circle,
                    size: 20, color: Color(0xFF22C55E)),
                if (onTap != null) ...[
                  const SizedBox(width: 6),
                  Icon(Icons.refresh, size: 18, color: c.muted),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CD {
  const _CD({
    required this.page,
    required this.card,
    required this.border,
    required this.text,
    required this.muted,
  });

  final Color page;
  final Color card;
  final Color border;
  final Color text;
  final Color muted;

  static _CD of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _CD(
    page: Color(0xFF0D1117),
    card: Color(0xFF131A28),
    border: Color(0xFF2A3040),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF9CA3AF),
  );

  static const _light = _CD(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    border: Color(0xFFEBEDF0),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
  );
}

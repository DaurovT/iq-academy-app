import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/api/providers.dart';
import '../../core/models/learn.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Приводит ссылку к встраиваемому виду (Vimeo/YouTube → embed-плеер).
String _embedUrl(String url) {
  final vimeo = RegExp(r'vimeo\.com/(?:video/)?(\d+)').firstMatch(url);
  if (vimeo != null) {
    return 'https://player.vimeo.com/video/${vimeo.group(1)}?autoplay=1&title=0&byline=0';
  }
  final yt = RegExp(r'(?:youtu\.be/|youtube\.com/watch\?v=)([\w-]+)')
      .firstMatch(url);
  if (yt != null) {
    return 'https://www.youtube.com/embed/${yt.group(1)}?autoplay=1&playsinline=1';
  }
  return url;
}

String _dur(int? sec) {
  final s = sec ?? 0;
  final m = (s ~/ 60).toString().padLeft(2, '0');
  final r = (s % 60).toString().padLeft(2, '0');
  return '$m:$r';
}

/// Просмотр урока. Перенесён один в один из макета Figma
/// «pharmiq-learning-lesson».
class LessonViewScreen extends ConsumerStatefulWidget {
  const LessonViewScreen(
      {super.key, required this.courseId, required this.lessonId});

  final int courseId;
  final int lessonId;

  @override
  ConsumerState<LessonViewScreen> createState() => _LessonViewScreenState();
}

class _LessonViewScreenState extends ConsumerState<LessonViewScreen> {
  int _tab = 0; // 0 = Текст урока, 1 = Материалы
  bool _loading = false;
  WebViewController? _webCtrl;

  void _startVideo(String url) {
    setState(() {
      _webCtrl = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0xFF0B0F1A))
        ..loadRequest(Uri.parse(_embedUrl(url)));
    });
  }

  Future<void> _complete(CourseDetail course) async {
    setState(() => _loading = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final res = await ref
          .read(apiProvider)
          .catalog
          .completeLesson(widget.courseId, widget.lessonId);
      ref.invalidate(courseDetailProvider(widget.courseId));
      ref.invalidate(walletProvider);
      messenger.showSnackBar(
          SnackBar(content: Text('Урок завершён · +${res.rewardIqc} IQC')));
      if (mounted) _goNext(course);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _goNext(CourseDetail course) {
    // Следующий ПО ПОРЯДКУ непройденный шаг после текущего (видео или квиз) — не прыгаем через
    // промежуточные видео к первому квизу. Предыдущий шаг только что завершён → следующий открыт.
    final ls = course.lessons;
    final cur = ls.indexWhere((l) => l.id == widget.lessonId);
    Lesson? next;
    for (var i = cur + 1; i < ls.length; i++) {
      if (!ls[i].completed) {
        next = ls[i];
        break;
      }
    }
    if (next == null) {
      context.pop(); // весь курс пройден
      return;
    }
    final path = next.kind == 'quiz' ? 'quiz' : 'lesson';
    context.pushReplacement('/app/learn/${widget.courseId}/$path/${next.id}');
  }

  @override
  Widget build(BuildContext context) {
    final c = _LV.of(context);
    final course = ref.watch(courseDetailProvider(widget.courseId));

    return Scaffold(
      backgroundColor: c.page,
      body: SafeArea(
        bottom: false,
        child: AsyncView(
          value: course,
          onRetry: () => ref.invalidate(courseDetailProvider(widget.courseId)),
          data: (course) {
            Lesson? lesson;
            for (final l in course.lessons) {
              if (l.id == widget.lessonId) {
                lesson = l;
                break;
              }
            }
            if (lesson == null) {
              return const EmptyState(text: 'Урок не найден');
            }
            return _body(context, c, course, lesson);
          },
        ),
      ),
    );
  }

  Widget _body(
      BuildContext context, _LV c, CourseDetail course, Lesson lesson) {
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
                    onTap: () => context.canPop()
                        ? context.pop()
                        : context.go('/app/learn'),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: c.iconBg,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.arrow_back, size: 20, color: c.text),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Text(lesson.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: c.text)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            children: [
              // видео-плеер
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: _webCtrl != null
                        ? WebViewWidget(controller: _webCtrl!)
                        : ColoredBox(
                            color: const Color(0xFF0B0F1A),
                            child: Center(
                              child: InkWell(
                                onTap: (lesson.videoUrl == null ||
                                        lesson.videoUrl!.isEmpty)
                                    ? null
                                    : () => _startVideo(lesson.videoUrl!),
                                borderRadius: BorderRadius.circular(28),
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0x14FFFFFF),
                                      borderRadius: BorderRadius.circular(28)),
                                  child: Icon(
                                      (lesson.videoUrl == null ||
                                              lesson.videoUrl!.isEmpty)
                                          ? Icons.videocam_off_outlined
                                          : Icons.play_arrow,
                                      size: 28,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // audio-progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: const Color(0xFF060A12),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Icon(Icons.play_arrow,
                          size: 18, color: Color(0xFF8E9BAE)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 4,
                            color: const Color(0xFF1E2535),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 0.0,
                                child: ColoredBox(color: Color(0xFF1D4068)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('00:00 · ${_dur(lesson.videoDurationSec)}',
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFF8E9BAE))),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _Tab(
                        c: c,
                        label: 'ТЕКСТ УРОКА',
                        selected: _tab == 0,
                        onTap: () => setState(() => _tab = 0)),
                    const SizedBox(width: 8),
                    _Tab(
                        c: c,
                        label: 'МАТЕРИАЛЫ УРОКА',
                        selected: _tab == 1,
                        onTap: () => setState(() => _tab = 1)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _tab == 0
                    ? Text(course.description,
                        style: TextStyle(
                            fontSize: 14, height: 1.5, color: c.muted))
                    : Text('Материалов пока нет',
                        style: TextStyle(fontSize: 14, color: c.muted)),
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
                  backgroundColor: lesson.completed
                      ? const Color(0xFF1D4068)
                      : c.card,
                  foregroundColor:
                      lesson.completed ? Colors.white : c.muted,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _loading
                    ? null
                    : lesson.completed
                        ? () => _goNext(course)
                        : () => _complete(course),
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              lesson.completed
                                  ? Icons.quiz_outlined
                                  : Icons.lock_outline,
                              size: 20),
                          const SizedBox(width: 8),
                          Text(
                            lesson.completed
                                ? 'НАЧАТЬ ТЕСТИРОВАНИЕ'
                                : 'ЗАВЕРШИТЬ УРОК',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.c,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final _LV c;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 34,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1D4068) : c.page,
          borderRadius: BorderRadius.circular(999),
          border: selected ? null : Border.all(color: c.border),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected ? const Color(0xFFE4E2ED) : c.muted)),
      ),
    );
  }
}

class _LV {
  const _LV({
    required this.page,
    required this.card,
    required this.border,
    required this.iconBg,
    required this.text,
    required this.muted,
  });

  final Color page;
  final Color card;
  final Color border;
  final Color iconBg;
  final Color text;
  final Color muted;

  static _LV of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _LV(
    page: Color(0xFF0D1117),
    card: Color(0xFF131A28),
    border: Color(0xFF1E2535),
    iconBg: Color(0x14FFFFFF),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF9CA3AF),
  );

  static const _light = _LV(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    border: Color(0xFFEBEDF0),
    iconBg: Color(0xFFEEF2FF),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
  );
}

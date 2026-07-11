import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Просмотр урока. Видео пока показываем плейсхолдером-плеером (реальный
/// Vimeo-плеер добавим на полировке); правило досмотра 95% enforce'ит бэк
/// при вызове completeLesson.
class LessonViewScreen extends ConsumerStatefulWidget {
  const LessonViewScreen({super.key, required this.courseId, required this.lessonId});

  final int courseId;
  final int lessonId;

  @override
  ConsumerState<LessonViewScreen> createState() => _LessonViewScreenState();
}

class _LessonViewScreenState extends ConsumerState<LessonViewScreen> {
  bool _loading = false;

  Future<void> _complete() async {
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
      if (mounted) context.go('/app/learn/${widget.courseId}');
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final course = ref.watch(courseDetailProvider(widget.courseId));
    return Scaffold(
      appBar: AppBar(title: const Text('Урок')),
      body: AsyncView(
        value: course,
        data: (c) {
          final lesson = c.lessons.where((l) => l.id == widget.lessonId).firstOrNull;
          if (lesson == null) {
            return const EmptyState(text: 'Урок не найден');
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Плейсхолдер видео-плеера.
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.play_circle_outline,
                        size: 64, color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(lesson.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text('${lesson.durationMin} мин · +${lesson.rewardIqc} IQC',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 24),
              if (lesson.completed)
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Урок уже завершён'),
                  ),
                )
              else
                FilledButton.icon(
                  onPressed: _loading ? null : _complete,
                  icon: _loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.check),
                  label: const Text('Завершить урок'),
                ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(courseDetailProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text('Курс')),
      body: AsyncView(
        value: detail,
        onRetry: () => ref.invalidate(courseDetailProvider(id)),
        data: (c) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(c.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(c.description),
            const SizedBox(height: 16),
            Text('Уроки', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final l in c.lessons)
              Card(
                child: ListTile(
                  leading: Icon(
                    l.locked == true
                        ? Icons.lock_outline
                        : l.kind == 'quiz'
                            ? Icons.quiz_outlined
                            : Icons.play_circle_outline,
                  ),
                  title: Text(l.title),
                  subtitle: Text('${l.durationMin} мин · +${l.rewardIqc} IQC'),
                  trailing: l.completed
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  enabled: l.locked != true,
                  onTap: l.locked == true
                      ? null
                      : () {
                          if (l.kind == 'quiz') {
                            context.go('/app/learn/$id/quiz/${l.id}');
                          } else {
                            context.go('/app/learn/$id/lesson/${l.id}');
                          }
                        },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

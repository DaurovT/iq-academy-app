import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/format.dart';
import '../../widgets/async_view.dart';
import 'checks_screen.dart' show statusColor;
import 'providers.dart';

class CheckDetailScreen extends ConsumerWidget {
  const CheckDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(checkDetailProvider(id));
    return Scaffold(
      appBar: AppBar(title: Text('Чек #$id')),
      body: AsyncView(
        value: detail,
        onRetry: () => ref.invalidate(checkDetailProvider(id)),
        data: (c) {
          final scheme = Theme.of(context).colorScheme;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(children: [
                Chip(
                  label: Text(c.status.label),
                  backgroundColor:
                      statusColor(c.status, scheme).withValues(alpha: 0.15),
                ),
                const Spacer(),
                Text(formatDateTime(c.createdAt)),
              ]),
              if (c.rejectReason != null) ...[
                const SizedBox(height: 12),
                Card(
                  color: scheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Причина отклонения: ${c.rejectReason}'),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              if (c.photos.isNotEmpty) ...[
                Text('Фото', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: c.photos.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, i) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        c.photos[i].url,
                        width: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 140,
                          color: scheme.surfaceContainerHighest,
                          child: const Icon(Icons.broken_image_outlined),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Text('Препараты', style: Theme.of(context).textTheme.titleMedium),
              for (final d in c.drugs)
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.medication_outlined),
                  title: Text(d.name),
                  trailing: Text('×${d.packs}'),
                ),
              if (c.allocations.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text('Зачтено в квесты',
                    style: Theme.of(context).textTheme.titleMedium),
                for (final a in c.allocations)
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.flag_outlined),
                    title: Text(a.questName),
                    trailing: Text('×${a.packs}'),
                  ),
              ],
              if (c.aiText != null && c.aiText!.isNotEmpty) ...[
                const SizedBox(height: 16),
                ExpansionTile(
                  title: const Text('Распознанный текст (ИИ)'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(c.aiText!),
                    ),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

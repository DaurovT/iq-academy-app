import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/format.dart';
import '../../widgets/async_view.dart';
import '../pharmacist/checks_screen.dart' show statusColor;
import '../shared/widgets/photo_lightbox.dart';
import 'providers.dart';

class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(recipeDetailProvider(id));
    return Scaffold(
      appBar: AppBar(title: Text('Рецепт #$id')),
      body: AsyncView(
        value: detail,
        onRetry: () => ref.invalidate(recipeDetailProvider(id)),
        data: (r) {
          final scheme = Theme.of(context).colorScheme;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(children: [
                Chip(
                  label: Text(r.status.label),
                  backgroundColor: statusColor(r.status, scheme).withValues(alpha: 0.15),
                ),
                const Spacer(),
                Text(formatDateTime(r.createdAt)),
              ]),
              if (r.rejectReason != null) ...[
                const SizedBox(height: 12),
                Card(
                  color: scheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Причина отклонения: ${r.rejectReason}'),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              if (r.photos.isNotEmpty) ...[
                Text('Фото', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: r.photos.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, i) => GestureDetector(
                      onTap: () => showPhotoLightbox(
                          context, [for (final p in r.photos) p.url],
                          initialIndex: i),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          r.photos[i].url,
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
                ),
                const SizedBox(height: 16),
              ],
              Text('Препараты', style: Theme.of(context).textTheme.titleMedium),
              for (final d in r.drugs)
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.medication_outlined),
                  title: Text(d.name),
                  trailing: Text('×${d.qty}'),
                ),
              if (r.aiText != null && r.aiText!.isNotEmpty) ...[
                const SizedBox(height: 16),
                ExpansionTile(
                  title: const Text('Распознанный текст (ИИ)'),
                  children: [
                    Padding(padding: const EdgeInsets.all(16), child: Text(r.aiText!)),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/sapper.dart';
import 'mini_apps_screens.dart';

/// Промо мини-приложений на главной: активный Супер Сапёр зовёт играть.
class MiniAppsHomeBlock extends ConsumerWidget {
  const MiniAppsHomeBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(miniAppsProvider);
    return v.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (apps) {
        MiniApp? sapper;
        for (final a in apps) {
          if (a.key == 'sapper') { sapper = a; break; }
        }
        if (sapper == null) return const SizedBox.shrink();
        final active = sapper.activeDraws > 0;
        final scheme = Theme.of(context).colorScheme;
        return Material(
          color: scheme.primaryContainer.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => context.push(active ? '/app/sapper' : '/app/mini-apps'),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Text('💣', style: TextStyle(fontSize: 28)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Text('Супер Сапёр', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                          const SizedBox(width: 8),
                          if (active)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(color: const Color(0xFF7C5CFF), borderRadius: BorderRadius.circular(999)),
                              child: Text('${sapper.activeDraws} активн.',
                                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
                            ),
                        ]),
                        const SizedBox(height: 2),
                        Text(active ? 'Занимай клетки за IQC — выигрывай призы' : 'Мини-приложения платформы',
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                      ],
                    ),
                  ),
                  Text('Играть →', style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w700, fontSize: 13)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

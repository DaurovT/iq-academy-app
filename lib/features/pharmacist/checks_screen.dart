import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/uploads/upload_queue.dart';
import '../../core/format.dart';
import '../../core/models/check.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class ChecksScreen extends ConsumerWidget {
  const ChecksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checks = ref.watch(checksProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Мои чеки')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _submitFlow(context, ref),
        icon: const Icon(Icons.add_a_photo_outlined),
        label: const Text('Загрузить чек'),
      ),
      body: Column(
        children: [
          const _PendingBanner(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(checksProvider),
              child: AsyncView(
                value: checks,
                onRetry: () => ref.invalidate(checksProvider),
                data: (list) => list.isEmpty
                    ? ListView(children: const [
                        SizedBox(height: 300, child: EmptyState(text: 'Чеков пока нет')),
                      ])
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: list.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, i) => _CheckTile(check: list[i]),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitFlow(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Сделать фото'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Выбрать из галереи'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;

    final List<XFile> picked;
    if (source == ImageSource.gallery) {
      picked = await picker.pickMultiImage();
    } else {
      final x = await picker.pickImage(source: ImageSource.camera);
      picked = x == null ? [] : [x];
    }
    if (picked.isEmpty) return;
    if (!context.mounted) return;

    // Ставим в очередь: загрузится сразу при сети или позже (офлайн-устойчиво).
    await ref
        .read(uploadQueueProvider.notifier)
        .enqueueCheck(picked.map((x) => x.path).toList());
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Чек добавлен — загружается')));
  }
}

/// Баннер с числом ожидающих загрузок (офлайн-очередь) и кнопкой «повторить».
class _PendingBanner extends ConsumerWidget {
  const _PendingBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(pendingUploadCountProvider);
    if (count == 0) return const SizedBox.shrink();
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const SizedBox(
                height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)),
            const SizedBox(width: 12),
            Expanded(child: Text('Загружается: $count')),
            TextButton(
              onPressed: () => ref.read(uploadQueueProvider.notifier).retryNow(),
              child: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Цвет-статус чека.
Color statusColor(CheckStatus s, ColorScheme scheme) => switch (s) {
      CheckStatus.approved => Colors.green,
      CheckStatus.rejected => scheme.error,
      CheckStatus.aiWrong => Colors.orange,
      _ => scheme.primary,
    };

class _CheckTile extends StatelessWidget {
  const _CheckTile({required this.check});
  final Check check;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final drugs = check.drugs.map((d) => '${d.name} ×${d.packs}').join(', ');
    return Card(
      child: ListTile(
        onTap: () => context.go('/app/checks/${check.id}'),
        leading: CircleAvatar(
          backgroundColor: statusColor(check.status, scheme).withValues(alpha: 0.15),
          child: Icon(Icons.receipt_long_outlined,
              color: statusColor(check.status, scheme)),
        ),
        title: Text('Чек #${check.id}'),
        subtitle: Text(
          '${formatDate(check.createdAt)}'
          '${drugs.isEmpty ? '' : '\n$drugs'}',
        ),
        isThreeLine: drugs.isNotEmpty,
        trailing: Text(check.status.label,
            style: TextStyle(color: statusColor(check.status, scheme))),
      ),
    );
  }
}

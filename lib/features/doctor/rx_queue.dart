import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/uploads/pending_upload.dart';
import '../../core/uploads/upload_queue.dart';
import '../../widgets/local_photo.dart';
import '../pharmacist/checks/check_ui.dart' show ReceiptLines, ReceiptPaper;
import 'rx_common.dart';

/// Бланки, которые ещё не ушли на сервер.
final rxQueueProvider = Provider<List<PendingUpload>>((ref) {
  final all = ref.watch(uploadQueueProvider).asData?.value ?? const [];
  return all.where((e) => e.kind == UploadKind.recipe).toList();
});

/// «Ждут отправки» в «Моих бланках» (макет RxQueue): строка на бланк —
/// миниатюра первого фото с «+N», состояние, у застрявших «Удалить» /
/// «Переснять». Пустая очередь — блока нет.
class RxQueueSection extends ConsumerWidget {
  const RxQueueSection({super.key, this.bottom = 0});

  /// Отступ под блоком (когда он виден).
  final double bottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(rxQueueProvider);
    final l = context.l10n;
    final queue = ref.read(uploadQueueProvider.notifier);
    final hasWaiting = items.any((e) => !e.stuck);

    Future<void> delete(PendingUpload item) async {
      final ok = await _confirmDelete(context, item, queue.previewPath);
      if (ok == true) await queue.remove(item.id);
    }

    Future<void> retake(PendingUpload item) async {
      await queue.remove(item.id);
      if (context.mounted) openRecipeCamera(context);
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: PqMotion.ease,
      alignment: Alignment.topCenter,
      child: items.isEmpty
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PqSectionHeader(
                    l.checksQueueTitle,
                    count: items.length,
                    countTone: PqTone.warning,
                    trailing: hasWaiting
                        ? RxOutlinePill(
                            label: l.checksQueueRetry,
                            icon: PqIcons.refresh,
                            color: context.pq.text,
                            onTap: queue.retryNow,
                          )
                        : null,
                  ),
                  const SizedBox(height: 12),
                  _QueueCard(
                    items: items,
                    previewPath: queue.previewPath,
                    onDelete: delete,
                    onRetake: retake,
                  ),
                ],
              ),
            ),
    );
  }
}

class _QueueCard extends StatelessWidget {
  const _QueueCard({
    required this.items,
    required this.previewPath,
    required this.onDelete,
    required this.onRetake,
  });

  final List<PendingUpload> items;
  final String Function(String) previewPath;
  final ValueChanged<PendingUpload> onDelete;
  final ValueChanged<PendingUpload> onRetake;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final item in items)
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: pq.divider)),
              ),
              child: _QueueRow(
                item: item,
                previewPath: previewPath,
                onDelete: () => onDelete(item),
                onRetake: () => onRetake(item),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: PqIcon(PqIcons.smartphone, size: 18, color: pq.textMuted),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    context.l10n.rxQueueNote,
                    style: PqText.text(14, FontWeight.w400,
                        height: 1.45, c: pq.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QueueRow extends StatelessWidget {
  const _QueueRow({
    required this.item,
    required this.previewPath,
    required this.onDelete,
    required this.onRetake,
  });

  final PendingUpload item;
  final String Function(String) previewPath;
  final VoidCallback onDelete;
  final VoidCallback onRetake;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final when = formatShortDateTime(item.createdAt);
    final n = item.filePaths.length;
    final (PqIcons icon, Color color, String title, String sub) =
        switch (item.state) {
      UploadState.waiting => (
          PqIcons.wifiOff,
          pq.tone(PqTone.warning).fg,
          l.checksQueueWaiting,
          l.rxQueueTaken(when, n),
        ),
      UploadState.rejected => (
          PqIcons.octagonX,
          pq.danger,
          l.checksQueueRejected,
          l.rxQueueRejectedSub(when, n),
        ),
      UploadState.missing => (
          PqIcons.imageOff,
          pq.danger,
          l.checksQueueMissing,
          l.checksQueueMissingSub,
        ),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              item.state == UploadState.missing
                  ? const PqIconTile(PqIcons.imageOff,
                      tone: PqTone.danger, size: 56, radius: 14, iconSize: 24)
                  : RxQueueThumb(item: item, previewPath: previewPath),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PqIcon(icon, size: 16, color: color),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(title,
                              style: PqText.rowTitle(c: pq.text)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      sub,
                      style: PqText.caption(c: pq.textMuted)
                          .copyWith(height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (item.stuck) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  RxOutlinePill(
                    label: l.checksQueueDelete,
                    icon: PqIcons.trash,
                    color: pq.danger,
                    onTap: onDelete,
                  ),
                  PqPillButton(
                    label: l.checksQueueRetake,
                    icon: PqIcons.camera,
                    onPressed: onRetake,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Миниатюра бланка 56: первое фото на листе, за ним край второго листа и
/// «+N», если фото несколько.
class RxQueueThumb extends StatelessWidget {
  const RxQueueThumb({super.key, required this.item, required this.previewPath});

  final PendingUpload item;
  final String Function(String) previewPath;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final more = item.filePaths.length - 1;
    final path =
        item.filePaths.isEmpty ? '' : previewPath(item.filePaths.first);
    final tile = Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: pq.surfaceAlt,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: pq.border),
      ),
      alignment: Alignment.center,
      child: ReceiptPaper(
        width: 34,
        height: 44,
        rotation: -4,
        photo: path.isEmpty
            ? const ReceiptLines(compact: true)
            : localPhoto(path,
                width: 34,
                height: 44,
                fallback: const ReceiptLines(compact: true)),
      ),
    );
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (more > 0)
            Positioned(
              left: 6,
              top: 4,
              width: 56,
              height: 56,
              child: Opacity(
                opacity: .55,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: pq.surfaceAlt,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          tile,
          if (more > 0)
            Positioned(
              right: -6,
              bottom: -6,
              child: Container(
                height: 22,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: pq.text,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: pq.surface, width: 2),
                ),
                child: Text(
                  '+$more',
                  style: PqText.text(12, FontWeight.w800, height: 1, c: pq.surface),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Контурная капсула 40: «Повторить», «Удалить».
class RxOutlinePill extends StatelessWidget {
  const RxOutlinePill({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final PqIcons icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      semanticLabel: label,
      scale: .96,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: pq.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PqIcon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(label, style: PqText.text(14, FontWeight.w600, c: color)),
          ],
        ),
      ),
    );
  }
}

/// «Удалить бланк?» (макет RxQueueDelete): бланк есть только на телефоне,
/// поэтому без подтверждения не удаляем.
Future<bool?> _confirmDelete(
  BuildContext context,
  PendingUpload item,
  String Function(String) previewPath,
) {
  return showPqSheet<bool>(
    context,
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
    builder: (ctx) => RxDeleteSheet(item: item, previewPath: previewPath),
  );
}

/// Содержимое окна «Удалить бланк?» (вынесено для визуальной сверки).
class RxDeleteSheet extends StatelessWidget {
  const RxDeleteSheet({super.key, required this.item, required this.previewPath});

  final PendingUpload item;
  final String Function(String) previewPath;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final state = switch (item.state) {
      UploadState.waiting => l.checksQueueWaiting,
      UploadState.rejected => l.checksQueueRejected,
      UploadState.missing => l.checksQueueMissing,
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PqIconTile(PqIcons.trash,
                tone: PqTone.danger, size: 48, radius: 14, iconSize: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.rxDeleteTitle,
                      style: PqText.heading(22, FontWeight.w700, c: pq.text)),
                  const SizedBox(height: 4),
                  Text(
                    l.rxDeleteText,
                    style: PqText.text(15, FontWeight.w400,
                        height: 1.45, c: pq.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: pq.surfaceAlt,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              item.state == UploadState.missing
                  ? const PqIconTile(PqIcons.imageOff,
                      tone: PqTone.danger, size: 56, radius: 14, iconSize: 24)
                  : RxQueueThumb(item: item, previewPath: previewPath),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state,
                        style: PqText.text(15, FontWeight.w600, c: pq.text)),
                    const SizedBox(height: 2),
                    Text(
                      l.rxQueueMeta(formatShortDateTime(item.createdAt),
                          item.filePaths.length),
                      style: PqText.caption(c: pq.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        PqPressable(
          onTap: () => Navigator.of(context).pop(true),
          semanticLabel: l.checksQueueDelete,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: pq.danger,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PqIcon(PqIcons.trash, size: 20, color: pq.onAccent),
                const SizedBox(width: 10),
                Text(l.checksQueueDelete,
                    style: PqText.text(16, FontWeight.w700, c: pq.onAccent)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        PqButton(
          label: l.commonCancel,
          kind: PqButtonKind.secondary,
          height: 52,
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    );
  }
}

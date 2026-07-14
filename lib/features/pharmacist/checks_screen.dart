import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/uploads/upload_queue.dart';
import '../../core/format.dart';
import '../../core/models/check.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

/// Цвет-статус чека/рецепта. Используется другими экранами (детали чека,
/// рецепты врача, портфель медпреда).
Color statusColor(CheckStatus s, ColorScheme scheme) => switch (s) {
      CheckStatus.approved => Colors.green,
      CheckStatus.rejected => scheme.error,
      CheckStatus.aiWrong => Colors.orange,
      _ => scheme.primary,
    };

/// Экран «Мои чеки». Дизайн перенесён из макета Figma «pharmiq-checks-screen».
class ChecksScreen extends ConsumerWidget {
  const ChecksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);
    final checks = ref.watch(checksProvider);
    final count = checks.asData?.value.length;

    return Scaffold(
      backgroundColor: p.bg,
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenDecor(checksDecor)),
          Column(
        children: [
          const PharmTopBar(),
          // Закреплённая шапка: заголовок, кнопка и счётчик не скроллятся.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: _Header(
              palette: p,
              count: count,
              onSend: () => _submitFlow(context, ref),
            ),
          ),
          // Прокручивается только список чеков.
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(checksProvider),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                children: [
                  const _PendingBanner(),
                  checks.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (e, _) => _InlineError(
                      palette: p,
                      message: e.toString(),
                      onRetry: () => ref.invalidate(checksProvider),
                    ),
                    data: (list) {
                      if (list.isEmpty) {
                        return _EmptyCard(palette: p, text: 'Чеков пока нет');
                      }
                      return Column(
                        children: [
                          for (final c in list) ...[
                            _CheckCard(palette: p, check: c),
                            const SizedBox(height: 8),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
          ),
        ],
      ),
    );
  }

  Future<void> _submitFlow(BuildContext context, WidgetRef ref) =>
      showNewCheckSheet(context);
}

/// Открывает модалку отправки нового чека. Используется на экране «Мои чеки»
/// и на главной (кнопка «Отправить чек»).
Future<void> showNewCheckSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const _NewCheckSheet(),
  );
}

// ── Модалка «Новый чек» ─────────────────────────────────────────────────

class _NewCheckSheet extends ConsumerStatefulWidget {
  const _NewCheckSheet();

  @override
  ConsumerState<_NewCheckSheet> createState() => _NewCheckSheetState();
}

class _NewCheckSheetState extends ConsumerState<_NewCheckSheet> {
  final _picker = ImagePicker();
  final List<XFile> _photos = [];
  bool _busy = false;

  Future<void> _addGallery() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) setState(() => _photos.addAll(picked));
  }

  Future<void> _addCamera() async {
    final x = await _picker.pickImage(source: ImageSource.camera);
    if (x != null) setState(() => _photos.add(x));
  }

  Future<void> _submit() async {
    if (_photos.isEmpty || _busy) return;
    setState(() => _busy = true);
    final nav = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    await ref
        .read(uploadQueueProvider.notifier)
        .enqueueCheck(_photos.map((x) => x.path).toList());
    nav.pop();
    messenger.showSnackBar(
        const SnackBar(content: Text('Чек добавлен — загружается')));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetBg = isDark ? const Color(0xFF22232B) : Colors.white; // как навбар
    final text = isDark ? Colors.white : const Color(0xFF1A1D26);
    final muted = isDark ? const Color(0xFF8F909A) : const Color(0xFF6B7280);
    final zoneBg = isDark ? const Color(0xFF15161C) : const Color(0xFFF5F6FA);
    final dashed = isDark ? const Color(0xFF2A3550) : const Color(0xFFD0D5DD);

    return Container(
      decoration: BoxDecoration(
        color: sheetBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: dashed, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 16),
              Text('Новый чек',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700, color: text)),
              const SizedBox(height: 16),
              // зона добавления / превью
              InkWell(
                onTap: _addGallery,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: zoneBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: dashed, width: 2, style: BorderStyle.solid),
                  ),
                  child: _photos.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate_outlined,
                                size: 40, color: dashed),
                            const SizedBox(height: 8),
                            Text('Нажмите чтобы добавить фото',
                                style: TextStyle(fontSize: 13, color: muted)),
                          ],
                        )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _photos.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (_, i) => _Thumb(
                            path: _photos[i].path,
                            onRemove: () =>
                                setState(() => _photos.removeAt(i)),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              // сделать фото
              SizedBox(
                height: 44,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFF1A3566), Color(0xFF2D5A9E)]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _addCamera,
                      borderRadius: BorderRadius.circular(12),
                      child: const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.photo_camera_outlined,
                                size: 18, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Сделать фото',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // отправить
              SizedBox(
                height: 52,
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1A3566),
                    disabledBackgroundColor:
                        const Color(0xFF1A3566).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: _photos.isEmpty || _busy ? null : _submit,
                  child: const Text('Отправить на проверку',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.path, required this.onRemove});
  final String path;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(File(path),
              width: 140, height: double.infinity, fit: BoxFit.cover),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: InkWell(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  color: Colors.black54, shape: BoxShape.circle),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Заголовок ───────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({
    required this.palette,
    required this.count,
    required this.onSend,
  });

  final PharmPalette palette;
  final int? count;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Мои чеки',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: palette.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 12),
            _SendButton(palette: palette, isDark: isDark, onTap: onSend),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '${count ?? 0} всего',
          style: TextStyle(fontSize: 14, color: palette.textMuted),
        ),
      ],
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({
    required this.palette,
    required this.isDark,
    required this.onTap,
  });

  final PharmPalette palette;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = isDark ? const Color(0x14FFFFFF) : palette.accent;
    final border = isDark ? const Color(0x1FFFFFFF) : Colors.transparent;
    final fg = isDark ? palette.textPrimary : Colors.white;
    return Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            'Отправить фото',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Карточка чека ───────────────────────────────────────────────────────

class _CheckCard extends StatelessWidget {
  const _CheckCard({required this.palette, required this.check});

  final PharmPalette palette;
  final Check check;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF2D2E38) : palette.card;
    final detail = _detail(check);

    return Material(
      color: cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: palette.cardBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/app/checks/${check.id}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '№${check.id}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: palette.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${formatDate(check.createdAt)} · фото: ${check.photoCount}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: palette.textMuted),
                    ),
                    if (detail.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        detail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: palette.textMuted),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _StatusChip(palette: palette, isDark: isDark, status: check.status),
            ],
          ),
        ),
      ),
    );
  }

  String _detail(Check c) {
    if (c.status == CheckStatus.rejected &&
        (c.rejectReason?.isNotEmpty ?? false)) {
      return c.rejectReason!;
    }
    if (c.drugs.isNotEmpty) {
      return c.drugs.map((d) => '${d.name} ×${d.packs}').join(', ');
    }
    if (c.status == CheckStatus.pending || c.status == CheckStatus.aiDetected) {
      return 'Ожидайте — обычно 24 часа';
    }
    return '';
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.palette,
    required this.isDark,
    required this.status,
  });

  final PharmPalette palette;
  final bool isDark;
  final CheckStatus status;

  @override
  Widget build(BuildContext context) {
    final (String label, Color bg, Color fg) = _style();
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(11)),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
          color: fg,
        ),
      ),
    );
  }

  (String, Color, Color) _style() {
    switch (status) {
      case CheckStatus.approved:
        return isDark
            ? ('Одобрен', const Color(0xFF173F20), const Color(0xFF79D384))
            : ('Одобрен', const Color(0xFF10B981), Colors.white);
      case CheckStatus.rejected:
      case CheckStatus.aiWrong:
        return isDark
            ? ('Отклонён', const Color(0xFF5C1A28), const Color(0xFFFFD9D6))
            : ('Отклонён', const Color(0xFFEF4444), Colors.white);
      case CheckStatus.pending:
      case CheckStatus.aiDetected:
        return isDark
            ? ('На проверке', const Color(0xFF4A3000), const Color(0xFFFFD770))
            : ('На проверке', const Color(0xFFF59E0B), Colors.white);
    }
  }
}

// ── Вспомогательные ─────────────────────────────────────────────────────

/// Баннер офлайн-очереди: сколько чеков ещё загружается + «повторить».
class _PendingBanner extends ConsumerWidget {
  const _PendingBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(pendingUploadCountProvider);
    if (count == 0) return const SizedBox.shrink();
    final p = PharmPalette.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: p.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
              height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)),
          const SizedBox(width: 12),
          Expanded(
            child: Text('Загружается: $count',
                style: TextStyle(color: p.textPrimary)),
          ),
          TextButton(
            onPressed: () => ref.read(uploadQueueProvider.notifier).retryNow(),
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}

class _InlineError extends StatelessWidget {
  const _InlineError({
    required this.palette,
    required this.message,
    required this.onRetry,
  });

  final PharmPalette palette;
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Icon(Icons.error_outline,
              size: 40, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 12),
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(color: palette.textMuted)),
          const SizedBox(height: 12),
          FilledButton.tonal(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.palette, required this.text});

  final PharmPalette palette;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2D2E38) : palette.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: palette.cardBorder),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: palette.textMuted),
      ),
    );
  }
}

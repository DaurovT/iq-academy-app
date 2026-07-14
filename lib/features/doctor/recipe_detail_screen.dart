import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/format.dart';
import '../../core/img.dart';
import '../../core/models/check.dart';
import '../../widgets/async_view.dart';
import '../shared/widgets/photo_lightbox.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

/// Деталь рецепта врача. Перенесена из макета Figma «prescription-detail»
/// (тёмная 161:682 и светлая 161:242 темы).
class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _RD.of(context);
    final detail = ref.watch(recipeDetailProvider(id));

    return Scaffold(
      backgroundColor: c.page,
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(recipeDetailDecor)),
          SafeArea(
            bottom: false,
            child: AsyncView(
              value: detail,
              onRetry: () => ref.invalidate(recipeDetailProvider(id)),
              data: (r) => _Body(c: c, id: id, detail: r),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.c, required this.id, required this.detail});
  final _RD c;
  final int id;
  final RecipeDetail detail;

  @override
  Widget build(BuildContext context) {
    final (chipLabel, chipBg) = _chip(detail.status);
    final aiText = detail.aiText?.trim() ?? '';

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
      children: [
        // breadcrumb
        SizedBox(
          height: 40,
          child: InkWell(
            onTap: () =>
                context.canPop() ? context.pop() : context.go('/app/recipes'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.chevron_left, size: 20, color: c.accent),
                const SizedBox(width: 4),
                Text('Мои рецепты',
                    style: TextStyle(fontSize: 14, color: c.accent)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // header: title + status + date
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text('Рецепт №$id',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: c.text)),
            ),
            const SizedBox(width: 12),
            Container(
              height: 23,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: chipBg, borderRadius: BorderRadius.circular(12)),
              child: Text(chipLabel.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                      color: Colors.white)),
            ),
            const Spacer(),
            Text(formatShortDateTime(detail.createdAt),
                style: TextStyle(fontSize: 13, color: c.muted)),
          ],
        ),
        const SizedBox(height: 24),

        // photos
        Text('Фото ${detail.photoCount}',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                color: c.muted)),
        const SizedBox(height: 12),
        _PhotoRow(c: c, detail: detail),
        const SizedBox(height: 24),

        // распознано ИИ
        _AiCard(c: c, drugs: detail.drugs),

        if (aiText.isNotEmpty) ...[
          const SizedBox(height: 24),
          _ClinicalCard(c: c, text: aiText),
        ],
      ],
    );
  }

  (String, Color) _chip(CheckStatus s) => switch (s) {
        CheckStatus.approved => ('Одобрен', const Color(0xFF16A34A)),
        CheckStatus.rejected ||
        CheckStatus.aiWrong =>
          ('Отклонён', const Color(0xFFEF4444)),
        _ => ('На проверке', const Color(0xFFF59E0B)),
      };
}

// ── Фото ───────────────────────────────────────────────────────────────

class _PhotoRow extends StatelessWidget {
  const _PhotoRow({required this.c, required this.detail});
  final _RD c;
  final RecipeDetail detail;

  @override
  Widget build(BuildContext context) {
    if (detail.photos.isEmpty) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: c.card, borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.image_outlined, size: 24, color: c.muted),
      );
    }
    final urls = [for (final p in detail.photos) p.url];
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: detail.photos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => showPhotoLightbox(context, urls, initialIndex: i),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imgThumb(detail.photos[i].url, w: 240)!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: c.card,
                child: Icon(Icons.broken_image_outlined,
                    size: 24, color: c.muted),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Распознано ИИ ──────────────────────────────────────────────────────

class _AiCard extends StatelessWidget {
  const _AiCard({required this.c, required this.drugs});
  final _RD c;
  final List<RecipeDrug> drugs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, size: 20, color: Color(0xFF6B9EF5)),
              const SizedBox(width: 8),
              Text('Распознано ИИ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: c.text)),
            ],
          ),
          if (drugs.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Препараты не распознаны',
                  style: TextStyle(fontSize: 14, color: c.muted)),
            )
          else
            for (final d in drugs) ...[
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(d.name,
                        style: TextStyle(fontSize: 14, color: c.text)),
                  ),
                  const SizedBox(width: 12),
                  Text('${d.qty}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: c.text)),
                ],
              ),
            ],
        ],
      ),
    );
  }
}

// ── Полный распознанный текст ───────────────────────────────────────────

class _ClinicalCard extends StatelessWidget {
  const _ClinicalCard({required this.c, required this.text});
  final _RD c;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(16)),
      child: Text(
        text,
        style: TextStyle(fontSize: 13, height: 1.6, color: c.muted),
      ),
    );
  }
}

// ── Палитра ─────────────────────────────────────────────────────────────

class _RD {
  const _RD({
    required this.page,
    required this.card,
    required this.text,
    required this.muted,
    required this.accent,
  });

  final Color page;
  final Color card;
  final Color text;
  final Color muted;
  final Color accent;

  static _RD of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _RD(
    page: Color(0xFF0F0F14),
    card: Color(0xFF22232B),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF8F909A),
    accent: Color(0xFF6B9EF5),
  );

  static const _light = _RD(
    page: Color(0xFFF5F6FA),
    card: Color(0xFFFFFFFF),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    accent: Color(0xFF6B7280),
  );
}

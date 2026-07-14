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

enum _Tab { all, active, done }

/// Экран «Мои рецепты». Дизайн перенесён из макета Figma
/// «prescriptions-list» (тёмная 161:406 и светлая 161:1088 темы).
class RecipesScreen extends ConsumerStatefulWidget {
  const RecipesScreen({super.key});

  @override
  ConsumerState<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends ConsumerState<RecipesScreen> {
  _Tab _tab = _Tab.all;

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final recipes = ref.watch(recipesProvider);
    final all = recipes.asData?.value ?? const <Recipe>[];
    final count = recipes.asData?.value.length;

    final list = switch (_tab) {
      _Tab.all => all,
      _Tab.active => all.where(_isActive).toList(),
      _Tab.done => all.where((r) => !_isActive(r)).toList(),
    };

    return Scaffold(
      backgroundColor: p.bg,
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(recipesDecor)),
          Column(
            children: [
              const PharmTopBar(),
              // Закреплённая шапка: заголовок, кнопка и вкладки не скроллятся.
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Мои рецепты',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: p.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${count ?? 0} всего',
                      style: TextStyle(fontSize: 14, color: p.textMuted),
                    ),
                    const SizedBox(height: 16),
                    _SubmitButton(
                      onTap: () => showNewRecipeSheet(context, ref),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        for (final (t, label) in const [
                          (_Tab.all, 'Все'),
                          (_Tab.active, 'Активные'),
                          (_Tab.done, 'Завершенные'),
                        ]) ...[
                          _TabChip(
                            palette: p,
                            label: label,
                            selected: _tab == t,
                            onTap: () => setState(() => _tab = t),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => ref.invalidate(recipesProvider),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    children: [
                      const _PendingBanner(),
                      recipes.when(
                        loading: () => const Padding(
                          padding: EdgeInsets.only(top: 48),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        error: (e, _) => _InlineError(
                          palette: p,
                          message: e.toString(),
                          onRetry: () => ref.invalidate(recipesProvider),
                        ),
                        data: (_) {
                          if (list.isEmpty) {
                            return _EmptyCard(
                                palette: p, text: 'Рецептов пока нет');
                          }
                          return Column(
                            children: [
                              for (final r in list) ...[
                                _RecipeCard(palette: p, recipe: r),
                                const SizedBox(height: 12),
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

  static bool _isActive(Recipe r) =>
      r.status != CheckStatus.approved && r.status != CheckStatus.rejected;
}

// ── Отправка рецепта ────────────────────────────────────────────────────

/// Запускает поток отправки нового рецепта (выбор источника → фото →
/// данные врача → очередь загрузки). Используется на экране «Мои рецепты»
/// и на главной (кнопка «Отправить рецепт»).
Future<void> showNewRecipeSheet(BuildContext context, WidgetRef ref) async {
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

  // Онбординг врача (все поля опциональны — бэк переиспользует прошлые).
  final doctor = await _askDoctorInfo(context);
  if (!context.mounted) return;

  await ref
      .read(uploadQueueProvider.notifier)
      .enqueueRecipe(picked.map((x) => x.path).toList(), doctor);
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Рецепт добавлен — загружается')));
}

Future<DoctorRecipeInfo?> _askDoctorInfo(BuildContext context) {
  final name = TextEditingController();
  final workplace = TextEditingController();
  final city = TextEditingController();
  final phone = TextEditingController();
  return showDialog<DoctorRecipeInfo>(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Данные врача (по желанию)'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'ФИО')),
            TextField(
                controller: workplace,
                decoration:
                    const InputDecoration(labelText: 'Место работы')),
            TextField(
                controller: city,
                decoration: const InputDecoration(labelText: 'Город')),
            TextField(
                controller: phone,
                decoration: const InputDecoration(labelText: 'Телефон'),
                keyboardType: TextInputType.phone),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, const DoctorRecipeInfo()),
          child: const Text('Пропустить'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(
            context,
            DoctorRecipeInfo(
              name: name.text.trim().isEmpty ? null : name.text.trim(),
              workplace:
                  workplace.text.trim().isEmpty ? null : workplace.text.trim(),
              city: city.text.trim().isEmpty ? null : city.text.trim(),
              phone: phone.text.trim().isEmpty ? null : phone.text.trim(),
            ),
          ),
          child: const Text('Отправить'),
        ),
      ],
    ),
  );
}

// ── Кнопка «Отправить рецепт» ───────────────────────────────────────────

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF6B9EF5),
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: const SizedBox(
          height: 48,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_camera_outlined, size: 18, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Отправить рецепт',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Вкладки ──────────────────────────────────────────────────────────────

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.palette,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final PharmPalette palette;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 31,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF6B9EF5)
              : (isDark ? const Color(0xFF2D2E38) : Colors.white),
          borderRadius: BorderRadius.circular(999),
          border: selected ? null : Border.all(color: palette.cardBorder),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? Colors.white : palette.textMuted,
          ),
        ),
      ),
    );
  }
}

// ── Карточка рецепта ─────────────────────────────────────────────────────

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.palette, required this.recipe});

  final PharmPalette palette;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF2D2E38) : palette.card;
    final drugs = recipe.drugs.map((d) => '${d.name} · ${d.qty}').join(', ');

    return Material(
      color: cardBg,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/app/recipes/${recipe.id}'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: palette.cardBorder),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '№${recipe.id}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: palette.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _StatusChip(status: recipe.status),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      size: 14, color: palette.textMuted),
                  const SizedBox(width: 6),
                  Text(
                    formatShortDateTime(recipe.createdAt),
                    style: TextStyle(fontSize: 12, color: palette.textMuted),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.photo_camera_outlined,
                      size: 14, color: palette.textMuted),
                  const SizedBox(width: 6),
                  Text(
                    'фото: ${recipe.photoCount}',
                    style: TextStyle(fontSize: 12, color: palette.textMuted),
                  ),
                ],
              ),
              if (drugs.isNotEmpty) ...[
                const SizedBox(height: 12),
                Divider(height: 1, thickness: 1, color: palette.cardBorder),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF21283A)
                        : const Color(0xFFF5F7FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    drugs,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: palette.textMuted),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Статус-чип рецепта: сплошная заливка + белый текст (единый вид в обеих
/// темах, как в макете).
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final CheckStatus status;

  @override
  Widget build(BuildContext context) {
    final (String label, Color bg) = switch (status) {
      CheckStatus.approved => ('Одобрен', const Color(0xFF16A34A)),
      CheckStatus.rejected ||
      CheckStatus.aiWrong =>
        ('Отклонён', const Color(0xFFEF4444)),
      _ => ('На проверке', const Color(0xFFF59E0B)),
    };
    return Container(
      height: 23,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ── Вспомогательные ──────────────────────────────────────────────────────

class _PendingBanner extends ConsumerWidget {
  const _PendingBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(pendingUploadCountProvider);
    if (count == 0) return const SizedBox.shrink();
    final p = PharmPalette.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: p.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2)),
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
          FilledButton.tonal(
              onPressed: onRetry, child: const Text('Повторить')),
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
        borderRadius: BorderRadius.circular(16),
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

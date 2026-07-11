import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/uploads/upload_queue.dart';
import '../../core/format.dart';
import '../../core/models/check.dart';
import '../../widgets/async_view.dart';
import '../pharmacist/checks_screen.dart' show statusColor;
import 'providers.dart';

class RecipesScreen extends ConsumerWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Мои рецепты')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _submitFlow(context, ref),
        icon: const Icon(Icons.add_a_photo_outlined),
        label: const Text('Загрузить рецепт'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(recipesProvider),
        child: AsyncView(
          value: recipes,
          onRetry: () => ref.invalidate(recipesProvider),
          data: (list) => list.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 300, child: EmptyState(text: 'Рецептов пока нет')),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _RecipeTile(recipe: list[i]),
                ),
        ),
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
              TextField(controller: name, decoration: const InputDecoration(labelText: 'ФИО')),
              TextField(controller: workplace, decoration: const InputDecoration(labelText: 'Место работы')),
              TextField(controller: city, decoration: const InputDecoration(labelText: 'Город')),
              TextField(controller: phone, decoration: const InputDecoration(labelText: 'Телефон'), keyboardType: TextInputType.phone),
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
                workplace: workplace.text.trim().isEmpty ? null : workplace.text.trim(),
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
}

class _RecipeTile extends StatelessWidget {
  const _RecipeTile({required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final drugs = recipe.drugs.map((d) => '${d.name} ×${d.qty}').join(', ');
    return Card(
      child: ListTile(
        onTap: () => context.go('/app/recipes/${recipe.id}'),
        leading: CircleAvatar(
          backgroundColor: statusColor(recipe.status, scheme).withValues(alpha: 0.15),
          child: Icon(Icons.description_outlined, color: statusColor(recipe.status, scheme)),
        ),
        title: Text('Рецепт #${recipe.id}'),
        subtitle: Text('${formatDate(recipe.createdAt)}${drugs.isEmpty ? '' : '\n$drugs'}'),
        isThreeLine: drugs.isNotEmpty,
        trailing: Text(recipe.status.label,
            style: TextStyle(color: statusColor(recipe.status, scheme))),
      ),
    );
  }
}

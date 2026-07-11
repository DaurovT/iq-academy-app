import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/format.dart';
import '../../widgets/async_view.dart';
import '../../widgets/stat_tile.dart';
import '../pharmacist/checks_screen.dart' show statusColor;
import 'providers.dart';

class MedrepPharmacistDetailScreen extends ConsumerWidget {
  const MedrepPharmacistDetailScreen({super.key, required this.telegramId});
  final int telegramId;

  Future<void> _incentivize(BuildContext context, WidgetRef ref) async {
    var rating = 5.0;
    final note = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Поощрить фармацевта'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Оценка: ${rating.round()}'),
              Slider(
                value: rating,
                min: 1,
                max: 5,
                divisions: 4,
                label: '${rating.round()}',
                onChanged: (v) => setState(() => rating = v),
              ),
              TextField(
                controller: note,
                decoration: const InputDecoration(labelText: 'Комментарий'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Отмена')),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Отправить')),
          ],
        ),
      ),
    );
    if (ok != true) return;
    if (!context.mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiProvider).medrep.incentivize(telegramId, rating.round(), note.text.trim());
      messenger.showSnackBar(const SnackBar(content: Text('Отправлено')));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(pharmacistDetailProvider(telegramId));
    return Scaffold(
      appBar: AppBar(title: const Text('Фармацевт')),
      body: AsyncView(
        value: detail,
        onRetry: () => ref.invalidate(pharmacistDetailProvider(telegramId)),
        data: (p) {
          final scheme = Theme.of(context).colorScheme;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(p.name, style: Theme.of(context).textTheme.headlineSmall),
              Text('${p.shop} · ${p.city}'),
              Text('Активность: ${formatDate(p.lastActivity)}',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 16),
              StatGrid(tiles: [
                StatTile(value: '${p.checks}', label: 'Чеков'),
                StatTile(value: '${p.approvedPacks}', label: 'Упаковок'),
                StatTile(value: '${p.quests}', label: 'Квестов'),
              ]),
              const SizedBox(height: 16),
              FilledButton.tonalIcon(
                onPressed: () => _incentivize(context, ref),
                icon: const Icon(Icons.star_outline),
                label: const Text('Поощрить'),
              ),
              const SizedBox(height: 16),
              Text('Последние чеки', style: Theme.of(context).textTheme.titleMedium),
              for (final c in p.recentChecks)
                Card(
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.receipt_long_outlined,
                        color: statusColor(c.status, scheme)),
                    title: Text('Чек #${c.id}'),
                    subtitle: Text(formatDate(c.createdAt)),
                    trailing: Text('×${c.packs} · ${c.status.label}'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

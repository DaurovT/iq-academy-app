import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/providers.dart';
import '../../../core/models/notification.dart';
import '../../../widgets/async_view.dart';
import '../providers.dart';

class NotificationSettingsScreen extends ConsumerWidget {
  const NotificationSettingsScreen({super.key});

  Future<void> _save(BuildContext context, WidgetRef ref, NotificationSettings s) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiProvider).notifications.setSettings(s);
      ref.invalidate(notificationSettingsProvider);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(notificationSettingsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Уведомления')),
      body: AsyncView(
        value: settings,
        onRetry: () => ref.invalidate(notificationSettingsProvider),
        data: (s) => ListView(
          children: [
            SwitchListTile(
              title: const Text('Статусы чеков и рецептов'),
              value: s.checks,
              onChanged: (v) => _save(context, ref, s.copyWith(checks: v)),
            ),
            SwitchListTile(
              title: const Text('Квесты и награды'),
              value: s.quests,
              onChanged: (v) => _save(context, ref, s.copyWith(quests: v)),
            ),
            SwitchListTile(
              title: const Text('Обучение'),
              value: s.learning,
              onChanged: (v) => _save(context, ref, s.copyWith(learning: v)),
            ),
            SwitchListTile(
              title: const Text('Новости и акции'),
              value: s.marketing,
              onChanged: (v) => _save(context, ref, s.copyWith(marketing: v)),
            ),
          ],
        ),
      ),
    );
  }
}

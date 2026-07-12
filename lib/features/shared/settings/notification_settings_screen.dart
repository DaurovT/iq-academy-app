import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/providers.dart';
import '../../../core/models/notification.dart';
import '../../../widgets/async_view.dart';
import '../providers.dart';

/// Открывает «Настройки уведомлений» модальным нижним листом
/// (перенесено один в один из макета Figma «pharmiq-notifications-settings»).
Future<void> showNotificationSettingsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const _SettingsSheet(),
  );
}

/// Полноэкранная обёртка для маршрута `/app/settings/notifications`.
class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D1117) : const Color(0xFFF5F6FA),
      body: const Align(
        alignment: Alignment.bottomCenter,
        child: _SettingsSheet(),
      ),
    );
  }
}

class _SettingsSheet extends ConsumerWidget {
  const _SettingsSheet();

  Future<void> _save(
      BuildContext context, WidgetRef ref, NotificationSettings s) async {
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetBg = isDark ? const Color(0xFF1A1F2E) : Colors.white;
    final text = isDark ? Colors.white : const Color(0xFF1A1D26);
    final border = isDark ? const Color(0xFF30363D) : const Color(0xFFEBEDF0);
    final settings = ref.watch(notificationSettingsProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: sheetBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    color: border, borderRadius: BorderRadius.circular(2)),
              ),
              // header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Настройки уведомлений',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: text)),
                    InkWell(
                      onTap: () => Navigator.of(context).maybePop(),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: border,
                            borderRadius: BorderRadius.circular(16)),
                        child: Icon(Icons.close, size: 16, color: text),
                      ),
                    ),
                  ],
                ),
              ),
              AsyncView(
                value: settings,
                onRetry: () => ref.invalidate(notificationSettingsProvider),
                data: (s) => Column(
                  children: [
                    _Row(
                      text: text,
                      border: border,
                      label: 'Статусы чеков и рецептов',
                      value: s.checks,
                      onChanged: (v) =>
                          _save(context, ref, s.copyWith(checks: v)),
                    ),
                    _Row(
                      text: text,
                      border: border,
                      label: 'Квесты и награды',
                      value: s.quests,
                      onChanged: (v) =>
                          _save(context, ref, s.copyWith(quests: v)),
                    ),
                    _Row(
                      text: text,
                      border: border,
                      label: 'Обучение',
                      value: s.learning,
                      onChanged: (v) =>
                          _save(context, ref, s.copyWith(learning: v)),
                    ),
                    _Row(
                      text: text,
                      border: border,
                      label: 'Новости и акции',
                      value: s.marketing,
                      last: true,
                      onChanged: (v) =>
                          _save(context, ref, s.copyWith(marketing: v)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.text,
    required this.border,
    required this.label,
    required this.value,
    required this.onChanged,
    this.last = false,
  });

  final Color text;
  final Color border;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: TextStyle(fontSize: 15, color: text)),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: const Color(0xFF34C759),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/api/providers.dart';
import '../../../core/models/notification.dart';
import '../../../widgets/async_view.dart';
import '../providers.dart';
import '../settings/notification_settings_screen.dart';
import '../widgets/pharm_top_bar.dart';

final _dt = DateFormat('dd.MM, HH:mm');

/// Уведомления. Перенесены один в один из макета Figma
/// «pharmiq-notifications-list».
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _N.of(context);
    final items = ref.watch(notificationsProvider);
    final unread =
        items.asData?.value.where((n) => !n.isRead).length ?? 0;

    return Scaffold(
      backgroundColor: c.page,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(notificationsProvider),
              child: AsyncView(
                value: items,
                onRetry: () => ref.invalidate(notificationsProvider),
                data: (list) => ListView(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 20),
                  children: [
                    // page-header
                    Text('Уведомления',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: c.text)),
                    if (unread > 0) ...[
                      const SizedBox(height: 4),
                      Text(_unreadLabel(unread),
                          style: TextStyle(fontSize: 13, color: c.sub)),
                    ],
                    const SizedBox(height: 12),
                    // action-row
                    SizedBox(
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => showNotificationSettingsSheet(context),
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: c.settingsBg,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Icon(Icons.settings_outlined,
                                  size: 18, color: c.text),
                            ),
                          ),
                          InkWell(
                            onTap: () => _markAll(ref),
                            borderRadius: BorderRadius.circular(999),
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(color: c.markBorder),
                              ),
                              child: Text('Отметить все прочитанными',
                                  style: TextStyle(fontSize: 12, color: c.text)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (list.isEmpty)
                      _Empty(c: c)
                    else
                      for (final n in list) ...[
                        _Card(
                          c: c,
                          n: n,
                          onMarkRead: () => _markRead(ref, n.id),
                          onOpen: n.link == null
                              ? null
                              : () {
                                  _markRead(ref, n.id);
                                  context.push(n.link!);
                                },
                        ),
                        const SizedBox(height: 12),
                      ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _unreadLabel(int n) {
    final w = n % 10 == 1 && n % 100 != 11 ? 'непрочитанное' : 'непрочитанных';
    return '$n $w';
  }

  Future<void> _markAll(WidgetRef ref) async {
    await ref.read(apiProvider).notifications.markAllRead();
    ref.invalidate(notificationsProvider);
    ref.invalidate(unreadCountProvider);
  }

  Future<void> _markRead(WidgetRef ref, int id) async {
    await ref.read(apiProvider).notifications.markRead(id);
    ref.invalidate(notificationsProvider);
    ref.invalidate(unreadCountProvider);
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.c,
    required this.n,
    required this.onMarkRead,
    required this.onOpen,
  });

  final _N c;
  final AppNotification n;
  final VoidCallback onMarkRead;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: c.cardBg, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (!n.isRead)
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                            color: Color(0xFF3B82F6), shape: BoxShape.circle),
                      ),
                    Expanded(
                      child: Text(n.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: c.text)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(_time(n.createdAt),
                  style: TextStyle(fontSize: 11, color: c.sub)),
            ],
          ),
          const SizedBox(height: 12),
          Text(n.body, style: TextStyle(fontSize: 13, color: c.sub)),
          const SizedBox(height: 12),
          Container(height: 1, color: c.divider),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              n.isRead
                  ? Text('✓ Прочитано',
                      style: TextStyle(fontSize: 12, color: c.readText))
                  : InkWell(
                      onTap: onMarkRead,
                      child: Text('Отметить прочитанным',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: c.accent)),
                    ),
              if (onOpen != null)
                InkWell(
                  onTap: onOpen,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D4ED8),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      children: [
                        Text('Открыть',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        SizedBox(width: 6),
                        Icon(Icons.chevron_right, size: 14, color: Colors.white),
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

  String _time(String iso) {
    final d = DateTime.tryParse(iso);
    return d == null ? iso : _dt.format(d.toLocal());
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.c});
  final _N c;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
          color: c.cardBg, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Icon(Icons.notifications_none, size: 40, color: c.sub),
          const SizedBox(height: 12),
          Text('Уведомлений нет',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: c.text)),
          const SizedBox(height: 4),
          Text('Здесь появятся статусы чеков, награды за квесты и новости обучения.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: c.sub)),
        ],
      ),
    );
  }
}

class _N {
  const _N({
    required this.page,
    required this.text,
    required this.sub,
    required this.settingsBg,
    required this.markBorder,
    required this.cardBg,
    required this.divider,
    required this.readText,
    required this.accent,
  });

  final Color page;
  final Color text;
  final Color sub;
  final Color settingsBg;
  final Color markBorder;
  final Color cardBg;
  final Color divider;
  final Color readText;
  final Color accent;

  static _N of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _N(
    page: Color(0xFF0D1117),
    text: Color(0xFFE4E2ED),
    sub: Color(0xFF8E8F9A),
    settingsBg: Color(0xFF1A1F2E),
    markBorder: Color(0xFF2A3040),
    cardBg: Color(0xFF131A28),
    divider: Color(0xFF1E2535),
    readText: Color(0xFF5E6070),
    accent: Color(0xFF6B9EF5),
  );

  static const _light = _N(
    page: Color(0xFFF5F6FA),
    text: Color(0xFF1A1D26),
    sub: Color(0xFF6B7280),
    settingsBg: Color(0xFFEEF2FF),
    markBorder: Color(0xFFD0D5DD),
    cardBg: Colors.white,
    divider: Color(0xFFEBEDF0),
    readText: Color(0xFF9CA3AF),
    accent: Color(0xFF2563EB),
  );
}

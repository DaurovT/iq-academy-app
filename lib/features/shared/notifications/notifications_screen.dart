import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../../../core/models/notification.dart';
import '../../../widgets/pq_states.dart';
import '../profile/profile_widgets.dart';
import '../providers.dart';
import '../settings/notification_settings_screen.dart';

final _dt = DateFormat('dd.MM, HH:mm');
final _dm = DateFormat('dd.MM');

/// Фильтр ленты (чипы «Все / Чеки / Квесты / Обучение»).
enum _Filter { all, checks, quests, learning }

/// Вид уведомления → плитка и фильтр. Тип с сервера — свободная строка,
/// поэтому категорию определяем по ключевым словам в `type` и `link`.
enum _Cat { wallet, quest, coin, warn, book, other }

_Cat _catOf(AppNotification n) {
  final s = '${n.type} ${n.link ?? ''}'.toLowerCase();
  bool has(List<String> w) => w.any(s.contains);
  if (has(['reject', 'declin', 'fail', 'wrong'])) return _Cat.warn;
  if (has(['voucher', 'wallet', 'reward', 'redeem'])) return _Cat.wallet;
  if (has(['quest'])) return _Cat.quest;
  if (has(['course', 'learn', 'lesson', 'quiz'])) return _Cat.book;
  if (has(['check', 'recipe', 'credit', 'accru', 'iqc'])) return _Cat.coin;
  return _Cat.other;
}

_Filter? _filterOf(_Cat c) => switch (c) {
      _Cat.coin || _Cat.warn => _Filter.checks,
      _Cat.quest || _Cat.wallet => _Filter.quests,
      _Cat.book => _Filter.learning,
      _Cat.other => null,
    };

/// Уведомления (макеты Notif / NotifEmpty): группы по месяцам, фильтры,
/// «прочитано» по нажатию и свайпу, «Прочитать все», настройки — нижним листом.
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  _Filter _filter = _Filter.all;

  /// Прочитанные локально — пока сервер не вернул обновлённый список.
  final _read = <int>{};

  bool _isUnread(AppNotification n) => !n.isRead && !_read.contains(n.id);

  Future<void> _markRead(AppNotification n) async {
    if (!_isUnread(n)) return;
    setState(() => _read.add(n.id));
    try {
      await ref.read(apiProvider).notifications.markRead(n.id);
      ref.invalidate(notificationsProvider);
      ref.invalidate(unreadCountProvider);
    } catch (_) {
      if (mounted) setState(() => _read.remove(n.id));
    }
  }

  Future<void> _markAll(List<AppNotification> list) async {
    final ids = list.where(_isUnread).map((n) => n.id).toList();
    setState(() => _read.addAll(ids));
    try {
      await ref.read(apiProvider).notifications.markAllRead();
      ref.invalidate(notificationsProvider);
      ref.invalidate(unreadCountProvider);
    } catch (_) {
      if (mounted) setState(() => _read.removeAll(ids));
    }
  }

  void _open(AppNotification n) {
    _markRead(n);
    if (n.link != null) context.push(n.link!);
  }

  Future<void> _refresh() async {
    ref.invalidate(notificationsProvider);
    ref.invalidate(unreadCountProvider);
    await ref.read(notificationsProvider.future);
  }

  String _month(DateTime d) {
    final code = Localizations.localeOf(context).languageCode;
    try {
      return DateFormat('LLLL y', code == 'tg' ? 'ru' : code).format(d);
    } catch (_) {
      return DateFormat('MM.y').format(d);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final pq = context.pq;
    final items = ref.watch(notificationsProvider);
    return PqScreen(
      child: Column(children: [
        PqTopBar(
          backLabel: l.profileBack,
          onBack: () => profileGoBack(context, '/app'),
          trailing: PqIconButton(
            icon: PqIcons.settings,
            label: l.notifSettingsTitle,
            onTap: () => showNotificationSettingsSheet(context),
          ),
        ),
        Expanded(
          child: PqAsync<List<AppNotification>>(
            value: items,
            onRetry: () => ref.invalidate(notificationsProvider),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            loadingBuilder: (_) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: PqSkeletonList(title: l.notifTitle),
            ),
            data: (list) => PqRefresh(
              onRefresh: _refresh,
              child: list.isEmpty ? _empty(context) : _content(context, list, pq),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _header(BuildContext context, String subtitle, {VoidCallback? onReadAll}) {
    final pq = context.pq;
    final l = context.l10n;
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Expanded(child: PqPageTitle(l.notifTitle, subtitle: subtitle)),
      if (onReadAll != null) ...[
        const SizedBox(width: 12),
        PqPressable(
          onTap: onReadAll,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 44),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              PqIcon(PqIcons.checkCheck, size: 18, color: pq.accent),
              const SizedBox(width: 6),
              Text(l.notifReadAll, style: PqText.link(c: pq.accent)),
            ]),
          ),
        ),
      ],
    ]);
  }

  Widget _empty(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    Widget up(int i, Widget c) =>
        PqAnimate(delay: PqMotion.staggerDelay(i, maxIndex: 4), child: c);
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      children: [
        up(0, _header(context, l.notifEmptySubtitle)),
        const SizedBox(height: 20),
        up(1, Padding(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
          child: Column(children: [
            Container(
              width: 96,
              height: 96,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: pq.accentSoft,
                borderRadius: BorderRadius.circular(32),
              ),
              child: PqRing(
                delay: const Duration(milliseconds: 400),
                repeat: 2,
                child: PqIcon(PqIcons.bell, size: 44, color: pq.accentText),
              ),
            ),
            const SizedBox(height: 20),
            Text(l.notifEmptyQuietTitle,
                textAlign: TextAlign.center, style: PqText.emptyTitle(c: pq.text)),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(l.notifEmptyQuietText,
                  textAlign: TextAlign.center,
                  style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textMuted)),
            ),
            const SizedBox(height: 20),
            PqPressable(
              onTap: () => showNotificationSettingsSheet(context),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: pq.border),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  PqIcon(PqIcons.settings, size: 18, color: pq.accent),
                  const SizedBox(width: 8),
                  Text(l.notifConfigure, style: PqText.text(15, FontWeight.w600, c: pq.accent)),
                ]),
              ),
            ),
          ]),
        )),
      ],
    );
  }

  Widget _content(BuildContext context, List<AppNotification> list, PqColors pq) {
    final l = context.l10n;
    final doctor =
        ref.watch(authControllerProvider).asData?.value.activeRole == Role.doctor;
    final unread = list.where(_isUnread).length;
    final rows = list
        .where((n) => _filter == _Filter.all || _filterOf(_catOf(n)) == _filter)
        .toList();

    // Группы по месяцам в порядке ленты.
    final groups = <(String, List<AppNotification>)>[];
    for (final n in rows) {
      final d = DateTime.tryParse(n.createdAt)?.toLocal();
      final name = d == null ? '' : _month(d);
      if (groups.isEmpty || groups.last.$1 != name) groups.add((name, []));
      groups.last.$2.add(n);
    }

    String label(_Filter f) => switch (f) {
          _Filter.all => l.notifFilterAll,
          _Filter.checks => doctor ? l.notifFilterRecipes : l.notifFilterChecks,
          _Filter.quests => l.notifFilterQuests,
          _Filter.learning => l.notifFilterLearning,
        };

    final sections = <Widget>[
      _header(
        context,
        unread > 0 ? l.notifNewCount(unread) : l.notifAllRead,
        onReadAll: unread > 0 ? () => _markAll(list) : null,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(children: [
          for (final f in _Filter.values) ...[
            if (f != _Filter.all) const SizedBox(width: 8),
            Semantics(
              selected: f == _filter,
              child: PqChip(
                selectedWeight: FontWeight.w600,
                weight: FontWeight.w600,
                label: label(f),
                selected: f == _filter,
                onTap: () => setState(() => _filter = f),
              ),
            ),
          ],
        ]),
      ),
      if (rows.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Text(l.notifCategoryEmpty,
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w400, c: pq.textMuted)),
        ),
      for (final (name, items) in groups)
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          if (name.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(name.toUpperCase(), style: PqText.overline(c: pq.textMuted)),
            ),
            const SizedBox(height: 10),
          ],
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _NotifRow(
              key: ValueKey(items[i].id),
              n: items[i],
              cat: _catOf(items[i]),
              unread: _isUnread(items[i]),
              onTap: () => _markRead(items[i]),
              onAction: items[i].link == null ? null : () => _open(items[i]),
            ),
          ],
        ]),
    ];

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      itemCount: sections.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (_, i) => PqAnimate(
        delay: PqMotion.staggerDelay(i, maxIndex: 4),
        child: sections[i],
      ),
    );
  }
}

class _NotifRow extends StatelessWidget {
  const _NotifRow({
    super.key,
    required this.n,
    required this.cat,
    required this.unread,
    required this.onTap,
    required this.onAction,
  });

  final AppNotification n;
  final _Cat cat;
  final bool unread;
  final VoidCallback onTap;
  final VoidCallback? onAction;

  /// Фон непрочитанного: в токенах нет — разный в темах (#16203a / #eef2ff).
  static Color _unreadBg(PqColors pq) =>
      pq.isDark ? const Color(0xFF16203A) : const Color(0xFFEEF2FF);

  /// Ваучер — красная плитка (одинаковая в обеих темах).
  static const _walletBg = Color(0xFFE53935);

  Widget _tile(PqColors pq) {
    final (icon, bg, fg) = switch (cat) {
      _Cat.wallet => (PqIcons.gift, _walletBg, Colors.white),
      _Cat.quest => (PqIcons.trophy, pq.successSoft, pq.success),
      _Cat.coin => (PqIcons.coin, pq.accentSoft, pq.accentText),
      _Cat.warn => (PqIcons.alertTriangle, pq.dangerSoft, pq.danger),
      _Cat.book => (PqIcons.bookOpen, pq.warningSoft, pq.warning),
      _Cat.other => (PqIcons.bell, pq.surfaceAlt, pq.textSecondary),
    };
    return PqIconTile(icon, size: 44, radius: 14, background: bg, foreground: fg);
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = DateTime.tryParse(n.createdAt);
    final local = d?.toLocal();
    // Дата без времени (полночь) — только «дд.мм», как в макете.
    final time = local == null
        ? n.createdAt
        : (local.hour == 0 && local.minute == 0 ? _dm.format(local) : _dt.format(local));

    final card = PqPressable(
      onTap: onTap,
      semanticLabel: n.title,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: unread ? _unreadBg(pq) : pq.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: unread ? pq.accent : pq.border),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _tile(pq),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                if (unread) ...[
                  Semantics(
                    label: l.notifNewAria,
                    child: PqDotPulse(
                      delay: const Duration(milliseconds: 600),
                      repeat: 2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(color: pq.accent, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: PqText.text(16, unread ? FontWeight.w700 : FontWeight.w500, c: pq.text),
                    child: Text(n.title),
                  ),
                ),
                const SizedBox(width: 8),
                Text(time, style: PqText.caption(c: pq.textMuted)),
              ]),
              const SizedBox(height: 4),
              Text(n.body, style: PqText.body(c: pq.textSecondary)),
              if (onAction != null) ...[
                const SizedBox(height: 4 + 6),
                PqPillButton(
                  label: switch (cat) {
                    _Cat.wallet => l.notifActionQr,
                    _Cat.warn => l.notifActionRetake,
                    _ => l.notifOpen,
                  },
                  height: 36,
                  onPressed: onAction,
                ),
              ],
            ]),
          ),
        ]),
      ),
    );

    if (!unread) return card;
    // Свайп влево — отметить прочитанным (карточка остаётся на месте).
    return Dismissible(
      key: ValueKey('swipe-${n.id}'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        onTap();
        return false;
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: pq.accentSoft,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          PqIcon(PqIcons.checkCheck, size: 18, color: pq.accentText),
          const SizedBox(width: 6),
          Text(l.notifMarkedRead, style: PqText.link(c: pq.accentText)),
        ]),
      ),
      child: card,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/models/common.dart';
import '../../core/models/quest.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

final _dm = DateFormat('dd.MM');
final _dmy = DateFormat('dd.MM.yyyy');

String _period(Quest q) {
  final s = q.startDate == null ? null : DateTime.tryParse(q.startDate!);
  final e = q.endDate == null ? null : DateTime.tryParse(q.endDate!);
  if (s != null && e != null) return '${_dm.format(s)} — ${_dmy.format(e)}';
  if (e != null) return 'до ${_dmy.format(e)}';
  if (s != null) return 'с ${_dmy.format(s)}';
  return 'Без срока';
}

enum _Tab { active, archive, all }

/// Список квестов фармацевта. Перенесён один в один из макета Figma
/// «quests-list-active».
class QuestsScreen extends ConsumerStatefulWidget {
  const QuestsScreen({super.key});

  @override
  ConsumerState<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends ConsumerState<QuestsScreen> {
  _Tab _tab = _Tab.active;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final c = _Q.of(context);
    // Цель квестов зависит от активной роли: врач — рецепты, иначе — чеки.
    final role = ref.watch(authControllerProvider).asData?.value.activeRole;
    final target =
        role == Role.doctor ? QuestTarget.recipes : QuestTarget.checks;
    final all =
        ref.watch(questsListProvider(target)).asData?.value ?? const <Quest>[];

    final byTab = switch (_tab) {
      _Tab.active => all.where((q) => q.status == QuestStatus.active),
      _Tab.archive => all.where((q) => q.status == QuestStatus.disabled),
      _Tab.all => all,
    };
    final q = _query.trim().toLowerCase();
    final list = byTab
        .where((e) => q.isEmpty || e.name.toLowerCase().contains(q))
        .toList();

    return Scaffold(
      backgroundColor: c.page,
      body: Stack(children: [Positioned.fill(child: ScreenDecor(questsDecor)), Column(
        children: [
          const PharmTopBar(),
          // заголовок + «История участия»
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Квесты',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: c.text)),
                _HistoryChip(c: c, onTap: () => context.push('/app/quests/history')),
              ],
            ),
          ),
          // поиск
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _SearchField(c: c, onChanged: (v) => setState(() => _query = v)),
          ),
          // табы
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                for (final (t, label) in const [
                  (_Tab.active, 'Активные'),
                  (_Tab.archive, 'Архив'),
                  (_Tab.all, 'Все'),
                ]) ...[
                  _TabChip(
                    c: c,
                    label: label,
                    selected: _tab == t,
                    onTap: () => setState(() => _tab = t),
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          // список
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async =>
                  ref.invalidate(questsListProvider(target)),
              child: list.isEmpty
                  ? _EmptyState(c: c, tab: _tab, onGoActive: () => setState(() => _tab = _Tab.active))
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        // Счётчик — над списком, а не между карточками.
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(_countLabel(list.length),
                              style: TextStyle(fontSize: 12, color: c.muted)),
                        ),
                        for (var i = 0; i < list.length; i++) ...[
                          _QuestCard(
                            c: c,
                            quest: list[i],
                            onTap: () => context.push('/app/quests/${list[i].id}'),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ],
                    ),
            ),
          ),
        ],
      )]),
    );
  }

  String _countLabel(int n) {
    final word = switch (_tab) {
      _Tab.active => 'активных',
      _Tab.archive => 'архивных',
      _Tab.all => '',
    };
    final tail = n % 10 == 1 && n % 100 != 11 ? 'квест' : 'квеста';
    return '$n ${word.isEmpty ? '' : '$word '}$tail'.replaceAll('  ', ' ');
  }
}

// ── Верхние элементы ────────────────────────────────────────────────────

class _HistoryChip extends StatelessWidget {
  const _HistoryChip({required this.c, required this.onTap});
  final _Q c;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: c.chipBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: c.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.history, size: 16, color: c.muted),
            const SizedBox(width: 6),
            Text('История участия',
                style: TextStyle(fontSize: 13, color: c.muted)),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.c, required this.onChanged});
  final _Q c;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(Icons.search, size: 20, color: c.muted),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: TextStyle(fontSize: 16, color: c.text),
              decoration: InputDecoration(
                isCollapsed: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: 'Поиск',
                hintStyle: TextStyle(fontSize: 16, color: c.muted),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.c,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final _Q c;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Светлая тема: выбранный таб — сплошной синий (#2563EB), текст белый.
    // Тёмная тема: янтарная рамка и янтарный текст.
    final filledLight = selected && !isDark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 32,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: filledLight ? const Color(0xFF2563EB) : c.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: selected && isDark
                  ? const Color(0xFFF59E0B)
                  : filledLight
                      ? const Color(0xFF2563EB)
                      : c.border),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: filledLight
                    ? Colors.white
                    : selected
                        ? const Color(0xFFF59E0B)
                        : c.tabInactive)),
      ),
    );
  }
}

// ── Карточка квеста ─────────────────────────────────────────────────────

class _QuestCard extends ConsumerWidget {
  const _QuestCard({required this.c, required this.quest, required this.onTap});
  final _Q c;
  final Quest quest;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVoucher = quest.rewardType == RewardType.voucher;
    final pct = (quest.progress.clamp(0, 1) * 100).round();

    // Деталь квеста — чтобы показать цель покупок и упаковки прямо на карточке
    // (в списочном ответе их нет; кэшируется, повторный заход в квест — мгновенно).
    final detail = ref.watch(questDetailProvider(quest.id)).asData?.value;
    final goal = detail?.goal ??
        (quest.progress > 0
            ? (quest.completedCount / quest.progress).round()
            : null);
    final packsText = (detail == null || detail.mechanics.isEmpty)
        ? null
        : detail.mechanics.map((m) => '${m.drug} × ${m.qty} уп.').join(', ');

    // Сумма/магазин лежат в описании ("🛒 Korzinka — 100 000"), а не в prizeIqc.
    final descClean =
        quest.description.replaceFirst(RegExp(r'^\s*🛒\s*'), '').trim();
    final rewardLine = isVoucher
        ? (descClean.isNotEmpty ? descClean : 'Korzinka')
        : '+${quest.prizeIqc} IQC · без лимита';

    return Material(
      color: c.card,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(quest.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: c.text)),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isVoucher
                          ? const Color(0xFFF59E0B)
                          : const Color(0xFF7C3AED),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      isVoucher ? 'Ваучер' : 'IQC',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isVoucher ? const Color(0xFF1C1B1F) : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 14, color: c.muted),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(rewardLine,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: c.muted)),
                  ),
                ],
              ),
              if (packsText != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.inventory_2_outlined, size: 14, color: c.muted),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(packsText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13, color: c.muted)),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 14, color: c.muted),
                      const SizedBox(width: 8),
                      Text(_period(quest),
                          style: TextStyle(fontSize: 12, color: c.muted)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                            color: Color(0xFF22C55E), shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        quest.status == QuestStatus.active
                            ? 'Активен'
                            : 'Завершён',
                        style: TextStyle(
                            fontSize: 11,
                            color: quest.status == QuestStatus.active
                                ? const Color(0xFF22C55E)
                                : c.muted),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  height: 4,
                  color: c.track,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: quest.progress.clamp(0, 1).toDouble(),
                      child: Container(color: const Color(0xFFF59E0B)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    goal != null
                        ? '${quest.completedCount} / $goal покупок'
                        : '${quest.completedCount} покупок',
                    style: TextStyle(fontSize: 11, color: c.muted),
                  ),
                  Text('$pct%',
                      style: TextStyle(fontSize: 11, color: c.muted)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Пустое состояние ────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.c, required this.tab, required this.onGoActive});
  final _Q c;
  final _Tab tab;
  final VoidCallback onGoActive;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final (title, sub) = switch (tab) {
      _Tab.archive => ('Нет архивных квестов', 'Завершённые квесты появятся здесь'),
      _Tab.active => ('Нет активных квестов', 'Новые квесты появятся здесь'),
      _Tab.all => ('Квестов нет', 'Загляните позже'),
    };
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: c.border),
            ),
            child: Column(
              children: [
                Icon(Icons.track_changes, size: 48, color: c.muted),
                const SizedBox(height: 16),
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: c.text)),
                const SizedBox(height: 4),
                Text(sub,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: c.muted)),
                if (tab == _Tab.archive) ...[
                  const SizedBox(height: 20),
                  // Светлая тема: сплошная синяя кнопка. Тёмная: фиолетовый контур.
                  isDark
                      ? OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF7C3AED),
                            side: const BorderSide(color: Color(0xFF7C3AED)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onPressed: onGoActive,
                          child: const Text('Смотреть активные'),
                        )
                      : FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          onPressed: onGoActive,
                          child: const Text('Смотреть активные'),
                        ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Палитра ─────────────────────────────────────────────────────────────

class _Q {
  const _Q({
    required this.page,
    required this.card,
    required this.border,
    required this.chipBg,
    required this.text,
    required this.muted,
    required this.tabInactive,
    required this.track,
  });

  final Color page;
  final Color card;
  final Color border;
  final Color chipBg;
  final Color text;
  final Color muted;
  final Color tabInactive;
  final Color track;

  static _Q of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _Q(
    page: Color(0xFF0D1117),
    card: Color(0xFF151B2A),
    border: Color(0x1FFFFFFF),
    chipBg: Color(0x14FFFFFF),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF6B7280),
    tabInactive: Color(0xFF9C99A6),
    track: Color(0x14FFFFFF),
  );

  static const _light = _Q(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    border: Color(0xFFEBEDF0),
    chipBg: Color(0xFFF2F4F7),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    tabInactive: Color(0xFF9CA3AF),
    track: Color(0xFFEBEDF0),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/quest.dart';
import '../../shared/providers.dart';
import '../../shared/quest_history/quests_done_view.dart';
import '../providers.dart';
import 'quest_card.dart';
import 'quest_ui.dart';

/// Поиск по квестам (макет QuestSearch): поле в фокусе с кнопкой «Очистить»
/// и «Отмена», «Найдено N квестов», секции «Активные» / «Завершённые» с
/// подсветкой совпадения, «Часто ищут».
class QuestSearchScreen extends ConsumerStatefulWidget {
  const QuestSearchScreen({super.key});

  @override
  ConsumerState<QuestSearchScreen> createState() => _QuestSearchScreenState();
}

class _QuestSearchScreenState extends ConsumerState<QuestSearchScreen> {
  final _controller = TextEditingController();
  final _focus = FocusNode();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text != _query) setState(() => _query = _controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _setQuery(String v) {
    _controller.value = TextEditingValue(
      text: v,
      selection: TextSelection.collapsed(offset: v.length),
    );
    _focus.requestFocus();
  }

  bool _matches(String q, List<String?> fields) =>
      fields.any((f) => f != null && f.toLowerCase().contains(q));

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final target = watchQuestTarget(ref);
    final all =
        ref.watch(questsListProvider(target)).asData?.value ?? const <Quest>[];
    final parts =
        ref.watch(questParticipationsProvider).asData?.value ??
        const <QuestParticipation>[];
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;

    final q = _query.trim().toLowerCase();
    final active =
        q.isEmpty
            ? const <Quest>[]
            : all
                .where(
                  (e) =>
                      e.status == QuestStatus.active &&
                      _matches(q, [e.name, e.drug, e.brand]),
                )
                .toList();
    final done =
        q.isEmpty
            ? const <QuestDoneItem>[]
            : QuestDoneItem.build(
              parts,
              all,
            ).where((e) => e.name.toLowerCase().contains(q)).toList();

    // «Часто ищут»: препараты из квестов (отдельной статистики запросов нет).
    final seen = <String>{};
    final popular = <String>[];
    for (final e in all) {
      final drug = e.drug?.trim() ?? '';
      final s = drug.isNotEmpty ? drug : e.name.trim().split(' ').first;
      // Уже набранное в подсказки не повторяем.
      if (q.isNotEmpty && s.toLowerCase().contains(q)) continue;
      if (s.isNotEmpty && seen.add(s.toLowerCase())) popular.add(s);
      if (popular.length == 6) break;
    }

    final blocks = <Widget>[
      Text(l.questsTitle, style: PqText.display(c: pq.text)),
      Row(
        children: [
          Expanded(
            child: _SearchField(
              controller: _controller,
              focus: _focus,
              onClear: () => _setQuery(''),
            ),
          ),
          const SizedBox(width: 12),
          PqPressable(
            onTap:
                () =>
                    context.canPop()
                        ? context.pop()
                        : context.go('/app/quests'),
            semanticLabel: l.commonCancel,
            child: SizedBox(
              height: 44,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    l.commonCancel,
                    style: PqText.text(15, FontWeight.w600, c: pq.accent),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      if (q.isNotEmpty && (active.isNotEmpty || done.isNotEmpty))
        Text(
          l.questsFound(active.length + done.length),
          style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
        ),
      if (q.isNotEmpty && active.isEmpty && done.isEmpty)
        PqEmptyState(
          icon: PqIcons.search,
          title: l.questsNothingFound,
          message: l.questsNothingFoundSub,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        ),
      if (active.isNotEmpty)
        _Section(
          title: l.questsTabActive,
          children: [
            for (final e in active)
              QuestSearchCard(
                quest: e,
                query: q,
                onTap: () => context.push('/app/quests/${e.id}'),
              ),
          ],
        ),
      if (done.isNotEmpty)
        _Section(
          title: l.questsTabDone,
          children: [
            PqListCard(
              children: [
                for (final e in done)
                  QuestDoneSearchRow(
                    item: e,
                    query: q,
                    onTap: () => context.push('/app/quests/${e.questId}'),
                  ),
              ],
            ),
          ],
        ),
      if (popular.isNotEmpty)
        _Section(
          title: l.questsPopular,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final s in popular)
                  _PopularChip(label: s, onTap: () => _setQuery(s)),
              ],
            ),
          ],
        ),
    ];

    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTabHeader(
            onBell: () => context.go('/app/notifications'),
            bellLabel: l.notifTitle,
            unread: unread > 0,
          ),
          Expanded(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
              children: [
                for (var i = 0; i < blocks.length; i++) ...[
                  if (i > 0) const SizedBox(height: 16),
                  PqAnimate(
                    // Экран поиска: каскад как на экранах входа (до .2s).
                    delay: PqMotion.staggerDelay(i, maxIndex: 4),
                    child: blocks[i],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Поле поиска 48: рамка 2 акцентом в фокусе, иконка лупы, «Очистить» 36.
class _SearchField extends StatefulWidget {
  const _SearchField({
    required this.controller,
    required this.focus,
    required this.onClear,
  });

  final TextEditingController controller;
  final FocusNode focus;
  final VoidCallback onClear;

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  @override
  void initState() {
    super.initState();
    widget.focus.addListener(_rebuild);
    widget.controller.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    widget.focus.removeListener(_rebuild);
    widget.controller.removeListener(_rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final focused = widget.focus.hasFocus;
    final bw = focused ? 2.0 : 1.0;
    final hasText = widget.controller.text.isNotEmpty;
    return Semantics(
      textField: true,
      label: l.questsSearchLabel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 48,
        padding: EdgeInsets.fromLTRB(14 - (bw - 1), 0, 6 - (bw - 1), 0),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: focused ? pq.accent : pq.border, width: bw),
        ),
        child: Row(
          children: [
            PqIcon(PqIcons.search, size: 20, color: pq.textMuted),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focus,
                autofocus: true,
                textInputAction: TextInputAction.search,
                cursorColor: pq.accent,
                cursorWidth: 2,
                cursorHeight: 20,
                style: PqText.field(c: pq.text),
                decoration: InputDecoration(
                  isDense: true,
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: l.questsSearchPlaceholder,
                  hintStyle: PqText.field(c: pq.textMuted),
                ),
              ),
            ),
            const SizedBox(width: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder:
                  (c, a) => ScaleTransition(
                    scale: CurvedAnimation(parent: a, curve: PqMotion.ease),
                    child: FadeTransition(opacity: a, child: c),
                  ),
              child:
                  !hasText
                      ? const SizedBox(
                        key: ValueKey('none'),
                        width: 36,
                        height: 36,
                      )
                      : PqPressable(
                        key: const ValueKey('clear'),
                        onTap: widget.onClear,
                        semanticLabel: l.questsSearchClear,
                        scale: .94,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: pq.surfaceAlt,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: PqIcon(
                            PqIcons.x,
                            size: 16,
                            color: pq.textMuted,
                          ),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      PqSectionHeader(title),
      for (final c in children) ...[const SizedBox(height: 8), c],
    ],
  );
}

/// Подсказка запроса: капсула 36 с лупой.
class _PopularChip extends StatelessWidget {
  const _PopularChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      scale: .96,
      semanticLabel: label,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: pq.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PqIcon(PqIcons.search, size: 14, color: pq.textSecondary),
            const SizedBox(width: 6),
            Text(
              label,
              style: PqText.text(14, FontWeight.w400, c: pq.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

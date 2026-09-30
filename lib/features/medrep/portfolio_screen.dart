import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// Активным считаем фармацевта, у которого есть хотя бы один чек
/// (в модели нет отдельного статуса).
bool isActivePharmacist(PortfolioPharmacist p) => p.checks > 0;

/// Фиолетовый текст «2 квеста» (тёмная/светлая).
Color medQuestColor(PqColors pq) =>
    pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);

/// Экран «Фармацевты» (макеты MedPharmacists / MedSearchEmpty).
class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

enum _Tab { all, active, passive }

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  final _search = TextEditingController();
  String _query = '';
  _Tab _tab = _Tab.all;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final list = ref.watch(portfolioProvider);
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTabHeader(
          onBell: () => context.go('/app/notifications'),
          bellLabel: l.notifTitle,
          unread: unread > 0,
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(portfolioProvider);
              await ref.read(portfolioProvider.future).catchError((_) => <PortfolioPharmacist>[]);
            },
            child: PqAsync<List<PortfolioPharmacist>>(
              value: list,
              onRetry: () => ref.invalidate(portfolioProvider),
              data: (items) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
                child: _body(context, items),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, List<PortfolioPharmacist> items) {
    final pq = context.pq;
    final l = context.l10n;
    final active = items.where(isActivePharmacist).length;
    final q = _query.trim().toLowerCase();
    var filtered = switch (_tab) {
      _Tab.all => items,
      _Tab.active => items.where(isActivePharmacist).toList(),
      _Tab.passive => items.where((p) => !isActivePharmacist(p)).toList(),
    };
    if (q.isNotEmpty) {
      filtered = filtered
          .where((p) =>
              p.name.toLowerCase().contains(q) ||
              p.shop.toLowerCase().contains(q) ||
              p.city.toLowerCase().contains(q))
          .toList();
    }
    final searchEmpty = q.isNotEmpty && filtered.isEmpty;

    Widget content;
    if (items.isEmpty) {
      content = MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.users,
          background: pq.accentSoft,
          foreground: pq.accentText,
        ),
        title: l.medrepEmptyTitle,
        message: l.medrepEmptyText,
      );
    } else if (searchEmpty) {
      content = MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.search,
          size: 80,
          radius: 24,
          iconSize: 34,
          background: pq.surface,
          foreground: pq.accentText,
          borderColor: pq.border,
        ),
        title: l.medrepNotFoundTitle,
        message: l.medrepNotFoundText(_query.trim()),
        action: MedOutlineButton(
          label: l.medrepResetSearch,
          icon: PqIcons.x,
          onTap: () {
            _search.clear();
            setState(() => _query = '');
          },
        ),
      );
    } else if (filtered.isEmpty) {
      content = MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.users,
          size: 80,
          radius: 24,
          iconSize: 34,
          background: pq.surface,
          foreground: pq.accentText,
          borderColor: pq.border,
        ),
        title: l.portfolioNotFound,
      );
    } else {
      content = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        for (var i = 0; i < filtered.length; i++) ...[
          if (i > 0) const SizedBox(height: 10),
          _PharmacistCard(pharmacist: filtered[i]),
        ],
      ]);
    }

    return PqStagger(gap: 16, children: [
      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(
          child: PqPageTitle(l.portfolioTitle,
              subtitle: l.portfolioInPortfolio(items.length)),
        ),
        if (!searchEmpty && items.isNotEmpty) ...[
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              PqBreath(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration:
                      BoxDecoration(color: pq.success, shape: BoxShape.circle),
                ),
              ),
              const SizedBox(width: 6),
              Text(l.medrepUpdatedNow, style: PqText.caption(c: pq.textMuted)),
            ]),
          ),
        ],
      ]),
      if (items.isNotEmpty)
        MedSearchField(
          controller: _search,
          hint: l.medrepSearchHint,
          onChanged: (v) => setState(() => _query = v),
        ),
      if (items.isNotEmpty && !searchEmpty)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(children: [
            _CountChip(
              label: l.medrepFilterAll,
              count: items.length,
              selected: _tab == _Tab.all,
              onTap: () => setState(() => _tab = _Tab.all),
            ),
            const SizedBox(width: 8),
            _CountChip(
              label: l.medrepFilterActive,
              count: active,
              selected: _tab == _Tab.active,
              onTap: () => setState(() => _tab = _Tab.active),
            ),
            const SizedBox(width: 8),
            _CountChip(
              label: l.medrepFilterPassive,
              count: items.length - active,
              selected: _tab == _Tab.passive,
              onTap: () => setState(() => _tab = _Tab.passive),
            ),
          ]),
        ),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: PqMotion.ease,
        child: KeyedSubtree(
          key: ValueKey('${_tab.name}|$searchEmpty|${filtered.isEmpty}'),
          child: content,
        ),
      ),
    ]);
  }
}

/// Чип-фильтр 40 со счётчиком (opacity .7).
class _CountChip extends StatelessWidget {
  const _CountChip({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final fg = selected ? pq.chipActiveText : pq.textSecondary;
    return Semantics(
      selected: selected,
      button: true,
      child: PqPressable(
        onTap: onTap,
        scale: .96,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: selected ? pq.chipActiveBg : pq.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: selected ? pq.chipActiveBg : pq.border),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(label,
                style: PqText.text(14, selected ? FontWeight.w700 : FontWeight.w500,
                    c: fg)),
            const SizedBox(width: 6),
            Opacity(
              opacity: .7,
              child: Text('$count',
                  style: PqText.text(14, selected ? FontWeight.w700 : FontWeight.w500,
                      c: fg)),
            ),
          ]),
        ),
      ),
    );
  }
}

/// Карточка фармацевта: аватар 48 · имя, аптека, статус · чеки и квесты.
class _PharmacistCard extends StatelessWidget {
  const _PharmacistCard({required this.pharmacist});

  final PortfolioPharmacist pharmacist;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final p = pharmacist;
    final active = isActivePharmacist(p);
    final statusColor = active ? pq.success : pq.textMuted;
    final card = PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      onTap: () => context.push('/app/portfolio/${p.telegramId}'),
      child: Row(children: [
        MedAvatar(p.name, size: 48, seed: p.telegramId, colors: active ? null : kMedMutedGradient),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(p.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.heading(16, FontWeight.w700, c: pq.text)),
            const SizedBox(height: 2),
            Text([p.shop, p.city].where((s) => s.isNotEmpty).join(' · '),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.caption(c: pq.textMuted)),
            const SizedBox(height: 2),
            Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
              ),
              const SizedBox(width: 4),
              Text(active ? l.pharmDetailActive : l.pharmDetailPassive,
                  style: PqText.caption(c: statusColor)),
            ]),
          ]),
        ),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('${p.checks}',
              style: PqText.heading(20, FontWeight.w800, height: 1.1, c: pq.text)),
          const SizedBox(height: 2),
          Text(l.medrepUnitChecks(p.checks), style: PqText.caption(c: pq.textMuted)),
          const SizedBox(height: 2),
          Text(l.medrepCountQuests(p.quests),
              style: PqText.caption(
                  w: FontWeight.w600,
                  c: p.quests > 0 ? medQuestColor(pq) : pq.textMuted)),
        ]),
      ]),
    );
    return active ? card : Opacity(opacity: .78, child: card);
  }
}

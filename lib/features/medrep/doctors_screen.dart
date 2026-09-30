import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// Экран «Врачи» медпреда. Временное решение, пока нет прямой связки
/// «медпред → врач»: показывает всех врачей рецептурного проекта компании
/// медпреда (медпред Бионорики видит только врачей Бионорики), по регионам,
/// со статусом выполнения рецептурного квеста.
///
/// В макетах 1.2 экрана нет — оформлен на компонентах дизайн-системы в языке
/// экранов медпреда (MedPharmacists / MedQuestDetail).
class DoctorsScreen extends ConsumerStatefulWidget {
  const DoctorsScreen({super.key});

  @override
  ConsumerState<DoctorsScreen> createState() => _DoctorsScreenState();
}

/// Статус врача по выбранному квесту.
enum _Status { completed, inProgress, idle }

_Status _statusOf(DoctorRow d) => d.done > 0
    ? _Status.completed
    : (d.collected > 0 ? _Status.inProgress : _Status.idle);

PqTone _toneOf(_Status s) => switch (s) {
      _Status.completed => PqTone.success,
      _Status.inProgress => PqTone.warning,
      _Status.idle => PqTone.neutral,
    };

/// 15.0 → «15», 2.5 → «2.5».
String _n(double v) =>
    v == v.roundToDouble() ? v.toInt().toString() : v.toStringAsFixed(1);

/// Бэкенд отдаёт этот ярлык для пустого города — переводим на язык UI.
const _backendUnknownRegion = 'Регион не указан';

class _DoctorsScreenState extends ConsumerState<DoctorsScreen> {
  int? _questId; // null — квест по умолчанию (ближайший к завершению)
  final _search = TextEditingController();
  String _query = '';
  _Status? _filter; // null — все
  final _collapsed = <String>{};

  /// Последние данные — показываем их, пока грузится другой квест.
  DoctorsOverview? _last;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = doctorsProvider(_questId);
    final value = ref.watch(provider);
    final data = value.asData?.value ?? (value.isLoading ? _last : null);
    if (data != null) _last = data;

    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.doctorsTitle,
          backLabel: l.navPortfolio,
          onBack: () => medBack(context),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(provider);
              await ref.read(provider.future).then((_) {}, onError: (_) {});
            },
            child: data == null
                ? PqAsync<DoctorsOverview>(
                    value: value,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    onRetry: () => ref.invalidate(provider),
                    data: (_) => const SizedBox.shrink(),
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                    child: _body(context, data, loading: value.isLoading),
                  ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, DoctorsOverview o, {required bool loading}) {
    final pq = context.pq;
    final l = context.l10n;
    final company = o.companyName;
    final title = PqPageTitle(
      l.doctorsTitle,
      subtitle: company == null || company.isEmpty
          ? l.doctorsHint
          : '${l.doctorsHint} · $company',
    );

    Widget emptyBlock(String title, String? message) => MedEmptyBlock(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          tile: MedPopTile(
            icon: PqIcons.stethoscope,
            background: pq.accentSoft,
            foreground: pq.accentText,
          ),
          title: title,
          message: message,
        );

    if (!o.available) {
      return PqStagger(gap: 16, children: [
        title,
        emptyBlock(l.doctorsEmpty, l.doctorsUnavailable),
      ]);
    }
    if (o.totals.doctors == 0) {
      return PqStagger(gap: 16, children: [title, emptyBlock(l.doctorsEmpty, null)]);
    }

    final quest = o.quests.where((q) => q.id == o.questId).firstOrNull;
    final q = _query.trim().toLowerCase();

    final regions = <Widget>[];
    for (final g in o.regions) {
      final items = g.items.where((d) {
        if (_filter != null && _statusOf(d) != _filter) return false;
        if (q.isEmpty) return true;
        return d.name.toLowerCase().contains(q) ||
            d.workplace.toLowerCase().contains(q) ||
            d.city.toLowerCase().contains(q) ||
            g.region.toLowerCase().contains(q);
      }).toList();
      if (items.isEmpty) continue;
      final region =
          g.region == _backendUnknownRegion ? l.doctorsRegionUnknown : g.region;
      final collapsed = _collapsed.contains(g.region);
      regions.add(Column(
        key: ValueKey(g.region),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _RegionHeader(
            title: region,
            summary: l.doctorsRegionSummary(g.doctors, g.completed),
            collapsed: collapsed,
            onTap: () => setState(() => collapsed
                ? _collapsed.remove(g.region)
                : _collapsed.add(g.region)),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: PqMotion.ease,
            alignment: Alignment.topCenter,
            child: collapsed
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: PqListCard(children: [
                      for (final d in items)
                        _DoctorRow(doctor: d, hasQuest: quest != null),
                    ]),
                  ),
          ),
        ],
      ));
    }

    return PqStagger(gap: 16, children: [
      title,
      if (o.quests.length > 1)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(children: [
            for (final (i, qq) in o.quests.indexed) ...[
              if (i > 0) const SizedBox(width: 8),
              PqChip(
                label: qq.name,
                selected: qq.id == o.questId,
                onTap: () => setState(() => _questId = qq.id),
              ),
            ],
          ]),
        ),
      AnimatedOpacity(
        opacity: loading ? .6 : 1,
        duration: const Duration(milliseconds: 200),
        child: _QuestCard(quest: quest),
      ),
      _Summary(
        totals: o.totals,
        filter: _filter,
        onFilter: (s) => setState(() => _filter = _filter == s ? null : s),
      ),
      MedSearchField(
        controller: _search,
        hint: l.doctorsSearchHint,
        onChanged: (v) => setState(() => _query = v),
      ),
      if (regions.isEmpty)
        MedEmptyBlock(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          tile: MedPopTile(
            icon: PqIcons.search,
            size: 80,
            radius: 24,
            iconSize: 34,
            background: pq.surface,
            foreground: pq.accentText,
            borderColor: pq.border,
          ),
          title: l.doctorsNotFound,
          action: q.isEmpty && _filter == null
              ? null
              : MedOutlineButton(
                  label: l.medrepResetSearch,
                  icon: PqIcons.x,
                  onTap: () {
                    _search.clear();
                    setState(() {
                      _query = '';
                      _filter = null;
                    });
                  },
                ),
        )
      else
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (var i = 0; i < regions.length; i++) ...[
            if (i > 0) const SizedBox(height: 20),
            regions[i],
          ],
        ]),
    ]);
  }
}

// ── Квест ───────────────────────────────────────────────────────────────

class _QuestCard extends StatelessWidget {
  const _QuestCard({required this.quest});

  final DoctorQuestInfo? quest;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final q = quest;
    return PqCard(
      child: Row(children: [
        const PqIconTile(PqIcons.target),
        const SizedBox(width: 14),
        Expanded(
          child: q == null
              ? Text(l.doctorsNoQuest, style: PqText.text(14, FontWeight.w400, c: pq.textMuted))
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(q.name, style: PqText.rowTitle(c: pq.text)),
                  const SizedBox(height: 3),
                  Text(
                    [
                      if (q.startDate != null && q.endDate != null)
                        '${medDayMonth(q.startDate!)} — ${medDayMonth(q.endDate!)}',
                      l.doctorsQuestGoal(_n(q.goal)),
                    ].join(' · '),
                    style: PqText.caption(c: pq.textMuted),
                  ),
                ]),
        ),
      ]),
    );
  }
}

// ── Сводка-фильтр ───────────────────────────────────────────────────────

class _Summary extends StatelessWidget {
  const _Summary({
    required this.totals,
    required this.filter,
    required this.onFilter,
  });

  final DoctorTotals totals;
  final _Status? filter;
  final ValueChanged<_Status> onFilter;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    Widget tile(int i, _Status s, String label, int value) => Expanded(
          child: PqAnimate(
            delay: Duration(milliseconds: 100 + 60 * i),
            child: _FilterTile(
              label: label,
              value: value,
              tone: _toneOf(s),
              selected: filter == s,
              onTap: () => onFilter(s),
            ),
          ),
        );
    return Row(children: [
      tile(0, _Status.completed, l.doctorsCompleted, totals.completed),
      const SizedBox(width: 8),
      tile(1, _Status.inProgress, l.doctorsInProgress, totals.inProgress),
      const SizedBox(width: 8),
      tile(2, _Status.idle, l.doctorsIdle, totals.idle),
    ]);
  }
}

class _FilterTile extends StatelessWidget {
  const _FilterTile({
    required this.label,
    required this.value,
    required this.tone,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int value;
  final PqTone tone;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final t = pq.tone(tone);
    final fg = tone == PqTone.neutral ? pq.text : t.fg;
    return Semantics(
      selected: selected,
      button: true,
      child: PqPressable(
        onTap: onTap,
        scale: .96,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          padding: EdgeInsets.all(selected ? 13 : 14),
          decoration: BoxDecoration(
            color: selected ? t.bg : pq.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: selected ? t.fg : pq.border, width: selected ? 2 : 1),
            boxShadow: pq.cardShadow,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$value', style: PqText.heading(22, FontWeight.w800, c: fg)),
            const SizedBox(height: 2),
            Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.caption(c: pq.textMuted)),
          ]),
        ),
      ),
    );
  }
}

// ── Регион ──────────────────────────────────────────────────────────────

class _RegionHeader extends StatelessWidget {
  const _RegionHeader({
    required this.title,
    required this.summary,
    required this.collapsed,
    required this.onTap,
  });

  final String title;
  final String summary;
  final bool collapsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 44),
        child: Row(children: [
          PqIcon(PqIcons.mapPin, size: 18, color: pq.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.heading(18, FontWeight.w600, c: pq.text)),
          ),
          const SizedBox(width: 8),
          Text(summary, style: PqText.caption(c: pq.textMuted)),
          const SizedBox(width: 4),
          AnimatedRotation(
            turns: collapsed ? 0 : .5,
            duration: const Duration(milliseconds: 200),
            curve: PqMotion.ease,
            child: PqIcon(PqIcons.chevronDown, size: 18, color: pq.textMuted),
          ),
        ]),
      ),
    );
  }
}

// ── Строка врача ────────────────────────────────────────────────────────

class _DoctorRow extends StatelessWidget {
  const _DoctorRow({required this.doctor, required this.hasQuest});

  final DoctorRow doctor;
  final bool hasQuest;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = doctor;
    final status = _statusOf(d);
    final tone = _toneOf(status);
    final label = switch (status) {
      _Status.completed => l.doctorsDoneTimes(d.done),
      _Status.inProgress => l.doctorsInProgress,
      _Status.idle => l.doctorsIdle,
    };
    final place = [d.workplace, d.city].where((s) => s.isNotEmpty).join(' · ');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          MedAvatar(d.name,
              colors: status == _Status.idle ? kMedMutedGradient : null),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(d.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.text(16, FontWeight.w600, c: pq.text)),
              if (place.isNotEmpty)
                Text(place,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.caption(c: pq.textMuted)),
            ]),
          ),
          if (hasQuest) ...[
            const SizedBox(width: 8),
            PqStatusBadge(label, tone: tone),
          ],
        ]),
        if (hasQuest) ...[
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
              child: PqProgressBar(
                // Выполненный квест — полная полоса: бэкенд обнуляет текущий
                // прогресс после выполнения, и без этого выполнивший врач
                // выглядел бы как «0 / 15».
                value: d.done > 0 ? 1.0 : d.progress.clamp(0.0, 1.0),
                height: 6,
                color: tone == PqTone.neutral ? pq.textMuted : pq.tone(tone).fg,
                trackColor: pq.surfaceAlt,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              d.done > 0
                  ? '${_n(d.goal)} / ${_n(d.goal)}'
                      '${d.collected > 0 ? ' +${_n(d.collected)}' : ''}'
                  : '${_n(d.collected)} / ${_n(d.goal)}',
              style: PqText.caption(c: pq.text, w: FontWeight.w600),
            ),
          ]),
        ],
        const SizedBox(height: 8),
        Text(l.doctorsRecipesCount(d.recipes),
            style: PqText.caption(c: pq.textMuted)),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// Тон и иконка статуса чека провизора.
({PqTone tone, PqIcons icon}) medCheckStatusStyle(CheckStatus s) => switch (s) {
      CheckStatus.approved => (tone: PqTone.success, icon: PqIcons.check),
      CheckStatus.rejected ||
      CheckStatus.aiWrong =>
        (tone: PqTone.danger, icon: PqIcons.alertTriangle),
      _ => (tone: PqTone.warning, icon: PqIcons.clock),
    };

/// Строка чека: плитка статуса · «Чек №…» + дата · упаковки + статус.
class MedCheckRow extends StatelessWidget {
  const MedCheckRow({super.key, required this.check});

  final RecentCheck check;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final st = medCheckStatusStyle(check.status);
    final label = check.status.label(l);
    return PqListRow(
      title: l.medrepCheckNo(check.id),
      subtitle: formatShortDateTime(check.createdAt),
      icon: st.icon,
      tone: st.tone,
      value: l.medrepPacksShort(check.packs),
      valueTone: st.tone,
      valueCaption: label.isEmpty
          ? label
          : label[0].toLowerCase() + label.substring(1),
    );
  }
}

enum _Filter { all, approved, rejected }

/// «Все чеки» провизора (макет MedPhChecks).
class MedrepPharmacistChecksScreen extends ConsumerStatefulWidget {
  const MedrepPharmacistChecksScreen({super.key, required this.telegramId});

  final int telegramId;

  @override
  ConsumerState<MedrepPharmacistChecksScreen> createState() =>
      _MedrepPharmacistChecksScreenState();
}

class _MedrepPharmacistChecksScreenState
    extends ConsumerState<MedrepPharmacistChecksScreen> {
  _Filter _filter = _Filter.all;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = pharmacistDetailProvider(widget.telegramId);
    final detail = ref.watch(provider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.medrepAllChecks,
          backLabel: l.pharmDetailBack,
          onBack: () => medBack(context, '/app/portfolio/${widget.telegramId}'),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(provider);
              await ref.read(provider.future).then((_) {}, onError: (_) {});
            },
            child: PqAsync<PharmacistDetail>(
              value: detail,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              onRetry: () => ref.invalidate(provider),
              data: (d) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                child: _body(context, d),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, PharmacistDetail d) {
    final pq = context.pq;
    final l = context.l10n;
    final checks = d.recentChecks.where((c) => switch (_filter) {
          _Filter.all => true,
          _Filter.approved => c.status == CheckStatus.approved,
          _Filter.rejected =>
            c.status == CheckStatus.rejected || c.status == CheckStatus.aiWrong,
        });

    // Группы: «Последние 7 дней», дальше — по месяцам.
    final groups = <String, List<RecentCheck>>{};
    final weekAgo = ref.watch(medrepNowProvider)().subtract(const Duration(days: 7));
    for (final c in checks) {
      final t = DateTime.tryParse(c.createdAt)?.toLocal();
      final key = t == null || t.isAfter(weekAgo)
          ? l.medrepLast7Days
          : l.medrepMonthYear('m${t.month}', '${t.year}');
      groups.putIfAbsent(key, () => []).add(c);
    }

    return PqStagger(gap: 16, children: [
      Row(children: [
        MedAvatar(d.name, size: 48, seed: d.telegramId),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(d.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.heading(20, FontWeight.w700, c: pq.text)),
            Text(
                '${l.medrepCountChecks(d.checks)} · '
                '${l.medrepCountPacks(d.approvedPacks)}',
                style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
          ]),
        ),
      ]),
      PqSegmented<_Filter>(
        values: _Filter.values,
        selected: _filter,
        labelOf: (f) => switch (f) {
          _Filter.all => l.medrepFilterAll,
          _Filter.approved => l.medrepFilterApproved,
          _Filter.rejected => l.medrepFilterRejected,
        },
        onChanged: (f) => setState(() => _filter = f),
      ),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: PqMotion.ease,
        child: KeyedSubtree(
          key: ValueKey(_filter),
          child: groups.isEmpty
              ? MedEmptyBlock(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                  tile: MedPopTile(
                    icon: PqIcons.receipt,
                    size: 80,
                    radius: 24,
                    iconSize: 34,
                    background: pq.surface,
                    foreground: pq.accentText,
                    borderColor: pq.border,
                  ),
                  title: l.pharmDetailNoChecks,
                )
              : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  for (final (i, e) in groups.entries.indexed) ...[
                    if (i > 0) const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                      child: Text(e.key.toUpperCase(),
                          style: PqText.overline(c: pq.textMuted)),
                    ),
                    const SizedBox(height: 8),
                    PqListCard(children: [
                      for (final c in e.value) MedCheckRow(check: c),
                    ]),
                  ],
                ]),
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'pharmacist_checks_screen.dart' show MedCheckRow;
import 'providers.dart';

/// Карточка фармацевта (макет MedPharmacist) + «Поощрить» (MedReward).
class MedrepPharmacistDetailScreen extends ConsumerWidget {
  const MedrepPharmacistDetailScreen({super.key, required this.telegramId});
  final int telegramId;

  Future<void> _incentivize(
      BuildContext context, WidgetRef ref, PharmacistDetail d) async {
    final l = context.l10n;
    final sent = await showPqSheet<bool>(
      context,
      scrollable: true,
      builder: (_) => _RewardSheet(
        detail: d,
        onSend: (rating, note) =>
            ref.read(apiProvider).medrep.incentivize(telegramId, rating, note),
      ),
    );
    if (sent == true && context.mounted) {
      showPqToast(context, l.pharmDetailSent, icon: PqIcons.star);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final provider = pharmacistDetailProvider(telegramId);
    final detail = ref.watch(provider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.medrepTeamTitle,
          backLabel: l.medrepTeamTitle,
          onBack: () => medBack(context, '/app/portfolio'),
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
              loading: PqLoadingKind.home,
              onRetry: () => ref.invalidate(provider),
              data: (d) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                child: _Body(
                  detail: d,
                  onIncentivize: () => _incentivize(context, ref, d),
                  onAllChecks: () =>
                      context.push('/app/portfolio/$telegramId/checks'),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.detail,
    required this.onIncentivize,
    required this.onAllChecks,
  });

  final PharmacistDetail detail;
  final VoidCallback onIncentivize;
  final VoidCallback onAllChecks;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = detail;
    final active = d.checks > 0;
    final muted = medHeroMuted(pq);
    final last = d.lastActivity.isEmpty ? '—' : medDayMonth(d.lastActivity);

    return PqStagger(gap: 24, children: [
      MedHeroCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            PqAnimate(
              fx: PqFx.pop,
              child: MedAvatar(d.name,
                  seed: d.telegramId,
                  size: 56, colors: active ? null : kMedMutedGradient),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(d.name,
                    style: PqText.heading(20, FontWeight.w700, c: Colors.white)),
                const SizedBox(height: 2),
                Text([d.shop, d.city].where((s) => s.isNotEmpty).join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.text(14, FontWeight.w400, c: muted)),
              ]),
            ),
          ]),
          const SizedBox(height: 18),
          Row(children: [
            Expanded(
              child: Text(l.medrepChecksAllTime.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.overline(c: muted)),
            ),
            const SizedBox(width: 8),
            MedHeroPill(
              active ? l.pharmDetailActive : l.pharmDetailPassive,
              dot: active ? const Color(0xFF4ADE80) : const Color(0x99FFFFFF),
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('${d.checks}', style: PqText.balance(c: Colors.white)),
              const SizedBox(width: 8),
              Text(l.medrepUnitChecks(d.checks),
                  style: PqText.heading(18, FontWeight.w700, c: muted)),
            ],
          ),
          const SizedBox(height: 18),
          MedHeroStats(items: [
            ('${d.approvedPacks}', l.medrepUnitPacks(d.approvedPacks)),
            ('${d.quests}', l.medrepUnitQuests(d.quests)),
            (last, l.medrepLastActivity),
          ]),
          const SizedBox(height: 18),
          MedAccentButton(
            label: l.pharmDetailIncentivize,
            icon: PqIcons.star,
            height: 54,
            radius: 16,
            fontSize: 16,
            iconSize: 20,
            iconGap: 10,
            background: pq.isDark ? pq.accent : Colors.white,
            foreground: pq.isDark ? pq.onAccent : pq.accentText,
            onTap: onIncentivize,
          ),
        ]),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PqSectionHeader(
          l.pharmDetailRecentChecks,
          count: d.checks,
          countTone: PqTone.success,
          actionLabel: d.recentChecks.isEmpty ? null : l.medrepAllChecks,
          onAction: onAllChecks,
        ),
        const SizedBox(height: 12),
        if (d.recentChecks.isEmpty)
          PqCard(
            padding: const EdgeInsets.all(20),
            child: Text(l.pharmDetailNoChecks,
                textAlign: TextAlign.center,
                style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
          )
        else
          PqListCard(children: [
            for (final c in d.recentChecks.take(3)) MedCheckRow(check: c),
          ]),
      ]),
    ]);
  }
}

// ── Поощрить (MedReward) ─────────────────────────────────────────────────

class _RewardSheet extends StatefulWidget {
  const _RewardSheet({required this.detail, required this.onSend});

  final PharmacistDetail detail;
  final Future<void> Function(int rating, String note) onSend;

  @override
  State<_RewardSheet> createState() => _RewardSheetState();
}

class _RewardSheetState extends State<_RewardSheet> {
  final _note = TextEditingController();
  int _rating = 5;
  bool _sending = false;

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    setState(() => _sending = true);
    try {
      await widget.onSend(_rating, _note.text.trim());
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _sending = false);
      showPqToast(context, context.l10n.stateServerErrorTitle,
          tone: PqTone.danger);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = widget.detail;
    final first = d.name.trim().split(RegExp(r'\s+')).first;
    final selectedBg = pq.isDark ? pq.accentSoft : const Color(0xFFEEF2FF);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        MedAvatar(d.name, size: 48, seed: d.telegramId),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(l.medrepRewardTitle(first),
                style: PqText.heading(20, FontWeight.w700, c: pq.text)),
            if (d.shop.isNotEmpty)
              Text(d.shop,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
          ]),
        ),
      ]),
      const SizedBox(height: 16),
      Text(l.medrepRewardRating, style: PqText.link(c: pq.textSecondary)),
      const SizedBox(height: 8),
      Row(children: [
        for (var r = 1; r <= 5; r++) ...[
          if (r > 1) const SizedBox(width: 8),
          Expanded(
            child: Semantics(
              inMutuallyExclusiveGroup: true,
              checked: r == _rating,
              label: l.medrepRewardStars(r),
              child: PqPressable(
                onTap: () => setState(() => _rating = r),
                scale: .96,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: PqMotion.ease,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: r == _rating ? selectedBg : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: r == _rating ? pq.accent : pq.border,
                      width: r == _rating ? 2 : 1,
                    ),
                  ),
                  child: Text('$r',
                      style: PqText.heading(18, FontWeight.w700, c: pq.text)),
                ),
              ),
            ),
          ),
        ],
      ]),
      const SizedBox(height: 16),
      Text.rich(
        TextSpan(children: [
          TextSpan(text: '${l.medrepRewardMessage} '),
          TextSpan(
            text: l.medrepOptional,
            style: PqText.text(14, FontWeight.w400, c: pq.textMuted),
          ),
        ]),
        style: PqText.link(c: pq.textSecondary),
      ),
      const SizedBox(height: 8),
      Container(
        constraints: const BoxConstraints(minHeight: 76),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: pq.fieldBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: pq.border),
        ),
        child: TextField(
          controller: _note,
          minLines: 2,
          maxLines: 4,
          maxLength: 500,
          buildCounter: (_, {required currentLength, required isFocused, maxLength}) =>
              null,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: pq.accent,
          style: PqText.field(c: pq.text),
          decoration: InputDecoration(
            isDense: true,
            filled: false,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hintText: l.medrepRewardHint,
            hintStyle: PqText.field(c: pq.textMuted),
          ),
        ),
      ),
      const SizedBox(height: 16),
      Row(children: [
        PqIcon(PqIcons.bell, size: 16, color: pq.textMuted),
        const SizedBox(width: 8),
        Expanded(
          child: Text(l.medrepRewardNotice, style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
        ),
      ]),
      const SizedBox(height: 16),
      PqButton(
        label: l.medrepRewardSend(_rating),
        icon: PqIcons.star,
        loading: _sending,
        onPressed: _send,
      ),
    ]);
  }
}

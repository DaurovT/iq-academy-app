import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// «Ожидают подтверждения» — заявки фармацевтов, которые ввели кодовое слово
/// в приложении или пришли из бота (макет MedPending).
class ReferralsScreen extends ConsumerStatefulWidget {
  const ReferralsScreen({super.key});

  @override
  ConsumerState<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends ConsumerState<ReferralsScreen> {
  /// id заявки → какое действие выполняется (true — принять).
  final _busy = <int, bool>{};

  Future<void> _act(PendingReferral r, bool accept) async {
    final l = context.l10n;
    final id = r.id;
    setState(() => _busy[id] = accept);
    try {
      final api = ref.read(apiProvider).medrep;
      accept
          ? await api.acceptReferral(id, kind: r.kind)
          : await api.rejectReferral(id, kind: r.kind);
      ref.invalidate(referralsProvider);
      if (accept) {
        ref.invalidate(portfolioProvider);
        ref.invalidate(medrepTeamProvider);
      }
      if (!mounted) return;
      showPqToast(
        context,
        accept ? l.referralsAccepted : l.referralsRejected,
        tone: accept ? PqTone.success : PqTone.neutral,
        icon: accept ? PqIcons.check : PqIcons.x,
      );
    } catch (e) {
      if (!mounted) return;
      showPqToast(
        context,
        isOfflineError(e) ? l.stateOfflineTitle : l.stateServerErrorTitle,
        tone: PqTone.danger,
      );
    } finally {
      if (mounted) setState(() => _busy.remove(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final list = ref.watch(referralsProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.medrepHomeMenuPending,
          backLabel: l.navPortfolio,
          onBack: () => medBack(context),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(referralsProvider);
              await ref.read(referralsProvider.future).then((_) {}, onError: (_) {});
            },
            child: PqAsync<List<PendingReferral>>(
              value: list,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              onRetry: () => ref.invalidate(referralsProvider),
              data: (items) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                child: _body(context, items),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, List<PendingReferral> items) {
    final pq = context.pq;
    final l = context.l10n;
    if (items.isEmpty) {
      return MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.userPlus,
          background: pq.accentSoft,
          foreground: pq.accentText,
        ),
        title: l.referralsEmpty,
        message: l.medrepPendingText,
      );
    }
    return PqStagger(gap: 14, children: [
      PqPageTitle(l.medrepCountPharm(items.length),
          subtitle: l.medrepPendingText),
      for (final r in items)
        _ReferralCard(
          key: ValueKey(r.id),
          referral: r,
          busy: _busy[r.id],
          onAccept: () => _act(r, true),
          onReject: () => _act(r, false),
          now: ref.watch(medrepNowProvider)(),
        ),
    ]);
  }
}

class _ReferralCard extends StatelessWidget {
  const _ReferralCard({
    super.key,
    required this.referral,
    required this.busy,
    required this.onAccept,
    required this.onReject,
    required this.now,
  });

  final DateTime now;
  final PendingReferral referral;

  /// null — свободна; true/false — идёт «принять»/«отклонить».
  final bool? busy;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final r = referral;
    final place = (r.shop == null || r.shop!.isEmpty) ? r.phone : r.shop!;
    return PqCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          MedAvatar(r.name, size: 48, seed: r.id),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(r.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.heading(16, FontWeight.w700, c: pq.text)),
              const SizedBox(height: 2),
              Text(place,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.caption(c: pq.textMuted)),
              const SizedBox(height: 2),
              Text(
                  r.source == 'code' || (r.source == null && r.kind == 'app')
                      ? l.medrepEnteredCode(medAgo(l, r.requestedAt, now))
                      : l.medrepFollowedLink(medAgo(l, r.requestedAt, now)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.caption(c: pq.textMuted)),
            ]),
          ),
        ]),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
            child: Opacity(
              opacity: busy == true ? .5 : 1,
              child: MedOutlineButton(
                label: l.referralsDecline,
                height: 44,
                radius: 14,
                transparent: true,
                expand: true,
                onTap: busy == null ? onReject : null,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: MedAccentButton(
              label: l.referralsAccept,
              icon: PqIcons.check,
              height: 44,
              loading: busy == true,
              onTap: busy == null ? onAccept : null,
            ),
          ),
        ]),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import '../../../widgets/pq_states.dart';
import '../providers.dart';
import 'wallet_common.dart';

/// Ждут выдачи (макет VoucherQueue): квесты, по которым ваучеры выдаются
/// вручную, и шаги «Квест выполнен → Проверка → Выдача».
class VoucherQueueScreen extends ConsumerWidget {
  const VoucherQueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(title: l.walletAwaitingTitle, backLabel: l.walletBack),
          Expanded(
            child: PqRefresh(
              onRefresh: () async {
                ref.invalidate(pendingAccrualsProvider);
                try {
                  await ref.read(pendingAccrualsProvider.future);
                } catch (_) {}
              },
              child: PqAsync<List<PendingAccrual>>(
                value: ref.watch(pendingAccrualsProvider),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                onRetry: () => ref.invalidate(pendingAccrualsProvider),
                data:
                    (list) =>
                        list.isEmpty
                            ? ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
                              children: [
                                PqEmptyState(
                                  icon: PqIcons.hourglass,
                                  title: l.walletQueueEmptyTitle,
                                  message: l.walletQueueEmptyText,
                                ),
                              ],
                            )
                            : _Body(list),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(this.pending);

  final List<PendingAccrual> pending;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final total = pending.fold<int>(0, (s, a) => s + a.count);
    Widget step(
      String label,
      Color bar, {
      bool current = false,
      bool muted = false,
    }) {
      Widget line = Container(
        height: 4,
        decoration: BoxDecoration(
          color: bar,
          borderRadius: BorderRadius.circular(2),
        ),
      );
      if (current) {
        line = PqBreath(
          duration: const Duration(milliseconds: 1600),
          child: line,
        );
      }
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            line,
            const SizedBox(height: 6),
            Text(
              label,
              style: PqText.text(
                12,
                current ? FontWeight.w700 : FontWeight.w500,
                c: muted ? pq.textMuted : pq.text,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: PqStagger(
        gap: 20,
        children: [
          PqPageTitle(
            l.walletQueueQuests(pending.length),
            subtitle: l.walletQueueVouchers(total),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              step(l.walletStepDone, pq.success),
              const SizedBox(width: 4),
              step(l.walletStepReview, pq.warning, current: true),
              const SizedBox(width: 4),
              step(l.walletStepIssue, walletTrackColor(pq), muted: true),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: pq.warningSoft,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: PqIcon(PqIcons.clock, size: 20, color: pq.warning),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l.walletQueueHint,
                    style: PqText.body(c: pq.warning, w: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          WalletRowsCard(
            children: [for (final a in pending) PendingRow(accrual: a)],
          ),
        ],
      ),
    );
  }
}

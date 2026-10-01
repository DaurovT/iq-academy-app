import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/format.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import '../../../widgets/pq_states.dart';
import '../providers.dart';
import 'voucher_archive.dart';
import 'wallet_common.dart';

/// Архив ваучеров (макеты Archive / ArchiveEmpty).
class VoucherArchiveScreen extends ConsumerWidget {
  const VoucherArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(
            title: l.walletArchiveTitle,
            backLabel: l.walletBackToWallet,
          ),
          Expanded(
            child: PqAsync<List<IssuedVoucher>>(
              value: ref.watch(myVouchersProvider),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
              onRetry: () => ref.invalidate(myVouchersProvider),
              data: (all) {
                final list = archivedVouchers(
                  all,
                  ref.watch(voucherArchiveProvider),
                );
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  layoutBuilder:
                      (cur, prev) => Stack(
                        alignment: Alignment.topCenter,
                        fit: StackFit.passthrough,
                        children: [...prev, if (cur != null) cur],
                      ),
                  child:
                      list.isEmpty
                          ? SingleChildScrollView(
                            key: const ValueKey('empty'),
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
                            child: PqEmptyState(
                              icon: PqIcons.archive,
                              title: l.walletArchiveEmptyTitle,
                              message: l.walletArchiveEmptyText,
                            ),
                          )
                          : _List(key: const ValueKey('list'), list: list),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _List extends ConsumerWidget {
  const _List({super.key, required this.list});

  final List<IssuedVoucher> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final months = l.walletMonths.split(',');
    final children = <Widget>[
      Text(
        l.walletArchiveCount(list.length),
        style: PqText.subtitle(c: pq.textMuted),
      ),
    ];
    String? month;
    for (final v in list) {
      final d = DateTime.tryParse(v.issuedAt)?.toLocal();
      final m = d == null ? '' : '${months[d.month - 1]} ${d.year}';
      if (m != month) {
        month = m;
        children.add(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              m.toUpperCase(),
              style: PqText.overline(c: pq.textMuted),
            ),
          ),
        );
      }
      children.add(
        _ArchivedCard(
          key: ValueKey(v.id),
          voucher: v,
          onRestore:
              isUsed(v)
                  ? null
                  : () =>
                      ref.read(voucherArchiveProvider.notifier).restore(v.id),
        ),
      );
    }
    if (list.any((v) => !isUsed(v))) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            l.walletRestoreHint,
            textAlign: TextAlign.center,
            style: PqText.body(c: pq.textMuted),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
      child: PqStagger(gap: 16, children: children),
    );
  }
}

class _ArchivedCard extends StatelessWidget {
  const _ArchivedCard({
    super.key,
    required this.voucher,
    required this.onRestore,
  });

  final IssuedVoucher voucher;

  /// null — ваучер погашен на кассе, вернуть нельзя.
  final VoidCallback? onRestore;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final tail = codeTail(voucher.code);
    return Container(
      decoration: BoxDecoration(
        gradient: gradient160(pq.archiveGradient),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                const KorzinkaBrand(fontSize: 14),
                const Spacer(),
                CardBadge(
                  onRestore == null
                      ? l.walletVoucherUsed
                      : l.walletStatusArchived,
                  alpha: .18,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatUzs(voucher.amountUzs),
                        style: PqText.heading(
                          22,
                          FontWeight.w700,
                          c: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l.walletReceivedMeta(
                          walletShortDate(voucher.issuedAt),
                          tail,
                        ),
                        style: PqText.caption(c: const Color(0xC7FFFFFF)),
                      ),
                    ],
                  ),
                ),
                if (onRestore != null) ...[
                  const SizedBox(width: 12),
                  PqPillButton(
                    label: l.walletRestore,
                    icon: PqIcons.undo,
                    onPressed: onRestore,
                    background: Colors.white.withValues(alpha: .2),
                    foreground: Colors.white,
                    semanticLabel: l.walletRestoreA11y(tail),
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

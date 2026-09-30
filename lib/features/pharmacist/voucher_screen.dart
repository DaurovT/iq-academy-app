import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/wallet.dart';
import '../../widgets/pq_states.dart';
import 'providers.dart';
import 'wallet/voucher_archive.dart';
import 'wallet/wallet_common.dart';
import 'wallet/wallet_toast.dart';

const _supportPhone = '+998900276969';
const _supportPhoneLabel = '+998 90-027-69-69';

/// Мой ваучер (макет Voucher): подарочная карта Korzinka с QR-кодом.
class VoucherScreen extends ConsumerWidget {
  const VoucherScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final mine = ref.watch(myVouchersProvider);
    final v = mine.asData?.value.where((e) => e.id == id).firstOrNull;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(
            title: l.voucherTitle,
            backLabel: l.walletBack,
            trailing:
                v == null
                    ? null
                    : PqIconButton(
                      icon: PqIcons.share,
                      iconSize: 19,
                      label: l.walletShare,
                      onTap: () => copyVoucherCode(context, v.code),
                    ),
          ),
          Expanded(
            child: PqAsync<List<IssuedVoucher>>(
              value: mine,
              loading: PqLoadingKind.spinner,
              onRetry: () => ref.invalidate(myVouchersProvider),
              data: (list) {
                final v = list.where((e) => e.id == id).firstOrNull;
                if (v == null) {
                  return PqEmptyState(
                    icon: PqIcons.ticket,
                    title: l.voucherNotFound,
                  );
                }
                return _Body(voucher: v, all: list);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.voucher, required this.all});

  final IssuedVoucher voucher;
  final List<IssuedVoucher> all;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final archive = ref.watch(voucherArchiveProvider);
    final used = isUsed(voucher);
    final archived = archive.contains(voucher.id);
    final others =
        activeVouchers(all, archive).where((v) => v.id != voucher.id).length;
    final peeks = used || archived ? 0 : others.clamp(0, 2);
    final status =
        used
            ? l.walletVoucherUsed
            : archived
            ? l.walletStatusArchived
            : l.walletVoucherActive;

    Widget peek(double inset, Color color, double opacity) => SizedBox(
      height: 10,
      child: OverflowBox(
        alignment: Alignment.topCenter,
        minHeight: 14,
        maxHeight: 14,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: inset),
          child: Opacity(
            opacity: opacity,
            child: Container(
              height: 14,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Widget link(
      PqIcons icon,
      String title,
      Widget trailing,
      VoidCallback onTap, {
      bool last = false,
    }) => PqPressable(
      onTap: onTap,
      child: Container(
        // <a> min-height 52 + нижняя рамка (content-box)
        constraints: BoxConstraints(minHeight: last ? 52 : 53),
        decoration: BoxDecoration(
          border: last ? null : Border(bottom: BorderSide(color: pq.divider)),
        ),
        child: Row(
          children: [
            PqIcon(icon, size: 18, color: pq.textMuted),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: PqText.text(15, FontWeight.w400, c: pq.text),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
      child: PqStagger(
        gap: 16,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (peeks >= 2) peek(18, const Color(0xFFB92624), .55),
              if (peeks >= 1) peek(10, const Color(0xFFCF2F2C), .75),
              VoucherTicket(
                voucher: voucher,
                status: status,
                archived: archived,
                notchColor: pq.bg,
              ),
            ],
          ),
          PqCard(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                link(
                  PqIcons.cart,
                  l.walletStores,
                  PqIcon(PqIcons.externalLink, size: 16, color: pq.textMuted),
                  () => launchUrl(
                    Uri.parse('https://korzinka.uz'),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
                link(
                  PqIcons.phone,
                  l.voucherSupport,
                  Text(
                    _supportPhoneLabel,
                    style: PqText.text(15, FontWeight.w700, c: pq.accent),
                  ),
                  () => launchUrl(Uri.parse('tel:$_supportPhone')),
                  last: true,
                ),
              ],
            ),
          ),
          if (!used)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PqPressable(
                  onTap: () {
                    if (archived) {
                      ref
                          .read(voucherArchiveProvider.notifier)
                          .restore(voucher.id);
                    } else {
                      archiveVoucherWithUndo(ref, voucher);
                      Navigator.of(context).maybePop();
                    }
                  },
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: pq.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: pq.border),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PqIcon(
                          archived ? PqIcons.undo : PqIcons.archive,
                          size: 18,
                          color: pq.text,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          archived
                              ? l.walletRestoreFromArchive
                              : l.walletToArchive,
                          style: PqText.button(c: pq.text),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!archived) ...[
                  const SizedBox(height: 8),
                  Text(
                    l.walletToArchiveHint,
                    textAlign: TextAlign.center,
                    style: PqText.body(c: pq.textMuted),
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

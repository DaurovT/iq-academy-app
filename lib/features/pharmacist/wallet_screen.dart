import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/wallet.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'providers.dart';
import 'wallet/exchange_sheet.dart';
import 'wallet/voucher_archive.dart';
import 'wallet/voucher_overlay.dart';
import 'wallet/wallet_common.dart';
import 'wallet/wallet_toast.dart';

/// Кошелёк (макет Wallet): баланс, стопка ваучеров Korzinka, очередь выдачи,
/// обмен IQC. Вкладка нижнего меню.
class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  Future<void> _refresh(WidgetRef ref) async {
    ref.invalidate(walletProvider);
    ref.invalidate(pendingAccrualsProvider);
    ref.invalidate(availableVouchersProvider);
    ref.invalidate(myVouchersProvider);
    ref.invalidate(walletTxnsProvider);
    try {
      await ref.read(walletProvider.future);
    } catch (_) {
      // ошибку покажет PqAsync
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    return PqScreen(
      child: Stack(
        children: [
          Column(
            children: [
              PqTabHeader(
                onBell: () => context.go('/app/notifications'),
                bellLabel: l.notifTitle,
                unread: unread > 0,
              ),
              Expanded(
                child: PqRefresh(
                  onRefresh: () => _refresh(ref),
                  child: PqAsync<Wallet>(
                    value: ref.watch(walletProvider),
                    loading: PqLoadingKind.home,
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      4,
                      16,
                      kPqNavClearance,
                    ),
                    onRetry: () => ref.invalidate(walletProvider),
                    data: (w) => _WalletBody(wallet: w),
                  ),
                ),
              ),
            ],
          ),
          const WalletToastLayer(),
        ],
      ),
    );
  }
}

class _WalletBody extends ConsumerWidget {
  const _WalletBody({required this.wallet});

  final Wallet wallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final pending =
        ref.watch(pendingAccrualsProvider).asData?.value ??
        const <PendingAccrual>[];
    final denoms =
        ref.watch(availableVouchersProvider).asData?.value ??
        const <VoucherDenomination>[];
    final mine =
        ref.watch(myVouchersProvider).asData?.value ?? const <IssuedVoucher>[];
    final archived = ref.watch(voucherArchiveProvider);
    final txns = ref.watch(walletTxnsProvider).asData?.value;
    final active = activeVouchers(mine, archived);
    final hasArchived = archivedVouchers(mine, archived).isNotEmpty;
    final accrued =
        txns == null
            ? null
            : iqcFromUzs(
              txns
                  .where((t) => t.type == WalletTxnType.earn && t.deltaUzs > 0)
                  .fold<int>(0, (s, t) => s + t.deltaUzs),
            ).round();
    final awaiting = pending.fold<int>(0, (s, a) => s + a.count);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
      child: PqStagger(
        gap: 24,
        children: [
          Text(l.walletTitle, style: PqText.display(c: context.pq.text)),
          _BalanceCard(
            iqc: wallet.balanceIqc,
            accrued: accrued,
            awaiting: awaiting,
          ),
          _MyVouchers(active: active, hasArchived: hasArchived),
          if (pending.isNotEmpty) _Awaiting(pending: pending),
          if (denoms.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WalletSectionHead(l.walletExchangeTitle),
                for (final d in denoms) ...[
                  const SizedBox(height: 12),
                  _ExchangeCard(denom: d, balance: wallet.balanceIqc),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

// ── Баланс ─────────────────────────────────────────────────────────────

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.iqc,
    required this.accrued,
    required this.awaiting,
  });

  final int iqc;
  final int? accrued;
  final int awaiting;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    const line = Color(0x33FFFFFF);
    Widget stat(String value, String label) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PqText.heading(20, FontWeight.w700, c: Colors.white),
        ),
        const SizedBox(height: 2),
        Text(label, style: PqText.caption(c: pq.walletMuted)),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pq.walletGradient,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0xB31A3566),
            offset: Offset(0, 16),
            blurRadius: 32,
            spreadRadius: -16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l.walletBalanceLabel.toUpperCase(),
                  style: PqText.overline(c: pq.walletMuted),
                ),
              ),
              PqPressable(
                onTap: () => context.push('/app/wallet/history'),
                semanticLabel: l.walletHistoryTitle,
                scale: .96,
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0x24FFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0x3DFFFFFF)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PqIcon(
                        PqIcons.history,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        l.walletHistoryTitle,
                        style: PqText.link(c: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    walletNum(iqc),
                    style: PqText.balance(c: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'IQC',
                style: PqText.text(18, FontWeight.w700, c: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.only(top: 14),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: line)),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: stat(
                      accrued == null ? '—' : '${walletNum(accrued!)} IQC',
                      l.walletAccruedAllTime,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: line)),
                      ),
                      child: stat(
                        walletNum(awaiting),
                        l.walletAwaitingStat(awaiting),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Мои ваучеры: стопка карт ───────────────────────────────────────────

class _MyVouchers extends ConsumerWidget {
  const _MyVouchers({required this.active, required this.hasArchived});

  final List<IssuedVoucher> active;
  final bool hasArchived;

  void _open(BuildContext context, WidgetRef ref, IssuedVoucher v) {
    showVoucherOverlay(
      context,
      voucher: v,
      onArchive: () {
        archiveVoucherWithUndo(ref, v);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final back =
        active.isEmpty
            ? const <IssuedVoucher>[]
            : active.sublist(0, active.length - 1);
    final front = active.isEmpty ? null : active.last;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WalletSectionHead(
          l.walletMyVouchers,
          count: active.length,
          countTone: PqTone.success,
          actionLabel: l.walletArchive,
          onAction: () => context.push('/app/wallet/archive'),
        ),
        const SizedBox(height: 12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: PqMotion.ease,
          layoutBuilder:
              (cur, prev) => Stack(
                alignment: Alignment.topCenter,
                fit: StackFit.passthrough,
                children: [...prev, if (cur != null) cur],
              ),
          child:
              front == null
                  ? DashedBorderBox(
                    key: const ValueKey('empty'),
                    color: pq.borderStrong,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 28,
                    ),
                    child: Column(
                      children: [
                        // inline-svg в строке 16/1.4: 3 px сверху, 4 снизу
                        Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 4),
                          child: PqIcon(
                            PqIcons.archive,
                            size: 26,
                            color: pq.textMuted,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          hasArchived
                              ? l.walletAllArchivedTitle
                              : l.walletNoVouchers,
                          textAlign: TextAlign.center,
                          style: PqText.text(16, FontWeight.w600, c: pq.text),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          l.walletAllArchivedText,
                          textAlign: TextAlign.center,
                          style: PqText.body(c: pq.textMuted),
                        ),
                      ],
                    ),
                  )
                  : Column(
                    key: ValueKey(active.map((v) => v.id).join(',')),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < back.length; i++)
                        _BackCard(
                          voucher: back[i],
                          color: stackBackColor(i, back.length),
                          onTap: () => _open(context, ref, back[i]),
                        ),
                      _FrontCard(
                        voucher: front,
                        onTap: () => _open(context, ref, front),
                      ),
                    ],
                  ),
        ),
        if (front != null) ...[
          const SizedBox(height: 12),
          Text(
            l.walletTapCardHint,
            textAlign: TextAlign.center,
            style: PqText.body(c: pq.textMuted),
          ),
        ],
      ],
    );
  }
}

/// «Корешок» ваучера в стопке: 64 высотой, следующий перекрывает нижние 12.
class _BackCard extends StatelessWidget {
  const _BackCard({
    required this.voucher,
    required this.color,
    required this.onTap,
  });

  final IssuedVoucher voucher;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final sum = formatUzs(voucher.amountUzs);
    return SizedBox(
      height: 52,
      child: OverflowBox(
        alignment: Alignment.topCenter,
        minHeight: 64,
        maxHeight: 64,
        child: PqPressable(
          onTap: onTap,
          semanticLabel: l.walletOpenVoucher(sum),
          child: Container(
            height: 64,
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const KorzinkaBrand(fontSize: 14, tight: true),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CardOverline(l.walletFaceValue, tight: true),
                    Text(
                      sum,
                      style: PqText.heading(
                        16,
                        FontWeight.w700,
                        height: kOnestNormal,
                        c: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FrontCard extends StatelessWidget {
  const _FrontCard({required this.voucher, required this.onTap});

  final IssuedVoucher voucher;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final sum = formatUzs(voucher.amountUzs);
    return PqPressable(
      onTap: onTap,
      semanticLabel: l.walletOpenVoucher(sum),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: kVoucherGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x73000000),
              offset: Offset(0, -8),
              blurRadius: 20,
              spreadRadius: -10,
            ),
            BoxShadow(
              color: Color(0xB3E53935),
              offset: Offset(0, 18),
              blurRadius: 32,
              spreadRadius: -18,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const KorzinkaBrand(tight: true),
                const Spacer(),
                CardBadge(l.walletVoucherActive, tight: true),
              ],
            ),
            const SizedBox(height: 20),
            CardOverline(l.walletGiftCard, tight: true),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                sum,
                style: PqText.heading(
                  40,
                  FontWeight.w800,
                  height: 1.05,
                  c: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CardField(
                    l.walletReceived,
                    walletShortDate(voucher.issuedAt),
                    tight: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CardField(
                    l.walletCode,
                    '••${codeTail(voucher.code)}',
                    align: CrossAxisAlignment.center,
                    tight: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CardField(
                    'QR',
                    l.walletShowQr,
                    align: CrossAxisAlignment.end,
                    tight: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Ждут выдачи ────────────────────────────────────────────────────────

class _Awaiting extends StatelessWidget {
  const _Awaiting({required this.pending});

  final List<PendingAccrual> pending;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WalletSectionHead(
          l.walletAwaitingTitle,
          count: pending.length,
          countTone: PqTone.warning,
        ),
        const SizedBox(height: 12),
        WalletRowsCard(
          footer: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PqIcon(PqIcons.clock, size: 18, color: pq.warning),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l.walletManualHint,
                    style: PqText.body(c: pq.textSecondary),
                  ),
                ),
              ],
            ),
          ),
          children: [
            for (final a in pending.take(3))
              PendingRow(
                accrual: a,
                icon: PqIcons.hourglass,
                amountColor: pq.warning,
                titleLines: 1,
              ),
          ],
        ),
        const SizedBox(height: 12),
        PqPressable(
          onTap: () => context.push('/app/wallet/queue'),
          child: Container(
            height: 50, // <a> 48 + рамка (content-box)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: pq.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l.walletShowAll(pending.length),
                  style: PqText.link(c: pq.accent),
                ),
                const SizedBox(width: 4),
                PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Обменять IQC ───────────────────────────────────────────────────────

class _ExchangeCard extends ConsumerWidget {
  const _ExchangeCard({required this.denom, required this.balance});

  final VoucherDenomination denom;
  final int balance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final enough = balance >= denom.costIqc;
    final progress =
        denom.costIqc <= 0 ? 1.0 : (balance / denom.costIqc).clamp(0.0, 1.0);
    return PqCard(
      onTap: () => context.push('/app/wallet/shop'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: kKorzinkaRed,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const PqIcon(
                  PqIcons.gift,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatUzs(denom.faceUzs),
                      style: PqText.title(c: pq.text),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l.walletGiftCardKorzinka,
                      style: PqText.body(c: pq.textMuted),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Text(
                '${denom.costIqc} IQC',
                style: PqText.amount(c: iqcPriceColor(pq)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (enough)
            PqButton(
              label: l.walletExchangeFor(walletNum(denom.costIqc)),
              icon: PqIcons.ticket,
              height: 48,
              onPressed:
                  () => startVoucherExchange(
                    context,
                    ref,
                    denom: denom,
                    balance: balance,
                  ),
            )
          else ...[
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: walletTrackColor(pq),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: iqcBarColor(pq),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l.walletProgressOf('$balance', '${denom.costIqc}'),
                    style: PqText.body(c: pq.textMuted),
                  ),
                ),
                Text(
                  l.walletMore('${denom.costIqc - balance}'),
                  style: PqText.body(c: pq.textMuted),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Semantics(
              button: true,
              enabled: false,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: pq.fieldDisabledBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: pq.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PqIcon(PqIcons.lock, size: 16, color: pq.textMuted),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        l.walletSaveUp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.text(
                          15,
                          FontWeight.w700,
                          c: pq.textMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/format.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import '../../../widgets/pq_states.dart';
import '../providers.dart';
import 'exchange_sheet.dart';
import 'wallet_common.dart';

/// Обмен IQC (макет VoucherShop): баланс и номиналы подарочных карт Korzinka.
class VoucherShopScreen extends ConsumerWidget {
  const VoucherShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(title: l.walletShopTitle, backLabel: l.walletBack),
          Expanded(
            child: PqRefresh(
              onRefresh: () async {
                ref.invalidate(walletProvider);
                ref.invalidate(availableVouchersProvider);
                try {
                  await ref.read(availableVouchersProvider.future);
                } catch (_) {}
              },
              child: PqAsync<Wallet>(
                value: ref.watch(walletProvider),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                onRetry: () => ref.invalidate(walletProvider),
                data: (w) => _Body(balance: w.balanceIqc),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.balance});

  final int balance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final denomsAsync = ref.watch(availableVouchersProvider);
    final denoms = denomsAsync.asData?.value;
    final cheapest =
        denoms == null || denoms.isEmpty
            ? null
            : denoms.map((d) => d.costIqc).reduce(math.min);
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: PqStagger(
        gap: 20,
        children: [
          WalletBalanceCard(
            iqc: balance,
            caption:
                cheapest == null || cheapest <= 0
                    ? null
                    : l.walletEnoughFor(balance ~/ cheapest),
          ),
          if (denoms == null)
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PqSkeleton(height: 150, radius: 22),
                SizedBox(height: 20),
                PqSkeleton(height: 150, radius: 22),
              ],
            )
          else
            for (var i = 0; i < denoms.length; i++)
              _DenomCard(denom: denoms[i], balance: balance),
          Text(
            l.walletShopNote,
            textAlign: TextAlign.center,
            style: PqText.body(c: pq.textMuted),
          ),
        ],
      ),
    );
  }
}

class _DenomCard extends ConsumerWidget {
  const _DenomCard({required this.denom, required this.balance});

  final VoucherDenomination denom;
  final int balance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final enough = balance >= denom.costIqc;
    final cost = walletNum(denom.costIqc);
    return PqCard(
      padding: const EdgeInsets.all(14),
      radius: 22,
      borderColor: enough ? pq.accent : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              _MiniCard(faceUzs: denom.faceUzs),
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
                    Text(l.walletGiftCard, style: PqText.body(c: pq.textMuted)),
                    const SizedBox(height: 2),
                    Text(
                      '$cost IQC',
                      style: PqText.body(
                        c: iqcPriceColor(pq),
                        w: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (enough)
            PqButton(
              label: l.walletExchangeFor(cost),
              icon: PqIcons.ticket,
              height: 52,
              onPressed:
                  () => startVoucherExchange(
                    context,
                    ref,
                    denom: denom,
                    balance: balance,
                  ),
            )
          else ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    l.walletProgressOf(walletNum(balance), cost),
                    style: PqText.body(c: pq.textMuted),
                  ),
                ),
                Text(
                  l.walletMore(walletNum(denom.costIqc - balance)),
                  style: PqText.body(c: pq.warning, w: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 6),
            PqProgressBar(
              value: denom.costIqc <= 0 ? 1 : balance / denom.costIqc,
              color: iqcBarColor(pq),
              trackColor: walletTrackColor(pq),
            ),
          ],
        ],
      ),
    );
  }
}

/// Мини-карта 112×72 с логотипом и номиналом.
class _MiniCard extends StatelessWidget {
  const _MiniCard({required this.faceUzs});

  final int faceUzs;

  @override
  Widget build(BuildContext context) => Container(
    width: 112,
    height: 72,
    decoration: BoxDecoration(
      gradient: kVoucherGradient,
      borderRadius: BorderRadius.circular(14),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      children: [
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .12),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const KorzinkaBrand(
                fontSize: 12,
                onest: false,
                tile: 0,
                iconSize: 14,
                gap: 6,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  walletNum(faceUzs),
                  style: PqText.heading(16, FontWeight.w800, c: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

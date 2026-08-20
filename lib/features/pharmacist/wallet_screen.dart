import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/api/providers.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/wallet.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

final _num = NumberFormat.decimalPattern('ru');
String _uzs(num v) => '${_num.format(v)} UZS';

/// Кошелёк. Дизайн перенесён один в один из макета Figma «wallet-main».
class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _W.of(context);
    final wallet = ref.watch(walletProvider).asData?.value;
    final pending = ref.watch(pendingAccrualsProvider).asData?.value ?? const [];
    final denoms =
        ref.watch(availableVouchersProvider).asData?.value ?? const [];
    final mine = ref.watch(myVouchersProvider).asData?.value ?? const [];
    final iqc = wallet?.balanceIqc ?? 0;

    return Scaffold(
      backgroundColor: c.page,
      body: Stack(children: [Positioned.fill(child: ScreenDecor(walletDecor)), Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(walletProvider);
                ref.invalidate(pendingAccrualsProvider);
                ref.invalidate(availableVouchersProvider);
                ref.invalidate(myVouchersProvider);
              },
              child: ListView(
                padding: const EdgeInsets.only(bottom: 24),
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: _Title(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _BalanceCard(
                      c: c,
                      iqc: iqc,
                      uzs: wallet?.balanceUzs ?? 0,
                      onHistory: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const _HistoryScreen()),
                      ),
                    ),
                  ),

                  // ── Мои ваучеры (подняты в самый верх) ──
                  _SectionHeader(c: c, title: context.l10n.walletMyVouchers),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: mine.isEmpty
                        ? _EmptyCard(c: c, text: context.l10n.walletNoVouchers)
                        : Column(
                            children: [
                              for (final v in mine) ...[
                                _MyVoucherRow(
                                  c: c,
                                  voucher: v,
                                  onTap: () =>
                                      context.push('/app/wallet/voucher/${v.id}'),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ],
                          ),
                  ),

                  // ── Ваучеры в очереди ──
                  if (pending.isNotEmpty) ...[
                    _SectionHeader(
                        c: c,
                        title: context.l10n.walletPendingVouchers,
                        count: pending.length),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          for (final a in pending) ...[
                            _PendingRow(c: c, accrual: a),
                            const SizedBox(height: 8),
                          ],
                        ],
                      ),
                    ),
                  ],

                  // ── Использовать IQC ──
                  _SectionHeader(c: c, title: context.l10n.walletUseIqc),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        for (final v in denoms) ...[
                          _DenomCard(
                            c: c,
                            denom: v,
                            enough: iqc >= v.costIqc,
                            onRedeem: () => _redeem(context, ref, v),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      )]),
    );
  }

  Future<void> _redeem(
      BuildContext context, WidgetRef ref, VoucherDenomination v) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.l10n.walletRedeemTitle),
        content: Text(context.l10n.walletRedeemBody(v.label, v.costIqc)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(context.l10n.walletCancel)),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(context.l10n.walletRedeem)),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await ref.read(apiProvider).wallet.redeem(v.faceUzs);
      ref.invalidate(walletProvider);
      ref.invalidate(myVouchersProvider);
      ref.invalidate(availableVouchersProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.walletVoucherIssued)));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

class _Title extends StatelessWidget {
  const _Title();
  @override
  Widget build(BuildContext context) {
    final c = _W.of(context);
    return Text(context.l10n.walletTitle,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: c.text));
  }
}

// ── Балансовая карточка ─────────────────────────────────────────────────

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.c,
    required this.iqc,
    required this.uzs,
    required this.onHistory,
  });

  final _W c;
  final int iqc;
  final int uzs;
  final VoidCallback onHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: c.balanceGradient,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.walletBalanceLabel,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: c.balLabel)),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(_num.format(iqc),
                  style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const SizedBox(width: 4),
              Text('IQC',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: c.balLabel)),
            ],
          ),
          const SizedBox(height: 8),
          Text(_uzs(uzs),
              style: TextStyle(fontSize: 14, color: c.balSub)),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                      context.l10n.walletTotalAccrued(_num.format(iqc)),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: c.balLabel)),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onHistory,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: c.balChipBorder),
                    ),
                    child: Text(context.l10n.walletHistoryArrow,
                        style: TextStyle(fontSize: 12, color: c.balLabel)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Заголовок секции ────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.c, required this.title, this.count});
  final _W c;
  final String title;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: c.text)),
          if (count != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                  color: c.countBg, borderRadius: BorderRadius.circular(10)),
              child: Text('$count',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: c.muted)),
            ),
        ],
      ),
    );
  }
}

// ── Строка «ваучер в очереди» ───────────────────────────────────────────

class _PendingRow extends StatelessWidget {
  const _PendingRow({required this.c, required this.accrual});
  final _W c;
  final PendingAccrual accrual;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: c.clockBg, borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.schedule, size: 20, color: c.amber),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(accrual.questName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: c.text)),
                const SizedBox(height: 3),
                Text(context.l10n.walletQuestDoneAwaiting,
                    style: TextStyle(fontSize: 12, color: c.muted)),
                const SizedBox(height: 3),
                Text(formatDate(accrual.requestedAt),
                    style: TextStyle(fontSize: 11, color: c.faint)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: c.clockBg, borderRadius: BorderRadius.circular(10)),
            child: Text('×${accrual.count}',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700, color: c.amber)),
          ),
        ],
      ),
    );
  }
}

// ── Карточка номинала ───────────────────────────────────────────────────

class _DenomCard extends StatelessWidget {
  const _DenomCard({
    required this.c,
    required this.denom,
    required this.enough,
    required this.onRedeem,
  });

  final _W c;
  final VoucherDenomination denom;
  final bool enough;
  final VoidCallback onRedeem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: c.giftPurpleBg, borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.card_giftcard, size: 20, color: c.giftPurple),
          ),
          const SizedBox(height: 12),
          Text(denom.label,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: c.text)),
          const SizedBox(height: 2),
          Text(context.l10n.walletForIqc(denom.costIqc),
              style: TextStyle(fontSize: 14, color: c.muted)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: c.redeemBtn,
                foregroundColor: Colors.white,
                disabledBackgroundColor: c.redeemBtn.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: enough ? onRedeem : null,
              child: Text(context.l10n.walletGetVoucher,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ),
          if (!enough) ...[
            const SizedBox(height: 8),
            Center(
              child: Text(context.l10n.walletNotEnoughIqc,
                  style: TextStyle(fontSize: 12, color: c.muted)),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Строка «мой ваучер» ─────────────────────────────────────────────────

class _MyVoucherRow extends StatelessWidget {
  const _MyVoucherRow({required this.c, required this.voucher, required this.onTap});
  final _W c;
  final IssuedVoucher voucher;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final used = voucher.status == 'used';
    return Material(
      color: c.card,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: c.giftBlueBg, borderRadius: BorderRadius.circular(20)),
                child: Icon(Icons.card_giftcard, size: 20, color: c.giftBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_uzs(voucher.amountUzs),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: c.text)),
                    const SizedBox(height: 3),
                    Text(
                        context.l10n.walletCodeMeta(
                            voucher.code, formatDateTime(voucher.issuedAt)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: c.muted)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: used ? c.usedBg : c.activeBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: used ? c.usedFg : c.activeFg),
                ),
                child: Text(
                    used
                        ? context.l10n.walletVoucherUsed
                        : context.l10n.walletVoucherActive,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: used ? c.usedFg : c.activeFg)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.c, required this.text});
  final _W c;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(14)),
      child: Text(text,
          textAlign: TextAlign.center, style: TextStyle(color: c.muted)),
    );
  }
}

// ── История операций ────────────────────────────────────────────────────

class _HistoryScreen extends ConsumerWidget {
  const _HistoryScreen();

  IconData _icon(WalletTxnType t) => switch (t) {
        WalletTxnType.earn => Icons.add_circle_outline,
        WalletTxnType.redeem => Icons.remove_circle_outline,
        WalletTxnType.reversal => Icons.undo,
        WalletTxnType.adjust => Icons.tune,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txns = ref.watch(walletTxnsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.walletHistoryTitle)),
      body: txns.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (list) => list.isEmpty
            ? Center(child: Text(context.l10n.walletNoTransactions))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: list.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final t = list[i];
                  final positive = t.deltaUzs >= 0;
                  return ListTile(
                    leading: Icon(_icon(t.type)),
                    title: Text(t.note ?? t.refType),
                    subtitle: Text(formatDateTime(t.createdAt)),
                    trailing: Text(
                      '${positive ? '+' : ''}${formatUzs(t.deltaUzs)}',
                      style: TextStyle(
                        color: positive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

// ── Палитра кошелька (токены макета) ────────────────────────────────────

class _W {
  const _W({
    required this.page,
    required this.card,
    required this.text,
    required this.muted,
    required this.faint,
    required this.balanceGradient,
    required this.balLabel,
    required this.balSub,
    required this.balChipBorder,
    required this.countBg,
    required this.clockBg,
    required this.amber,
    required this.giftPurpleBg,
    required this.giftPurple,
    required this.giftBlueBg,
    required this.giftBlue,
    required this.redeemBtn,
    required this.activeBg,
    required this.activeFg,
    required this.usedBg,
    required this.usedFg,
  });

  final Color page;
  final Color card;
  final Color text;
  final Color muted;
  final Color faint;
  final List<Color> balanceGradient;
  final Color balLabel;
  final Color balSub;
  final Color balChipBorder;
  final Color countBg;
  final Color clockBg;
  final Color amber;
  final Color giftPurpleBg;
  final Color giftPurple;
  final Color giftBlueBg;
  final Color giftBlue;
  final Color redeemBtn;
  final Color activeBg;
  final Color activeFg;
  final Color usedBg;
  final Color usedFg;

  static _W of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _W(
    page: Color(0xFF0D1117),
    card: Color(0xFF151B2A),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF9CA3AF),
    faint: Color(0xFF49454F),
    balanceGradient: [Color(0xFF1A3566), Color(0xFF2A4B8A)],
    balLabel: Color(0xFF8BAFD4),
    balSub: Color(0xFF6A8CAF),
    balChipBorder: Color(0xFF2A4B8A),
    countBg: Color(0xFF1E2A3A),
    clockBg: Color(0xFF2A2010),
    amber: Color(0xFFF59E0B),
    giftPurpleBg: Color(0xFF2D1F5E),
    giftPurple: Color(0xFFC4B5FD),
    giftBlueBg: Color(0xFF1F2D3D),
    giftBlue: Color(0xFF7DD3FC),
    redeemBtn: Color(0xFF3730A3),
    activeBg: Color(0xFF14421E),
    activeFg: Color(0xFF22C55E),
    usedBg: Color(0xFF23262F),
    usedFg: Color(0xFF9CA3AF),
  );

  static const _light = _W(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    faint: Color(0xFF9CA3AF),
    balanceGradient: [Color(0xFF2563EB), Color(0xFF7C3AED)],
    balLabel: Color(0xFFD6E3FF),
    balSub: Color(0xFFDBEAFE),
    balChipBorder: Color(0x66FFFFFF),
    countBg: Color(0xFFEEF2FF),
    clockBg: Color(0xFFFEF3C7),
    amber: Color(0xFFD97706),
    giftPurpleBg: Color(0xFFEDE9FE),
    giftPurple: Color(0xFF7C3AED),
    giftBlueBg: Color(0xFFE0F2FE),
    giftBlue: Color(0xFF0EA5E9),
    redeemBtn: Color(0xFF3730A3),
    activeBg: Color(0xFFDCFCE7),
    activeFg: Color(0xFF16A34A),
    usedBg: Color(0xFFF3F4F6),
    usedFg: Color(0xFF6B7280),
  );
}

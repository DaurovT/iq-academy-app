import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../../core/design/design.dart';
import '../../../core/format.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import '../providers.dart';
import 'wallet_common.dart';

/// Обмен IQC на ваучер: лист подтверждения (макет ExchangeConfirm) →
/// `wallet.redeem(faceUzs)` → обновление кошелька и тост.
Future<void> startVoucherExchange(
  BuildContext context,
  WidgetRef ref, {
  required VoucherDenomination denom,
  required int balance,
}) async {
  final api = ref.read(apiProvider);
  final l = context.l10n;
  final ok = await showPqSheet<bool>(
    context,
    scrollable: true,
    builder:
        (_) => _ExchangeSheet(
          denom: denom,
          balance: balance,
          onConfirm: () async {
            final r = await api.wallet.redeem(denom.faceUzs);
            if (r.ok) {
              ref.invalidate(walletProvider);
              ref.invalidate(myVouchersProvider);
              ref.invalidate(availableVouchersProvider);
              ref.invalidate(walletTxnsProvider);
            }
            return r.ok;
          },
        ),
  );
  if (ok == null) return; // «Отмена»
  if (!context.mounted) return;
  showPqToast(
    context,
    ok ? l.walletVoucherIssued : l.walletExchangeFailed,
    tone: ok ? PqTone.success : PqTone.danger,
    icon: ok ? PqIcons.ticket : null,
  );
}

class _ExchangeSheet extends StatefulWidget {
  const _ExchangeSheet({
    required this.denom,
    required this.balance,
    required this.onConfirm,
  });

  final VoucherDenomination denom;
  final int balance;
  final Future<bool> Function() onConfirm;

  @override
  State<_ExchangeSheet> createState() => _ExchangeSheetState();
}

class _ExchangeSheetState extends State<_ExchangeSheet> {
  bool _busy = false;

  Future<void> _confirm() async {
    setState(() => _busy = true);
    bool ok;
    try {
      ok = await widget.onConfirm();
    } catch (_) {
      ok = false;
    }
    if (mounted) Navigator.of(context).pop(ok);
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final d = widget.denom;
    final cost = walletNum(d.costIqc);
    Widget row(String k, String v, {bool last = false}) => Container(
      // min-height 44 + нижняя рамка (content-box)
      constraints: BoxConstraints(minHeight: last ? 44 : 45),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: pq.divider)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(k, style: PqText.subtitle(c: pq.textMuted))),
          Text(v, style: PqText.text(15, FontWeight.w700, c: pq.text)),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqAnimate(
          fx: PqFx.pop,
          duration: const Duration(milliseconds: 450),
          delay: const Duration(milliseconds: 150),
          child: _ConfirmCard(faceUzs: d.faceUzs),
        ),
        const SizedBox(height: 16),
        Text(
          l.walletConfirmTitle(cost),
          style: PqText.heading(22, FontWeight.w700, c: pq.text),
        ),
        const SizedBox(height: 4),
        Text(
          l.walletConfirmText(formatUzs(d.faceUzs)),
          style: PqText.subtitle(c: pq.textMuted),
        ),
        const SizedBox(height: 16),
        row(l.walletWillDebit, '$cost IQC'),
        row(l.walletWillRemain, '${walletNum(widget.balance - d.costIqc)} IQC'),
        row(l.walletWhereTo, l.walletToWallet, last: true),
        const SizedBox(height: 16),
        PqButton(
          label: l.walletExchange,
          icon: PqIcons.ticket,
          loading: _busy,
          onPressed: _confirm,
        ),
        const SizedBox(height: 8),
        PqButton(
          label: l.walletCancel,
          kind: PqButtonKind.secondary,
          height: 52,
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

/// Карта 150 в листе подтверждения.
class _ConfirmCard extends StatelessWidget {
  const _ConfirmCard({required this.faceUzs});

  final int faceUzs;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: kVoucherGradient,
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .12),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const KorzinkaBrand(fontSize: 14, onest: false, tileAlpha: .2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.walletGiftCard.toUpperCase(),
                      style: PqText.text(
                        12,
                        FontWeight.w400,
                        ls: .8,
                        c: Colors.white.withValues(alpha: .8),
                      ),
                    ),
                    Text(
                      formatUzs(faceUzs),
                      style: PqText.heading(
                        22,
                        FontWeight.w800,
                        c: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

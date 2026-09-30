import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import 'wallet_common.dart';

/// Открытие ваучера поверх кошелька (макет Wallet, состояние isOpen):
/// затемнение pqFade .25s, крестик pqFade .3s после .2s, карта pqOpen .42s,
/// блок с QR pqReveal .45s после .18s, кнопка «В архив» pqRise .35s после .35s.
Future<void> showVoucherOverlay(
  BuildContext context, {
  required IssuedVoucher voucher,
  required VoidCallback onArchive,
}) {
  return Navigator.of(context, rootNavigator: true).push(
    PageRouteBuilder<void>(
      opaque: false,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 420),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder:
          (_, __, ___) =>
              _VoucherOverlay(voucher: voucher, onArchive: onArchive),
      // Появление анимируют сами элементы; закрытие — общее растворение.
      transitionsBuilder:
          (_, a, __, child) =>
              a.status == AnimationStatus.reverse
                  ? FadeTransition(opacity: a, child: child)
                  : child,
    ),
  );
}

class _VoucherOverlay extends StatelessWidget {
  const _VoucherOverlay({required this.voucher, required this.onArchive});

  final IssuedVoucher voucher;
  final VoidCallback onArchive;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    void close() => Navigator.of(context).pop();
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: l.walletVoucherDialog,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: close,
              child: PqAnimate(
                fx: PqFx.fade,
                child: const ColoredBox(color: Color(0xB805060A)),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: PqAnimate(
                          fx: PqFx.fade,
                          duration: const Duration(milliseconds: 300),
                          delay: const Duration(milliseconds: 200),
                          child: PqIconButton(
                            icon: PqIcons.x,
                            label: l.walletClose,
                            onTap: close,
                            background: Colors.white.withValues(alpha: .16),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      PqAnimate(
                        fx: PqFx.open,
                        child: VoucherTicket(
                          voucher: voucher,
                          status: l.walletVoucherActive,
                          animateReveal: true,
                          shortDate: true,
                          shadow: const [
                            BoxShadow(
                              color: Color(0xB3000000),
                              offset: Offset(0, 30),
                              blurRadius: 60,
                              spreadRadius: -20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      PqAnimate(
                        fx: PqFx.rise,
                        delay: const Duration(milliseconds: 350),
                        child: PqPressable(
                          onTap: () {
                            close();
                            onArchive();
                          },
                          semanticLabel: l.walletArchiveUsed,
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: .1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: .28),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const PqIcon(
                                  PqIcons.archive,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    l.walletArchiveUsed,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: PqText.button(c: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

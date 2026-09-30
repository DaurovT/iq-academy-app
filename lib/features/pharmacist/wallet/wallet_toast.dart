import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import 'voucher_archive.dart';
import 'wallet_common.dart';

/// Тост «Ваучер ••4007 в архиве» с «Отменить» (макет Wallet, состояние
/// toast): тёмная плашка поверх кошелька, живёт 4 с (pqToast).
class WalletToast extends Notifier<IssuedVoucher?> {
  Timer? _timer;

  @override
  IssuedVoucher? build() {
    ref.onDispose(() => _timer?.cancel());
    return null;
  }

  void show(IssuedVoucher v) {
    _timer?.cancel();
    state = v;
    _timer = Timer(const Duration(seconds: 4), hide);
  }

  void hide() {
    _timer?.cancel();
    state = null;
  }
}

final walletToastProvider = NotifierProvider<WalletToast, IssuedVoucher?>(
  WalletToast.new,
);

/// Убрать ваучер в архив и показать на кошельке тост с «Отменить».
void archiveVoucherWithUndo(WidgetRef ref, IssuedVoucher v) {
  ref.read(voucherArchiveProvider.notifier).archive(v.id);
  ref.read(walletToastProvider.notifier).show(v);
}

/// Слой тоста для экрана кошелька (top: 380, поля 16 — как в макете).
class WalletToastLayer extends ConsumerWidget {
  const WalletToastLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(walletToastProvider);
    if (v == null) return const SizedBox.shrink();
    return Positioned(
      left: 16,
      right: 16,
      top: 380,
      child: _ArchiveToast(
        key: ValueKey(v.id),
        voucher: v,
        onUndo: () {
          ref.read(voucherArchiveProvider.notifier).restore(v.id);
          ref.read(walletToastProvider.notifier).hide();
        },
      ),
    );
  }
}

class _ArchiveToast extends StatefulWidget {
  const _ArchiveToast({super.key, required this.voucher, required this.onUndo});

  final IssuedVoucher voucher;
  final VoidCallback onUndo;

  @override
  State<_ArchiveToast> createState() => _ArchiveToastState();
}

class _ArchiveToastState extends State<_ArchiveToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_c.status == AnimationStatus.dismissed) {
      // Уменьшить движение — сразу видимое состояние (без появления).
      if (PqMotion.reduced(context)) {
        _c.value = .5;
      } else {
        _c.forward();
      }
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final toast = Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80000000),
              offset: Offset(0, 12),
              blurRadius: 28,
              spreadRadius: -10,
            ),
          ],
        ),
        child: Row(
          children: [
            // inline-svg на базовой линии строки 16/1.4 — чуть выше центра
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: PqIcon(PqIcons.archive, size: 18, color: Color(0xFF79D384)),
          ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                l.walletArchivedToast(codeTail(widget.voucher.code)),
                style: PqText.text(14, FontWeight.w600, c: Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            PqPressable(
              onTap: widget.onUndo,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                child: Text(
                  l.walletUndo,
                  style: PqText.buttonSmall(c: const Color(0xFF8FB5F8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // pqToast 4s ease-out: 0% скрыт и ниже на 16 → 12% на месте → 88% → 100% растворился.
    return AnimatedBuilder(
      animation: _c,
      child: toast,
      builder: (_, child) {
        final t = _c.value;
        final o = kf(
          t,
          const [0, .12, .88, 1],
          const [0, 1, 1, 0],
          Curves.easeOut,
        );
        final dy = kf(t, const [0, .12, 1], const [16, 0, 0], Curves.easeOut);
        return Opacity(
          opacity: o.clamp(0.0, 1.0),
          child: Transform.translate(offset: Offset(0, dy), child: child),
        );
      },
    );
  }
}

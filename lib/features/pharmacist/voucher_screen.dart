import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/format.dart';
import '../../core/models/wallet.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

/// Экран ваучера с крупным QR для показа на кассе.
/// QR генерируем из кода (тот же код, что в Telegram).
class VoucherScreen extends ConsumerWidget {
  const VoucherScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mine = ref.watch(myVouchersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Ваучер')),
      body: AsyncView(
        value: mine,
        onRetry: () => ref.invalidate(myVouchersProvider),
        data: (list) {
          final v = list.where((e) => e.id == id).firstOrNull;
          if (v == null) return const EmptyState(text: 'Ваучер не найден');
          return _VoucherBody(voucher: v);
        },
      ),
    );
  }
}

class _VoucherBody extends StatelessWidget {
  const _VoucherBody({required this.voucher});
  final IssuedVoucher voucher;

  @override
  Widget build(BuildContext context) {
    final used = voucher.status == 'used';
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(formatUzs(voucher.amountUzs),
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Opacity(
                opacity: used ? 0.3 : 1,
                child: QrImageView(
                  data: voucher.code,
                  size: 220,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SelectableText('Код: ${voucher.code}',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Chip(
              label: Text(used ? 'Использован' : 'Активен'),
              backgroundColor: used
                  ? null
                  : Theme.of(context).colorScheme.primaryContainer,
            ),
            const SizedBox(height: 8),
            Text('Выпущен: ${formatDate(voucher.issuedAt)}',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

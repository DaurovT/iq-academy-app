import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../core/format.dart';
import '../../core/models/wallet.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Кошелёк'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Награды'),
            Tab(text: 'История'),
          ]),
        ),
        body: Column(
          children: [
            AsyncView(
              value: wallet,
              onRetry: () => ref.invalidate(walletProvider),
              data: (w) => _BalanceCard(wallet: w),
            ),
            const Expanded(
              child: TabBarView(children: [
                _RewardsTab(),
                _HistoryTab(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.wallet});
  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Баланс',
              style: TextStyle(color: scheme.onPrimary.withValues(alpha: 0.8))),
          const SizedBox(height: 6),
          Text(formatIqc(wallet.balanceIqc),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: scheme.onPrimary, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text('≈ ${formatUzs(wallet.balanceUzs)}',
              style: TextStyle(color: scheme.onPrimary.withValues(alpha: 0.9))),
        ],
      ),
    );
  }
}

class _RewardsTab extends ConsumerWidget {
  const _RewardsTab();

  Future<void> _redeem(
      BuildContext context, WidgetRef ref, VoucherDenomination v) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Обменять баллы?'),
        content: Text('${v.label} за ${v.costIqc} IQC'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Отмена')),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Обменять')),
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
            const SnackBar(content: Text('Ваучер оформлен')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final available = ref.watch(availableVouchersProvider);
    final mine = ref.watch(myVouchersProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Обменять баллы', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        AsyncView(
          value: available,
          data: (list) => Column(
            children: [
              for (final v in list)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.card_giftcard_outlined),
                    title: Text(v.label),
                    subtitle: Text('${v.costIqc} IQC'),
                    trailing: FilledButton.tonal(
                      onPressed: () => _redeem(context, ref, v),
                      child: const Text('Обменять'),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text('Мои ваучеры', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        AsyncView(
          value: mine,
          data: (list) => list.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Пока нет ваучеров'))
              : Column(
                  children: [
                    for (final v in list)
                      Card(
                        child: ListTile(
                          leading: Icon(v.status == 'used'
                              ? Icons.check_circle_outline
                              : Icons.qr_code_2),
                          title: Text(formatUzs(v.amountUzs)),
                          subtitle: Text('Код: ${v.code}'),
                          trailing: Text(v.status == 'used' ? 'Использован' : 'Активен'),
                          onTap: () => context.go('/app/wallet/voucher/${v.id}'),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _HistoryTab extends ConsumerWidget {
  const _HistoryTab();

  IconData _icon(WalletTxnType t) => switch (t) {
        WalletTxnType.earn => Icons.add_circle_outline,
        WalletTxnType.redeem => Icons.remove_circle_outline,
        WalletTxnType.reversal => Icons.undo,
        WalletTxnType.adjust => Icons.tune,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txns = ref.watch(walletTxnsProvider);
    return AsyncView(
      value: txns,
      onRetry: () => ref.invalidate(walletTxnsProvider),
      data: (list) => list.isEmpty
          ? const EmptyState(text: 'Операций пока нет')
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
    );
  }
}

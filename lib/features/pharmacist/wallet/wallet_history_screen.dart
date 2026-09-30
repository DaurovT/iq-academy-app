import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/format.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';
import '../../../widgets/pq_states.dart';
import '../providers.dart';
import 'wallet_common.dart';

enum _Filter { all, earned, spent }

/// История кошелька (макет WalletHistory): фильтр, итоги месяца, операции
/// по месяцам.
class WalletHistoryScreen extends ConsumerStatefulWidget {
  const WalletHistoryScreen({super.key});

  @override
  ConsumerState<WalletHistoryScreen> createState() =>
      _WalletHistoryScreenState();
}

class _WalletHistoryScreenState extends ConsumerState<WalletHistoryScreen> {
  _Filter _filter = _Filter.all;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(title: l.walletHistoryTitle, backLabel: l.walletBack),
          Expanded(
            child: PqRefresh(
              onRefresh: () async {
                ref.invalidate(walletTxnsProvider);
                try {
                  await ref.read(walletTxnsProvider.future);
                } catch (_) {}
              },
              child: PqAsync<List<WalletTxn>>(
                value: ref.watch(walletTxnsProvider),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                onRetry: () => ref.invalidate(walletTxnsProvider),
                data: _body,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(List<WalletTxn> all) {
    final pq = context.pq;
    final l = context.l10n;
    final months = l.walletMonths.split(',');
    // Итоги — за месяц последней операции (обычно текущий), название месяца
    // в подписи: «Начислено в июле».
    final dates =
        [
            for (final t in all) DateTime.tryParse(t.createdAt)?.toLocal(),
          ].whereType<DateTime>().toList()
          ..sort();
    final now = dates.isEmpty ? DateTime.now() : dates.last;
    final monthIn = l.walletMonthsIn.split(',')[now.month - 1];

    // Итоги текущего месяца — по всем операциям, независимо от фильтра.
    var earned = 0, spent = 0;
    for (final t in all) {
      final d = DateTime.tryParse(t.createdAt)?.toLocal();
      if (d == null || d.year != now.year || d.month != now.month) continue;
      if (t.deltaUzs > 0) {
        earned += t.deltaUzs;
      } else {
        spent -= t.deltaUzs;
      }
    }

    final list =
        all
            .where(
              (t) => switch (_filter) {
                _Filter.all => true,
                _Filter.earned => t.deltaUzs > 0,
                _Filter.spent => t.deltaUzs < 0,
              },
            )
            .toList()
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // Группы по месяцам: «ИЮЛЬ 2026».
    final groups = <String, List<WalletTxn>>{};
    for (final t in list) {
      final d = DateTime.tryParse(t.createdAt)?.toLocal();
      final key = d == null ? '' : '${months[d.month - 1]} ${d.year}';
      groups.putIfAbsent(key, () => []).add(t);
    }

    Widget stat(String label, String value, Color color) => Expanded(
      child: PqCard(
        padding: const EdgeInsets.all(14),
        radius: 18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: PqText.caption(c: pq.textMuted)),
            const SizedBox(height: 2),
            Text(value, style: PqText.heading(22, FontWeight.w800, c: color)),
          ],
        ),
      ),
    );

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: PqStagger(
        gap: 20,
        children: [
          PqSegmented<_Filter>(
            values: _Filter.values,
            selected: _filter,
            labelOf:
                (f) => switch (f) {
                  _Filter.all => l.walletHistoryAll,
                  _Filter.earned => l.walletHistoryEarned,
                  _Filter.spent => l.walletHistorySpent,
                },
            onChanged: (f) => setState(() => _filter = f),
          ),
          Row(
            children: [
              stat(
                l.walletEarnedIn(monthIn),
                '+${_iqc(earned)} IQC',
                pq.success,
              ),
              const SizedBox(width: 12),
              stat(l.walletSpentIn(monthIn), '${_iqc(spent)} IQC', pq.text),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            switchInCurve: PqMotion.ease,
            layoutBuilder:
                (cur, prev) => Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.passthrough,
                  children: [...prev, if (cur != null) cur],
                ),
            child:
                list.isEmpty
                    ? PqEmptyState(
                      key: ValueKey('empty-$_filter'),
                      icon: PqIcons.history,
                      title: l.walletNoTransactions,
                    )
                    : Column(
                      key: ValueKey(_filter),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final g in groups.entries) ...[
                          if (g.key != groups.keys.first)
                            const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                            child: Text(
                              g.key.toUpperCase(),
                              style: PqText.overline(c: pq.textMuted),
                            ),
                          ),
                          const SizedBox(height: 8),
                          WalletRowsCard(
                            children: [for (final t in g.value) _TxnRow(t)],
                          ),
                        ],
                      ],
                    ),
          ),
        ],
      ),
    );
  }

  static String _iqc(int uzs) => walletNum(iqcFromUzs(uzs));
}

class _TxnRow extends StatelessWidget {
  const _TxnRow(this.t);

  final WalletTxn t;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final positive = t.deltaUzs >= 0;
    final ref = t.refType.toLowerCase();
    final (PqIcons icon, PqTone tone, String title) = switch (t.type) {
      WalletTxnType.redeem => (
        PqIcons.ticket,
        PqTone.danger,
        l.walletTxnRedeem,
      ),
      WalletTxnType.reversal => (
        PqIcons.undo,
        positive ? PqTone.success : PqTone.danger,
        l.walletTxnReversal,
      ),
      WalletTxnType.adjust => (
        PqIcons.coins,
        positive ? PqTone.info : PqTone.danger,
        l.walletTxnAdjust,
      ),
      WalletTxnType.earn => switch (ref) {
        _ when ref.contains('check') => (
          PqIcons.coin,
          PqTone.info,
          l.walletTxnCheck,
        ),
        _ when ref.contains('recipe') => (
          PqIcons.fileRx,
          PqTone.info,
          l.walletTxnRecipe,
        ),
        _ when ref.contains('survey') => (
          PqIcons.sparkles,
          PqTone.success,
          l.walletTxnSurvey,
        ),
        _ when ref.contains('quest') => (
          PqIcons.trophy,
          PqTone.success,
          l.walletTxnQuest,
        ),
        _ when ref.contains('lesson') || ref.contains('course') => (
          PqIcons.play,
          PqTone.info,
          l.walletTxnCourse,
        ),
        _ => (PqIcons.coin, PqTone.info, l.walletTxnOther),
      },
    };
    final date = walletShortDate(t.createdAt);
    final note = t.note?.trim();
    final amount = walletNum(iqcFromUzs(t.deltaUzs.abs()));
    return PqListRow(
      icon: icon,
      tone: tone,
      title: title,
      subtitle: note == null || note.isEmpty ? date : '$note · $date',
      value: positive ? '+$amount IQC' : '−$amount IQC',
      valueTone: positive ? tone : PqTone.danger,
      valueCaption: positive ? l.walletAccrued : l.walletDebited,
    );
  }
}

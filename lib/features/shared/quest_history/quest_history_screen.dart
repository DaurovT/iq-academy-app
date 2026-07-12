import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/format.dart';
import '../../../core/models/quest.dart';
import '../../../widgets/async_view.dart';
import '../../pharmacist/providers.dart';

/// История участия в квестах. Перенесена один в один из макета Figma
/// «quests-history».
class QuestHistoryScreen extends ConsumerWidget {
  const QuestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _QH.of(context);
    final items = ref.watch(questParticipationsProvider);

    return Scaffold(
      backgroundColor: c.page,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // top-app-bar
            SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => context.canPop()
                          ? context.pop()
                          : context.go('/app/quests'),
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(Icons.chevron_left, size: 24, color: c.muted),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('История участия',
                        style: TextStyle(fontSize: 16, color: c.muted)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async =>
                    ref.invalidate(questParticipationsProvider),
                child: AsyncView(
                  value: items,
                  onRetry: () => ref.invalidate(questParticipationsProvider),
                  data: (list) => list.isEmpty
                      ? ListView(children: const [
                          SizedBox(
                              height: 320,
                              child: EmptyState(text: 'История пуста')),
                        ])
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (_, i) =>
                              _Row(c: c, p: list[i], last: i == list.length - 1),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.c, required this.p, required this.last});
  final _QH c;
  final QuestParticipation p;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final isVoucher = p.rewardType == RewardType.voucher;
    return Column(
      children: [
        SizedBox(
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: c.iconBg, borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.emoji_events_outlined,
                      size: 20, color: c.muted),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(p.questName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: c.text)),
                      const SizedBox(height: 4),
                      Text(formatDate(p.completedAt),
                          style: TextStyle(fontSize: 12, color: c.muted)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Pill(
                      text: isVoucher ? 'Ваучер' : 'IQC',
                      bg: isVoucher
                          ? const Color(0xFFF59E0B)
                          : const Color(0xFF7C3AED),
                      fg: isVoucher ? const Color(0xFF0D1117) : Colors.white,
                    ),
                    const SizedBox(height: 4),
                    _Pill(
                      text: isVoucher ? 'Активен' : 'Выполнен',
                      bg: const Color(0xFF22C55E),
                      fg: const Color(0xFF0D1117),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (!last) Container(height: 1, color: c.divider),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, required this.bg, required this.fg});
  final String text;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Text(text,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: fg)),
    );
  }
}

class _QH {
  const _QH({
    required this.page,
    required this.iconBg,
    required this.text,
    required this.muted,
    required this.divider,
  });

  final Color page;
  final Color iconBg;
  final Color text;
  final Color muted;
  final Color divider;

  static _QH of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _QH(
    page: Color(0xFF0D1117),
    iconBg: Color(0xFF151B2A),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF8F909A),
    divider: Color(0xFF1F2530),
  );

  static const _light = _QH(
    page: Color(0xFFF5F6FA),
    iconBg: Color(0xFFF2F4F7),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    divider: Color(0xFFEBEDF0),
  );
}

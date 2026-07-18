import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/format.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/quest.dart';
import '../../../widgets/async_view.dart';
import '../../pharmacist/providers.dart';
import '../widgets/screen_decor.dart';

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
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(questHistoryDecor)),
          SafeArea(
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
                            child:
                                Icon(Icons.arrow_back, size: 22, color: c.text),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(context.l10n.questHistoryTitle,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: c.text)),
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
                          ? ListView(children: [
                              SizedBox(
                                  height: 320,
                                  child: EmptyState(
                                      text: context.l10n.questHistoryEmpty)),
                            ])
                          : ListView.builder(
                              padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                              itemCount: list.length,
                              itemBuilder: (_, i) => _Row(c: c, p: list[i]),
                            ),
                    ),
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

class _Row extends StatelessWidget {
  const _Row({required this.c, required this.p});
  final _QH c;
  final QuestParticipation p;

  @override
  Widget build(BuildContext context) {
    final isVoucher = p.rewardType == RewardType.voucher;
    return Container(
      height: 72,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.cardBorder),
        boxShadow: c.shadow,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: c.iconBg, borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.emoji_events_outlined, size: 20, color: c.accent),
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
                        fontWeight: FontWeight.w600,
                        color: c.text)),
                const SizedBox(height: 4),
                Text(formatDate(p.completedAt),
                    style: TextStyle(fontSize: 12, color: c.date)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Pill(
                text: isVoucher ? context.l10n.questHistoryVoucher : 'IQC',
                bg: isVoucher
                    ? const Color(0xFF7C3AED)
                    : const Color(0xFFF59E0B),
                fg: Colors.white,
              ),
              const SizedBox(height: 4),
              _Pill(
                text: isVoucher
                    ? context.l10n.questHistoryActive
                    : context.l10n.questHistoryDone,
                bg: isVoucher ? c.activeBg : c.doneBg,
                fg: isVoucher ? c.activeText : c.doneText,
              ),
            ],
          ),
        ],
      ),
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
    required this.card,
    required this.cardBorder,
    required this.iconBg,
    required this.accent,
    required this.text,
    required this.date,
    required this.activeBg,
    required this.activeText,
    required this.doneBg,
    required this.doneText,
    required this.shadow,
  });

  final Color page;
  final Color card;
  final Color cardBorder;
  final Color iconBg;
  final Color accent;
  final Color text;
  final Color date;
  final Color activeBg;
  final Color activeText;
  final Color doneBg;
  final Color doneText;
  final List<BoxShadow> shadow;

  static _QH of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _QH(
    page: Color(0xFF0D1117),
    card: Color(0xFF151B2A),
    cardBorder: Color(0xFF1F2530),
    iconBg: Color(0xFF1B2436),
    accent: Color(0xFF6B9EF5),
    text: Color(0xFFE4E2ED),
    date: Color(0xFF8F909A),
    activeBg: Color(0xFF14421E),
    activeText: Color(0xFF79D384),
    doneBg: Color(0xFF1A3566),
    doneText: Color(0xFFA0C4FF),
    shadow: [],
  );

  static const _light = _QH(
    page: Color(0xFFF5F6FA),
    card: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFEBEDF0),
    iconBg: Color(0xFFEEF2FF),
    accent: Color(0xFF2563EB),
    text: Color(0xFF1A1D26),
    date: Color(0xFF9CA3AF),
    activeBg: Color(0xFFECFDF5),
    activeText: Color(0xFF059669),
    doneBg: Color(0xFFEFF6FF),
    doneText: Color(0xFF2563EB),
    shadow: [
      BoxShadow(
          color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
    ],
  );
}

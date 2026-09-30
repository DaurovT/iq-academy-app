import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/sapper.dart';
import '../../widgets/pq_states.dart';
import 'sapper_widgets.dart';

/// Итоги розыгрыша (макет SapperResult): конфетти pqFall при выигрыше,
/// баннер pqPop .5s после .2s, поле с переворотом клеток pqFlip .45s
/// каскадом по диагонали (.35s + 40 мс × (строка + столбец)), легенда,
/// победители и закреплённая кнопка «новая акция».
class SapperResultView extends StatelessWidget {
  const SapperResultView({
    super.key,
    required this.field,
    required this.onRefresh,
    required this.onPlayNew,
  });

  final SapperField field;
  final Future<void> Function() onRefresh;
  final VoidCallback onPlayNew;

  // Детали конфетти из макета: (left, цвет, длительность, задержка).
  static const _confetti = [
    (40.0, Color(0xFFFBBF24), 2600, 200),
    (90.0, Color(0xFFA78BFA), 2200, 500),
    (150.0, Color(0xFF6B9EF5), 2800, 100),
    (210.0, Color(0xFFF472B6), 2400, 600),
    (260.0, Color(0xFFFBBF24), 2100, 300),
    (320.0, Color(0xFF79D384), 2700, 400),
    (370.0, Color(0xFFA78BFA), 2300, 150),
  ];

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final f = field;
    final colors = SapperCellColors.of(pq);
    final occ = <int, bool>{for (final o in f.occupied) o.index: o.mine};
    for (final c in f.myCells) {
      occ[c] = true;
    }
    final myCount = occ.values.where((m) => m).length;
    final prizeByCell = <int, SapperRevealPrize>{for (final p in f.prizes) p.index: p};
    final won = f.prizes.where((p) => p.wonByMe).toList();
    final prizeTotal = f.prizes.isNotEmpty
        ? f.prizes.length
        : f.legend.fold<int>(0, (s, p) => s + p.count);
    final cols = f.cols > 0 ? f.cols : 8;
    final width = MediaQuery.sizeOf(context).width;

    // Победители: «вы» — первым.
    bool isMe(SapperWinner w) => occ[w.index] == true || (prizeByCell[w.index]?.wonByMe ?? false);
    final winners = [...f.winners]..sort((a, b) => (isMe(b) ? 1 : 0) - (isMe(a) ? 1 : 0));

    return Stack(children: [
      Positioned.fill(
        child: PqRefresh(
          onRefresh: onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(16, 0, 16, sapperStickyClearance(context, 140)),
            children: [
              PqAnimate(
                fx: PqFx.pop,
                delay: const Duration(milliseconds: 200),
                child: _OutcomeBanner(won: won, myCount: myCount, colors: colors),
              ),
              const SizedBox(height: 16),
              _RevealedCard(f: f, prizeTotal: prizeTotal),
              const SizedBox(height: 16),
              SapperGrid(
                cols: cols,
                count: f.cellCount,
                semanticLabel: l10n.sapperGridRevealed,
                cellBuilder: (i, size) => PqAnimate(
                  fx: PqFx.flip,
                  duration: const Duration(milliseconds: 450),
                  delay: Duration(milliseconds: 350 + 40 * (i ~/ cols + i % cols)),
                  child: _ResultCell(
                    colors: colors,
                    prize: prizeByCell[i],
                    mine: occ[i] == true,
                    theirs: occ.containsKey(i) && occ[i] != true,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SapperFieldLegend(items: [
                (colors.mine, colors.mine, l10n.sapperLegendMine),
                (colors.theirs, colors.theirs, l10n.sapperLegendTheirs),
                (colors.empty, colors.freeBorder, l10n.sapperLegendEmpty),
                (colors.iqc, colors.iqc, 'IQC'),
                (colors.voucher, colors.voucher, l10n.sapperLegendVoucher),
              ]),
              if (winners.isNotEmpty) ...[
                const SizedBox(height: 24),
                Text(l10n.sapperWinners, style: PqText.section(c: pq.text)),
                const SizedBox(height: 8),
                PqCard(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: Column(children: [
                    for (var i = 0; i < winners.length; i++)
                      _WinnerRow(
                        w: winners[i],
                        me: isMe(winners[i]),
                        last: i == winners.length - 1,
                      ),
                  ]),
                ),
              ],
            ],
          ),
        ),
      ),
      if (won.isNotEmpty)
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: 600,
          child: ClipRect(
            child: PqConfetti(pieces: [
              for (final c in _confetti)
                PqConfettiPiece(
                  left: c.$1 * width / 414,
                  color: c.$2,
                  duration: Duration(milliseconds: c.$3),
                  delay: Duration(milliseconds: c.$4),
                  width: 8,
                  height: 12,
                  radius: 2,
                  linear: true,
                ),
            ]),
          ),
        ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: SapperStickyBottom(children: [
          PqButton(label: l10n.sapperPlayNew, icon: PqIcons.grid, onPressed: onPlayNew),
        ]),
      ),
    ]);
  }
}

/// Баннер исхода: выигрыш — зелёный (кубок на янтарной плитке 52);
/// без приза — нейтральная карточка.
class _OutcomeBanner extends StatelessWidget {
  const _OutcomeBanner({required this.won, required this.myCount, required this.colors});

  final List<SapperRevealPrize> won;
  final int myCount;
  final SapperCellColors colors;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final win = won.isNotEmpty;
    final title = win
        ? l10n.sapperWonTitle(won.map((p) => sapperPrizeText(p.label)).join(', '))
        : l10n.sapperNoWin;
    final subtitle = win
        ? l10n.sapperWonText(won.length, myCount)
        : myCount > 0
            ? l10n.sapperMyCellsCount(myCount)
            : l10n.sapperNotParticipated;
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: win ? pq.successSoft : pq.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: win ? pq.success : pq.border),
          boxShadow: win ? null : pq.cardShadow,
        ),
        child: Row(children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: win ? colors.iqc : pq.surfaceAlt,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: PqIcon(win ? PqIcons.trophy : PqIcons.grid,
                size: 26, color: win ? colors.iqcFg : pq.textMuted),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: PqText.title(c: win ? pq.success : pq.text)),
              const SizedBox(height: 2),
              Text(subtitle, style: PqText.text(14, FontWeight.w400, c: pq.textSecondary)),
            ]),
          ),
        ]),
      ),
    );
  }
}

/// «29 июня» (для языков без данных intl — «29.06.2026»).
String _dayMonth(String iso, String locale) {
  final d = DateTime.tryParse(iso);
  if (d == null || !DateFormat.localeExists(locale)) return formatDate(iso);
  try {
    return DateFormat.MMMMd(locale).format(d.toLocal());
  } catch (_) {
    return formatDate(iso);
  }
}

/// «ПОЛЕ ВСКРЫТО · дата» + число призов + состав призов на градиенте.
class _RevealedCard extends StatelessWidget {
  const _RevealedCard({required this.f, required this.prizeTotal});

  final SapperField f;
  final int prizeTotal;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final title = f.revealAt == null
        ? l10n.sapperRevealed
        : l10n.sapperRevealedOn(_dayMonth(f.revealAt!, l10n.localeName));
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: sapperGradient(pq),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Expanded(
            child: Text(title.toUpperCase(),
                style: PqText.text(12, FontWeight.w700, ls: 1, c: Colors.white)),
          ),
          if (prizeTotal > 0) ...[
            const SizedBox(width: 8),
            SapperGlassPill(l10n.sapperPrizesCount(prizeTotal), icon: PqIcons.gift),
          ],
        ]),
        if (f.legend.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final p in f.legend) SapperPrizeChip(count: p.count, label: p.label),
          ]),
        ],
      ]),
    );
  }
}

/// Открытая клетка: приз IQC (сумма) / ваучер (билет) / моя (галочка) /
/// чужая (человек) / пустая. Мой выигрыш — рамка 3 акцентом + свечение.
class _ResultCell extends StatelessWidget {
  const _ResultCell({
    required this.colors,
    required this.prize,
    required this.mine,
    required this.theirs,
  });

  final SapperCellColors colors;
  final SapperRevealPrize? prize;
  final bool mine;
  final bool theirs;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    Color bg = colors.empty, fg = colors.theirsFg;
    Border? border = Border.all(color: colors.freeBorder);
    List<BoxShadow>? shadow;
    Widget? child;
    var label = l10n.sapperCellEmpty;
    final p = prize;
    if (p != null) {
      final voucher = sapperIsVoucher(p.label);
      bg = voucher ? colors.voucher : colors.iqc;
      fg = voucher ? colors.voucherFg : colors.iqcFg;
      border = null;
      final amount = voucher ? null : sapperPrizeAmount(p.label);
      child = amount != null
          ? Text(amount,
              maxLines: 1,
              style: PqText.heading(14, FontWeight.w800, height: 1, c: fg))
          : PqIcon(voucher ? PqIcons.ticket : PqIcons.coins, size: 18, color: fg);
      label = l10n.sapperCellPrize(p.label);
      if (p.wonByMe || mine) {
        label = '${l10n.sapperCellMine}, $label';
      }
      if (p.wonByMe) {
        border = Border.all(color: colors.mine, width: 3);
        shadow = [
          const BoxShadow(color: Color(0xCCFBBF24), blurRadius: 18, spreadRadius: 2),
          BoxShadow(color: pq.bg, spreadRadius: 3),
        ];
      }
    } else if (mine) {
      bg = colors.mine;
      fg = colors.mineFg;
      border = Border.all(color: colors.mine);
      child = PqIcon(PqIcons.check, size: 18, color: fg);
      label = '${l10n.sapperCellMine}, ${l10n.sapperCellEmpty.toLowerCase()}';
    } else if (theirs) {
      bg = colors.theirs;
      border = Border.all(color: colors.theirs);
      child = PqIcon(PqIcons.user, size: 16, color: fg);
      label = l10n.sapperCellTheirs;
    }
    return Semantics(
      label: label,
      child: ExcludeSemantics(
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
            border: border,
            boxShadow: shadow,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

/// Строка победителя: аватар 40 с инициалами (мой — акцентный), имя 16/600,
/// подпись 14, приз 16/700 фиолетовым.
class _WinnerRow extends StatelessWidget {
  const _WinnerRow({required this.w, required this.me, required this.last});

  final SapperWinner w;
  final bool me;
  final bool last;

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    return parts.take(2).map((p) => p.characters.first.toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: pq.divider)),
      ),
      child: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: me ? pq.accent : pq.surfaceAlt,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(_initials(w.name),
              style: PqText.text(14, FontWeight.w700,
                  c: me ? pq.onAccent : pq.textSecondary)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(w.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.text(16, FontWeight.w600, c: pq.text)),
            Text(me ? l10n.sapperWinnerYou : l10n.sapperWinnerCell(w.index + 1),
                style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
          ]),
        ),
        const SizedBox(width: 12),
        Text(sapperPrizeText(w.label),
            style: PqText.text(16, FontWeight.w700, c: sapperPurple(pq))),
      ]),
    );
  }
}

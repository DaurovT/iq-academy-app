import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/sapper.dart';
import '../../widgets/pq_states.dart';
import '../pharmacist/providers.dart' show walletProvider;
import 'mini_apps_screens.dart' show sapperFieldProvider;
import 'sapper_result_view.dart';
import 'sapper_widgets.dart';

// ── Игровое поле (макет SapperGame) и итоги (макет SapperResult) ──────────────
class SapperGameScreen extends ConsumerStatefulWidget {
  const SapperGameScreen({super.key, required this.id});
  final int id;
  @override
  ConsumerState<SapperGameScreen> createState() => _SapperGameScreenState();
}

class _SapperGameScreenState extends ConsumerState<SapperGameScreen> {
  Timer? _tick;
  Timer? _toastTimer;
  bool _busy = false;
  int _ticks = 0;

  /// Выбранные, но ещё не занятые клетки (pqSel).
  final Set<int> _sel = {};

  /// Подтверждение «+N клеток — ждём итогов» над кнопкой.
  String? _toast;
  int _toastId = 0;

  @override
  void initState() {
    super.initState();
    // Тикаем таймер обратного отсчёта. Плюс, когда время вскрытия наступило, сервер
    // вскрывает автоматически (loop ~20с) — раз в 10с перезапрашиваем поле, чтобы экран
    // сам перешёл в «Вскрыт» без ручного обновления (раньше «застревал» на отсчёте).
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {});
      _ticks++;
      final f = ref.read(sapperFieldProvider(widget.id)).asData?.value;
      if (f != null && !f.revealed && _ticks % 10 == 0) {
        final t = f.revealAt == null ? null : DateTime.tryParse(f.revealAt!);
        if (t != null && t.difference(DateTime.now()).inSeconds <= 0) {
          ref.invalidate(sapperFieldProvider(widget.id));
        }
      }
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    _toastTimer?.cancel();
    super.dispose();
  }

  void _backToDraws() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/app/sapper');
    }
  }

  void _showToast(String text) {
    _toastTimer?.cancel();
    setState(() {
      _toast = text;
      _toastId++;
    });
    _toastTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() => _toast = null);
    });
  }

  void _toggle(int cell) {
    setState(() {
      _toast = null;
      if (!_sel.remove(cell)) _sel.add(cell);
    });
  }

  // Нехватка IQC — вместо ошибки с сервера показываем понятный блокер
  // с предложением заработать IQC (обучение / квест / опрос).
  Future<void> _notEnoughIqc(SapperField f, int total) async {
    final l10n = context.l10n;
    final pq = context.pq;
    await showPqSheet<void>(
      context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: PqAnimate(
              fx: PqFx.pop,
              child: PqIconTile(PqIcons.coins,
                  tone: PqTone.warning, size: 64, radius: 20, iconSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Text(l10n.sapperNoIqcTitle,
              textAlign: TextAlign.center, style: PqText.sheetTitle(c: pq.text)),
          const SizedBox(height: 8),
          Text(l10n.sapperNoIqcBody(total, f.balanceIqc),
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textMuted)),
          const SizedBox(height: 24),
          PqButton(
            label: l10n.navQuests,
            icon: PqIcons.target,
            onPressed: () {
              Navigator.pop(ctx);
              context.go('/app/quests');
            },
          ),
          const SizedBox(height: 8),
          PqButton(
            label: l10n.navLearn,
            icon: PqIcons.graduationCap,
            kind: PqButtonKind.secondary,
            onPressed: () {
              Navigator.pop(ctx);
              context.go('/app/learn');
            },
          ),
          const SizedBox(height: 4),
          PqButton(
            label: l10n.commonCancel,
            kind: PqButtonKind.text,
            onPressed: () => Navigator.pop(ctx),
          ),
        ],
      ),
    );
  }

  /// Подтверждение списания + принятие правил акции (ссылка на правила
  /// обязательна до участия — App Store 5.3 / Google Play).
  Future<bool> _confirm(int n, int total) async {
    final l10n = context.l10n;
    final pq = context.pq;
    final ok = await showPqSheet<bool>(
      context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: PqAnimate(
              fx: PqFx.pop,
              child: PqIconTile(PqIcons.grid, size: 64, radius: 20, iconSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Text(l10n.sapperReserveManyTitle(n),
              textAlign: TextAlign.center, style: PqText.sheetTitle(c: pq.text)),
          const SizedBox(height: 8),
          Text(l10n.sapperReserveBody(total),
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textMuted)),
          const SizedBox(height: 12),
          Text(l10n.sapperRulesAccept,
              textAlign: TextAlign.center, style: PqText.caption(c: pq.textMuted)),
          PqButton(
            label: l10n.sapperRulesButton,
            kind: PqButtonKind.text,
            icon: PqIcons.fileText,
            onPressed: () {
              Navigator.pop(ctx, false);
              context.push('/app/sapper-rules');
            },
          ),
          const SizedBox(height: 12),
          PqButton(
            label: l10n.sapperReserveConfirm(total),
            onPressed: () => Navigator.pop(ctx, true),
          ),
          const SizedBox(height: 8),
          PqButton(
            label: l10n.commonCancel,
            kind: PqButtonKind.secondary,
            onPressed: () => Navigator.pop(ctx, false),
          ),
        ],
      ),
    );
    return ok ?? false;
  }

  Future<void> _buy(SapperField f) async {
    if (_busy || _sel.isEmpty) return;
    final cells = _sel.toList()..sort();
    final total = cells.length * f.priceIqc;
    // При нехватке IQC — понятный экран с предложением заработать, а не 400-ошибка.
    if (f.balanceIqc < total) {
      await _notEnoughIqc(f, total);
      return;
    }
    if (!await _confirm(cells.length, total)) return;
    if (!mounted) return;
    setState(() => _busy = true);
    final api = ref.read(apiProvider).sapper;
    var done = 0;
    Object? error;
    // API занимает по одной клетке — отправляем выбранные по очереди.
    for (final cell in cells) {
      try {
        await api.reserve(widget.id, cell);
        done++;
        _sel.remove(cell);
      } catch (e) {
        error = e;
        break;
      }
    }
    if (!mounted) return;
    setState(() => _busy = false);
    if (done > 0) {
      _showToast(context.l10n.sapperTakenToast(done));
      ref.invalidate(walletProvider);
    }
    ref.invalidate(sapperFieldProvider(widget.id));
    if (error != null) {
      showPqToast(context, '$error'.replaceFirst('Exception: ', ''), tone: PqTone.danger);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final v = ref.watch(sapperFieldProvider(widget.id));
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        SapperBackLink(label: l10n.sapperTitle, onTap: _backToDraws),
        Expanded(
          child: PqAsync<SapperField>(
            value: v,
            onRetry: () => ref.invalidate(sapperFieldProvider(widget.id)),
            loading: PqLoadingKind.spinner,
            data: (f) => f.revealed
                ? SapperResultView(
                    field: f,
                    onRefresh: () => ref.refresh(sapperFieldProvider(widget.id).future),
                    onPlayNew: () => context.pushReplacement('/app/sapper'),
                  )
                : _buildField(context, f),
          ),
        ),
      ]),
    );
  }

  Widget _buildField(BuildContext context, SapperField f) {
    final pq = context.pq;
    final l10n = context.l10n;
    final colors = SapperCellColors.of(pq);
    final occ = <int, bool>{for (final o in f.occupied) o.index: o.mine};
    for (final c in f.myCells) {
      occ[c] = true;
    }
    // Клетки, занятые с момента выбора (своими или чужими), из выбора убираем.
    _sel.removeWhere((c) => occ.containsKey(c) || c >= f.cellCount);
    final acceptClosed = f.acceptingUntil != null &&
        (DateTime.tryParse(f.acceptingUntil!)?.isBefore(DateTime.now()) ?? false);
    final canSelect = f.status == 'active' && !acceptClosed;
    final n = _sel.length;
    final total = n * f.priceIqc;
    final rows = f.cols > 0 ? (f.cellCount / f.cols).ceil() : 0;

    final hint = !canSelect
        ? l10n.sapperAcceptClosed
        : n > 0
            ? l10n.sapperSelectedHint(n, total)
            : l10n.sapperSelectHint;

    return Stack(children: [
      Positioned.fill(
        child: PqRefresh(
          onRefresh: () => ref.refresh(sapperFieldProvider(widget.id).future),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(16, 0, 16, sapperStickyClearance(context, 150)),
            children: [
              _HiddenPrizesCard(f: f),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                  child: _StatTile(
                    label: l10n.sapperYourBalance,
                    value: '${f.balanceIqc}',
                    suffix: 'IQC',
                    suffixColor: sapperPurple(pq),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatTile(
                    label: l10n.sapperOccupiedTitle,
                    value: '${occ.length}',
                    suffix: l10n.sapperOfTotal(f.cellCount),
                    suffixColor: pq.textMuted,
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              SapperGrid(
                cols: f.cols,
                count: f.cellCount,
                semanticLabel: l10n.sapperGridLabel(f.cols, rows),
                cellBuilder: (i, size) {
                  final mine = occ[i] == true;
                  final theirs = occ.containsKey(i) && !mine;
                  final sel = _sel.contains(i);
                  return _GameCell(
                    colors: colors,
                    mine: mine,
                    theirs: theirs,
                    selected: sel,
                    onTap: canSelect && !_busy && !mine && !theirs ? () => _toggle(i) : null,
                  );
                },
              ),
              const SizedBox(height: 16),
              SapperFieldLegend(items: [
                (colors.sel, colors.selBorder, l10n.sapperLegendSelected),
                (colors.mine, colors.mine, l10n.sapperLegendMine),
                (colors.theirs, colors.theirs, l10n.sapperLegendOccupied),
                (colors.free, colors.freeBorder, l10n.sapperLegendFree),
              ]),
            ],
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: SapperStickyBottom(children: [
          Text(hint, textAlign: TextAlign.center, style: PqText.body(c: pq.textMuted)),
          PqButton(
            label: n > 0 ? l10n.sapperTakeCta(n, total) : l10n.sapperStep1Title,
            icon: PqIcons.grid,
            loading: _busy,
            onPressed: canSelect && n > 0 ? () => _buy(f) : null,
          ),
        ]),
      ),
      if (_toast != null)
        Positioned(
          left: 16,
          right: 16,
          bottom: sapperStickyClearance(context, 124),
          child: PqAnimate(
            key: ValueKey(_toastId),
            fx: PqFx.toast,
            child: _GameToast(text: _toast!),
          ),
        ),
    ]);
  }
}

/// «НА ПОЛЕ СПРЯТАНО» + время до итогов + состав призов на градиенте.
class _HiddenPrizesCard extends StatelessWidget {
  const _HiddenPrizesCard({required this.f});

  final SapperField f;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: sapperGradient(pq),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Expanded(
            child: Text(l10n.sapperHiddenTitle.toUpperCase(),
                style: PqText.text(12, FontWeight.w700, ls: 1, c: Colors.white)),
          ),
          const SizedBox(width: 8),
          SapperGlassPill(sapperResultsPill(l10n, f.revealAt), icon: PqIcons.clock),
        ]),
        const SizedBox(height: 12),
        if (f.legend.isEmpty)
          Text(l10n.sapperNoPrizes,
              style: PqText.body(c: Colors.white.withValues(alpha: .8)))
        else
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final p in f.legend) SapperPrizeChip(count: p.count, label: p.label),
          ]),
      ]),
    );
  }
}

/// Плитка показателя: подпись 12 + число Onest 20/800 с суффиксом 14.
class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.label,
    required this.value,
    required this.suffix,
    required this.suffixColor,
  });

  final String label;
  final String value;
  final String suffix;
  final Color suffixColor;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: pq.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: pq.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: PqText.caption(c: pq.textMuted)),
        const SizedBox(height: 2),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: '$value '),
            TextSpan(text: suffix, style: TextStyle(fontSize: 14, color: suffixColor)),
          ]),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PqText.heading(20, FontWeight.w800, c: pq.text),
        ),
      ]),
    );
  }
}

/// Клетка активного поля: свободная / чужая (человек) / моя (галочка) /
/// выбранная (галочка, рамка 2 и пульс pqSel 1.6s). Смена фона — .2s.
class _GameCell extends StatelessWidget {
  const _GameCell({
    required this.colors,
    required this.mine,
    required this.theirs,
    required this.selected,
    required this.onTap,
  });

  final SapperCellColors colors;
  final bool mine;
  final bool theirs;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Color bg = colors.free, border = colors.freeBorder, fg = colors.theirsFg;
    double bw = 1;
    PqIcons? icon;
    double iconSize = 18;
    String label = l10n.sapperCellFree;
    if (theirs) {
      bg = colors.theirs;
      border = colors.theirs;
      icon = PqIcons.user;
      label = l10n.sapperCellTheirs;
    }
    if (mine) {
      bg = colors.mine;
      border = colors.mine;
      fg = colors.mineFg;
      icon = PqIcons.check;
      iconSize = 20;
      label = l10n.sapperCellMine;
    }
    if (selected) {
      bg = colors.sel;
      border = colors.selBorder;
      bw = 2;
      fg = colors.selFg;
      icon = PqIcons.check;
      label = l10n.sapperCellSelected;
    }
    final radius = BorderRadius.circular(10);
    Widget cell = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: radius,
        border: Border.all(color: border, width: bw),
      ),
      alignment: Alignment.center,
      child: icon == null ? null : PqIcon(icon, size: iconSize, color: fg),
    );
    if (selected) cell = PqPulseRing.select(borderRadius: radius, child: cell);
    return PqPressable(
      onTap: onTap,
      scale: .94,
      semanticLabel: label,
      child: ExcludeSemantics(child: cell),
    );
  }
}

/// Подтверждение над кнопкой (pqToast .35s): инверсная плашка с зелёной галочкой.
class _GameToast extends StatelessWidget {
  const _GameToast({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: pq.chipActiveBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80000000),
              offset: Offset(0, 16),
              blurRadius: 32,
              spreadRadius: -12,
            ),
          ],
        ),
        child: Row(children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(color: Color(0xFF22C55E), shape: BoxShape.circle),
            alignment: Alignment.center,
            child: const PqIcon(PqIcons.check, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text,
                style: PqText.text(15, FontWeight.w600,
                    c: pq.isDark ? pq.chipActiveText : pq.bg)),
          ),
        ]),
      ),
    );
  }
}

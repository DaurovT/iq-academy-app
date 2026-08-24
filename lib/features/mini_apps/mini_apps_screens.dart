import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/sapper.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/async_view.dart';
import '../pharmacist/providers.dart' show walletProvider;
import '../shared/widgets/pharm_top_bar.dart';

final miniAppsProvider = FutureProvider<List<MiniApp>>((ref) => ref.watch(apiProvider).miniApps.list());
final sapperDrawsProvider = FutureProvider<List<SapperDrawItem>>((ref) => ref.watch(apiProvider).sapper.draws());
final sapperFieldProvider = FutureProvider.family<SapperField, int>((ref, id) => ref.watch(apiProvider).sapper.field(id));

String _countdown(AppLocalizations l10n, String? iso) {
  if (iso == null) return '';
  final t = DateTime.tryParse(iso);
  if (t == null) return '';
  final ms = t.difference(DateTime.now()).inSeconds;
  if (ms <= 0) return l10n.sapperCountdownSoon;
  final d = ms ~/ 86400, h = (ms % 86400) ~/ 3600, m = (ms % 3600) ~/ 60, s = ms % 60;
  if (d > 0) return l10n.sapperCountdownDaysHours(d, h);
  if (h > 0) return l10n.sapperCountdownHoursMinutes(h, m);
  return l10n.sapperCountdownMinutesSeconds(m, s);
}

// Текст пилюли времени. До вскрытия — «вскрытие через …». Когда время уже наступило
// (сервер вскроет в течение ~20с) — короткое «Скоро», без кривого «вскрытие через скоро».
String _revealPill(AppLocalizations l10n, String? iso) {
  final t = iso == null ? null : DateTime.tryParse(iso);
  if (t == null || t.difference(DateTime.now()).inSeconds <= 0) return l10n.miniAppsSoon;
  return l10n.sapperRevealIn(_countdown(l10n, iso));
}

// ── Хаб мини-приложений ───────────────────────────────────────────────────────
// Перенесён 1:1 из макета Figma (mini-apps-screen, ноды 209:4 / 209:138):
// топбар, заголовок «Мини-приложения» + подзаголовок, карточки игр.
class MiniAppsHubScreen extends ConsumerWidget {
  const MiniAppsHubScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);
    final v = ref.watch(miniAppsProvider);
    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: AsyncView<List<MiniApp>>(
              value: v,
              onRetry: () => ref.invalidate(miniAppsProvider),
              data: (apps) => ListView(
                padding: const EdgeInsets.fromLTRB(16, 28, 16, 100),
                children: [
                  Text(
                    context.l10n.miniAppsTitle,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: p.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    context.l10n.miniAppsSubtitle,
                    style: const TextStyle(fontSize: 15, color: Color(0xFF6B6C78)),
                  ),
                  const SizedBox(height: 32),
                  for (final a in apps) ...[
                    _AppCard(app: a),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  const _AppCard({required this.app});
  final MiniApp app;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final available = app.available;
    final titleColor =
        isDark ? const Color(0xFFE4E2ED) : const Color(0xFF0F0F14);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: available && app.key == 'sapper'
            ? () => context.push('/app/sapper')
            : null,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: isDark
                  ? const [Color(0xFF1C2033), Color(0xFF2A2B36)]
                  : const [Color(0xFFFFFFFF), Color(0xFFF5F6FA)],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isDark
                    ? const Color(0x17FFFFFF)
                    : const Color(0xFFE0E2E8)),
            boxShadow: isDark
                ? const [
                    BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 20,
                        offset: Offset(0, 4)),
                  ]
                : const [
                    BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 14,
                        offset: Offset(0, 12)),
                    BoxShadow(
                        color: Color(0x12000000),
                        blurRadius: 5,
                        offset: Offset(0, 2)),
                  ],
          ),
          child: Row(
            children: [
              _IconBox(isDark: isDark, appKey: app.key),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            app.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: titleColor,
                            ),
                          ),
                        ),
                        if (!available) ...[
                          const SizedBox(width: 8),
                          _SoonPill(isDark: isDark),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      app.subtitle,
                      style: const TextStyle(
                          fontSize: 13, height: 1.4, color: Color(0xFF6B6C78)),
                    ),
                  ],
                ),
              ),
              if (available)
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('›',
                      style: TextStyle(fontSize: 24, color: Color(0xFF6B6C78))),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Иконка-плитка 48×48 для карточки игры (подарок для Сапёра, звезда для «Скоро»).
class _IconBox extends StatelessWidget {
  const _IconBox({required this.isDark, required this.appKey});
  final bool isDark;
  final String appKey;

  @override
  Widget build(BuildContext context) {
    final isSapper = appKey == 'sapper';
    final gradient = isSapper
        ? (isDark
            ? const [Color(0x12FFFFFF), Color(0x08FFFFFF)]
            : const [Color(0xFFFFFFFF), Color(0xFFFFFFFF)])
        : (isDark
            ? const [Color(0xFF2A2614), Color(0xFF1C1A0E)]
            : const [Color(0xFFFDFBF3), Color(0xFFFFFFFF)]);
    final border = isSapper
        ? (isDark ? const Color(0x14FFFFFF) : const Color(0xFFE0E2E8))
        : const Color(0x30D4AF37);
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: isSapper
          ? const Text('🎁', style: TextStyle(fontSize: 26))
          : const Icon(Icons.auto_awesome, size: 24, color: Color(0xFFF5C842)),
    );
  }
}

/// Пилюля «Скоро» рядом с названием недоступной игры.
class _SoonPill extends StatelessWidget {
  const _SoonPill({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2A2B36) : const Color(0xFFF0F1F5),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
            color: isDark ? const Color(0x14FFFFFF) : const Color(0xFFE0E2E8)),
      ),
      child: Text(
        context.l10n.miniAppsSoon,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6B6C78)),
      ),
    );
  }
}


// ── Список розыгрышей ─────────────────────────────────────────────────────────
// Перенесён 1:1 из макета Figma (sapper-intro, ноды 209:261 / 213:455):
// топбар, back, заголовок, промо-карточка розыгрыша с кнопкой «Перейти к игре».
class SapperDrawsScreen extends ConsumerWidget {
  const SapperDrawsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);
    final v = ref.watch(sapperDrawsProvider);
    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(sapperDrawsProvider),
              child: AsyncView<List<SapperDrawItem>>(
                value: v,
                onRetry: () => ref.invalidate(sapperDrawsProvider),
                data: (draws) => ListView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                  children: [
                    _BackLink(
                        label: context.l10n.miniAppsTitle,
                        onTap: () => _back(context, '/app/mini-apps')),
                    const SizedBox(height: 24),
                    Text(context.l10n.sapperTitle,
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: p.textPrimary)),
                    const SizedBox(height: 8),
                    Text(
                        context.l10n.sapperSubtitle,
                        style: TextStyle(
                            fontSize: 16, height: 1.4, color: p.textMuted)),
                    const SizedBox(height: 24),
                    if (draws.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                            child: Text(context.l10n.sapperNoDraws,
                                style: TextStyle(color: p.textMuted))),
                      )
                    else
                      for (final d in draws) ...[
                        _DrawCard(d: d),
                        const SizedBox(height: 12),
                      ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _back(BuildContext context, String fallback) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(fallback);
  }
}

const _sapperGrad = [Color(0xFF6B9EF5), Color(0xFFA855F7)];

class _BackLink extends StatelessWidget {
  const _BackLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chevron_left, size: 20, color: p.accent),
            const SizedBox(width: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: p.accent)),
          ],
        ),
      ),
    );
  }
}

/// Пилюля со временем до вскрытия (или «Вскрыт»).
class _TimePill extends StatelessWidget {
  const _TimePill({required this.active, required this.text});
  final bool active;
  final String text;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (!active) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2A2B36) : const Color(0xFFF0F1F5),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
              color: isDark ? const Color(0x14FFFFFF) : const Color(0xFFE0E2E8)),
        ),
        child: Text(text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isDark ? const Color(0xFF8F909A) : const Color(0xFF6B7280))),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isDark ? const Color(0x667C3AED) : const Color(0x1F7C3AED),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x54A855F7)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.schedule,
              size: 13,
              color: isDark ? const Color(0xFFC084FC) : const Color(0xFF7C3AED)),
          const SizedBox(width: 5),
          Text(text,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color:
                      isDark ? const Color(0xFFC084FC) : const Color(0xFF7C3AED))),
        ],
      ),
    );
  }
}

/// Тонкий прогресс-бар заполнения поля.
class _SapperProgress extends StatelessWidget {
  const _SapperProgress({required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 8,
        color: isDark ? const Color(0x14FFFFFF) : const Color(0xFFE8EBF0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: value.clamp(0.03, 1).toDouble(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: _sapperGrad),
                borderRadius: BorderRadius.all(Radius.circular(999)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Кнопка с сине-фиолетовым градиентом.
class _GradientButton extends StatelessWidget {
  const _GradientButton({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: _sapperGrad),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }
}

class _DrawCard extends StatelessWidget {
  const _DrawCard({required this.d});
  final SapperDrawItem d;
  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fill = d.cellCount > 0 ? (d.occupied / d.cellCount) : 0.0;
    final active = d.status == 'active';
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0x0AFFFFFF) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isDark ? const Color(0x17FFFFFF) : const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: isDark ? const Color(0x22A855F7) : const Color(0x0F000000),
            blurRadius: isDark ? 24 : 14,
            offset: Offset(0, isDark ? 8 : 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(d.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: p.textPrimary)),
              ),
              const SizedBox(width: 12),
              _TimePill(
                  active: active,
                  text: active
                      ? _countdown(context.l10n, d.revealAt)
                      : context.l10n.sapperRevealed),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(context.l10n.sapperPrizesAndPrice(d.prizeCount, d.priceIqc),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: p.textPrimary)),
              if (d.myCells > 0)
                Text(context.l10n.sapperMyCells(d.myCells),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA855F7))),
            ],
          ),
          const SizedBox(height: 10),
          _SapperProgress(value: fill),
          const SizedBox(height: 8),
          Text(
              context.l10n.sapperOccupancy(
                  d.occupied, d.cellCount, (fill * 100).round()),
              style: TextStyle(fontSize: 13, color: p.textMuted)),
          const SizedBox(height: 16),
          _GradientButton(
              text: context.l10n.sapperGoToGame,
              onTap: () => context.push('/app/sapper/${d.id}')),
        ],
      ),
    );
  }
}

// ── Игровое поле ──────────────────────────────────────────────────────────────
class SapperGameScreen extends ConsumerStatefulWidget {
  const SapperGameScreen({super.key, required this.id});
  final int id;
  @override
  ConsumerState<SapperGameScreen> createState() => _SapperGameScreenState();
}

class _SapperGameScreenState extends ConsumerState<SapperGameScreen> {
  Timer? _tick;
  bool _busy = false;
  int _ticks = 0;

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
    super.dispose();
  }

  // Нехватка IQC — вместо ошибки с сервера показываем понятный блокер
  // с предложением заработать IQC (обучение / квест / опрос).
  Future<void> _notEnoughIqc(SapperField f) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.sapperNoIqcTitle),
        content: Text(context.l10n.sapperNoIqcBody(f.priceIqc, f.balanceIqc)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(context.l10n.commonCancel)),
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                context.go('/app/learn');
              },
              child: Text(context.l10n.navLearn)),
          FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
                context.go('/app/quests');
              },
              child: Text(context.l10n.navQuests)),
        ],
      ),
    );
  }

  Future<void> _reserve(SapperField f, int cell) async {
    if (_busy) return;
    // При нехватке IQC — понятный диалог с предложением заработать, а не 400-ошибка:
    // раньше резерв уходил на сервер вслепую и возвращался «Недостаточно IQC».
    if (f.balanceIqc < f.priceIqc) {
      await _notEnoughIqc(f);
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      // ctx — контекст диалога (root-навигатор). Раньше был Navigator.pop(context, …)
      // с внешним контекстом, который под ShellRoute резолвится во вложенный навигатор,
      // из-за чего кнопки «Занять»/«Отмена» не закрывали диалог.
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.sapperReserveTitle(cell + 1)),
        content: Text(context.l10n.sapperReserveBody(f.priceIqc)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(context.l10n.commonCancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(context.l10n.sapperReserveConfirm(f.priceIqc))),
        ],
      ),
    );
    if (ok != true) return;
    setState(() => _busy = true);
    try {
      final r = await ref.read(apiProvider).sapper.reserve(widget.id, cell);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(context.l10n.sapperCellReserved(r.cellIndex + 1))));
      ref.invalidate(walletProvider);
      ref.invalidate(sapperFieldProvider(widget.id));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e'.replaceFirst('Exception: ', ''))));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final v = ref.watch(sapperFieldProvider(widget.id));
    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: AsyncView<SapperField>(
              value: v,
              onRetry: () => ref.invalidate(sapperFieldProvider(widget.id)),
              data: (f) => _buildField(context, f),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(BuildContext context, SapperField f) {
    final p = PharmPalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final occ = <int, bool>{for (final o in f.occupied) o.index: o.mine};
    final prizeByCell = <int, SapperRevealPrize>{
      for (final pr in f.prizes) pr.index: pr
    };
    final acceptClosed = f.acceptingUntil != null &&
        (DateTime.tryParse(f.acceptingUntil!)?.isBefore(DateTime.now()) ?? false);
    final myWins = f.prizes.where((pr) => pr.wonByMe).length;
    final revealed = f.revealed;

    final availBg = isDark ? const Color(0xFF252838) : const Color(0xFFEEF0F4);
    final availBorder =
        isDark ? const Color(0xFF343850) : const Color(0xFFE2E5EC);
    final emptyBg = isDark ? const Color(0xFF252838) : const Color(0xFFE9EBF0);
    final theirsBg = isDark ? const Color(0xFF343850) : const Color(0xFFDDE0E8);
    final cellBorder = isDark ? const Color(0xFF343850) : const Color(0xFFD5D9E2);
    final personColor =
        isDark ? const Color(0xFF54566A) : const Color(0xFFAAAEBC);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        _BackLink(
            label: context.l10n.sapperDraws,
            onTap: () => _back(context, '/app/sapper')),
        const SizedBox(height: 16),
        _HiddenPrizesCard(f: f, isDark: isDark),
        const SizedBox(height: 16),
        // Баланс — только на активном поле; на экране после вскрытия его
        // и заголовок убрали (правка дизайна 209:422).
        if (!revealed) ...[
          _BalanceRow(f: f, isDark: isDark),
          const SizedBox(height: 16),
        ],
        if (revealed) ...[
          _WinBanner(wins: myWins, isDark: isDark),
          const SizedBox(height: 16),
        ] else if (acceptClosed) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: availBg, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(context.l10n.sapperAcceptClosed,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: p.textMuted)),
            ),
          ),
          const SizedBox(height: 12),
        ],
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            context.l10n.sapperFieldTotal(f.cellCount),
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: p.textMuted),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: f.cols, mainAxisSpacing: 2, crossAxisSpacing: 2),
          itemCount: f.cellCount,
          itemBuilder: (_, i) {
            final mine = occ[i] == true;
            final isOcc = occ.containsKey(i);
            final prize = prizeByCell[i];
            if (revealed) {
              final row = i ~/ f.cols, col = i % f.cols;
              return _RevealCell(
                delayMs: (row + col) * 45,
                prize: prize,
                mine: mine,
                occupied: isOcc,
                emptyBg: emptyBg,
                theirsBg: theirsBg,
                cellBorder: cellBorder,
                personColor: personColor,
              );
            }
            final canTap =
                f.status == 'active' && !acceptClosed && !isOcc && !_busy;
            return _ActiveCell(
              mine: mine,
              occupied: isOcc,
              availBg: availBg,
              availBorder: availBorder,
              personColor: personColor,
              onTap: canTap ? () => _reserve(f, i) : null,
            );
          },
        ),
        const SizedBox(height: 14),
        _SapperLegend(revealed: revealed, isDark: isDark),
        if (revealed && f.winners.isNotEmpty) ...[
          const SizedBox(height: 20),
          _WinnersCard(winners: f.winners, isDark: isDark),
        ],
      ],
    );
  }
}

// ── Карточка «На поле спрятано» (стеклянная) ─────────────────────────────
class _HiddenPrizesCard extends StatelessWidget {
  const _HiddenPrizesCard({required this.f, required this.isDark});
  final SapperField f;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final active = f.status == 'active';
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF1A0A30), Color(0xFF1E1B4B), Color(0xFF0D1B3E)],
                stops: [0, 0.45, 1],
              )
            : null,
        color: isDark ? null : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isDark ? const Color(0x457C3AED) : const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: isDark ? const Color(0x40A855F7) : const Color(0x0F000000),
            blurRadius: isDark ? 32 : 14,
            spreadRadius: isDark ? -4 : 0,
            offset: Offset(0, isDark ? 12 : 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.sapperHiddenTitle,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: isDark
                          ? const Color(0xFF8F909A)
                          : const Color(0xFF6B7280))),
              if (active)
                _HiddenTimePill(text: _revealPill(context.l10n, f.revealAt))
              else if (f.revealed)
                _TimePill(active: false, text: context.l10n.sapperRevealed),
            ],
          ),
          const SizedBox(height: 14),
          if (f.legend.isEmpty)
            Text(context.l10n.sapperNoPrizes,
                style: TextStyle(
                    fontSize: 13,
                    color: isDark
                        ? const Color(0xFF8F909A)
                        : const Color(0xFF6B7280)))
          else
            // Чипы призов в одну строку с горизонтальным скроллом.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  for (var i = 0; i < f.legend.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    _PrizeChip(
                        text: context.l10n.sapperPrizeChip(
                            f.legend[i].count, f.legend[i].label),
                        isDark: isDark),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _HiddenTimePill extends StatelessWidget {
  const _HiddenTimePill({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (!isDark) {
      // В светлой теме — просто фиолетовый текст без подложки.
      return Text(text,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF7C3AED)));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF3B0764),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFA855F7)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
                color: Color(0xFFC084FC), shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(text,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFC084FC))),
        ],
      ),
    );
  }
}

class _PrizeChip extends StatelessWidget {
  const _PrizeChip({required this.text, required this.isDark});
  final String text;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(colors: [Color(0xFF2D1B4E), Color(0xFF1E1040)])
            : null,
        color: isDark ? null : const Color(0xFFF3F1FB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isDark ? const Color(0x877C3AED) : const Color(0xFFE5E1F5)),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color:
                  isDark ? const Color(0xFFE2C6FF) : const Color(0xFF6D28D9))),
    );
  }
}

// ── Баланс (активное поле) ───────────────────────────────────────────────
class _BalanceRow extends StatelessWidget {
  const _BalanceRow({required this.f, required this.isDark});
  final SapperField f;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    if (!isDark) {
      final p = PharmPalette.of(context);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.l10n.sapperBalance(f.balanceIqc),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: p.textPrimary)),
          Text(context.l10n.sapperCellPrice(f.priceIqc),
              style: TextStyle(fontSize: 13, color: p.textMuted)),
        ],
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B23),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E2F3A)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _balanceCell(context.l10n.sapperYourBalance, '${f.balanceIqc}',
              CrossAxisAlignment.start),
          _balanceCell(context.l10n.sapperCellPriceLabel, '${f.priceIqc}',
              CrossAxisAlignment.end),
        ],
      ),
    );
  }

  Widget _balanceCell(String label, String value, CrossAxisAlignment align) {
    return Column(
      crossAxisAlignment: align,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
        const SizedBox(height: 2),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFE4E2ED))),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                  color: const Color(0xFF1A3566),
                  borderRadius: BorderRadius.circular(6)),
              child: const Text('IQC',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF6B9EF5))),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Баннер результата ────────────────────────────────────────────────────
class _WinBanner extends StatelessWidget {
  const _WinBanner({required this.wins, required this.isDark});
  final int wins;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final win = wins > 0;
    final bg = win
        ? (isDark ? const Color(0xFF0F3D1F) : const Color(0xFFDCFCE7))
        : (isDark ? const Color(0xFF1A1B23) : const Color(0xFFF0F1F5));
    final fg = win
        ? (isDark ? const Color(0xFF4ADE80) : const Color(0xFF166534))
        : (isDark ? const Color(0xFF8F909A) : const Color(0xFF6B7280));
    return Container(
      height: 52,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Text(
        win
            ? context.l10n
                .sapperWinBannerWin(wins, _prizeWord(context.l10n, wins))
            : context.l10n.sapperNoWin,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: fg),
      ),
    );
  }
}

String _prizeWord(AppLocalizations l10n, int n) {
  final m10 = n % 10, m100 = n % 100;
  if (m10 == 1 && m100 != 11) return l10n.sapperPrizeOne;
  if (m10 >= 2 && m10 <= 4 && (m100 < 12 || m100 > 14)) return l10n.sapperPrizeFew;
  return l10n.sapperPrizeMany;
}

// ── Клетка активного поля ────────────────────────────────────────────────
class _ActiveCell extends StatelessWidget {
  const _ActiveCell({
    required this.mine,
    required this.occupied,
    required this.availBg,
    required this.availBorder,
    required this.personColor,
    required this.onTap,
  });
  final bool mine;
  final bool occupied;
  final Color availBg;
  final Color availBorder;
  final Color personColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: mine ? const Color(0xFF3B82F6) : availBg,
          borderRadius: BorderRadius.circular(10),
          border: mine ? null : Border.all(color: availBorder),
          boxShadow: mine
              ? const [BoxShadow(color: Color(0x593B82F6), blurRadius: 10)]
              : null,
        ),
        alignment: Alignment.center,
        child: mine
            ? const Text('✓',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))
            : occupied
                ? Icon(Icons.person, size: 18, color: personColor)
                : null,
      ),
    );
  }
}

// ── Легенда поля ─────────────────────────────────────────────────────────
class _SapperLegend extends StatelessWidget {
  const _SapperLegend({required this.revealed, required this.isDark});
  final bool revealed;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final labelColor =
        isDark ? const Color(0xFF808299) : const Color(0xFF6B7280);
    final availBg = isDark ? const Color(0xFF252838) : const Color(0xFFEEF0F4);
    final emptyBg = isDark ? const Color(0xFF252838) : const Color(0xFFE9EBF0);
    final theirsBg = isDark ? const Color(0xFF343850) : const Color(0xFFCFD3DD);
    final l10n = context.l10n;
    final items = revealed
        ? <(Color, String)>[
            (const Color(0xFF3B82F6), l10n.sapperLegendMine),
            (theirsBg, l10n.sapperLegendTheirs),
            (emptyBg, l10n.sapperLegendEmpty),
            (const Color(0xFFEAB308), 'IQC'),
            (const Color(0xFFF5C842), l10n.sapperLegendVoucher),
          ]
        : <(Color, String)>[
            (const Color(0xFF9947FF), l10n.sapperLegendSelected),
            (const Color(0xFF3B82F6), l10n.sapperLegendMine),
            (theirsBg, l10n.sapperLegendOccupied),
            (availBg, l10n.sapperLegendFree),
          ];
    return Wrap(
      spacing: 14,
      runSpacing: 8,
      children: [
        for (final it in items)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                    color: it.$1, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(width: 5),
              Text(it.$2,
                  style: TextStyle(fontSize: 11, color: labelColor)),
            ],
          ),
      ],
    );
  }
}

// ── Победители ───────────────────────────────────────────────────────────
class _WinnersCard extends StatelessWidget {
  const _WinnersCard({required this.winners, required this.isDark});
  final List<SapperWinner> winners;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1B23) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: isDark ? const Color(0xFF2E2F3A) : const Color(0xFFEBEDF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.sapperWinners,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: p.textPrimary)),
          const SizedBox(height: 12),
          for (final w in winners)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: p.accent.withValues(alpha: isDark ? 0.9 : 0.85),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(w.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: p.textPrimary)),
                  ),
                  Text(w.label,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: p.accent)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Клетка вскрытия с «волной-проявлением» (задержка по диагонали).
/// Приз с «Ваучер» в названии → золотой билет, иначе → мешочек IQC.
class _RevealCell extends StatelessWidget {
  const _RevealCell({
    required this.delayMs,
    required this.prize,
    required this.mine,
    required this.occupied,
    required this.emptyBg,
    required this.theirsBg,
    required this.cellBorder,
    required this.personColor,
  });
  final int delayMs;
  final SapperRevealPrize? prize;
  final bool mine;
  final bool occupied;
  final Color emptyBg;
  final Color theirsBg;
  final Color cellBorder;
  final Color personColor;

  @override
  Widget build(BuildContext context) {
    final hasPrize = prize != null;
    final isTicket =
        hasPrize && prize!.label.toLowerCase().contains('ваучер');
    final wonByMe = prize?.wonByMe ?? false;

    Color bg;
    Widget? child;
    if (hasPrize) {
      bg = isTicket ? const Color(0xFFF5C842) : const Color(0xFFEAB308);
      child = Text(isTicket ? '🎫' : '💰', style: const TextStyle(fontSize: 20));
    } else if (mine) {
      bg = const Color(0xFF3B82F6);
      child = const Text('✓',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white));
    } else if (occupied) {
      bg = theirsBg;
      child = Icon(Icons.person, size: 16, color: personColor);
    } else {
      bg = emptyBg;
    }

    final cell = Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        // Выигравшая КЛЕТКА ПОЛЬЗОВАТЕЛЯ — заметная зелёная рамка + свечение,
        // чтобы среди жёлтых призов было видно, что именно выиграл он.
        // Остальным призам/своим клеткам рамка не нужна; пустым/чужим — тонкая,
        // чтобы поле читалось цельным.
        border: (hasPrize && wonByMe)
            ? Border.all(color: const Color(0xFF22C55E), width: 3)
            : (hasPrize || mine)
                ? null
                : Border.all(color: cellBorder),
        boxShadow: (hasPrize && wonByMe)
            ? const [
                BoxShadow(
                    color: Color(0x9922C55E), blurRadius: 12, spreadRadius: 1)
              ]
            : null,
      ),
      alignment: Alignment.center,
      child: child,
    );
    // проявление: opacity + scale со стаггером по диагонали
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 320 + delayMs),
      curve: Interval(
        (delayMs / (320 + delayMs)).clamp(0.0, 0.95),
        1.0,
        curve: Curves.easeOut,
      ),
      builder: (_, t, ch) => Opacity(
        opacity: t,
        child: Transform.scale(scale: 0.72 + 0.28 * t, child: ch),
      ),
      child: cell,
    );
  }
}

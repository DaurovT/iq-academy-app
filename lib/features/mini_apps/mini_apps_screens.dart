import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/providers.dart';
import '../../core/models/sapper.dart';
import '../../widgets/async_view.dart';
import '../pharmacist/providers.dart' show walletProvider;

final miniAppsProvider = FutureProvider<List<MiniApp>>((ref) => ref.watch(apiProvider).miniApps.list());
final sapperDrawsProvider = FutureProvider<List<SapperDrawItem>>((ref) => ref.watch(apiProvider).sapper.draws());
final sapperFieldProvider = FutureProvider.family<SapperField, int>((ref, id) => ref.watch(apiProvider).sapper.field(id));

String _countdown(String? iso) {
  if (iso == null) return '';
  final t = DateTime.tryParse(iso);
  if (t == null) return '';
  final ms = t.difference(DateTime.now()).inSeconds;
  if (ms <= 0) return 'скоро';
  final d = ms ~/ 86400, h = (ms % 86400) ~/ 3600, m = (ms % 3600) ~/ 60, s = ms % 60;
  if (d > 0) return '${d}д ${h}ч';
  if (h > 0) return '${h}ч ${m}м';
  return '${m}м ${s}с';
}

const _violet = Color(0xFF7C5CFF);

// ── Хаб мини-приложений ───────────────────────────────────────────────────────
class MiniAppsHubScreen extends ConsumerWidget {
  const MiniAppsHubScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(miniAppsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Мини-приложения')),
      body: AsyncView<List<MiniApp>>(
        value: v,
        onRetry: () => ref.invalidate(miniAppsProvider),
        data: (apps) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final a in apps)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AppCard(app: a),
              ),
          ],
        ),
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  const _AppCard({required this.app});
  final MiniApp app;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: app.available ? 1 : 0.55,
      child: Material(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: app.available && app.key == 'sapper' ? () => context.push('/app/sapper') : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(app.key == 'sapper' ? '💣' : '✨', style: const TextStyle(fontSize: 30)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(app.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                        const SizedBox(width: 8),
                        if (app.available && app.activeDraws > 0) _pill('${app.activeDraws} активн.', _violet),
                        if (!app.available) _pill('Скоро', scheme.outline),
                      ]),
                      const SizedBox(height: 3),
                      Text(app.subtitle, style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                if (app.available) Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _pill(String t, Color c) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(999)),
      child: Text(t, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
    );

// ── Список розыгрышей ─────────────────────────────────────────────────────────
class SapperDrawsScreen extends ConsumerWidget {
  const SapperDrawsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(sapperDrawsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Супер Сапёр')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(sapperDrawsProvider),
        child: AsyncView<List<SapperDrawItem>>(
          value: v,
          onRetry: () => ref.invalidate(sapperDrawsProvider),
          data: (draws) {
            if (draws.isEmpty) {
              return ListView(children: const [
                SizedBox(height: 120),
                Center(child: Text('Нет розыгрышей', style: TextStyle(color: Colors.grey))),
              ]);
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: draws.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => _DrawCard(d: draws[i]),
            );
          },
        ),
      ),
    );
  }
}

class _DrawCard extends StatelessWidget {
  const _DrawCard({required this.d});
  final SapperDrawItem d;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fill = d.cellCount > 0 ? (d.occupied / d.cellCount) : 0.0;
    return Material(
      color: scheme.surface,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/app/sapper/${d.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(d.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  if (d.status == 'active') _pill('⏱ ${_countdown(d.revealAt)}', _violet)
                  else _pill('Вскрыт', scheme.outline),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(spacing: 12, children: [
                Text('🎁 ${d.prizeCount} призов', style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                Text('💠 ${d.priceIqc} IQC/клетка', style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
                if (d.myCells > 0) Text('твоих: ${d.myCells}', style: TextStyle(fontSize: 12, color: scheme.primary, fontWeight: FontWeight.w600)),
              ]),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(value: fill, minHeight: 6, backgroundColor: scheme.surfaceContainerHighest),
              ),
              const SizedBox(height: 4),
              Text('занято ${d.occupied} из ${d.cellCount} (${(fill * 100).round()}%)',
                  style: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant)),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    // тикаем таймер обратного отсчёта
    _tick = Timer.periodic(const Duration(seconds: 1), (_) { if (mounted) setState(() {}); });
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  Future<void> _reserve(SapperField f, int cell) async {
    if (_busy) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Занять клетку №${cell + 1}?'),
        content: Text('Спишется ${f.priceIqc} IQC. Отменить нельзя — клетка закрепится за вами до вскрытия.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Отмена')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: Text('Занять за ${f.priceIqc} IQC')),
        ],
      ),
    );
    if (ok != true) return;
    setState(() => _busy = true);
    try {
      final r = await ref.read(apiProvider).sapper.reserve(widget.id, cell);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Клетка №${r.cellIndex + 1} занята')));
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
    final v = ref.watch(sapperFieldProvider(widget.id));
    return Scaffold(
      appBar: AppBar(title: Text(v.asData?.value.title ?? 'Супер Сапёр')),
      body: AsyncView<SapperField>(
        value: v,
        onRetry: () => ref.invalidate(sapperFieldProvider(widget.id)),
        data: (f) => _buildField(context, f),
      ),
    );
  }

  Widget _buildField(BuildContext context, SapperField f) {
    final scheme = Theme.of(context).colorScheme;
    final occ = <int, bool>{ for (final o in f.occupied) o.index: o.mine };
    final prizeByCell = <int, SapperRevealPrize>{ for (final p in f.prizes) p.index: p };
    final acceptClosed = f.acceptingUntil != null &&
        (DateTime.tryParse(f.acceptingUntil!)?.isBefore(DateTime.now()) ?? false);
    final myWins = f.prizes.where((p) => p.wonByMe).length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Легенда
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: scheme.surface, borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('НА ПОЛЕ СПРЯТАНО',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: scheme.onSurfaceVariant)),
                  if (f.status == 'active') _pill('⏱ ${_countdown(f.revealAt)}', _violet)
                  else if (f.revealed) _pill('Вскрыт', scheme.outline),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(spacing: 6, runSpacing: 6, children: [
                for (final l in f.legend)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: scheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                    child: Text('🎁 ${l.count}× ${l.label}', style: const TextStyle(fontSize: 12)),
                  ),
                if (f.legend.isEmpty) Text('призы не заявлены', style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Баланс: ${f.balanceIqc} IQC', style: const TextStyle(fontWeight: FontWeight.w600)),
            Text('цена клетки ${f.priceIqc} IQC', style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
          ],
        ),
        const SizedBox(height: 12),

        if (f.revealed)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: myWins > 0 ? _violet.withValues(alpha: 0.12) : scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                myWins > 0 ? '🎉 Вы выиграли $myWins ${myWins == 1 ? "приз" : "приза"}!' : 'В этот раз без выигрыша',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        if (!f.revealed && acceptClosed)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: scheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text('Приём клеток закрыт — идёт подготовка к вскрытию', style: TextStyle(color: scheme.onSurfaceVariant))),
          ),
        if (f.revealed || acceptClosed) const SizedBox(height: 12),

        // Поле
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: f.cols, mainAxisSpacing: 4, crossAxisSpacing: 4),
          itemCount: f.cellCount,
          itemBuilder: (_, i) {
            final mine = occ[i];
            final isOcc = occ.containsKey(i);
            final prize = prizeByCell[i];
            final canTap = f.status == 'active' && !acceptClosed && !isOcc && !_busy;
            if (f.revealed) {
              final row = i ~/ f.cols, col = i % f.cols;
              return _RevealCell(
                delayMs: (row + col) * 45,
                prize: prize,
                occupied: isOcc,
              );
            }
            return GestureDetector(
              onTap: canTap ? () => _reserve(f, i) : null,
              child: Container(
                decoration: BoxDecoration(
                  color: mine == true ? scheme.primary : isOcc ? scheme.surfaceContainerHighest : scheme.surface,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: mine == true ? scheme.primary : scheme.outlineVariant),
                ),
                alignment: Alignment.center,
                child: Text(mine == true ? '✓' : isOcc ? '•' : '',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
                        color: mine == true ? scheme.onPrimary : scheme.onSurfaceVariant)),
              ),
            );
          },
        ),

        if (f.revealed && f.winners.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: scheme.surface, borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Победители', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                for (final w in f.winners)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(w.name, style: const TextStyle(fontSize: 13)),
                        Text(w.label, style: TextStyle(fontSize: 13, color: scheme.onSurfaceVariant)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// Клетка вскрытия с «волной-проявлением» (задержка по диагонали).
class _RevealCell extends StatelessWidget {
  const _RevealCell({required this.delayMs, required this.prize, required this.occupied});
  final int delayMs;
  final SapperRevealPrize? prize;
  final bool occupied;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final hasPrize = prize != null;
    final mineWin = prize?.wonByMe ?? false;
    final child = Container(
      decoration: BoxDecoration(
        color: hasPrize
            ? (mineWin ? const Color(0xFFF5A623) : const Color(0xFFFDE68A))
            : occupied ? scheme.surfaceContainerHighest : scheme.surface,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: mineWin ? const Color(0xFFD97706) : scheme.outlineVariant, width: mineWin ? 2 : 1),
        boxShadow: mineWin ? [const BoxShadow(color: Color(0x99F5A623), blurRadius: 8)] : null,
      ),
      alignment: Alignment.center,
      child: Text(hasPrize ? '★' : occupied ? '•' : '',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
              color: hasPrize ? const Color(0xFF7C2D12) : scheme.onSurfaceVariant)),
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
      child: child,
    );
  }
}

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/models/quest.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

final _dm = DateFormat('dd.MM');
final _dmy = DateFormat('dd.MM.yyyy');
final _numFmt = NumberFormat.decimalPattern('ru');

String _fmt(String? iso, DateFormat f) {
  if (iso == null) return '';
  final d = DateTime.tryParse(iso);
  return d == null ? iso : f.format(d);
}

/// Деталь квеста. Перенесена один в один из макета Figma «quest-detail».
class QuestDetailScreen extends ConsumerWidget {
  const QuestDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _QD.of(context);
    final detail = ref.watch(questDetailProvider(id));
    return Scaffold(
      backgroundColor: c.page,
      body: SafeArea(
        bottom: false,
        child: AsyncView(
          value: detail,
          onRetry: () => ref.invalidate(questDetailProvider(id)),
          data: (q) => _Body(c: c, q: q),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.c, required this.q});
  final _QD c;
  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final isVoucher = q.rewardType == RewardType.voucher;
    final pct = q.goal == 0 ? 0 : (q.myCount / q.goal * 100).round();
    final left = (q.goal - q.myCount).clamp(0, q.goal);
    final period =
        '${_fmt(q.startDate, _dm)} — ${_fmt(q.endDate, _dmy)}';
    final rewardLine = isVoucher
        ? 'Korzinka · ${_numFmt.format(q.prizeIqc * 1000)} сум'
        : 'Все аптеки · без лимита';

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        // top-nav
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: InkWell(
            onTap: () =>
                context.canPop() ? context.pop() : context.go('/app/quests'),
            child: Row(
              children: [
                Icon(Icons.chevron_left, size: 24, color: c.muted),
                const SizedBox(width: 8),
                Text('Квесты', style: TextStyle(fontSize: 16, color: c.muted)),
              ],
            ),
          ),
        ),
        // header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(q.name,
                  style: TextStyle(
                      fontSize: 22,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: c.text)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _Pill(
                    text: isVoucher ? 'Ваучер' : 'IQC',
                    bg: isVoucher
                        ? const Color(0xFFF59E0B)
                        : const Color(0xFF7C3AED),
                    fg: isVoucher ? const Color(0xFF1C1B1F) : Colors.white,
                  ),
                  const SizedBox(width: 8),
                  _Pill(
                    text: q.status == QuestStatus.active
                        ? 'Активен до ${_fmt(q.endDate, _dmy)}'
                        : 'Завершён',
                    bg: q.status == QuestStatus.active
                        ? const Color(0xFF22C55E)
                        : c.card,
                    fg: q.status == QuestStatus.active
                        ? const Color(0xFF0D1117)
                        : c.muted,
                  ),
                ],
              ),
            ],
          ),
        ),
        // meta
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: c.muted),
              const SizedBox(width: 4),
              Text(period, style: TextStyle(fontSize: 13, color: c.muted)),
              Container(
                  width: 1,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  color: c.muted.withValues(alpha: 0.5)),
              Icon(Icons.shopping_cart_outlined, size: 14, color: c.muted),
              const SizedBox(width: 4),
              Flexible(
                child: Text(rewardLine,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: c.muted)),
              ),
            ],
          ),
        ),
        // progress-card
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _Ring(
                c: c,
                value: q.goal == 0 ? 0 : (q.myCount / q.goal).clamp(0, 1),
                count: q.myCount,
                goal: q.goal,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StatBlock(c: c, value: '$left', label: 'осталось'),
                    Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        color: c.divider),
                    _StatBlock(
                        c: c,
                        value: '$pct%',
                        label: 'выполнено',
                        valueColor: const Color(0xFFF59E0B)),
                  ],
                ),
              ),
            ],
          ),
        ),
        // НАГРАДА
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('НАГРАДА',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: c.muted)),
              const SizedBox(height: 4),
              Text(
                isVoucher
                    ? 'Ваучер выдаётся вручную после проверки'
                    : '+${q.prizeIqc} IQC на баланс',
                style: TextStyle(fontSize: 14, color: c.text),
              ),
            ],
          ),
        ),
        // Как засчитываются чеки
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: c.cardBorder),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: c.iconBg, borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.document_scanner_outlined,
                      size: 20, color: c.muted),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Как засчитываются чеки',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: c.text)),
                      const SizedBox(height: 2),
                      Text(
                        'Отправляйте фото чеков с нужным препаратом. Проверка упаковки — автоматически.',
                        style: TextStyle(
                            fontSize: 13, height: 1.4, color: c.muted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Что нужно сделать
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: c.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text('Что нужно сделать',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: c.text)),
                ),
                _rowDivider(c),
                _TableRow(
                    c: c,
                    label: 'Препарат',
                    value: q.mechanics.isNotEmpty
                        ? q.mechanics
                            .map((m) => '${m.drug} × ${m.qty}')
                            .join(', ')
                        : (q.drug ?? '—')),
                _rowDivider(c),
                _TableRow(
                    c: c,
                    label: 'Лимиты',
                    value: q.perUserLimit != null ? '${q.perUserLimit}' : '∞'),
                _rowDivider(c),
                _TableRow(c: c, label: 'Период', value: period),
                _rowDivider(c),
                _TableRow(c: c, label: 'Участников', value: '${q.participants}'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowDivider(_QD c) => Container(height: 1, color: c.tableDivider);
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, required this.bg, required this.fg});
  final String text;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Text(text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: fg)),
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({
    required this.c,
    required this.value,
    required this.label,
    this.valueColor,
  });
  final _QD c;
  final String value;
  final String label;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: valueColor ?? c.text)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 11, color: c.muted)),
      ],
    );
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({required this.c, required this.label, required this.value});
  final _QD c;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 13, color: c.muted)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(value,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 13, color: c.text)),
          ),
        ],
      ),
    );
  }
}

class _Ring extends StatelessWidget {
  const _Ring(
      {required this.c,
      required this.value,
      required this.count,
      required this.goal});
  final _QD c;
  final double value;
  final int count;
  final int goal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: CustomPaint(
        painter: _RingPainter(
          value: value.toDouble(),
          track: c.ringTrack,
          fill: const Color(0xFFF59E0B),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$count',
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              Text('/$goal',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: c.muted)),
              Text('покупок',
                  style: TextStyle(fontSize: 10, color: c.muted)),
            ],
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.value, required this.track, required this.fill});
  final double value;
  final Color track;
  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 9.0;
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = (size.width - stroke) / 2;

    final trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = track;
    canvas.drawCircle(center, radius, trackPaint);

    if (value > 0) {
      final fillPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..color = fill;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi * value,
        false,
        fillPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.value != value || old.track != track || old.fill != fill;
}

// ── Палитра ─────────────────────────────────────────────────────────────

class _QD {
  const _QD({
    required this.page,
    required this.card,
    required this.cardBorder,
    required this.tableDivider,
    required this.divider,
    required this.iconBg,
    required this.ringTrack,
    required this.text,
    required this.muted,
  });

  final Color page;
  final Color card;
  final Color cardBorder;
  final Color tableDivider;
  final Color divider;
  final Color iconBg;
  final Color ringTrack;
  final Color text;
  final Color muted;

  static _QD of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _QD(
    page: Color(0xFF0D1117),
    card: Color(0xFF151B2A),
    cardBorder: Color(0xFF1F2530),
    tableDivider: Color(0xFF3A3458),
    divider: Color(0xFF1E2A3A),
    iconBg: Color(0xFF1F2937),
    ringTrack: Color(0xFF1E2A3A),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF8F909A),
  );

  static const _light = _QD(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    cardBorder: Color(0xFFEBEDF0),
    tableDivider: Color(0xFFEBEDF0),
    divider: Color(0xFFEBEDF0),
    iconBg: Color(0xFFF2F4F7),
    ringTrack: Color(0xFFE8EBF0),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../../../core/models/quest.dart';

/// Общие вычисления и мелкие виджеты раздела «Квесты» (фармацевт и врач).

/// Цель квестов зависит от активной роли: врач — рецепты, иначе — чеки.
QuestTarget watchQuestTarget(WidgetRef ref) =>
    ref.watch(authControllerProvider).asData?.value.activeRole == Role.doctor
        ? QuestTarget.recipes
        : QuestTarget.checks;

final _dm = DateFormat('dd.MM');
final _dmy = DateFormat('dd.MM.yyyy');

DateTime? questDate(String? iso) =>
    iso == null ? null : DateTime.tryParse(iso)?.toLocal();

String questDm(DateTime d) => _dm.format(d);
String questDmy(DateTime d) => _dmy.format(d);

/// «01.06 — 30.06.2026» / «до 30.06.2026» / «с 01.06.2026» / «Без срока».
String questPeriod(AppLocalizations l, String? start, String? end) {
  final s = questDate(start);
  final e = questDate(end);
  if (s != null && e != null) return '${_dm.format(s)} — ${_dmy.format(e)}';
  if (e != null) return l.questsPeriodUntil(_dmy.format(e));
  if (s != null) return l.questsPeriodFrom(_dmy.format(s));
  return l.questsPeriodNone;
}

/// Магазин/сумма ваучера лежат в описании: «🛒 Korzinka — 100 000» →
/// «Korzinka · 100 000». null — описание не про ваучер.
String? questVoucherShop(String description) {
  final d = description.trim();
  if (!d.startsWith('🛒')) return null;
  final clean =
      d.replaceFirst(RegExp(r'^🛒\s*'), '').replaceAll(' — ', ' · ').trim();
  return clean.isEmpty ? null : clean;
}

/// Строка-пояснение под названием квеста: описание (если это не строка
/// ваучера), иначе препарат/бренд.
String? questInfoLine(String description, {String? drug, String? brand}) {
  final d = description.trim();
  if (d.isNotEmpty && questVoucherShop(d) == null) return d;
  final parts = [
    if (drug != null && drug.trim().isNotEmpty) drug.trim(),
    if (brand != null &&
        brand.trim().isNotEmpty &&
        brand.trim() != drug?.trim())
      brand.trim(),
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

/// Текст рядом с меткой награды на карточке.
String questRewardLine(
  AppLocalizations l,
  RewardType type,
  String description,
  int prize,
) =>
    type == RewardType.voucher
        ? (questVoucherShop(description) ?? l.questsRewardManual)
        : l.questsRewardPoints;

/// Прогресс квеста: сколько засчитано и какая цель.
class QuestProgress {
  const QuestProgress({
    required this.count,
    required this.goal,
    required this.ratio,
  });

  /// Список: цель берётся из детали (если уже загружена) или выводится из доли.
  factory QuestProgress.of(Quest q, [QuestDetail? d]) {
    if (d != null) return QuestProgress.detail(d);
    final goal =
        q.progress > 0 ? (q.completedCount / q.progress).round() : null;
    return QuestProgress(
      count: q.completedCount,
      goal: goal,
      ratio: q.progress.clamp(0, 1).toDouble(),
    );
  }

  factory QuestProgress.detail(QuestDetail d) => QuestProgress(
    count: d.myCount,
    goal: d.goal,
    ratio:
        d.goal <= 0
            ? d.progress.clamp(0, 1).toDouble()
            : (d.myCount / d.goal).clamp(0, 1).toDouble(),
  );

  final int count;
  final int? goal;
  final double ratio;

  int? get left => goal == null ? null : (goal! - count).clamp(0, goal!);
  bool get done => goal != null && goal! > 0 && count >= goal!;
  bool get almostDone => !done && ratio >= .6;
  int get percent => (ratio * 100).round();

  /// Сегменты pq-seg: по одному на единицу цели (до 20), иначе 10 долей.
  int get segments => goal != null && goal! > 0 && goal! <= 20 ? goal! : 10;
  int get filledSegments =>
      goal != null && goal! > 0 && goal! <= 20
          ? count.clamp(0, goal!)
          : (ratio * 10).floor().clamp(0, 10);
}

/// Цвета прогресса по типу награды (в макетах различаются по темам).
class QuestColors {
  QuestColors._(this.fill, this.track, this.accent);

  factory QuestColors.of(BuildContext context, RewardType type) {
    final pq = context.pq;
    final track = pq.isDark ? pq.border : const Color(0xFFE5E7EB);
    if (type == RewardType.voucher) {
      return QuestColors._(pq.warning, track, pq.warning);
    }
    return QuestColors._(
      pq.isDark ? PqColors.questBorder : PqColors.reward,
      track,
      pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9),
    );
  }

  /// Заполненные сегменты / полоса.
  final Color fill;
  final Color track;

  /// «Ещё 4», процент выполнения.
  final Color accent;
}

/// Метка награды: «IQC» (фиолетовая) или «Ваучер» (жёлтая).
class QuestRewardTag extends StatelessWidget {
  const QuestRewardTag(this.type, {super.key});

  final RewardType type;

  @override
  Widget build(BuildContext context) =>
      type == RewardType.voucher
          ? PqRewardTag.voucher(context.l10n.questsPillVoucher)
          : const PqRewardTag.iqc('IQC');
}

/// Статус квеста: капсула 12/700 с полями 4×10 (в макетах квестов — 4,
/// у [PqStatusBadge] — 5).
class QuestStatusBadge extends StatelessWidget {
  const QuestStatusBadge(this.label, {super.key, required this.tone});

  final String label;
  final PqTone tone;

  @override
  Widget build(BuildContext context) {
    final t = context.pq.tone(tone);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: t.bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: PqText.tag(c: t.fg)),
    );
  }
}

/// Название с подсветкой совпадения (`<mark>` в макете QuestSearch).
class QuestHighlight extends StatelessWidget {
  const QuestHighlight({
    super.key,
    required this.text,
    required this.query,
    required this.style,
    this.maxLines = 2,
  });

  final String text;
  final String query;
  final TextStyle style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final q = query.trim().toLowerCase();
    final i = q.isEmpty ? -1 : text.toLowerCase().indexOf(q);
    if (i < 0) {
      return Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
    }
    final match = text.substring(i, i + q.length);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text.substring(0, i)),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: pq.warningSoft,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(match, style: style.copyWith(color: pq.warning)),
            ),
          ),
          TextSpan(text: text.substring(i + q.length)),
        ],
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}

/// Счётчик «6 из 10 продаж»: крупная цифра + приглушённый хвост.
class QuestCountText extends StatelessWidget {
  const QuestCountText({
    super.key,
    required this.progress,
    required this.recipes,
    this.size = 22,
    this.weight = FontWeight.w700,
    this.tailSize = 15,
  });

  final QuestProgress progress;
  final bool recipes;
  final double size;
  final FontWeight weight;
  final double tailSize;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final goal = progress.goal;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${progress.count}'),
          if (goal != null && goal > 0)
            TextSpan(
              text:
                  ' ${recipes ? l.questsOfGoalRecipes(goal) : l.questsOfGoalSales(goal)}',
              style: PqText.heading(
                tailSize,
                FontWeight.w600,
                height: size >= 40 ? 1 : 1.4,
                c: pq.textMuted,
              ),
            ),
        ],
      ),
      style: PqText.heading(
        size,
        weight,
        height: size >= 40 ? 1 : 1.4,
        c: pq.text,
      ),
    );
  }
}

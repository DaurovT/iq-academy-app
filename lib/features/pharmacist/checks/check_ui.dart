import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/check.dart';

/// Этап чека в редизайне 1.2: «Отправлен → Проверка → Одобрен → Подтверждено».
///
/// Отдельного статуса «начислено» в API нет: считаем чек начисленным, когда
/// он одобрен и уже зачтён хотя бы в один квест (есть `allocations`).
/// [extraReview] — дополнительная (ручная) проверка, макет CheckReview.
enum CheckStage { review, extraReview, approved, credited, rejected }

CheckStage checkStageOf(CheckStatus s, {bool credited = false}) => switch (s) {
  CheckStatus.pending ||
  CheckStatus.aiDetected ||
  CheckStatus.aiWrong => CheckStage.review,
  CheckStatus.review => CheckStage.extraReview,
  CheckStatus.approved => credited ? CheckStage.credited : CheckStage.approved,
  CheckStatus.rejected => CheckStage.rejected,
};

extension CheckStageUi on CheckStage {
  /// Один цвет — одно значение: проверка — warning, доп. проверка — violet,
  /// одобрен — success, начислено — info, отклонён — danger.
  PqTone get tone => switch (this) {
    CheckStage.review => PqTone.warning,
    CheckStage.extraReview => PqTone.violet,
    CheckStage.approved => PqTone.success,
    CheckStage.credited => PqTone.info,
    CheckStage.rejected => PqTone.danger,
  };

  PqIcons get icon => switch (this) {
    CheckStage.review => PqIcons.clock,
    CheckStage.extraReview => PqIcons.shieldOk,
    CheckStage.approved => PqIcons.check,
    CheckStage.credited => PqIcons.coin,
    CheckStage.rejected => PqIcons.alertTriangle,
  };

  String label(AppLocalizations l) => switch (this) {
    CheckStage.review => l.checksStatusPending,
    CheckStage.extraReview => l.checksStatusExtraReview,
    CheckStage.approved => l.checksStatusApproved,
    CheckStage.credited => l.checksStepCredited,
    CheckStage.rejected => l.checksStatusRejected,
  };

  /// Ещё проверяется (обычная или дополнительная проверка).
  bool get inReview =>
      this == CheckStage.review || this == CheckStage.extraReview;
}

/// Шаги прогресса чека: 4 сегмента по 4 px (pq-seg) и подписи под ними.
/// На проверке текущий сегмент «дышит» (pqBreath 1.6s).
class CheckSteps extends StatelessWidget {
  const CheckSteps({
    super.key,
    required this.stage,
    this.gap = 6,
    this.animate = true,
  });

  final CheckStage stage;

  /// Расстояние между сегментами и подписями.
  final double gap;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    // Пустой сегмент: #2e2f3a (border) в тёмной, #e5e7eb в светлой теме.
    final track = pq.isDark ? pq.border : const Color(0xFFE5E7EB);
    final extra = stage == CheckStage.extraReview;
    final (List<Color> colors, int current) = switch (stage) {
      CheckStage.review => ([pq.success, pq.warning, track, track], 1),
      CheckStage.extraReview => (
        [pq.success, pq.tone(PqTone.violet).fg, track, track],
        1,
      ),
      CheckStage.approved => ([pq.success, pq.success, pq.success, track], 2),
      CheckStage.credited => ([pq.success, pq.success, pq.success, pq.info], 3),
      CheckStage.rejected => ([pq.success, pq.danger, track, track], 1),
    };
    final labels = [
      l.checksStepSent,
      stage == CheckStage.rejected
          ? l.checksStatusRejected
          : extra
          ? l.checksStatusExtraReview
          : l.checksStepReview,
      l.checksStepApproved,
      l.checksStepConfirmed,
    ];
    Widget seg(int i) {
      Widget box = Container(
        height: 4,
        decoration: BoxDecoration(
          color: colors[i],
          borderRadius: BorderRadius.circular(2),
        ),
      );
      if (stage.inReview && i == current) {
        box = PqBreath(child: box);
      }
      // В макете CheckReview сегменты без pq-seg (не «заполняются»).
      return animate && !extra ? PqSegFill(index: i, child: box) : box;
    }

    // CheckReview: колонки 1 : 1.4 : 1 : 1 — «Доп. проверка» в одну строку.
    int flex(int i) => extra && i == 1 ? 14 : 10;

    return Semantics(
      label: labels[current],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              for (var i = 0; i < 4; i++) ...[
                if (i > 0) const SizedBox(width: 4),
                Expanded(flex: flex(i), child: seg(i)),
              ],
            ],
          ),
          SizedBox(height: gap),
          ExcludeSemantics(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < 4; i++) ...[
                  if (i > 0) const SizedBox(width: 4),
                  Expanded(
                    flex: flex(i),
                    child: Text(
                      labels[i],
                      // Одно слово не переносим по буквам («Подтверждено»):
                      // как в CSS, оно может чуть выйти за колонку.
                      maxLines: labels[i].contains(' ') && !(extra && i == 1) ? 2 : 1,
                      softWrap: labels[i].contains(' ') && !(extra && i == 1),
                      overflow: TextOverflow.visible,
                      style: PqText.text(
                        12,
                        i == current ? FontWeight.w700 : FontWeight.w500,
                        c:
                            stage == CheckStage.rejected && i == current
                                ? pq.danger
                                : i <= current
                                ? pq.text
                                : pq.textMuted,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// «Бумажный» чек из макетов: белый лист с серыми строками и тенью.
/// Если передан [photo] — внутри листа показывается настоящее фото.
class ReceiptPaper extends StatelessWidget {
  const ReceiptPaper({
    super.key,
    required this.width,
    required this.height,
    this.rotation = 0,
    this.photo,
  });

  final double width;
  final double height;

  /// Поворот листа в градусах (−3°, 2°, −1° в макетах).
  final double rotation;
  final Widget? photo;

  @override
  Widget build(BuildContext context) {
    final paper = Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color(0x73000000),
            offset: Offset(0, 6),
            blurRadius: 14,
            spreadRadius: -6,
          ),
        ],
      ),
      child: photo ?? const ReceiptLines(),
    );
    return Transform.rotate(angle: rotation * math.pi / 180, child: paper);
  }
}

/// Серые «строки» бумажного чека (заглушка вместо фото).
class ReceiptLines extends StatelessWidget {
  const ReceiptLines({super.key});

  static const _lines = [.7, .5, .8, .6, .4, .7];

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final w in _lines)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
              child: FractionallySizedBox(
                widthFactor: w,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1D5DB),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

/// Есть ли сеть (connectivity_plus, как в очереди загрузки).
final checksOnlineProvider = StreamProvider<bool>((ref) async* {
  final c = Connectivity();
  bool on(List<ConnectivityResult> r) =>
      r.any((e) => e != ConnectivityResult.none);
  yield on(await c.checkConnectivity());
  yield* c.onConnectivityChanged.map(on);
});

/// Цвет иконки «Распознано ИИ» (в токенах нет: #c4b5fd / #6d28d9).
Color checksAiColor(PqColors pq) =>
    pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);

/// Заголовок секции экрана чека: иконка 18 + h2 (поля 0 4).
class ChecksSectionTitle extends StatelessWidget {
  const ChecksSectionTitle(this.title, {super.key, this.icon, this.iconColor});

  final String title;
  final PqIcons? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          if (icon != null) ...[
            PqIcon(icon!, size: 18, color: iconColor),
            const SizedBox(width: 8),
          ],
          Flexible(child: Text(title, style: PqText.section(c: pq.text))),
        ],
      ),
    );
  }
}

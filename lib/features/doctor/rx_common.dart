import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../shared/providers.dart';

/// Путь экрана съёмки бланка (без нижнего меню).
const kRxCameraPath = '/app/recipes/camera';

/// Открыть съёмку нового бланка (кнопки «Отправить бланк», «Переснять»).
void openRecipeCamera(BuildContext context) => context.push(kRxCameraPath);

/// Этап бланка для экрана и списков: на проверке → одобрен → начислено;
/// или отклонён.
enum RxStage { pending, approved, credited, rejected }

/// Сколько IQC начислено за бланк (id → сумма). API эту сумму пока не
/// отдаёт — карта пустая, и одобренный бланк показывается этапом «Одобрен».
/// Когда поле появится, заполнить здесь: экраны сразу покажут этап
/// «Начислено» (макет RxCredited) и «+N IQC».
final recipeCreditsProvider = Provider<Map<int, int>>((ref) => const {});

extension RecipeStatusStage on CheckStatus {
  /// Этап по статусу; [credited] — начисленная сумма, если известна.
  RxStage rxStage([int? credited]) => switch (this) {
        CheckStatus.pending || CheckStatus.aiDetected => RxStage.pending,
        CheckStatus.approved =>
          credited != null && credited > 0 ? RxStage.credited : RxStage.approved,
        CheckStatus.rejected || CheckStatus.aiWrong => RxStage.rejected,
      };
}

extension RxStageUi on RxStage {
  /// Тоны — как у чеков: на проверке — warning, одобрен — success,
  /// начислено — info, отклонён — danger.
  PqTone get tone => switch (this) {
        RxStage.pending => PqTone.warning,
        RxStage.approved => PqTone.success,
        RxStage.credited => PqTone.info,
        RxStage.rejected => PqTone.danger,
      };

  PqIcons get icon => switch (this) {
        RxStage.pending => PqIcons.clock,
        RxStage.approved => PqIcons.check,
        RxStage.credited => PqIcons.coin,
        RxStage.rejected => PqIcons.alertTriangle,
      };

  String label(AppLocalizations l10n) => switch (this) {
        RxStage.pending => l10n.recipesStatusPending,
        RxStage.approved => l10n.recipesStatusApproved,
        RxStage.credited => l10n.rxStepCredited,
        RxStage.rejected => l10n.recipesStatusRejected,
      };

  /// Одобрен или уже начислено.
  bool get isApproved => this == RxStage.approved || this == RxStage.credited;
}

/// «08.06» — короткая дата без времени.
String rxDayMonth(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return DateFormat('dd.MM').format(d.toLocal());
}

/// Препараты одной строкой: «Доритрицин N10 · 2, Pechak barglari · 16».
String rxDrugsLine(List<RecipeDrug> drugs) =>
    drugs.map((d) => '${d.name} · ${d.qty}').join(', ');

/// Цвет «искры» ИИ: #c4b5fd / #6d28d9.
Color rxSparkleColor(PqColors pq) =>
    pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);

/// Статус бланка: капсула 12/700 на мягкой заливке тона.
class RxStatusBadge extends StatelessWidget {
  const RxStatusBadge(this.stage, {super.key});

  final RxStage stage;

  @override
  Widget build(BuildContext context) =>
      PqStatusBadge(stage.label(context.l10n), tone: stage.tone);
}

/// Кнопка «Отправить бланк»: 56, радиус 16, иконка камеры.
class RxSendButton extends StatelessWidget {
  const RxSendButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => PqButton(
        label: label,
        icon: PqIcons.camera,
        onPressed: () => openRecipeCamera(context),
      );
}

/// Иллюстрация «лист бланка» (заглушка фото): белый лист 62×88,
/// повёрнутый на −3°, с серыми строками.
class RxPaperSheet extends StatelessWidget {
  const RxPaperSheet({super.key});

  static const _widths = [.7, .5, .8, .6, .4, .7];

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -3 * 3.1415926 / 180,
      child: Container(
        width: 62,
        height: 88,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                color: Color(0x73000000),
                offset: Offset(0, 6),
                blurRadius: 14,
                spreadRadius: -6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final w in _widths)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                child: FractionallySizedBox(
                  widthFactor: w,
                  alignment: Alignment.centerLeft,
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
}

/// Шапка вкладок врача: логотип + колокольчик (точка — есть непрочитанные).
class RxTabHeader extends ConsumerWidget {
  const RxTabHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    return PqTabHeader(
      onBell: () => context.go('/app/notifications'),
      unread: unread > 0,
      bellLabel: unread > 0 ? l10n.rxHomeBellUnread : l10n.rxHomeBellLabel,
    );
  }
}

/// Inter 14 с интерлиньяжем 1.4 (как `font-size:14px` без line-height в
/// макетах; [PqText.body] — 1.45, для абзацев).
TextStyle rxText14(Color c, [FontWeight w = FontWeight.w400]) =>
    PqText.text(14, w, c: c);

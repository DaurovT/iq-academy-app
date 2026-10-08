import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/quest.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import '../doctor/rx_common.dart';
import 'checks_screen.dart';
import 'providers.dart';
import 'quests/quest_ui.dart';

/// Карточка квеста (макет QuestDetail): «‹ Квесты», метки и заголовок,
/// прогресс (pq-seg), награда на градиенте, шаги, условия, засчитанные
/// чеки и закреплённая над меню кнопка «Отправить чек по квесту».
class QuestDetailScreen extends ConsumerWidget {
  const QuestDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final detail = ref.watch(questDetailProvider(id));
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTabHeader(
            onBell: () => context.go('/app/notifications'),
            bellLabel: l.notifTitle,
            unread: unread > 0,
          ),
          Expanded(
            child: PqAsync<QuestDetail>(
              value: detail,
              onRetry: () => ref.invalidate(questDetailProvider(id)),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
              data:
                  (q) => _Body(
                    q: q,
                    onRefresh:
                        () => ref.refresh(questDetailProvider(id).future),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.q, required this.onRefresh});

  final QuestDetail q;
  final Future<void> Function() onRefresh;

  void _back(BuildContext context) =>
      context.canPop() ? context.pop() : context.go('/app/quests');

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final recipes = q.target == QuestTarget.recipes;
    final active = q.status == QuestStatus.active;
    final info = questInfoLine(q.description, drug: q.drug, brand: q.brand);

    final blocks = <Widget>[
      _Header(q: q, info: info),
      _ProgressCard(q: q),
      _RewardCard(q: q),
      _Steps(q: q),
      _Conditions(q: q),
      _Counted(q: q),
    ];

    final navBottom = MediaQuery.paddingOf(context).bottom;
    return Stack(
      children: [
        PqRefresh(
          onRefresh: onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              active ? 200 : kPqNavClearance,
            ),
            children: [
              // «‹ Квесты» (min-height 44, margin-top −8).
              PqAnimate(
                child: Transform.translate(
                  offset: const Offset(0, -8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: PqPressable(
                      onTap: () => _back(context),
                      semanticLabel: l.questDetailBackQuests,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 44),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PqIcon(
                              PqIcons.chevronLeft,
                              size: 20,
                              color: pq.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              l.questDetailBackQuests,
                              style: PqText.text(
                                15,
                                FontWeight.w600,
                                c: pq.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              for (var i = 0; i < blocks.length; i++) ...[
                if (i > 0) const SizedBox(height: 24),
                PqAnimate(
                  delay: PqMotion.staggerDelay(i + 1),
                  child: blocks[i],
                ),
              ],
            ],
          ),
        ),
        if (active)
          Positioned(
            left: 0,
            right: 0,
            bottom: navBottom,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [pq.bg.withValues(alpha: 0), pq.bg, pq.bg],
                  stops: const [0, .45, 1],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
                child: PqButton(
                  label: recipes ? l.questsSendRecipe : l.questsSendCheck,
                  icon: PqIcons.camera,
                  // API не привязывает загрузку к квесту — засчитывается
                  // автоматически, поэтому запускаем обычную отправку.
                  onPressed:
                      () =>
                          recipes
                              ? context.push(kRxCameraPath)
                              : showNewCheckSheet(context),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Метки (награда · статус), заголовок h1 и пояснение.
class _Header extends StatelessWidget {
  const _Header({required this.q, required this.info});

  final QuestDetail q;
  final String? info;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final end = questDate(q.endDate);
    final active = q.status == QuestStatus.active;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            QuestRewardTag(q.rewardType),
            const SizedBox(width: 8),
            Flexible(
              child: QuestStatusBadge(
                active
                    ? (end == null
                        ? l.questsActive
                        : l.questDetailActiveUntil(questDm(end)))
                    : l.questDetailFinished,
                tone: active ? PqTone.success : PqTone.neutral,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          q.name,
          style: PqText.heading(
            30,
            FontWeight.w700,
            height: 1.1,
            ls: -0.3,
            c: pq.text,
          ),
        ),
        if (info != null) ...[
          const SizedBox(height: 10),
          Text(info!, style: PqText.subtitle(c: pq.textMuted)),
        ],
      ],
    );
  }
}

/// Прогресс: «0 из 10 продаж» (40/800) · процент, сегменты, «Осталось …».
class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.q});

  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final p = QuestProgress.detail(q);
    final colors = QuestColors.of(context, q.rewardType);
    final recipes = q.target == QuestTarget.recipes;
    final end = questDate(q.endDate);
    final left = p.left ?? 0;

    final Widget remain;
    if (p.done) {
      remain = Text(
        l.questsGoalReached,
        style: PqText.body(c: pq.textSecondary),
      );
    } else {
      remain = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  '${recipes ? l.questsRecipesLeftPrefix : l.questsSalesLeftPrefix} ',
            ),
            TextSpan(
              text: recipes ? l.questsRecipesCount(left) : l.questsPacks(left),
              style: TextStyle(fontWeight: FontWeight.w700, color: pq.text),
            ),
            if (end != null)
              TextSpan(text: ' ${l.questsPeriodUntil(questDmy(end))}'),
          ],
        ),
        style: PqText.body(c: pq.textSecondary),
      );
    }

    return PqCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: QuestCountText(
                  progress: p,
                  recipes: recipes,
                  size: 40,
                  weight: FontWeight.w800,
                  tailSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${p.percent}%',
                style: PqText.text(15, FontWeight.w700, c: colors.accent),
              ),
            ],
          ),
          const SizedBox(height: 14),
          PqSegmentProgress(
            total: p.segments,
            filled: p.filledSegments,
            fillColor: colors.fill,
            trackColor: colors.track,
            height: 8,
          ),
          if (p.goal != null && p.goal! > 0) ...[
            const SizedBox(height: 14),
            remain,
          ],
        ],
      ),
    );
  }
}

/// Награда на градиенте кошелька: плитка 52 с подарком, «НАГРАДА», сумма.
class _RewardCard extends StatelessWidget {
  const _RewardCard({required this.q});

  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final voucher = q.rewardType == RewardType.voucher;
    final shop = questVoucherShop(q.description);
    final title =
        voucher
            ? (shop == null ? l.questsPillVoucher : l.questsVoucherTitle(shop))
            : '+${q.prizeIqc} IQC';
    final sub =
        q.rewardReceived
            ? l.questsRewardReceived
            : voucher
            ? l.questsRewardManual
            : l.questsRewardIqcSub;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pq.walletGradient,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: voucher ? PqColors.voucher : PqColors.reward,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: PqIcon(
              // QuestDetail (фармацевт) — галочка в квадрате, DocQuestDetail — подарок.
              q.rewardReceived
                  ? PqIcons.checkCheck
                  : q.target == QuestTarget.recipes
                  ? PqIcons.gift
                  : PqIcons.squareCheck,
              size: 24,
              color: voucher ? PqColors.onVoucher : Colors.white,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // В обновлённом макете подписи «НАГРАДА» над строкой нет.
                Text(
                  title,
                  style: PqText.heading(18, FontWeight.w700, c: Colors.white),
                ),
                const SizedBox(height: 3),
                Text(
                  sub,
                  style: PqText.body(c: pq.walletMuted).copyWith(height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// «Что нужно сделать»: три пронумерованных шага.
class _Steps extends StatelessWidget {
  const _Steps({required this.q});

  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final recipes = q.target == QuestTarget.recipes;
    final drugs =
        q.mechanics.isNotEmpty
            ? q.mechanics.map((m) => m.drug).join(', ')
            : (q.drug ?? q.name);
    final goal = q.goal;
    final steps = [
      (
        recipes
            ? l.questsStepPrescribeDrug(drugs)
            : l.questsStepSellDrug(drugs),
        goal <= 0
            ? null
            : recipes
            ? l.questsNeedPrescribe(l.questsRecipesCount(goal))
            : l.questsNeedSell(l.questsPacks(goal)),
      ),
      (
        recipes ? l.questsStepPhotoRecipe : l.questsStepPhotoCheck,
        recipes ? l.questsStepPhotoRecipeSub : l.questsStepPhotoCheckSub,
      ),
      (
        recipes ? l.questsStepWaitRecipe : l.questsStepWaitCheck,
        recipes ? l.questsStepWaitRecipeSub : l.questsStepWaitCheckSub,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqSectionHeader(l.questDetailTodoTitle),
        const SizedBox(height: 12),
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            children: [
              for (var i = 0; i < steps.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: pq.accentSoft,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${i + 1}',
                          style: PqText.heading(
                            16,
                            FontWeight.w700,
                            c: pq.accentText,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              steps[i].$1,
                              style: PqText.text(
                                15,
                                FontWeight.w600,
                                c: pq.text,
                              ),
                            ),
                            if (steps[i].$2 != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                steps[i].$2!,
                                style: PqText.body(
                                  c: pq.textMuted,
                                ).copyWith(height: 1.4),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// «Условия»: период, лимит, препараты механики.
class _Conditions extends StatelessWidget {
  const _Conditions({required this.q});

  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final recipes = q.target == QuestTarget.recipes;
    final rows = <(PqIcons, String, String)>[
      (
        PqIcons.calendar,
        l.questDetailPeriodLabel,
        questPeriod(l, q.startDate, q.endDate),
      ),
      (
        PqIcons.infinity,
        recipes ? l.questsRecipesLimit : l.questsSalesLimit,
        q.perUserLimit == null ? l.questsNoLimit : '${q.perUserLimit}',
      ),
      // Число участников не показываем — решение продукта.
      for (final m in q.mechanics)
        (PqIcons.pill, m.drug, l.questsPacksShort(m.qty)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqSectionHeader(l.questsConditionsTitle),
        const SizedBox(height: 12),
        _RowsCard(rows: rows),
      ],
    );
  }
}

class _RowsCard extends StatelessWidget {
  const _RowsCard({required this.rows});

  final List<(PqIcons, String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                border:
                    i < rows.length - 1
                        ? Border(bottom: BorderSide(color: pq.divider))
                        : null,
              ),
              child: Row(
                children: [
                  // Иконка в строчном span макета — строка 23.4, svg сверху.
                  SizedBox(
                    height: 23.4,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: PqIcon(rows[i].$1, size: 18, color: pq.textMuted),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      rows[i].$2,
                      style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 220),
                    child: Text(
                      rows[i].$3,
                      textAlign: TextAlign.right,
                      style: PqText.text(14, FontWeight.w600, c: pq.text),
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

/// «Засчитанные чеки»: пусто — заглушка; иначе итог и переход к чекам.
/// Списка чеков по квесту API не отдаёт — только счётчик.
class _Counted extends StatelessWidget {
  const _Counted({required this.q});

  final QuestDetail q;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final recipes = q.target == QuestTarget.recipes;
    final Widget content;
    if (q.myCount <= 0) {
      content = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          children: [
            // Иконка в строчном span: строка 33.4 (svg на базовой линии
            // 16px-строки с интерлиньяжем 1.4).
            SizedBox(
              height: 33.4,
              child: Align(
                alignment: Alignment.topCenter,
                child: PqIcon(PqIcons.receipt, size: 28, color: pq.textMuted),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              recipes ? l.questsCountedEmptyRecipes : l.questsCountedEmpty,
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w600, c: pq.text),
            ),
            const SizedBox(height: 6),
            Text(
              recipes
                  ? l.questsCountedEmptySubRecipes
                  : l.questsCountedEmptySub,
              textAlign: TextAlign.center,
              style: PqText.body(c: pq.textMuted).copyWith(height: 1.4),
            ),
          ],
        ),
      );
    } else {
      content = PqListRow(
        icon: PqIcons.receipt,
        tone: PqTone.success,
        title:
            recipes
                ? l.questsCountedRecipes(q.myCount)
                : l.questsCountedSales(q.myCount),
        subtitle: recipes ? l.questsAllRecipes : l.questsAllChecks,
        chevron: true,
        onTap: () => context.go(recipes ? '/app/recipes' : '/app/checks'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqSectionHeader(
          recipes ? l.questsCountedRecipesTitle : l.questsCountedTitle,
        ),
        const SizedBox(height: 12),
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: content,
        ),
      ],
    );
  }
}

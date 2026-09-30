import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_modules.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/models/quest.dart';
import '../../core/models/wallet.dart';
import '../../widgets/pq_states.dart';
import '../mini_apps/mini_apps_home_block.dart';
import '../news/news_home_block.dart';
import '../news/survey_home_block.dart';
import '../pharmacist/providers.dart';
import '../shared/providers.dart';
import 'providers.dart';
import '../tour/tour_controller.dart';
import '../tour/tour_overlay.dart' show TourAutoStart;
import 'rx_common.dart';

/// Главная врача (макет DocHome / DocHomeLight): приветствие, кошелёк с
/// показателями и кнопкой «Отправить бланк», активные квесты, новости,
/// опрос, мини-приложения, последние бланки.
class DoctorHome extends ConsumerWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletProvider);

    Future<void> refresh() async {
      ref.invalidate(walletProvider);
      ref.invalidate(questsListProvider(QuestTarget.recipes));
      ref.invalidate(recipesProvider);
      ref.invalidate(unreadCountProvider);
      try {
        await ref.read(walletProvider.future);
      } catch (_) {}
    }

    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        const RxTabHeader(),
        Expanded(
          child: PqRefresh(
            onRefresh: refresh,
            child: PqAsync<Wallet>(
              value: wallet,
              loading: PqLoadingKind.home,
              onRetry: refresh,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
              // Обучающий тур: один раз, когда главная загрузилась.
              data: (w) => Stack(children: [
                _HomeBody(iqc: w.balanceIqc),
                const TourAutoStart(),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class _HomeBody extends ConsumerWidget {
  const _HomeBody({required this.iqc});

  final int iqc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final fullName =
        ref.watch(authControllerProvider).asData?.value.account?.fullName ?? '';
    final name = fullName.trim().split(RegExp(r'\s+')).first;
    final quests = (ref
                .watch(questsListProvider(QuestTarget.recipes))
                .asData
                ?.value ??
            const <Quest>[])
        .where((q) => q.status == QuestStatus.active)
        .toList();
    final recipes = ref.watch(recipesProvider).asData?.value ?? const <Recipe>[];
    final credits = ref.watch(recipeCreditsProvider);
    RxStage stageOf(Recipe r) => r.status.rxStage(credits[r.id]);
    final approved = recipes.where((r) => stageOf(r).isApproved).length;
    final pending = recipes.where((r) => stageOf(r) == RxStage.pending).length;

    // Разрыв 24 между блоками — отступом сверху у видимого блока, чтобы
    // скрытые (нет новостей/опроса) не оставляли двойной зазор.
    const gap = EdgeInsets.only(top: 24);
    final sections = <Widget>[
      PqPageTitle(
        name.isEmpty ? l10n.docHomeGreetingNoName : l10n.rxHomeGreeting(name),
        subtitle: l10n.rxHomeSubtitle,
      ),
      Padding(
        padding: gap,
        child: TourAnchor(
          target: TourTarget.balance,
          radius: 24,
          child: _WalletCard(
            iqc: iqc,
            activeQuests: quests.length,
            approved: approved,
            pending: pending,
          ),
        ),
      ),
      if (quests.isNotEmpty && ref.moduleVisible('quests'))
        Padding(
          padding: gap,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            PqSectionHeader(
              l10n.docHomeActiveQuests,
              actionLabel: l10n.docHomeAllQuests,
              onAction: () => context.go('/app/quests'),
            ),
            const SizedBox(height: 12),
            TourAnchor(
              target: TourTarget.quest,
              radius: 24,
              child: _QuestCard(quest: quests.first),
            ),
          ]),
        ),
      if (ref.moduleVisible('news')) const NewsHomeBlock(padding: gap),
      if (ref.moduleVisible('surveys')) const SurveyHomeBlock(padding: gap),
      if (ref.moduleVisible('mini_apps'))
        const Padding(padding: gap, child: MiniAppsHomeBlock()),
      if (recipes.isNotEmpty && ref.moduleVisible('recipes'))
        Padding(
          padding: gap,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            PqSectionHeader(
              l10n.rxHomeRecent,
              actionLabel: l10n.rxHomeAllRecipes,
              onAction: () => context.go('/app/recipes'),
            ),
            const SizedBox(height: 12),
            PqListCard(children: [
              for (final r in recipes.take(3))
                _RecentRow(recipe: r, stage: stageOf(r), credited: credits[r.id]),
            ]),
          ]),
        ),
    ];

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
      children: [
        for (var i = 0; i < sections.length; i++)
          PqAnimate(delay: PqMotion.staggerDelay(i), child: sections[i]),
      ],
    );
  }
}

// ── Кошелёк ─────────────────────────────────────────────────────────────

class _WalletCard extends StatelessWidget {
  const _WalletCard({
    required this.iqc,
    required this.activeQuests,
    required this.approved,
    required this.pending,
  });

  final int iqc;
  final int activeQuests;
  final int approved;
  final int pending;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: pq.walletGradient,
          transform: const GradientRotation(math.pi / 4),
        ),
        // В светлой теме рамки нет (и она не занимает 1 px).
        border: pq.isDark ? Border.all(color: pq.walletBorder) : null,
        boxShadow: [
          BoxShadow(
            color: pq.walletShadow,
            offset: const Offset(0, 16),
            blurRadius: 32,
            spreadRadius: pq.isDark ? -16 : -14,
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Expanded(
            child: Text(l10n.docHomeWalletBalance.toUpperCase(),
                style: PqText.overline(c: pq.walletMuted)),
          ),
          PqPressable(
            onTap: () => context.go('/app/wallet'),
            semanticLabel: l10n.docHomeWallet,
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: pq.walletPillBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: pq.walletPillBorder),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(l10n.docHomeWallet, style: PqText.link(c: pq.walletText)),
                const SizedBox(width: 4),
                PqIcon(PqIcons.chevronRight, size: 14, color: pq.walletText),
              ]),
            ),
          ),
        ]),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text('$iqc', style: PqText.balance(c: pq.walletText)),
              ),
            ),
            const SizedBox(width: 8),
            Text('IQC',
                style: PqText.text(18, FontWeight.w700, c: pq.walletText)),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: pq.walletLine)),
          ),
          child: IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              _Stat(value: activeQuests, label: l10n.rxHomeStatQuests(activeQuests)),
              _Stat(value: approved, label: l10n.rxHomeStatApproved, divider: true),
              _Stat(value: pending, label: l10n.rxHomeStatPending, divider: true),
            ]),
          ),
        ),
        const SizedBox(height: 20),
        TourAnchor(
          target: TourTarget.sendCheck,
          radius: 16,
          child: _SendButton(label: l10n.docHomeSendRecipe),
        ),
        const SizedBox(height: 10),
        Text(
          l10n.docHomeSendRecipeHint,
          textAlign: TextAlign.center,
          style: PqText.caption(c: pq.walletMuted),
        ),
      ]),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label, this.divider = false});

  final int value;
  final String label;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: divider ? 14 : 0),
        decoration: BoxDecoration(
          border: divider ? Border(left: BorderSide(color: pq.walletLine)) : null,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('$value', style: PqText.statSmall(c: Colors.white)),
          const SizedBox(height: 2),
          Text(label, style: PqText.caption(c: pq.walletMuted)),
        ]),
      ),
    );
  }
}

/// «Отправить бланк» в карточке кошелька: 54, радиус 16; в тёмной теме —
/// акцентная, в светлой — белая с синим текстом. pqPulse 2s ×3 после .8s.
class _SendButton extends StatelessWidget {
  const _SendButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final fg = pq.isDark ? pq.onAccent : pq.accent;
    return PqPulseRing.pulse(
      borderRadius: BorderRadius.circular(16),
      color: const Color(0xFF6B9EF5),
      delay: const Duration(milliseconds: 800),
      repeat: 3,
      child: PqPressable(
        onTap: () => openRecipeCamera(context),
        semanticLabel: label,
        child: Builder(builder: (context) {
          final pressed = PqPressedScope.of(context);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 54,
            decoration: BoxDecoration(
              color: pq.isDark
                  ? (pressed ? pq.accentPressed : pq.accent)
                  : (pressed ? pq.surfaceAlt : Colors.white),
              borderRadius: BorderRadius.circular(16),
              boxShadow: pq.isDark
                  ? null
                  : const [
                      BoxShadow(
                        color: Color(0x59111827),
                        offset: Offset(0, 6),
                        blurRadius: 14,
                        spreadRadius: -6,
                      ),
                    ],
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              PqIcon(PqIcons.camera, size: 20, color: fg),
              const SizedBox(width: 10),
              Flexible(
                child: Text(label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.button(c: fg)),
              ),
            ]),
          );
        }),
      ),
    );
  }
}

// ── Квест ───────────────────────────────────────────────────────────────

/// Карточка активного квеста: градиент, фиолетовая рамка, награда,
/// название, описание и сегментный прогресс «0 из 10 бланков · Ещё 10».
class _QuestCard extends ConsumerWidget {
  const _QuestCard({required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l10n = context.l10n;
    final dark = pq.isDark;
    final detail = ref.watch(questDetailProvider(quest.id)).asData?.value;

    final titleColor = dark ? const Color(0xFFF9FAFB) : Colors.white;
    final softColor = dark ? pq.textSecondary : const Color(0xE0FFFFFF);
    final progressColor = dark ? const Color(0xFFE5E7EB) : const Color(0xE0FFFFFF);
    final accent = dark ? PqColors.questProgress : PqColors.voucher;
    final track = dark ? const Color(0x1AFFFFFF) : const Color(0x40FFFFFF);

    // Сегменты: по одному на бланк, если цель небольшая; иначе 10 долей.
    final goal = detail?.goal ?? 0;
    final done = (detail?.myCount ?? 0).clamp(0, goal > 0 ? goal : 0);
    final int segments;
    final int filled;
    if (goal > 0 && goal <= 12) {
      segments = goal;
      filled = done;
    } else if (goal > 12) {
      segments = 10;
      filled = (done * 10 / goal).floor();
    } else {
      segments = 10;
      filled = (quest.progress.clamp(0, 1) * 10).floor();
    }
    final left = goal - done;

    return PqPressable(
      onTap: () => context.push('/app/quests/${quest.id}'),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: dark
                ? const [Color(0xFF0B1020), Color(0xFF1E1B4B), Color(0xFF312E81)]
                : const [Color(0xFF0EA5E9), Color(0xFF6366F1)],
            stops: dark ? const [0, .55, 1] : null,
            transform: const GradientRotation(20 * math.pi / 180),
          ),
          border: Border.all(color: dark ? PqColors.questBorder : Colors.white),
          boxShadow: [
            dark
                ? const BoxShadow(
                    color: Color(0x4DA855F7),
                    offset: Offset(0, 10),
                    blurRadius: 24,
                    spreadRadius: -10)
                : const BoxShadow(
                    color: Color(0x806366F1),
                    offset: Offset(0, 14),
                    blurRadius: 30,
                    spreadRadius: -14),
          ],
        ),
        child: Stack(children: [
          if (dark)
            Positioned(
              left: 0,
              right: 0,
              top: -20,
              height: 44,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x8CA855F7), Color(0x00A855F7)],
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Row(children: [
                quest.rewardType == RewardType.voucher
                    ? PqRewardTag.voucher(l10n.rxRewardVoucher)
                    : PqRewardTag.iqc(l10n.rxRewardIqc(quest.prizeIqc)),
                const Spacer(),
                PqIcon(PqIcons.chevronRight, size: 20, color: titleColor),
              ]),
              const SizedBox(height: 16),
              Text(quest.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.title(c: titleColor)),
              if (quest.description.trim().isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(quest.description.trim(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: rxText14(softColor)),
              ],
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                  child: Text(
                    goal > 0
                        ? l10n.rxQuestProgress(done, goal)
                        : l10n.rxQuestDone((quest.progress.clamp(0, 1) * 100).round()),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.text(14, FontWeight.w400, c: progressColor),
                  ),
                ),
                if (goal > 0 && left > 0)
                  Text(l10n.rxQuestLeft(left),
                      style: PqText.text(14, FontWeight.w700, c: accent)),
              ]),
              const SizedBox(height: 8),
              PqSegmentProgress(
                total: segments,
                filled: filled,
                fillColor: accent,
                trackColor: track,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ── Последние бланки ────────────────────────────────────────────────────

class _RecentRow extends StatelessWidget {
  const _RecentRow({required this.recipe, required this.stage, this.credited});

  final Recipe recipe;
  final RxStage stage;
  final int? credited;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final title = l10n.recipeDetailTitle(recipe.id);
    final drugDate = [
      if (recipe.drugs.isNotEmpty) recipe.drugs.first.name,
      rxDayMonth(recipe.createdAt),
    ].join(' · ');
    void open() => context.push('/app/recipes/${recipe.id}');
    return switch (stage) {
      RxStage.pending => PqListRow(
          icon: stage.icon,
          tone: stage.tone,
          title: stage.label(l10n),
          subtitle: '$title · ${formatShortDateTime(recipe.createdAt)}',
          value: l10n.rxWaitValue,
          valueCaption: l10n.rxWaitCaption,
          valueTone: stage.tone,
          valueIsAmount: false,
          onTap: open,
        ),
      RxStage.approved => PqListRow(
          icon: stage.icon,
          tone: stage.tone,
          title: title,
          subtitle: drugDate,
          value: l10n.rxSoon,
          valueCaption: l10n.rxSoonCaption,
          valueTone: stage.tone,
          onTap: open,
        ),
      RxStage.credited => PqListRow(
          icon: stage.icon,
          tone: stage.tone,
          title: title,
          subtitle: drugDate,
          value: l10n.rxRewardIqc(credited ?? 0),
          valueCaption: l10n.rxCreditedCaption,
          valueTone: stage.tone,
          onTap: open,
        ),
      RxStage.rejected => PqListRow(
          icon: stage.icon,
          tone: stage.tone,
          title: title,
          subtitle:
              '${_reason(recipe.rejectReason) ?? l10n.rxRejectedDefault} · ${rxDayMonth(recipe.createdAt)}',
          trailing: PqPillButton(
            label: l10n.rxRetake,
            icon: PqIcons.camera,
            onPressed: () => openRecipeCamera(context),
          ),
          onTap: open,
        ),
    };
  }

  static String? _reason(String? r) {
    final t = r?.trim() ?? '';
    return t.isEmpty ? null : t;
  }
}

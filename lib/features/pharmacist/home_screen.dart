import 'dart:math' as math;
import 'dart:ui' show PathMetric;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_modules.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/models/learn.dart';
import '../../core/models/quest.dart';
import '../../core/models/wallet.dart';
import '../../widgets/pq_states.dart';
import '../mini_apps/mini_apps_home_block.dart';
import '../news/news_home_block.dart';
import '../news/news_screen.dart' show newsListProvider;
import '../news/survey_home_block.dart';
import '../shared/providers.dart' show unreadCountProvider;
import '../tour/tour_controller.dart';
import '../tour/tour_overlay.dart' show TourAutoStart;
import 'checks_screen.dart' show showNewCheckSheet;
import 'providers.dart';

const _kSectionGap = 24.0;

/// Главная фармацевта (макеты Refined — эталон, HomeNew — новый пользователь,
/// SkelHome — загрузка, PullRefresh — обновление).
///
/// «Новый пользователь» — ни одного чека и нулевой баланс: вместо кошелька
/// показываем «Первые шаги», курс и квест для старта.
class PharmacistHome extends ConsumerWidget {
  const PharmacistHome({super.key});

  Future<void> _refresh(WidgetRef ref) async {
    ref.invalidate(unreadCountProvider);
    ref.invalidate(questsListProvider(QuestTarget.checks));
    ref.invalidate(questDetailProvider);
    ref.invalidate(newsListProvider);
    ref.invalidate(surveyNextProvider);
    ref.invalidate(coursesProvider);
    try {
      await Future.wait([
        ref.refresh(walletProvider.future),
        ref.refresh(checksProvider.future),
      ]);
    } catch (_) {
      // Ошибка отобразится состоянием экрана.
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final wallet = ref.watch(walletProvider);
    final checks = ref.watch(checksProvider);
    final unread = (ref.watch(unreadCountProvider).asData?.value ?? 0) > 0;

    final AsyncValue<(Wallet, List<Check>)> home;
    if (wallet.hasValue && checks.hasValue) {
      home = AsyncData((wallet.requireValue, checks.requireValue));
    } else if (wallet.hasError) {
      home = AsyncError(wallet.error!, wallet.stackTrace ?? StackTrace.empty);
    } else if (checks.hasError) {
      home = AsyncError(checks.error!, checks.stackTrace ?? StackTrace.empty);
    } else {
      home = const AsyncLoading();
    }

    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTabHeader(
            onBell: () => context.push('/app/notifications'),
            unread: unread,
            bellLabel: unread ? l.homeBellUnread : l.notifTitle,
          ),
          Expanded(
            child: PqAsync<(Wallet, List<Check>)>(
              value: home,
              onRetry: () {
                ref.invalidate(walletProvider);
                ref.invalidate(checksProvider);
              },
              loadingBuilder:
                  (_) => const SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
                    child: PqSkeletonHome(),
                  ),
              data: (d) {
                final (w, list) = d;
                final isNew = list.isEmpty && w.balanceIqc == 0;
                return Stack(
                  children: [
                    PqRefresh(
                      onRefresh: () => _refresh(ref),
                      child:
                          isNew
                              ? const _NewUserHome()
                              : _ActiveHome(wallet: w, checks: list),
                    ),
                    // Обучающий тур: один раз, когда главная загрузилась.
                    const TourAutoStart(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Прокручиваемый список секций главной с каскадным появлением
/// (`.pq-stagger`, промежуток 24).
class _HomeList extends StatelessWidget {
  const _HomeList({required this.sections});

  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
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

String _name(WidgetRef ref) =>
    ref.watch(authControllerProvider).asData?.value.account?.fullName.trim() ??
    '';

// ── Главная (макет Refined) ─────────────────────────────────────────────

class _ActiveHome extends ConsumerWidget {
  const _ActiveHome({required this.wallet, required this.checks});

  final Wallet wallet;
  final List<Check> checks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final name = _name(ref);
    final showQuests = ref.moduleVisible('quests');
    final quests =
        showQuests
            ? (ref
                    .watch(questsListProvider(QuestTarget.checks))
                    .asData
                    ?.value ??
                const <Quest>[])
            : const <Quest>[];
    final active = quests.where((q) => q.isLive).toList();

    const gap = EdgeInsets.only(top: _kSectionGap);
    return _HomeList(
      sections: [
        PqPageTitle(
          name.isEmpty ? l.homePhGreeting : l.homePhGreetingName(name),
          subtitle: l.homePhGreetingSub,
        ),
        Padding(
          padding: gap,
          child: TourAnchor(
            target: TourTarget.balance,
            radius: 22,
            child: _WalletCard(
              iqc: wallet.balanceIqc,
              showWallet: ref.moduleVisible('wallet'),
            ),
          ),
        ),
        if (active.isNotEmpty)
          Padding(
            padding: gap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PqSectionHeader(
                  l.homePhActiveQuests,
                  actionLabel: l.homePhAllQuests,
                  onAction: () => context.go('/app/quests'),
                ),
                const SizedBox(height: 12),
                TourAnchor(
                  target: TourTarget.quest,
                  radius: 24,
                  child: _QuestCard(quest: active.first),
                ),
              ],
            ),
          ),
        if (ref.moduleVisible('news')) const NewsHomeBlock(padding: gap),
        if (ref.moduleVisible('surveys')) const SurveyHomeBlock(padding: gap),
        if (ref.moduleVisible('mini_apps'))
          const Padding(padding: gap, child: MiniAppsHomeBlock()),
        if (checks.isNotEmpty)
          Padding(
            padding: gap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PqSectionHeader(
                  l.homePhRecentChecks,
                  actionLabel: l.homePhAllChecks,
                  onAction: () => context.go('/app/checks'),
                ),
                const SizedBox(height: 12),
                PqListCard(
                  children: [
                    for (final c in checks.take(3)) _CheckRow(check: c),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ── Карточка баланса ────────────────────────────────────────────────────

/// Градиентная карточка (walletGradient 135°) — общая для баланса и «Первых шагов».
class _GradientCard extends StatelessWidget {
  const _GradientCard({
    required this.child,
    required this.padding,
    this.lightBorder = false,
    this.radius = 24,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  /// HomeNew: в светлой теме рамка 1 px прозрачная (сохраняет размер).
  final bool lightBorder;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final border = pq.isDark || lightBorder;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pq.walletGradient,
        ),
        // В светлой теме у карточки нет рамки (в тёмной — 1 px walletBorder).
        border: border ? Border.all(color: pq.walletBorder) : null,
        boxShadow: [
          BoxShadow(
            color: pq.walletShadow,
            offset: const Offset(0, 16),
            blurRadius: 32,
            spreadRadius: pq.isDark ? -16 : -14,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _WalletCard extends StatelessWidget {
  const _WalletCard({required this.iqc, required this.showWallet});

  final int iqc;
  final bool showWallet;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    // Макет Refined (ред. после 1.2): компактная карточка — баланс слева,
    // кнопка «Кошелёк» справа, под ними — «Отправить чек».
    return _GradientCard(
      padding: const EdgeInsets.all(18),
      radius: 22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.homePhWalletBalanceLabel.toUpperCase(),
                      style: PqText.overline(c: pq.walletMuted),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Flexible(
                          child: Text(
                            formatUzsPlain(iqc),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: PqText.heading(
                              40,
                              FontWeight.w800,
                              height: 1,
                              c: pq.walletText,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'IQC',
                          style: PqText.text(
                            16,
                            FontWeight.w700,
                            height: 1,
                            c: pq.walletText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (showWallet) ...[
                const SizedBox(width: 12),
                HomeWalletButton(
                  label: l.homePhWalletButton,
                  onTap: () => context.go('/app/wallet'),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          TourAnchor(
            target: TourTarget.sendCheck,
            radius: 16,
            child: _SendCheckButton(
              label: l.homePhSendCheck,
              lightForeground: pq.accent,
              height: 52,
            ),
          ),
        ],
      ),
    );
  }
}

/// Кнопка «Кошелёк» на карточке баланса: 48, радиус 16, иконка + подпись +
/// шеврон. Общая для главных фармацевта и врача.
class HomeWalletButton extends StatelessWidget {
  const HomeWalletButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      semanticLabel: label,
      scale: .96,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: pq.isDark ? const Color(0x1FFFFFFF) : const Color(0x33FFFFFF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                pq.isDark ? const Color(0x38D6E3FF) : const Color(0x73FFFFFF),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PqIcon(PqIcons.wallet, size: 20, color: Colors.white),
            const SizedBox(width: 8),
            Text(label, style: PqText.button(c: Colors.white)),
            const SizedBox(width: 8),
            const PqIcon(PqIcons.chevronRight, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

/// «Отправить чек» на градиентной карточке: 54/16, камера; тёмная тема —
/// акцентная заливка, светлая — белая с цветным текстом. pqPulse ×3 после .8s.
/// Запускает существующий поток отправки чека ([showNewCheckSheet]).
class _SendCheckButton extends StatelessWidget {
  const _SendCheckButton({
    required this.label,
    required this.lightForeground,
    this.height = 54,
  });

  final String label;
  final Color lightForeground;
  final double height;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final bg = pq.isDark ? pq.accent : Colors.white;
    final fg = pq.isDark ? pq.onAccent : lightForeground;
    return PqPulseRing.pulse(
      borderRadius: BorderRadius.circular(16),
      color: pq.accent,
      delay: const Duration(milliseconds: 800),
      repeat: 3,
      child: PqPressable(
        onTap: () => showNewCheckSheet(context),
        semanticLabel: label,
        child: Builder(
          builder: (context) {
            final pressed = PqPressedScope.of(context);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: height,
              decoration: BoxDecoration(
                color:
                    pressed
                        ? Color.lerp(
                          bg,
                          pq.isDark ? Colors.black : pq.accent,
                          .08,
                        )
                        : bg,
                borderRadius: BorderRadius.circular(16),
                boxShadow:
                    pq.isDark
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PqIcon(PqIcons.camera, size: 20, color: fg),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.button(c: fg),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Карточка активного квеста ───────────────────────────────────────────

class _QuestCard extends ConsumerWidget {
  const _QuestCard({required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final dark = pq.isDark;
    // Цель и прогресс «N из M продаж» есть только в детали квеста.
    final detail = ref.watch(questDetailProvider(quest.id)).asData?.value;
    final goal = detail?.goal ?? 0;
    final done = detail == null ? 0 : math.min(detail.myCount, detail.goal);

    final int total;
    final int filled;
    if (goal > 0 && goal <= 20) {
      total = goal;
      filled = done;
    } else {
      total = 10;
      filled =
          goal > 0
              ? (done / goal * 10).floor()
              : (quest.progress.clamp(0, 1) * 10).floor();
    }

    final fg = dark ? const Color(0xFFF9FAFB) : Colors.white;
    final soft = dark ? pq.textSecondary : const Color(0xE0FFFFFF);
    final accent = dark ? PqColors.questProgress : PqColors.voucher;
    final desc =
        quest.description.replaceFirst(RegExp(r'^\s*🛒\s*'), '').trim();
    final left = goal - done;

    return PqPressable(
      onTap: () => context.push('/app/quests/${quest.id}'),
      semanticLabel: quest.name,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: const Alignment(-1, -.36),
            end: const Alignment(1, .36),
            colors:
                dark
                    ? const [
                      Color(0xFF0B1020),
                      Color(0xFF1E1B4B),
                      Color(0xFF312E81),
                    ]
                    : const [Color(0xFF0EA5E9), Color(0xFF6366F1)],
            stops: dark ? const [0, .55, 1] : null,
          ),
          border: Border.all(color: dark ? PqColors.questBorder : Colors.white),
          boxShadow: [
            dark
                ? const BoxShadow(
                  color: Color(0x4DA855F7),
                  offset: Offset(0, 10),
                  blurRadius: 24,
                  spreadRadius: -10,
                )
                : const BoxShadow(
                  color: Color(0x806366F1),
                  offset: Offset(0, 14),
                  blurRadius: 30,
                  spreadRadius: -14,
                ),
          ],
        ),
        child: Stack(
          children: [
            if (dark)
              const Positioned(
                left: 0,
                right: 0,
                top: -20,
                height: 44,
                child: DecoratedBox(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      quest.rewardType == RewardType.voucher
                          ? PqRewardTag.voucher(l.questDetailPillVoucher)
                          : PqRewardTag.iqc(l.homeRewardIqc(quest.prizeIqc)),
                      const Spacer(),
                      PqIcon(
                        PqIcons.chevronRight,
                        size: 20,
                        color: dark ? const Color(0xFFC4B5FD) : Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    quest.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.title(c: fg),
                  ),
                  if (desc.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.text(14, FontWeight.w400, c: soft),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          goal > 0
                              ? l.homeQuestSales(done, goal)
                              : l.homePhPctDone(
                                (quest.progress.clamp(0, 1) * 100).round(),
                              ),
                          style: PqText.text(
                            14,
                            FontWeight.w400,
                            c:
                                dark
                                    ? const Color(0xFFE5E7EB)
                                    : const Color(0xE0FFFFFF),
                          ),
                        ),
                      ),
                      if (goal > 0)
                        Text(
                          left > 0 ? l.homeQuestLeft(left) : l.homeQuestDone,
                          style: PqText.text(14, FontWeight.w700, c: accent),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  PqSegmentProgress(
                    total: total,
                    filled: filled,
                    fillColor: accent,
                    trackColor:
                        dark
                            ? const Color(0x1AFFFFFF)
                            : const Color(0x40FFFFFF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Строка последнего чека ──────────────────────────────────────────────

class _CheckRow extends StatelessWidget {
  const _CheckRow({required this.check});

  final Check check;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = check;
    final meta = l.homeCheckMeta(c.id, formatShortDateTime(c.createdAt));
    void open() => context.push('/app/checks/${c.id}');
    switch (c.status) {
      case CheckStatus.approved:
        final packs = c.drugs.fold<int>(0, (s, d) => s + d.packs);
        final names =
            c.drugs.map((d) => d.name).where((n) => n.isNotEmpty).toList();
        return PqListRow(
          icon: PqIcons.check,
          tone: PqTone.success,
          title:
              names.isEmpty
                  ? l.homePhCheckNumber(c.id)
                  : names.length == 1
                  ? names.first
                  : '${names.first} +${names.length - 1}',
          subtitle: meta,
          value: l.checksStatusApproved,
          valueTone: PqTone.success,
          valueCaption: packs > 0 ? l.checkDetailPacks(packs) : null,
          onTap: open,
        );
      case CheckStatus.rejected:
        final reason = c.rejectReason?.trim() ?? '';
        return PqListRow(
          icon: PqIcons.alertTriangle,
          tone: PqTone.danger,
          title: reason.isEmpty ? l.checkDetailRejectedFallback : reason,
          subtitle: meta,
          onTap: open,
          trailing: PqPillButton(
            label: l.homeCheckRetake,
            icon: PqIcons.camera,
            onPressed: () => showNewCheckSheet(context),
          ),
        );
      case CheckStatus.review:
        return PqListRow(
          icon: PqIcons.shieldOk,
          tone: PqTone.violet,
          title: c.status.label(l),
          subtitle: meta,
          onTap: open,
        );
      case CheckStatus.pending:
      case CheckStatus.aiDetected:
      case CheckStatus.aiWrong:
        return PqListRow(
          icon: PqIcons.clock,
          tone: PqTone.warning,
          title: c.status.label(l),
          subtitle: meta,
          value: l.homeCheckWait,
          valueIsAmount: false,
          valueTone: PqTone.warning,
          valueCaption: l.homeCheckWaitCaption,
          onTap: open,
        );
    }
  }
}

// ── Новый пользователь (макет HomeNew) ──────────────────────────────────

class _NewUserHome extends ConsumerWidget {
  const _NewUserHome();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final showLearn = ref.moduleVisible('learn');
    final showQuests = ref.moduleVisible('quests');
    final courses =
        showLearn
            ? (ref.watch(coursesProvider).asData?.value ?? const <Course>[])
            : const <Course>[];
    final quests =
        showQuests
            ? (ref
                    .watch(questsListProvider(QuestTarget.checks))
                    .asData
                    ?.value ??
                const <Quest>[])
            : const <Quest>[];

    // Курс для старта: сначала обязательный, затем любой непройденный.
    final open = courses.where((c) => c.progress < 1).toList();
    final course =
        open.where((c) => c.mandatory == true).firstOrNull ?? open.firstOrNull;
    final courseDone = courses.any((c) => c.progress >= 1);
    final quest = quests.where((q) => q.isLive).firstOrNull;

    const gap = EdgeInsets.only(top: _kSectionGap);
    return _HomeList(
      sections: [
        PqPageTitle(l.homeNewTitle, subtitle: l.homeNewSubtitle),
        Padding(
          padding: gap,
          child: _FirstStepsCard(course: course, courseDone: courseDone),
        ),
        if (course != null)
          Padding(
            padding: gap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PqSectionHeader(
                  l.homeNewCourseSection,
                  actionLabel: l.homeNewAllCourses,
                  onAction: () => context.go('/app/learn'),
                ),
                const SizedBox(height: 10),
                _CourseCard(course: course),
              ],
            ),
          ),
        if (quest != null)
          Padding(
            padding: gap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PqSectionHeader(
                  l.homeNewQuestSection,
                  actionLabel: l.homePhAllQuests,
                  onAction: () => context.go('/app/quests'),
                ),
                const SizedBox(height: 10),
                TourAnchor(
                  target: TourTarget.quest,
                  radius: 20,
                  child: _StartQuestCard(quest: quest),
                ),
              ],
            ),
          ),
        Padding(
          padding: gap,
          child: _DashedHint(
            text: l.homeNewHint,
            onTap:
                ref.moduleVisible('mini_apps')
                    ? () => context.push('/app/mini-apps')
                    : null,
          ),
        ),
      ],
    );
  }
}

/// «Доритрицин (Андижан)» → «Доритрицин» — короткое имя для подписи шага.
String _shortTitle(String t) {
  final s = t.replaceAll(RegExp(r'\s*\([^)]*\)'), '').trim();
  return s.isEmpty ? t : s;
}

/// Сумма наград за уроки курса (из детали курса), 0 — неизвестно.
int _courseReward(CourseDetail? d) =>
    d == null ? 0 : d.lessons.fold<int>(0, (s, x) => s + x.rewardIqc);

class _FirstStepsCard extends ConsumerWidget {
  const _FirstStepsCard({required this.course, required this.courseDone});

  final Course? course;
  final bool courseDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final c = course;
    final reward =
        c == null
            ? 0
            : _courseReward(
              ref.watch(courseDetailProvider(c.id)).asData?.value,
            );
    final courseSub =
        c == null
            ? l.homeNewStepCourseAny
            : reward > 0
            ? l.homeNewStepCourseReward(reward, _shortTitle(c.title))
            : l.homeNewStepCourseSub(_shortTitle(c.title));
    final steps = [
      (l.homeNewStepRegister, l.homeNewStepDone, true),
      (l.homeNewStepCheck, l.homeNewStepCheckSub, false),
      (
        l.homeNewStepCourse,
        courseDone ? l.homeNewStepDone : courseSub,
        courseDone,
      ),
    ];
    final doneCount = steps.where((s) => s.$3).length;
    final line = pq.isDark ? const Color(0x29D6E3FF) : const Color(0x47FFFFFF);
    return _GradientCard(
      padding: const EdgeInsets.all(18),
      lightBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l.homeNewStepsLabel.toUpperCase(),
                  style: PqText.overline(c: pq.walletMuted),
                ),
              ),
              Text(
                l.homeNewStepsCount(doneCount, steps.length),
                style: PqText.text(14, FontWeight.w700, c: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              for (var i = 0; i < steps.length; i++) ...[
                if (i > 0) const SizedBox(width: 4),
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 6,
                    decoration: BoxDecoration(
                      color:
                          steps[i].$3
                              ? const Color(0xFF22C55E)
                              : const Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 14),
          Text(
            l.homeNewHeadline,
            style: PqText.heading(
              22,
              FontWeight.w700,
              height: 1.25,
              c: Colors.white,
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: [
              for (var i = 0; i < steps.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration:
                      i < steps.length - 1
                          ? BoxDecoration(
                            border: Border(bottom: BorderSide(color: line)),
                          )
                          : null,
                  child: Row(
                    children: [
                      _StepDot(number: i + 1, done: steps[i].$3),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: steps[i].$3 ? .7 : 1,
                              child: Text(
                                steps[i].$1,
                                style: PqText.text(
                                  15,
                                  FontWeight.w600,
                                  c: Colors.white,
                                ).copyWith(
                                  decoration:
                                      steps[i].$3
                                          ? TextDecoration.lineThrough
                                          : null,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              steps[i].$2,
                              style: PqText.caption(c: pq.walletMuted),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          TourAnchor(
            target: TourTarget.sendCheck,
            radius: 16,
            child: _SendCheckButton(
              label: l.homeNewSendFirst,
              lightForeground: pq.accentText,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.number, required this.done});

  final int number;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: done ? const Color(0xFF22C55E) : const Color(0x24FFFFFF),
        border:
            done
                ? null
                : Border.all(color: const Color(0x80FFFFFF), width: 1.5),
      ),
      alignment: Alignment.center,
      child:
          done
              ? const PqIcon(PqIcons.check, size: 16, color: Colors.white)
              : Text('$number', style: PqText.tag(c: Colors.white)),
    );
  }
}

class _CourseCard extends ConsumerWidget {
  const _CourseCard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final detail = ref.watch(courseDetailProvider(course.id)).asData?.value;
    final reward = _courseReward(detail);
    final lessons = detail?.lessons ?? const <Lesson>[];
    final videoMin = lessons
        .where((x) => x.kind == 'video')
        .fold<int>(0, (s, x) => s + x.durationMin);
    final quizLesson = lessons.where((x) => x.kind == 'quiz').firstOrNull;
    final hasQuiz = quizLesson != null;
    // Число вопросов теста — из самого теста (как «тест 5 вопросов» в макете).
    final questions =
        quizLesson == null
            ? null
            : ref
                .watch(quizProvider((course.id, quizLesson.id)))
                .asData
                ?.value
                .questions
                .length;
    final sub =
        detail == null || (videoMin == 0 && !hasQuiz)
            ? l.homeNewCourseLessons(
              detail?.lessons.length ?? course.lessonCount,
            )
            : [
              if (videoMin > 0) l.homeNewCourseVideo(videoMin),
              if (hasQuiz)
                questions != null && questions > 0
                    ? l.homeNewCourseQuizQuestions(questions)
                    : l.homeNewCourseQuiz,
            ].join(' · ');
    return PqCard(
      padding: const EdgeInsets.all(14),
      onTap: () => context.push('/app/learn/${course.id}'),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment(-1, -.6),
                end: Alignment(1, .6),
                colors: [Color(0xFFE8611A), Color(0xFFF5A031)],
              ),
            ),
            alignment: Alignment.center,
            child: const PqIcon(PqIcons.play, size: 22, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.heading(16, FontWeight.w700, c: pq.text),
                ),
                const SizedBox(height: 2),
                Text(
                  sub,
                  style: PqText.text(14, FontWeight.w400, c: pq.textMuted),
                ),
              ],
            ),
          ),
          if (reward > 0) ...[
            const SizedBox(width: 14),
            PqRewardTag.iqc(l.homeRewardIqc(reward)),
          ],
        ],
      ),
    );
  }
}

class _StartQuestCard extends ConsumerWidget {
  const _StartQuestCard({required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final detail = ref.watch(questDetailProvider(quest.id)).asData?.value;
    final sub = [
      if (detail != null && detail.goal > 0) l.homeNewQuestGoal(detail.goal),
      quest.rewardType == RewardType.voucher
          ? l.homeNewQuestVoucher
          : l.homeNewQuestIqc,
    ].join(' · ');
    return PqCard(
      padding: const EdgeInsets.all(14),
      onTap: () => context.push('/app/quests/${quest.id}'),
      child: Row(
        children: [
          const PqIconTile(
            PqIcons.target,
            tone: PqTone.warning,
            size: 56,
            radius: 16,
            iconSize: 24,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quest.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.heading(16, FontWeight.w700, c: pq.text),
                ),
                const SizedBox(height: 2),
                Text(
                  sub,
                  style: PqText.text(14, FontWeight.w400, c: pq.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          PqIcon(PqIcons.chevronRight, size: 18, color: pq.textMuted),
        ],
      ),
    );
  }
}

/// Пунктирная подсказка «Баланс, ваучеры и игры появятся после первых IQC».
class _DashedHint extends StatelessWidget {
  const _DashedHint({required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final body = CustomPaint(
      painter: _DashedRRectPainter(color: pq.borderStrong, radius: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              PqIcon(PqIcons.grid, size: 20, color: pq.textSecondary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: PqText.text(15, FontWeight.w400, c: pq.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return onTap == null ? body : PqPressable(onTap: onTap, child: body);
  }
}

class _DashedRRectPainter extends CustomPainter {
  _DashedRRectPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Offset.zero & size,
            Radius.circular(radius),
          ).deflate(.5),
        );
    for (final PathMetric m in path.computeMetrics()) {
      for (double d = 0; d < m.length; d += 7) {
        canvas.drawPath(m.extractPath(d, math.min(d + 4, m.length)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRectPainter old) =>
      old.color != color || old.radius != radius;
}

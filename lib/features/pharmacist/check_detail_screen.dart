import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../widgets/pq_states.dart';
import '../shared/widgets/photo_lightbox.dart';
import 'checks/check_ui.dart';
import 'checks_screen.dart';
import 'providers.dart';

/// Экран чека (макеты CheckPending, CheckApproved, CheckCredited,
/// CheckRejected). Под нижним меню.
class CheckDetailScreen extends ConsumerWidget {
  const CheckDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final detail = ref.watch(checkDetailProvider(id));
    final navBottom = MediaQuery.paddingOf(context).bottom;
    final rejected = detail.asData?.value.status == CheckStatus.rejected;
    final bottomPad =
        math.max(kPqNavClearance, navBottom + 36) + (rejected ? 108 : 0);

    return PqScreen(
      safeBottom: false,
      child: Stack(
        children: [
          Positioned.fill(
            child: PqRefresh(
              onRefresh: () async {
                ref.invalidate(checkDetailProvider(id));
                try {
                  await ref.read(checkDetailProvider(id).future);
                } catch (_) {}
              },
              child: PqAsync<CheckDetail>(
                value: detail,
                onRetry: () => ref.invalidate(checkDetailProvider(id)),
                loadingBuilder:
                    (_) => ListView(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
                      children: [
                        const _BackLink(),
                        const SizedBox(height: 24),
                        PqSkeletonList(title: l.checkDetailTitle(id), rows: 3),
                      ],
                    ),
                data:
                    (d) => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(16, 12, 16, bottomPad),
                      children: [
                        PqStagger(gap: 24, children: _sections(context, d)),
                      ],
                    ),
              ),
            ),
          ),
          if (rejected)
            Positioned(
              left: 0,
              right: 0,
              bottom: navBottom,
              child: const _RetakeBar(),
            ),
        ],
      ),
    );
  }

  List<Widget> _sections(BuildContext context, CheckDetail d) {
    final stage = checkStageOf(d.status, credited: d.allocations.isNotEmpty);
    return [
      const _BackLink(),
      _Header(detail: d, stage: stage),
      _Hero(detail: d, stage: stage),
      if (d.photos.isNotEmpty) _Photos(detail: d),
      if (stage != CheckStage.rejected &&
          (stage == CheckStage.review || d.drugs.isNotEmpty))
        _AiSection(drugs: d.drugs, stage: stage),
      if (stage != CheckStage.rejected) _Accrual(detail: d, stage: stage),
      _Quests(detail: d, stage: stage),
      const _SupportLink(),
    ];
  }
}

/// «‹ Мои чеки» — 15/600, зона нажатия 44.
class _BackLink extends StatelessWidget {
  const _BackLink();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Align(
      alignment: Alignment.centerLeft,
      child: PqPressable(
        semanticLabel: l.checkDetailBackMyChecks,
        onTap:
            () => context.canPop() ? context.pop() : context.go('/app/checks'),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PqIcon(PqIcons.chevronLeft, size: 20, color: pq.textSecondary),
              const SizedBox(width: 4),
              Text(
                l.checkDetailBackMyChecks,
                style: PqText.text(15, FontWeight.w600, c: pq.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.detail, required this.stage});

  final CheckDetail detail;
  final CheckStage stage;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Semantics(
                header: true,
                child: Text(
                  l.checkDetailTitle(detail.id),
                  style: PqText.display(c: pq.text),
                ),
              ),
            ),
            const SizedBox(width: 12),
            PqStatusBadge(stage.label(l), tone: stage.tone),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          l.checksDatePhotos(
            formatShortDateTime(detail.createdAt),
            detail.photoCount,
          ),
          style: PqText.subtitle(c: pq.textMuted),
        ),
      ],
    );
  }
}

/// Карточка статуса: плитка 44, заголовок 18/700, пояснение и шаги.
class _Hero extends StatelessWidget {
  const _Hero({required this.detail, required this.stage});

  final CheckDetail detail;
  final CheckStage stage;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final t = pq.tone(stage.tone);
    final (String title, String text) = switch (stage) {
      CheckStage.review => (l.checksHeroPendingTitle, l.checksHeroPendingText),
      CheckStage.approved => (
        l.checksHeroApprovedTitle,
        l.checksHeroApprovedText,
      ),
      CheckStage.credited => (
        l.checksHeroCreditedTitle,
        l.checksHeroCreditedText,
      ),
      CheckStage.rejected => (l.checksHeroRejectedTitle, _rejectedText(l)),
    };
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: pq.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: t.fg),
        boxShadow: pq.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PqIconTile(
                stage.icon,
                tone: stage.tone,
                radius: 14,
                iconSize: 22,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: PqText.title(c: pq.text)),
                    const SizedBox(height: 4),
                    Text(text, style: PqText.body(c: pq.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          CheckSteps(stage: stage),
        ],
      ),
    );
  }

  String _rejectedText(AppLocalizations l) {
    final reason = detail.rejectReason?.trim() ?? '';
    if (reason.isEmpty) return l.checksHeroRejectedText;
    final end = RegExp(r'[.!?…]$').hasMatch(reason) ? '' : '.';
    return '$reason$end ${l.checksHeroRejectedText}';
  }
}

/// «Фото чека»: плитки 104×128, внутри — фото на «листе» под наклоном.
class _Photos extends StatelessWidget {
  const _Photos({required this.detail});

  final CheckDetail detail;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final urls = [for (final p in detail.photos) p.url];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChecksSectionTitle(l.checksPhotosTitle),
        const SizedBox(height: 10),
        SizedBox(
          height: 128,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: urls.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder:
                (_, i) => PqPressable(
                  semanticLabel: l.checksOpenPhoto(i + 1),
                  onTap:
                      () => showPhotoLightbox(
                        context,
                        urls,
                        initialIndex: i,
                        title: l.checkDetailTitle(detail.id),
                      ),
                  child: Container(
                    width: 104,
                    height: 128,
                    decoration: BoxDecoration(
                      color: pq.surfaceAlt,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ReceiptPaper(
                          width: 62,
                          height: 88,
                          rotation: i.isEven ? -3 : 2,
                          photo: Image.network(
                            urls[i],
                            width: 62,
                            height: 88,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const ReceiptLines(),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: Color(0x80000000),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const PqIcon(
                              PqIcons.zoomIn,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}

/// «Распознано ИИ»: препараты или «дышащие» заглушки, пока чек на проверке.
class _AiSection extends StatelessWidget {
  const _AiSection({required this.drugs, required this.stage});

  final List<CheckDrug> drugs;
  final CheckStage stage;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    Widget bar(double width) => PqBreath(
      child: Container(
        height: 12,
        width: width,
        decoration: BoxDecoration(
          color: pq.borderStrong,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );

    // Полосы 55% / 40% ширины строки и 48 px справа (space-between).
    Widget skeleton(double f) => ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: LayoutBuilder(
        builder:
            (_, box) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [bar(box.maxWidth * f), bar(48)],
            ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChecksSectionTitle(
          l.checkDetailAiTitle,
          icon: PqIcons.sparkle,
          iconColor: checksAiColor(pq),
        ),
        const SizedBox(height: 10),
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (drugs.isEmpty) ...[
                skeleton(.55),
                skeleton(.4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(
                    l.checksAiPending,
                    style: PqText.body(c: pq.textMuted),
                  ),
                ),
              ] else
                for (final d in drugs)
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 48),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(d.name, style: PqText.field(c: pq.text)),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          l.checkDetailPacks(d.packs),
                          style: PqText.amount(c: pq.text),
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

/// «Начисление»: что и когда поступит на баланс.
class _Accrual extends StatelessWidget {
  const _Accrual({required this.detail, required this.stage});

  final CheckDetail detail;
  final CheckStage stage;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final packs = detail.drugs.fold<int>(0, (s, d) => s + d.packs);
    final names = detail.drugs
        .map((d) => d.name)
        .where((s) => s.isNotEmpty)
        .join(', ');
    final drugsLine =
        names.isEmpty
            ? null
            : packs > 0
            ? '$names · ${l.checkDetailPacks(packs)}'
            : names;
    final big = PqText.heading(22, FontWeight.w700, c: pq.textMuted);
    final (String title, String? sub, Widget value) = switch (stage) {
      CheckStage.approved => (
        l.checksAccrualApprovedTitle,
        drugsLine,
        Text(l.checksAccrualSoon, style: big.copyWith(color: pq.success)),
      ),
      // Сумма IQC по чеку в API не приходит — показываем отметку «зачислено».
      CheckStage.credited => (
        l.checksAccrualCreditedTitle,
        drugsLine,
        PqAnimate(
          fx: PqFx.pop,
          delay: const Duration(milliseconds: 300),
          child: PqIcon(PqIcons.checkCheck, size: 26, color: pq.info),
        ),
      ),
      _ => (
        l.checksAccrualPendingTitle,
        l.checksAccrualPendingText,
        Text('—', style: big),
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChecksSectionTitle(
          l.checksAccrualTitle,
          icon: PqIcons.coin,
          iconColor: pq.accentText,
        ),
        const SizedBox(height: 10),
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 60),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: PqText.field(c: pq.text, w: FontWeight.w600),
                      ),
                      if (sub != null) ...[
                        const SizedBox(height: 2),
                        Text(sub, style: PqText.body(c: pq.textMuted)),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                value,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// «Зачёт в квесты»: квесты, в которые засчитан чек.
class _Quests extends StatelessWidget {
  const _Quests({required this.detail, required this.stage});

  final CheckDetail detail;
  final CheckStage stage;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final items = detail.allocations;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChecksSectionTitle(
          l.checkDetailQuestCardTitle,
          icon: PqIcons.trophy,
          iconColor: pq.success,
        ),
        const SizedBox(height: 10),
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              items.isEmpty
                  ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      stage == CheckStage.review
                          ? l.checkDetailQuestAfterApproval
                          : l.checkDetailQuestNone,
                      style: PqText.body(c: pq.textMuted),
                    ),
                  )
                  : Column(
                    children: [
                      for (var i = 0; i < items.length; i++)
                        Container(
                          decoration: BoxDecoration(
                            border:
                                i < items.length - 1
                                    ? Border(
                                      bottom: BorderSide(color: pq.divider),
                                    )
                                    : null,
                          ),
                          child: PqPressable(
                            onTap:
                                () => context.push(
                                  '/app/quests/${items[i].questId}',
                                ),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(minHeight: 56),
                              child: Row(
                                children: [
                                  const PqIconTile(
                                    PqIcons.trophy,
                                    tone: PqTone.success,
                                    size: 36,
                                    radius: 10,
                                    iconSize: 18,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          items[i].questName,
                                          style: PqText.field(
                                            c: pq.text,
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 1),
                                        Text(
                                          l.checksQuestDone,
                                          style: PqText.body(c: pq.success),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PqIcon(
                                    PqIcons.chevronRight,
                                    size: 18,
                                    color: pq.textMuted,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
        ),
      ],
    );
  }
}

/// «Вопрос по чеку? Напишите нам» → чат поддержки.
class _SupportLink extends StatelessWidget {
  const _SupportLink();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqPressable(
      onTap: () => context.push('/app/support'),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PqIcon(PqIcons.headphones, size: 18, color: pq.accent),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                l.checksSupport,
                textAlign: TextAlign.center,
                style: PqText.text(15, FontWeight.w600, c: pq.accent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Закреплённая над меню кнопка «Переснять чек» с растворением фона.
class _RetakeBar extends StatelessWidget {
  const _RetakeBar();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, .45],
          colors: [pq.bg.withValues(alpha: 0), pq.bg],
        ),
      ),
      child: PqButton(
        label: l.checksRetakeCheck,
        icon: PqIcons.camera,
        onPressed: () => showNewCheckSheet(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/img.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../widgets/pq_states.dart';
import '../shared/widgets/photo_lightbox.dart';
import 'providers.dart';
import 'rx_common.dart';

/// Экран бланка (макеты RxPending / RxApproved / RxRejected): статус с
/// шагами, фото, распознанные препараты, начисление, зачёт в квесты,
/// ссылка на распознанный текст и поддержку. У отклонённого — закреплённая
/// снизу кнопка «Переснять бланк».
class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(recipeDetailProvider(id));
    final credited = ref.watch(recipeCreditsProvider)[id];
    Future<void> refresh() async {
      ref.invalidate(recipeDetailProvider(id));
      try {
        await ref.read(recipeDetailProvider(id).future);
      } catch (_) {}
    }

    return PqScreen(
      safeBottom: false,
      child: PqAsync<RecipeDetail>(
        value: detail,
        onRetry: refresh,
        loadingBuilder: (_) => const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, kPqNavClearance),
          child: _BackLink(),
        ),
        data: (d) => PqRefresh(
            onRefresh: refresh, child: _Body(detail: d, credited: credited)),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.detail, this.credited});

  final RecipeDetail detail;

  /// Начислено IQC (если известно) — этап «Начислено».
  final int? credited;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final stage = detail.status.rxStage(credited);
    final rejected = stage == RxStage.rejected;
    final aiText = detail.aiText?.trim() ?? '';

    final sections = <Widget>[
      const _BackLink(),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Expanded(
            child: Text(l10n.recipeDetailTitle(detail.id),
                style: PqText.display(c: pq.text)),
          ),
          const SizedBox(width: 12),
          RxStatusBadge(stage),
        ]),
        const SizedBox(height: 6),
        Text(
          l10n.rxMeta(formatShortDateTime(detail.createdAt), detail.photoCount),
          style: PqText.subtitle(c: pq.textMuted),
        ),
      ]),
      _StatusCard(stage: stage, rejectReason: detail.rejectReason),
      _Section(title: l10n.rxPhotos, child: _Photos(detail: detail)),
      if (!rejected) ...[
        _Section(
          title: l10n.recipeDetailAiRecognized,
          icon: PqIcons.sparkle,
          iconColor: rxSparkleColor(pq),
          child: _AiCard(stage: stage, drugs: detail.drugs),
        ),
        _Section(
          title: l10n.rxAccrual,
          icon: PqIcons.coin,
          iconColor: pq.accentText,
          child: _AccrualCard(stage: stage, drugs: detail.drugs, credited: credited),
        ),
      ],
      // Зачёт по квестам для бланков API не отдаёт: у одобренного блок
      // скрыт, чтобы не показывать неверное «не зачтён».
      if (!stage.isApproved)
        _Section(
          title: l10n.rxQuests,
          icon: PqIcons.trophy,
          iconColor: pq.success,
          child: PqCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text(
              stage == RxStage.pending ? l10n.rxQuestsPending : l10n.rxQuestsNone,
              style: rxText14(pq.textMuted),
            ),
          ),
        ),
      if (!rejected && aiText.isNotEmpty)
        _Section(
          title: l10n.rxData,
          icon: PqIcons.fileRx,
          iconColor: pq.accentText,
          child: PqCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: PqPressable(
              onTap: () => context.push('/app/recipes/${detail.id}/text'),
              child: SizedBox(
                height: 44,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                    child: Text(l10n.rxShowText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.link(c: pq.accent)),
                  ),
                  const SizedBox(width: 6),
                  PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
                ]),
              ),
            ),
          ),
        ),
      PqPressable(
        onTap: () => context.push('/app/support'),
        child: SizedBox(
          height: 48,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            PqIcon(PqIcons.headphones, size: 18, color: pq.accent),
            const SizedBox(width: 8),
            Flexible(
              child: Text(l10n.rxSupport,
                  style: PqText.text(15, FontWeight.w600, c: pq.accent)),
            ),
          ]),
        ),
      ),
    ];

    final list = ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16, 12, 16, rejected ? 200 : kPqNavClearance),
      children: [PqStagger(gap: 24, children: sections)],
    );
    if (!rejected) return list;

    final bottom = MediaQuery.paddingOf(context).bottom;
    return Stack(children: [
      Positioned.fill(child: list),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 28 + bottom),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [pq.bg.withValues(alpha: 0), pq.bg],
              stops: const [0, .45],
            ),
          ),
          child: PqButton(
            label: l10n.rxRetakeRecipe,
            icon: PqIcons.camera,
            onPressed: () => openRecipeCamera(context),
          ),
        ),
      ),
    ]);
  }
}

/// «‹ Мои бланки» — возврат к списку (зона нажатия 44).
class _BackLink extends StatelessWidget {
  const _BackLink();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final label = context.l10n.recipeDetailMyRecipes;
    return Align(
      alignment: Alignment.centerLeft,
      child: PqPressable(
        semanticLabel: label,
        onTap: () =>
            context.canPop() ? context.pop() : context.go('/app/recipes'),
        child: SizedBox(
          height: 44,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            PqIcon(PqIcons.chevronLeft, size: 20, color: pq.textSecondary),
            const SizedBox(width: 4),
            Text(label, style: PqText.text(15, FontWeight.w600, c: pq.textSecondary)),
          ]),
        ),
      ),
    );
  }
}

// ── Статус + шаги ───────────────────────────────────────────────────────

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.stage, required this.rejectReason});

  final RxStage stage;
  final String? rejectReason;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final t = pq.tone(stage.tone);
    final reason = rejectReason?.trim() ?? '';
    final (title, text) = switch (stage) {
      RxStage.pending => (l10n.rxStatePendingTitle, l10n.rxStatePendingText),
      RxStage.approved => (l10n.rxStateApprovedTitle, l10n.rxStateApprovedText),
      RxStage.credited => (l10n.rxStateCreditedTitle, l10n.rxStateCreditedText),
      RxStage.rejected => (
          l10n.rxStateRejectedTitle,
          reason.isEmpty
              ? l10n.rxStateRejectedHint
              : '${_sentence(reason)} ${l10n.rxStateRejectedHint}',
        ),
    };
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: pq.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: t.fg),
        boxShadow: pq.cardShadow,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          PqIconTile(stage.icon, tone: stage.tone, radius: 14, iconSize: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: PqText.title(c: pq.text)),
              const SizedBox(height: 4),
              Text(text, style: PqText.body(c: pq.textSecondary)),
            ]),
          ),
        ]),
        const SizedBox(height: 14),
        _Steps(stage: stage),
      ]),
    );
  }

  /// Причина отказа как предложение: с точкой в конце.
  static String _sentence(String s) =>
      RegExp(r'[.!?…]$').hasMatch(s) ? s : '$s.';
}

/// Шаги «Отправлен · Проверка · Одобрен · Начислено»: полосы 4 px и подписи.
class _Steps extends StatelessWidget {
  const _Steps({required this.stage});

  final RxStage stage;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final track = pq.isDark ? pq.border : const Color(0xFFE5E7EB);
    final colors = switch (stage) {
      RxStage.pending => [pq.success, pq.warning, track, track],
      RxStage.approved => [pq.success, pq.success, pq.success, track],
      RxStage.credited => [pq.success, pq.success, pq.success, pq.info],
      RxStage.rejected => [pq.success, pq.danger, track, track],
    };
    // Текущий шаг: 1 — проверка/отказ, 2 — одобрен, 3 — начислено.
    final current = switch (stage) {
      RxStage.pending || RxStage.rejected => 1,
      RxStage.approved => 2,
      RxStage.credited => 3,
    };
    final labels = [
      l10n.rxStepSent,
      stage == RxStage.rejected ? l10n.rxStepRejected : l10n.rxStepReview,
      l10n.rxStepApproved,
      l10n.rxStepCredited,
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        for (var i = 0; i < 4; i++) ...[
          if (i > 0) const SizedBox(width: 4),
          Expanded(child: _bar(colors[i], breath: stage == RxStage.pending && i == 1)),
        ],
      ]),
      const SizedBox(height: 6),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (var i = 0; i < 4; i++) ...[
          if (i > 0) const SizedBox(width: 4),
          Expanded(
            child: Text(
              labels[i],
              style: PqText.caption(
                w: i == current ? FontWeight.w700 : FontWeight.w500,
                c: stage == RxStage.rejected && i == 1
                    ? pq.danger
                    : i <= current
                        ? pq.text
                        : pq.textMuted,
              ),
            ),
          ),
        ],
      ]),
    ]);
  }

  static Widget _bar(Color c, {bool breath = false}) {
    final bar = Container(
      height: 4,
      decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(2)),
    );
    return breath ? PqBreath(child: bar) : bar;
  }
}

// ── Секции ──────────────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.child,
    this.icon,
    this.iconColor,
  });

  final String title;
  final Widget child;
  final PqIcons? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(children: [
          if (icon != null) ...[
            PqIcon(icon!, size: 18, color: iconColor),
            const SizedBox(width: 8),
          ],
          Expanded(child: Text(title, style: PqText.section(c: pq.text))),
        ]),
      ),
      const SizedBox(height: 10),
      child,
    ]);
  }
}

class _Photos extends StatelessWidget {
  const _Photos({required this.detail});

  final RecipeDetail detail;

  @override
  Widget build(BuildContext context) {
    final photos = detail.photos;
    if (photos.isEmpty) {
      return const Align(alignment: Alignment.centerLeft, child: _PhotoTile());
    }
    final urls = [for (final p in photos) p.url];
    return SizedBox(
      height: 128,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: photos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) => _PhotoTile(
          url: imgThumb(photos[i].url, w: 320),
          label: context.l10n.rxOpenPhoto(i + 1),
          onTap: () => showPhotoLightbox(context, urls, initialIndex: i),
        ),
      ),
    );
  }
}

/// Плитка фото 104×128: превью (или иллюстрация листа) + значок «увеличить».
class _PhotoTile extends StatelessWidget {
  const _PhotoTile({this.url, this.label, this.onTap});

  final String? url;
  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final tile = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 104,
        height: 128,
        child: Stack(fit: StackFit.expand, children: [
          ColoredBox(
            color: pq.surfaceAlt,
            child: const Center(child: RxPaperSheet()),
          ),
          if (url != null)
            Image.network(
              url!,
              fit: BoxFit.cover,
              frameBuilder: (_, child, frame, sync) => AnimatedOpacity(
                opacity: sync || frame != null ? 1 : 0,
                duration: const Duration(milliseconds: 250),
                child: child,
              ),
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          if (onTap != null)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                    color: Color(0x80000000), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: const PqIcon(PqIcons.zoomIn, size: 15, color: Colors.white),
              ),
            ),
        ]),
      ),
    );
    return onTap == null
        ? tile
        : PqPressable(onTap: onTap, semanticLabel: label, child: tile);
  }
}

class _AiCard extends StatelessWidget {
  const _AiCard({required this.stage, required this.drugs});

  final RxStage stage;
  final List<RecipeDrug> drugs;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final List<Widget> children;
    if (drugs.isNotEmpty) {
      children = [
        for (final d in drugs)
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: Row(children: [
              Expanded(child: Text(d.name, style: PqText.field(c: pq.text))),
              const SizedBox(width: 12),
              Text('${d.qty}', style: PqText.amount(c: pq.text)),
            ]),
          ),
      ];
    } else if (stage == RxStage.pending) {
      // Полосы-заглушки: 55% / 40% ширины строки и 48 px справа.
      Widget bar(double f) => ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: LayoutBuilder(
              builder: (_, box) => Row(children: [
                SizedBox(width: box.maxWidth * f, child: PqBreath(child: _bar(pq))),
                const Spacer(),
                SizedBox(width: 48, child: PqBreath(child: _bar(pq))),
              ]),
            ),
          );
      children = [
        bar(.55),
        bar(.4),
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Text(l10n.rxAiLater, style: rxText14(pq.textMuted)),
        ),
      ];
    } else {
      children = [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(l10n.recipeDetailNoDrugs, style: rxText14(pq.textMuted)),
        ),
      ];
    }
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
    );
  }

  static Widget _bar(PqColors pq) => Container(
        height: 12,
        decoration: BoxDecoration(
            color: pq.borderStrong, borderRadius: BorderRadius.circular(6)),
      );
}

class _AccrualCard extends StatelessWidget {
  const _AccrualCard({required this.stage, required this.drugs, this.credited});

  final RxStage stage;
  final List<RecipeDrug> drugs;
  final int? credited;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final (String title, String sub, Widget value) = switch (stage) {
      RxStage.credited => (
          l10n.rxAccrualCreditedTitle,
          rxDrugsLine(drugs),
          // pqPop .5s после .3s — сумма «впрыгивает».
          PqAnimate(
            fx: PqFx.pop,
            delay: const Duration(milliseconds: 300),
            child: Text(l10n.rxRewardIqc(credited ?? 0),
                style: PqText.heading(22, FontWeight.w700, c: pq.info)),
          ),
        ),
      RxStage.approved => (
          l10n.rxAccrualApprovedTitle,
          rxDrugsLine(drugs),
          Text(l10n.rxSoon,
              style: PqText.heading(22, FontWeight.w700, c: pq.success)),
        ),
      _ => (
          l10n.rxAccrualPendingTitle,
          l10n.rxAccrualPendingText,
          Text('—', style: PqText.heading(22, FontWeight.w700, c: pq.textMuted)),
        ),
    };
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 60),
        child: Row(children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: PqText.text(16, FontWeight.w600, c: pq.text)),
                if (sub.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(sub,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: rxText14(pq.textMuted)),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          value,
        ]),
      ),
    );
  }
}

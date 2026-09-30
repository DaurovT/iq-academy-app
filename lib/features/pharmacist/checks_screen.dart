import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/check.dart';
import '../../core/uploads/pending_upload.dart';
import '../../core/uploads/upload_queue.dart';
import '../../widgets/local_photo.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'checks/check_ui.dart';
import 'checks/upload_sheet.dart';
import 'providers.dart';

/// Маршрут, который открывает «Мои чеки» сразу с листом «Новый чек».
const kChecksUploadPath = '/app/checks/upload';

/// Открывает лист отправки нового чека (макеты UploadPick → UploadPhotos →
/// UploadDone). Используется на экране «Мои чеки» и на главной.
Future<void> showNewCheckSheet(BuildContext context) =>
    showCheckUploadSheet(context);

/// Сколько строк истории показывать до «Показать все» (не больше).
const _historyPreview = 5;

/// Превью истории: последний месяц (как в макете — «Июнь 2026»), до 5 строк.
List<Check> _historyHead(List<Check> history) {
  if (history.isEmpty) return history;
  DateTime? m(Check c) => DateTime.tryParse(c.createdAt)?.toLocal();
  final first = m(history.first);
  return history
      .takeWhile(
        (c) => m(c)?.year == first?.year && m(c)?.month == first?.month,
      )
      .take(_historyPreview)
      .toList();
}

/// Экран «Мои чеки» (макеты Checks, ChecksEmpty, Offline, SkelList).
class ChecksScreen extends ConsumerStatefulWidget {
  const ChecksScreen({super.key, this.openUpload = false});

  /// Сразу открыть лист «Новый чек» (маршрут [kChecksUploadPath]).
  final bool openUpload;

  @override
  ConsumerState<ChecksScreen> createState() => _ChecksScreenState();
}

class _ChecksScreenState extends ConsumerState<ChecksScreen> {
  DateTime? _loadedAt;
  bool _showAll = false;

  @override
  void initState() {
    super.initState();
    ref.listenManual<AsyncValue<List<Check>>>(checksProvider, (_, next) {
      if (next.hasValue && !next.isLoading && !next.hasError) {
        _loadedAt = DateTime.now();
      }
    }, fireImmediately: true);
    // Связь вернулась — обновляем список сами.
    ref.listenManual<AsyncValue<bool>>(checksOnlineProvider, (prev, next) {
      if (prev?.asData?.value == false && next.asData?.value == true) {
        ref.invalidate(checksProvider);
      }
    });
    if (widget.openUpload) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        await showNewCheckSheet(context);
        if (mounted) context.go('/app/checks');
      });
    }
  }

  Future<void> _refresh() async {
    ref.read(uploadQueueProvider.notifier).retryNow();
    ref.invalidate(checksProvider);
    try {
      await ref.read(checksProvider.future);
    } catch (_) {}
  }

  void _send() => showNewCheckSheet(context);

  void _open(Check c) => context.push('/app/checks/${c.id}');

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final checks = ref.watch(checksProvider);
    final queue =
        ref.watch(uploadQueueProvider).asData?.value ?? const <PendingUpload>[];
    final online = ref.watch(checksOnlineProvider).asData?.value ?? true;
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    final navBottom = MediaQuery.paddingOf(context).bottom;
    final list = checks.asData?.value;
    final showFab =
        online && list != null && (list.isNotEmpty || queue.isNotEmpty);
    final bottomPad =
        math.max(kPqNavClearance, navBottom + 36) + (showFab ? 80 : 0);

    return PqScreen(
      safeBottom: false,
      child: Stack(
        children: [
          Column(
            children: [
              PqTabHeader(
                onBell: () => context.push('/app/notifications'),
                bellLabel: l.notifTitle,
                unread: unread > 0,
              ),
              if (!online && list != null) PqOfflineBanner(since: _loadedAt),
              Expanded(
                child: PqRefresh(
                  onRefresh: _refresh,
                  child: PqAsync<List<Check>>(
                    value: checks,
                    onRetry: () => ref.invalidate(checksProvider),
                    loadingBuilder:
                        (_) => ListView(
                          padding: kPqPagePadding,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            PqSkeletonList(title: l.checksTitle, rows: 6),
                          ],
                        ),
                    data:
                        (list) => ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(
                            16,
                            online ? 4 : 16,
                            16,
                            bottomPad,
                          ),
                          children: [
                            PqStagger(
                              gap: online ? 24 : 20,
                              children: _content(context, list, queue, online),
                            ),
                          ],
                        ),
                  ),
                ),
              ),
            ],
          ),
          if (showFab)
            Positioned(
              right: 16,
              bottom: navBottom + 16,
              child: _SendFab(onTap: _send),
            ),
        ],
      ),
    );
  }

  List<Widget> _content(
    BuildContext context,
    List<Check> list,
    List<PendingUpload> queue,
    bool online,
  ) {
    final pq = context.pq;
    final l = context.l10n;
    final empty = list.isEmpty && queue.isEmpty;
    final rejected = [
      for (final c in list)
        if (c.status == CheckStatus.rejected) c,
    ];
    final review = [
      for (final c in list)
        if (checkStageOf(c.status) == CheckStage.review) c,
    ];
    final history = [
      for (final c in list)
        if (c.status == CheckStatus.approved) c,
    ];

    final offlineSend = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqButton(
          label: l.checksSendCheck,
          icon: PqIcons.camera,
          onPressed: null,
        ),
        const SizedBox(height: 8),
        Text(
          l.stateOfflineSendHint,
          textAlign: TextAlign.center,
          style: PqText.body(c: pq.textMuted),
        ),
      ],
    );

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(l.checksTitle, style: PqText.display(c: pq.text)),
          ),
          if (!empty) ...[
            const SizedBox(height: 4),
            Text(
              l.checksSentCount(list.length),
              style: PqText.subtitle(c: pq.textMuted),
            ),
          ],
        ],
      ),
      if (!online) offlineSend,
      if (empty) ...[
        const _EmptyHero(),
        const _HowToCard(),
        if (online)
          PqButton(
            label: l.checksSendFirst,
            icon: PqIcons.camera,
            iconSize: 22,
            onPressed: _send,
          ),
      ] else ...[
        if (rejected.isNotEmpty)
          _Section(
            title: l.checksSectionRetake,
            count: rejected.length,
            tone: PqTone.danger,
            child: PqListCard(
              footer: PqHint(
                boldPrefix: l.checksRetakeTipBold,
                text: l.checksRetakeTip,
              ),
              children: [
                for (final c in rejected)
                  _RetakeRow(check: c, onOpen: () => _open(c), onRetake: _send),
              ],
            ),
          ),
        if (review.isNotEmpty || queue.isNotEmpty)
          _Section(
            title: l.checksStatusPending,
            count: review.length + queue.length,
            tone: PqTone.warning,
            child: PqListCard(
              children: [
                for (var i = 0; i < queue.length; i++)
                  _QueueRow(
                    item: queue[i],
                    active: i == 0 && queue[i].lastError == null,
                    onRetry:
                        () => ref.read(uploadQueueProvider.notifier).retryNow(),
                  ),
                for (final c in review)
                  _ReviewRow(check: c, onOpen: () => _open(c)),
              ],
            ),
          ),
        if (history.isNotEmpty)
          _Section(
            title: l.checksSectionHistory,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _HistoryCard(
                  checks: _showAll ? history : _historyHead(history),
                  onOpen: _open,
                ),
                if (!_showAll &&
                    history.length > _historyHead(history).length) ...[
                  const SizedBox(height: 12),
                  _ShowAll(
                    // «Показать все 14 чеков» — как в макете, считаем все чеки.
                    label: l.checksShowAll(list.length),
                    onTap: () => setState(() => _showAll = true),
                  ),
                ],
              ],
            ),
          ),
      ],
    ];
  }
}

// ── Секции и строки ─────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.child,
    this.count,
    this.tone,
  });

  final String title;
  final int? count;
  final PqTone? tone;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PqSectionHeader(title, count: count, countTone: tone ?? PqTone.neutral),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

/// Отклонённый чек: причина, номер и дата, кнопка «Переснять».
class _RetakeRow extends StatelessWidget {
  const _RetakeRow({
    required this.check,
    required this.onOpen,
    required this.onRetake,
  });

  final Check check;
  final VoidCallback onOpen;
  final VoidCallback onRetake;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final reason = check.rejectReason?.trim();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: PqPressable(
              onTap: onOpen,
              child: Row(
                children: [
                  const PqIconTile(PqIcons.alertTriangle, tone: PqTone.danger),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reason == null || reason.isEmpty
                              ? l.checkDetailRejectedFallback
                              : reason,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: PqText.rowTitle(c: pq.text),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l.checksNumberDate(
                            check.id,
                            formatShortDateTime(check.createdAt),
                          ),
                          style: PqText.caption(c: pq.textMuted),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          PqPillButton(
            label: l.checksRetake,
            icon: PqIcons.camera,
            semanticLabel: l.checksRetakeA11y(check.id),
            onPressed: onRetake,
          ),
        ],
      ),
    );
  }
}

/// Чек на проверке: номер, дата · фото, «~24 ч обычно» и шаги прогресса.
class _ReviewRow extends StatelessWidget {
  const _ReviewRow({required this.check, required this.onOpen});

  final Check check;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqPressable(
      onTap: onOpen,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const PqIconTile(PqIcons.clock, tone: PqTone.warning),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.checkDetailTitle(check.id),
                        style: PqText.rowTitle(c: pq.text),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        l.checksDatePhotos(
                          formatShortDateTime(check.createdAt),
                          check.photoCount,
                        ),
                        style: PqText.caption(c: pq.textMuted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      l.checksWaitValue,
                      style: PqText.amount(c: pq.warning),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l.checksWaitCaption,
                      style: PqText.caption(c: pq.textMuted),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            const CheckSteps(stage: CheckStage.review),
          ],
        ),
      ),
    );
  }
}

/// Чек из очереди загрузки (ещё не дошёл до сервера).
class _QueueRow extends StatelessWidget {
  const _QueueRow({
    required this.item,
    required this.active,
    required this.onRetry,
  });

  final PendingUpload item;
  final bool active;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final failed = item.lastError != null;
    final path = item.filePaths.isEmpty ? null : item.filePaths.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                path == null
                    ? const PqIconTile(PqIcons.receipt, tone: PqTone.warning)
                    : SizedBox.square(
                      dimension: 44,
                      child: localPhoto(path, width: 44, height: 44),
                    ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  failed ? l.checksUploadQueued : l.checksUploadingRow,
                  style: PqText.rowTitle(c: pq.text),
                ),
                const SizedBox(height: 3),
                Text(
                  failed
                      ? l.checksUploadAuto
                      : l.checksPhotoCount(item.filePaths.length),
                  style: PqText.caption(c: pq.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (failed)
            PqPillButton(
              label: l.asyncRetry,
              icon: PqIcons.refresh,
              background: pq.surfaceAlt,
              foreground: pq.accentText,
              onPressed: onRetry,
            )
          else if (active)
            PqSpinner(color: pq.accent, trackColor: pq.borderStrong)
          else
            PqIcon(PqIcons.clock, size: 20, color: pq.textMuted),
        ],
      ),
    );
  }
}

/// «История»: одобренные чеки, сгруппированные по месяцам.
class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.checks, required this.onOpen});

  final List<Check> checks;
  final ValueChanged<Check> onOpen;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final groups = <String, List<Check>>{};
    for (final c in checks) {
      final d = DateTime.tryParse(c.createdAt)?.toLocal();
      final key = d == null ? '' : '${l.checksMonth('m${d.month}')} ${d.year}';
      (groups[key] ??= []).add(c);
    }
    final children = <Widget>[];
    var n = 0;
    for (final e in groups.entries) {
      if (e.key.isNotEmpty) {
        children.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 2),
            child: Text(
              e.key.toUpperCase(),
              style: PqText.overline(c: pq.textMuted),
            ),
          ),
        );
      }
      for (final c in e.value) {
        n++;
        children.add(
          Container(
            decoration: BoxDecoration(
              border:
                  n < checks.length
                      ? Border(bottom: BorderSide(color: pq.divider))
                      : null,
            ),
            child: _HistoryRow(check: c, onTap: () => onOpen(c)),
          ),
        );
      }
    }
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.check, required this.onTap});

  final Check check;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final packs = check.drugs.fold<int>(0, (s, d) => s + d.packs);
    final names = check.drugs
        .map((d) => d.name)
        .where((s) => s.isNotEmpty)
        .join(', ');
    final approved = l.checksStatusApproved;
    return PqListRow(
      title: names.isEmpty ? l.checkDetailTitle(check.id) : names,
      subtitle: l.checksNumberDate(
        check.id,
        formatShortDateTime(check.createdAt),
      ),
      icon: CheckStage.approved.icon,
      tone: CheckStage.approved.tone,
      value: packs > 0 ? l.checkDetailPacks(packs) : approved,
      valueCaption: packs > 0 ? approved.toLowerCase() : null,
      valueTone: PqTone.success,
      onTap: onTap,
    );
  }
}

class _ShowAll extends StatelessWidget {
  const _ShowAll({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: pq.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.link(c: pq.accent),
              ),
            ),
            const SizedBox(width: 4),
            PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
          ],
        ),
      ),
    );
  }
}

// ── Пустое состояние (макет ChecksEmpty) ────────────────────────────────

class _EmptyHero extends StatelessWidget {
  const _EmptyHero();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 4),
      child: Column(
        children: [
          PqBob(
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: pq.accentSoft,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: PqIcon(PqIcons.receipt, size: 44, color: pq.accentText),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            l.checksEmptyTitle,
            textAlign: TextAlign.center,
            style: PqText.emptyTitle(c: pq.text),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              l.checksEmptyText,
              textAlign: TextAlign.center,
              style: PqText.text(
                15,
                FontWeight.w400,
                height: 1.45,
                c: pq.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HowToCard extends StatelessWidget {
  const _HowToCard();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final rows = [
      (PqIcons.scan, l.checksHow1Title, l.checksHow1Text),
      (PqIcons.swipe, l.checksHow2Title, l.checksHow2Text),
      (PqIcons.sun, l.checksHow3Title, l.checksHow3Text),
    ];
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
            child: Text(
              l.checksHowToTitle.toUpperCase(),
              style: PqText.overline(c: pq.textMuted),
            ),
          ),
          for (var i = 0; i < rows.length; i++)
            Container(
              decoration: BoxDecoration(
                border:
                    i < rows.length - 1
                        ? Border(bottom: BorderSide(color: pq.divider))
                        : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    PqIconTile(rows[i].$1, size: 40),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rows[i].$2,
                            style: PqText.text(15, FontWeight.w600, c: pq.text),
                          ),
                          const SizedBox(height: 2),
                          Text(rows[i].$3, style: PqText.body(c: pq.textMuted)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Плавающая кнопка «Отправить чек» ────────────────────────────────────

class _SendFab extends StatelessWidget {
  const _SendFab({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return PqAnimate(
      fx: PqFx.pop,
      duration: const Duration(milliseconds: 450),
      delay: const Duration(milliseconds: 350),
      child: PqPressable(
        onTap: onTap,
        semanticLabel: l.checksSendCheck,
        child: Builder(
          builder: (context) {
            final pq = context.pq;
            final pressed = PqPressedScope.of(context);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 56,
              padding: const EdgeInsets.fromLTRB(18, 0, 22, 0),
              decoration: BoxDecoration(
                color: pressed ? pq.accentPressed : pq.accent,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: pq.accentShadow,
                    offset: const Offset(0, 12),
                    blurRadius: 24,
                    spreadRadius: -12,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PqIcon(PqIcons.camera, size: 22, color: pq.onAccent),
                  const SizedBox(width: 10),
                  Text(l.checksSendCheck, style: PqText.button(c: pq.onAccent)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

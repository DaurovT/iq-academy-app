import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/check.dart';
import '../../../core/models/common.dart';
import '../../../core/models/support.dart';
import '../../../widgets/pq_states.dart';
import '../../doctor/providers.dart';
import '../../pharmacist/providers.dart';
import '../profile/profile_widgets.dart';
import '../providers.dart';

final _hm = DateFormat('HH:mm');
final _dm = DateFormat('dd.MM');

/// Вложение — ссылка на чек/бланк. SupportApi принимает только текст,
/// поэтому вложение уходит строкой «Чек №123» в конце сообщения и
/// в пузыре рисуется карточкой.
class _Attachment {
  const _Attachment({required this.recipe, required this.id});

  final bool recipe;
  final int id;
}

/// Чат с поддержкой (макеты Support / SupportDialog).
class SupportScreen extends ConsumerStatefulWidget {
  const SupportScreen({super.key});

  @override
  ConsumerState<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends ConsumerState<SupportScreen> {
  final _ctrl = TextEditingController();
  final _focus = FocusNode();
  final _scroll = ScrollController();
  _Attachment? _attachment;

  /// Отправляемое сообщение — показывается сразу, до ответа сервера.
  String? _pending;
  int _lastCount = -1;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _focus.dispose();
    _scroll.dispose();
    super.dispose();
  }

  bool get _canSend =>
      _pending == null && (_ctrl.text.trim().isNotEmpty || _attachment != null);

  String _refLine(_Attachment a) =>
      a.recipe
          ? context.l10n.recipeDetailTitle(a.id)
          : context.l10n.checkDetailTitle(a.id);

  Future<void> _send() async {
    if (!_canSend) return;
    final text = [
      if (_ctrl.text.trim().isNotEmpty) _ctrl.text.trim(),
      if (_attachment != null) _refLine(_attachment!),
    ].join('\n');
    setState(() => _pending = text);
    _scrollToEnd();
    try {
      await ref.read(apiProvider).support.send(text);
      _ctrl.clear();
      _attachment = null;
      ref.invalidate(supportThreadProvider);
      await ref.read(supportThreadProvider.future);
    } catch (e) {
      if (mounted) {
        showPqToast(
          context,
          context.l10n.supportSendFailed,
          tone: PqTone.danger,
          subtitle: profileErrorText(context, e),
        );
      }
    } finally {
      if (mounted) setState(() => _pending = null);
    }
  }

  void _scrollToEnd({bool animate = true}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      final end = _scroll.position.maxScrollExtent;
      if (animate && !PqMotion.reduced(context)) {
        _scroll.animateTo(
          end,
          duration: const Duration(milliseconds: 300),
          curve: PqMotion.ease,
        );
      } else {
        _scroll.jumpTo(end);
      }
    });
  }

  Future<void> _attach() async {
    final l = context.l10n;
    final role = ref.read(authControllerProvider).asData?.value.activeRole;
    if (role != Role.pharmacist && role != Role.doctor) {
      showPqToast(
        context,
        l.supportAttachUnavailable,
        tone: PqTone.info,
        icon: PqIcons.paperclip,
      );
      return;
    }
    final picked = await showPqSheet<_Attachment>(
      context,
      scrollable: true,
      builder: (_) => _AttachSheet(recipe: role == Role.doctor),
    );
    if (picked != null && mounted) {
      setState(() => _attachment = picked);
      _focus.requestFocus();
    }
  }

  void _useFaq(String q) {
    _ctrl.text = q;
    _ctrl.selection = TextSelection.collapsed(offset: q.length);
    _focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final thread = ref.watch(supportThreadProvider);
    final count = thread.asData?.value.length;
    if (count != null && count != _lastCount) {
      _scrollToEnd(animate: _lastCount >= 0);
      _lastCount = count;
    }

    return PqScreen(
      child: Column(
        children: [
          const _Header(),
          Expanded(
            child: PqAsync<List<SupportMessage>>(
              value: thread,
              onRetry: () => ref.invalidate(supportThreadProvider),
              loading: PqLoadingKind.spinner,
              data:
                  (list) => PqRefresh(
                    onRefresh: () async {
                      ref.invalidate(supportThreadProvider);
                      await ref.read(supportThreadProvider.future);
                    },
                    child: _Messages(
                      list: list,
                      pending: _pending,
                      controller: _scroll,
                      onFaq: _useFaq,
                    ),
                  ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: pq.bg,
              border: Border(top: BorderSide(color: pq.divider)),
            ),
            child: Padding(
              // Поля панели 10/12/30 — нижние 30 включают зону «домашней» полосы.
              padding: EdgeInsets.fromLTRB(
                12,
                10,
                12,
                math.max(30, MediaQuery.paddingOf(context).bottom),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    curve: PqMotion.ease,
                    child:
                        _attachment == null
                            ? const SizedBox(width: double.infinity)
                            : Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: _AttachmentChip(
                                attachment: _attachment!,
                                onRemove:
                                    () => setState(() => _attachment = null),
                              ),
                            ),
                  ),
                  _InputBar(
                    controller: _ctrl,
                    focusNode: _focus,
                    canSend: _canSend,
                    onSend: _send,
                    onAttach: _attach,
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

/// Шапка чата 72: «назад» · аватар поддержки с точкой «в сети» · название.
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: pq.divider)),
      ),
      child: Row(
        children: [
          PqIconButton(
            icon: PqIcons.chevronLeft,
            label: l.supportBackAria,
            onTap: () => profileGoBack(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 40,
                  child: Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: pq.walletGradient,
                          ),
                        ),
                        child: const PqIcon(
                          PqIcons.headphones,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        // 10 px + рамка 2 снаружи (content-box в макете) = 14.
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E),
                            shape: BoxShape.circle,
                            border: Border.all(color: pq.bg, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.supportHeaderTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.heading(16, FontWeight.w700, c: pq.text),
                      ),
                      Text(
                        l.supportHeaderSubtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.caption(c: pq.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8 + 44),
        ],
      ),
    );
  }
}

/// Лента: плашки дат, пузыри, «печатает…»; пустой чат — приветствие и
/// частые вопросы (макет Support).
class _Messages extends ConsumerWidget {
  const _Messages({
    required this.list,
    required this.pending,
    required this.controller,
    required this.onFaq,
  });

  final List<SupportMessage> list;
  final String? pending;
  final ScrollController controller;
  final ValueChanged<String> onFaq;

  String _day(BuildContext context, DateTime d) {
    final l = context.l10n;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(d.year, d.month, d.day);
    final diff = today.difference(day).inDays;
    if (diff == 0) return l.supportToday;
    if (diff == 1) return l.supportYesterday;
    final code = Localizations.localeOf(context).languageCode;
    try {
      return DateFormat(
        d.year == now.year ? 'd MMMM' : 'd MMMM y',
        code == 'tg' ? 'ru' : code,
      ).format(d);
    } catch (_) {
      return DateFormat('dd.MM.yyyy').format(d);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final items = <Widget>[];
    var anim = 0;
    Widget up(Widget child, {Duration? delay}) => PqAnimate(
      duration: const Duration(milliseconds: 400),
      delay: delay ?? Duration(milliseconds: 100 * (anim++).clamp(0, 5)),
      child: child,
    );

    if (list.isEmpty) {
      items
        ..add(_DayChip(l.supportToday))
        ..add(
          up(
            _Bubble.support(text: l.supportGreeting, caption: l.supportTeam),
            delay: Duration.zero,
          ),
        )
        ..add(
          up(
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l.supportFaqTitle,
                  style: PqText.text(14, FontWeight.w600, c: pq.textMuted),
                ),
                for (final q in [
                  l.supportFaq1,
                  l.supportFaq2,
                  l.supportFaq3,
                  l.supportFaq4,
                ]) ...[
                  const SizedBox(height: 8),
                  _FaqButton(label: q, onTap: () => onFaq(q)),
                ],
              ],
            ),
            delay: const Duration(milliseconds: 250),
          ),
        );
    } else {
      // Прочитано ли сообщение пользователя: после него есть ответ поддержки.
      final lastAdmin = list.lastIndexWhere((m) => m.from != 'user');
      String? lastDay;
      for (var i = 0; i < list.length; i++) {
        final m = list[i];
        final t = DateTime.tryParse(m.createdAt)?.toLocal();
        final day = t == null ? null : _day(context, t);
        if (day != null && day != lastDay) {
          items.add(_DayChip(day));
          lastDay = day;
        }
        final time = t == null ? '' : _hm.format(t);
        items.add(
          up(
            m.from == 'user'
                ? _Bubble.user(text: m.text, caption: time, read: i < lastAdmin)
                : _Bubble.support(
                  text: m.text,
                  caption:
                      time.isEmpty ? l.supportTeam : '${l.supportTeam} · $time',
                ),
          ),
        );
      }
    }
    if (pending != null) {
      items
        ..add(
          Opacity(
            opacity: .6,
            child: _Bubble.user(text: pending!, caption: ''),
          ),
        )
        ..add(
          PqAnimate(
            duration: const Duration(milliseconds: 400),
            child: const _Typing(),
          ),
        );
    }

    return ListView.separated(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: list.isEmpty ? 16 : 14),
      itemBuilder: (_, i) => items[i],
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: pq.surfaceAlt,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: PqText.caption(c: pq.textMuted, w: FontWeight.w600),
        ),
      ),
    );
  }
}

class _FaqButton extends StatelessWidget {
  const _FaqButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.fromLTRB(16, 0, 14, 0),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: pq.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: PqText.text(15, FontWeight.w500, c: pq.text),
              ),
            ),
            const SizedBox(width: 8),
            PqIcon(PqIcons.chevronRight, size: 18, color: pq.textMuted),
          ],
        ),
      ),
    );
  }
}

/// Пузырь сообщения: поддержка — слева, карточка с рамкой (20/20/20/6);
/// пользователь — справа, акцентная заливка (20/20/6/20) и отметка «прочитано».
class _Bubble extends ConsumerWidget {
  const _Bubble.support({required this.text, required this.caption})
    : user = false,
      read = false;
  const _Bubble.user({
    required this.text,
    required this.caption,
    this.read = false,
  }) : user = true;

  final String text;
  final String caption;
  final bool user;
  final bool read;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;

    // Последняя строка «Чек №123» / «Бланк №123» — вложение-карточка.
    var body = text;
    _Attachment? att;
    if (user) {
      final lines = text.split('\n');
      final last = lines.last.trim();
      for (final recipe in [false, true]) {
        final tpl =
            recipe
                ? l.recipeDetailTitle('\u0000')
                : l.checkDetailTitle('\u0000');
        final re = RegExp(
          '^${RegExp.escape(tpl).replaceAll('\u0000', r'(\d+)')}\$',
        );
        final m = re.firstMatch(last);
        if (m != null) {
          att = _Attachment(recipe: recipe, id: int.parse(m.group(1)!));
          body = lines.sublist(0, lines.length - 1).join('\n').trim();
          break;
        }
      }
    }

    final fg = user ? pq.onAccent : pq.text;
    return Align(
      alignment: user ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          crossAxisAlignment:
              user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: user ? pq.accent : pq.surface,
                border: user ? null : Border.all(color: pq.border),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(user ? 20 : 6),
                  bottomRight: Radius.circular(user ? 6 : 20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (body.isNotEmpty)
                    Text(
                      body,
                      style: PqText.text(
                        15,
                        FontWeight.w400,
                        height: 1.45,
                        c: fg,
                      ),
                    ),
                  if (att != null) ...[
                    if (body.isNotEmpty) const SizedBox(height: 10),
                    _AttachmentCard(attachment: att, color: fg),
                  ],
                ],
              ),
            ),
            if (caption.isNotEmpty) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(caption, style: PqText.caption(c: pq.textMuted)),
                  if (user) ...[
                    const SizedBox(width: 4),
                    PqIcon(
                      read ? PqIcons.checkCheck : PqIcons.check,
                      size: 14,
                      color: read ? pq.accentText : pq.textMuted,
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Карточка вложения внутри пузыря пользователя: плитка-чек, номер, дата · статус.
class _AttachmentCard extends ConsumerWidget {
  const _AttachmentCard({required this.attachment, required this.color});

  final _Attachment attachment;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final title =
        attachment.recipe
            ? l.recipeDetailTitle(attachment.id)
            : l.checkDetailTitle(attachment.id);
    final (createdAt, status) = _lookup(ref, attachment);
    final d =
        createdAt == null ? null : DateTime.tryParse(createdAt)?.toLocal();
    final sub = [
      if (d != null) _dm.format(d),
      if (status != null) _statusLabel(l, status),
    ].join(' · ');
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .18),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .22),
              borderRadius: BorderRadius.circular(10),
            ),
            child: PqIcon(PqIcons.receipt, size: 18, color: color),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: PqText.text(
                    14,
                    FontWeight.w700,
                    height: 1.3,
                    c: color,
                  ),
                ),
                if (sub.isNotEmpty)
                  Text(
                    sub,
                    style: PqText.text(
                      12,
                      FontWeight.w400,
                      height: 1.3,
                      c: color.withValues(alpha: .85),
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

/// Дата и статус чека/бланка из уже загруженных списков (если есть).
(String?, CheckStatus?) _lookup(WidgetRef ref, _Attachment a) {
  if (a.recipe) {
    final r =
        ref
            .watch(recipesProvider)
            .asData
            ?.value
            .where((x) => x.id == a.id)
            .firstOrNull;
    return (r?.createdAt, r?.status);
  }
  final c =
      ref
          .watch(checksProvider)
          .asData
          ?.value
          .where((x) => x.id == a.id)
          .firstOrNull;
  return (c?.createdAt, c?.status);
}

String _statusLabel(AppLocalizations l, CheckStatus s) => switch (s) {
  CheckStatus.pending => l.checkModelStatusPending,
  CheckStatus.aiDetected => l.checkModelStatusAiDetected,
  CheckStatus.aiWrong => l.checkModelStatusAiWrong,
  CheckStatus.approved => l.checkModelStatusApproved,
  CheckStatus.rejected => l.checkModelStatusRejected,
};

/// «Поддержка печатает»: пузырь 40 с тремя точками.
class _Typing extends StatelessWidget {
  const _Typing();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Align(
      alignment: Alignment.centerLeft,
      child: Semantics(
        label: context.l10n.supportTypingAria,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: pq.surface,
            border: Border.all(color: pq.border),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(6),
            ),
          ),
          child: PqTypingDots(color: pq.textMuted, size: 7),
        ),
      ),
    );
  }
}

/// Нижняя панель: скрепка 44 · поле-капсула ≥44 · «отправить» 44.
class _InputBar extends StatelessWidget {
  const _InputBar({
    required this.controller,
    required this.focusNode,
    required this.canSend,
    required this.onSend,
    required this.onAttach,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool canSend;
  final VoidCallback onSend;
  final VoidCallback onAttach;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PqIconButton(
          icon: PqIcons.paperclip,
          iconSize: 22,
          label: l.supportAttachAria,
          background: Colors.transparent,
          color: pq.textMuted,
          onTap: onAttach,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(minHeight: 44),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: pq.surface,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: pq.border),
            ),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              cursorColor: pq.accent,
              cursorWidth: 2,
              style: PqText.field(c: pq.text).copyWith(height: 1.3),
              decoration: InputDecoration(
                isCollapsed: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: l.supportMessageHint,
                hintStyle: PqText.field(c: pq.textMuted).copyWith(height: 1.3),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Semantics(
          button: true,
          enabled: canSend,
          label: l.supportSendAria,
          child: PqPressable(
            onTap: canSend ? onSend : null,
            scale: .94,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: PqMotion.ease,
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: canSend ? pq.accent : pq.surfaceAlt,
                shape: BoxShape.circle,
              ),
              child: PqIcon(
                PqIcons.arrowUp,
                size: 20,
                color: canSend ? pq.onAccent : pq.textMuted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Прикреплённый чек над полем ввода (до отправки) с кнопкой «убрать».
class _AttachmentChip extends StatelessWidget {
  const _AttachmentChip({required this.attachment, required this.onRemove});

  final _Attachment attachment;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqAnimate(
      fx: PqFx.rise,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 4, 6),
        decoration: BoxDecoration(
          color: pq.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: pq.border),
        ),
        child: Row(
          children: [
            PqIconTile(PqIcons.receipt, size: 36, radius: 10, iconSize: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                attachment.recipe
                    ? l.recipeDetailTitle(attachment.id)
                    : l.checkDetailTitle(attachment.id),
                style: PqText.text(14, FontWeight.w700, c: pq.text),
              ),
            ),
            PqIconButton(
              icon: PqIcons.x,
              iconSize: 16,
              label: l.supportAttachRemove,
              background: Colors.transparent,
              color: pq.textMuted,
              onTap: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}

/// Лист выбора чека/бланка для вложения.
class _AttachSheet extends ConsumerWidget {
  const _AttachSheet({required this.recipe});

  final bool recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final AsyncValue<List<(int, String, CheckStatus)>> items =
        recipe
            ? ref
                .watch(recipesProvider)
                .whenData(
                  (v) => [for (final r in v) (r.id, r.createdAt, r.status)],
                )
            : ref
                .watch(checksProvider)
                .whenData(
                  (v) => [for (final c in v) (c.id, c.createdAt, c.status)],
                );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileSheetHeader(
          title:
              recipe ? l.supportAttachRecipeTitle : l.supportAttachCheckTitle,
        ),
        const SizedBox(height: 8),
        PqAsync<List<(int, String, CheckStatus)>>(
          value: items,
          loading: PqLoadingKind.spinner,
          loadingBuilder:
              (_) => const Column(
                children: [PqSkeletonRow(), PqSkeletonRow(), PqSkeletonRow()],
              ),
          onRetry:
              () => ref.invalidate(recipe ? recipesProvider : checksProvider),
          data: (list) {
            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  l.supportAttachEmpty,
                  textAlign: TextAlign.center,
                  style: PqText.body(c: pq.textMuted),
                ),
              );
            }
            final shown = list.take(20).toList();
            return Column(
              children: [
                for (var i = 0; i < shown.length; i++)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border:
                          i < shown.length - 1
                              ? Border(bottom: BorderSide(color: pq.divider))
                              : null,
                    ),
                    child: PqListRow(
                      icon: PqIcons.receipt,
                      title:
                          recipe
                              ? l.recipeDetailTitle(shown[i].$1)
                              : l.checkDetailTitle(shown[i].$1),
                      subtitle: [
                        if (DateTime.tryParse(shown[i].$2) != null)
                          _dm.format(DateTime.parse(shown[i].$2).toLocal()),
                        _statusLabel(l, shown[i].$3),
                      ].join(' · '),
                      chevron: true,
                      onTap:
                          () => Navigator.of(
                            context,
                          ).pop(_Attachment(recipe: recipe, id: shown[i].$1)),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

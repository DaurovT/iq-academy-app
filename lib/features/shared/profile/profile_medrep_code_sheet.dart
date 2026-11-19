import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../../../core/models/medrep.dart';
import '../../medrep/medrep_widgets.dart' show MedAvatar;
import '../../../widgets/latin_code_formatter.dart';
import 'profile_widgets.dart';

/// Кодовое слово медпреда после регистрации (POST /client/account/medrep-code):
/// поле как в регистрации (RegDoctorCode), проверка слова, «Отправить».
/// Фармацевт попадает в «Ожидают подтверждения», врач — сразу в команду.
Future<void> showProfileMedrepCodeSheet(BuildContext context, Role role) async {
  final sent = await showPqSheet<bool>(
    context,
    scrollable: true,
    builder: (_) => _CodeSheet(role: role),
  );
  if (sent == true && context.mounted) {
    final l = context.l10n;
    showPqToast(
      context,
      role == Role.doctor ? l.profileCodeSentDoctor : l.profileCodeSentPharm,
      icon: PqIcons.check,
    );
  }
}

class _CodeSheet extends ConsumerStatefulWidget {
  const _CodeSheet({required this.role});

  final Role role;

  @override
  ConsumerState<_CodeSheet> createState() => _CodeSheetState();
}

class _CodeSheetState extends ConsumerState<_CodeSheet> {
  static const _len = 6;
  final _ctrl = TextEditingController();
  MedrepCodeCheck? _check;
  int _seq = 0;
  bool _busy = false;
  String? _error;

  /// Набраны русские буквы — подсказать сменить раскладку.
  bool _cyrillic = false;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onChanged(String raw) {
    _seq++;
    setState(() {
      _check = null;
      _error = null;
    });
    if (raw.length == _len) _checkCode(raw.toUpperCase());
  }

  Future<void> _checkCode(String code) async {
    final seq = _seq;
    try {
      final r = await ref.read(apiProvider).auth.checkMedrepCode(code);
      if (mounted && seq == _seq) setState(() => _check = r);
    } catch (_) {
      // Нет сети — слово проверит сервер при отправке.
    }
  }

  Future<void> _send() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final r = await ref
          .read(apiProvider)
          .account
          .sendMedrepCode(_ctrl.text.trim().toUpperCase());
      if (!mounted) return;
      if (r.ok) {
        Navigator.of(context).pop(true);
      } else {
        setState(() => _check = r);
      }
    } catch (e) {
      if (mounted) setState(() => _error = profileErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final doctor = widget.role == Role.doctor;
    final code = _ctrl.text;
    final ok = _check?.ok == true;
    final bad = _check?.ok == false;
    final owner = ok ? _check?.medrep : null;
    final stateColor = ok ? pq.success : (bad ? pq.danger : null);
    final company = owner?.company?.trim() ?? '';

    Widget field = Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: pq.fieldBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: stateColor ?? pq.border,
          width: stateColor == null ? 1 : 2,
        ),
      ),
      child: Row(children: [
        PqIcon(PqIcons.key, size: 20, color: stateColor ?? pq.textMuted),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _ctrl,
            autofocus: true,
            onChanged: _onChanged,
            autocorrect: false,
            enableSuggestions: false,
            // Латинская клавиатура: слово — только латиница и цифры, а русские
            // буквы фильтр молча отбрасывает (Android открывал «Русский»).
            keyboardType: TextInputType.visiblePassword,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              LatinCodeFormatter(
                maxLength: _len,
                onCyrillic: (c) {
                  if (c != _cyrillic) setState(() => _cyrillic = c);
                },
              ),
            ],
            cursorColor: pq.accent,
            cursorWidth: 2,
            style: code.isEmpty
                ? PqText.field(c: pq.text)
                : PqText.heading(18, FontWeight.w800, ls: 4, c: pq.text),
            decoration: InputDecoration(
              isDense: true,
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: l.regCodeExample,
              hintStyle: PqText.field(c: pq.textMuted),
            ),
          ),
        ),
        if (ok) ...[
          const SizedBox(width: 10),
          PqAnimate(
            fx: PqFx.pop,
            duration: const Duration(milliseconds: 400),
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: pq.success, shape: BoxShape.circle),
              child: PqIcon(PqIcons.check, size: 14, color: pq.bg),
            ),
          ),
        ] else if (bad) ...[
          const SizedBox(width: 10),
          PqIcon(PqIcons.alertTriangle, size: 20, color: pq.danger),
        ],
      ]),
    );
    if (bad) {
      field = PqAnimate(key: ValueKey('bad-$code'), fx: PqFx.shake, child: field);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ProfileSheetHeader(
        title: l.regCodeLabel,
        subtitle: doctor ? null : l.regCodeNotePharm,
      ),
      const SizedBox(height: 16),
      field,
      if (owner != null) ...[
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: pq.successSoft,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            MedAvatar(owner.name),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(owner.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.text(15, FontWeight.w700, c: pq.text)),
                  const SizedBox(height: 1),
                  Text(
                    company.isEmpty
                        ? l.regCodeMedrep
                        : '${l.regCodeMedrep} · $company',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.caption(c: pq.textSecondary),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    doctor ? l.regCodeJoinDoctor : l.regCodeJoinPharm,
                    style: PqText.caption(w: FontWeight.w700, c: pq.success),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
      if (_cyrillic) ...[
        const SizedBox(height: 8),
        Text(l.regCodeLatinOnly, style: PqText.body(c: pq.warning)),
      ],
      if (bad) ...[
        const SizedBox(height: 8),
        Semantics(
          liveRegion: true,
          child: Text(l.regCodeNotFound, style: PqText.body(c: pq.danger)),
        ),
      ],
      if (_error != null) ...[
        const SizedBox(height: 8),
        Text(_error!, style: PqText.body(c: pq.danger)),
      ],
      const SizedBox(height: 20),
      PqButton(
        label: l.profileCodeSend,
        icon: PqIcons.send,
        loading: _busy,
        onPressed: code.length == _len && !bad && !_busy ? _send : null,
      ),
    ]);
  }
}

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../../../core/models/registration.dart';
import '../pickers/city_picker.dart';
import '../pickers/map_picker.dart';
import '../providers.dart';
import 'profile_phone_sheet.dart';
import 'profile_widgets.dart';

/// «Личные данные» (макет EditProfile).
///
/// Эндпоинта обновления профиля в API нет, поэтому «Сохранить изменения»
/// отправляет заявку с новыми данными в чат поддержки (SupportApi.send),
/// а администратор обновляет профиль. Телефон меняется отдельно — через SMS.
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late final TextEditingController _name;
  final _work = TextEditingController();
  RefItem? _city;
  bool _busy = false;
  bool _submitted = false;
  bool _nameFilled = false;

  @override
  void initState() {
    super.initState();
    final account = ref.read(authControllerProvider).asData?.value.account;
    _name = TextEditingController(text: account?.fullName ?? '');
    _nameFilled = account != null;
  }

  @override
  void dispose() {
    _name.dispose();
    _work.dispose();
    super.dispose();
  }

  Future<void> _pickCity() async {
    final picked = await showPqCityPicker(context, selectedValue: _city?.value);
    if (picked != null && mounted) setState(() => _city = picked);
  }

  Future<void> _pickOnMap() async {
    final name = await showPqMapPicker(context);
    if (name != null && name.isNotEmpty && mounted) setState(() => _work.text = name);
  }

  Future<void> _save(Role? role) async {
    final l = context.l10n;
    final hasWork = _workLabel(role) != null;
    setState(() => _submitted = true);
    if (_name.text.trim().isEmpty ||
        _city == null ||
        (hasWork && _work.text.trim().isEmpty)) {
      return;
    }
    final lang = profileRefLanguage(context);
    final message = [
      l.profileEditRequest,
      '${l.profileFieldName}: ${_name.text.trim()}',
      '${l.profileFieldCity}: ${_city!.label.resolve(lang)}',
      if (hasWork) '${_workLabel(role)}: ${_work.text.trim()}',
    ].join('\n');
    setState(() => _busy = true);
    try {
      await ref.read(apiProvider).support.send(message);
      ref.invalidate(supportThreadProvider);
      if (!mounted) return;
      showPqToast(context, l.profileEditSent, subtitle: l.profileEditSentHint);
      profileGoBack(context);
    } catch (e) {
      if (!mounted) return;
      showPqToast(context, profileErrorText(context, e), tone: PqTone.danger);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String? _workLabel(Role? role) => switch (role) {
        Role.pharmacist => context.l10n.profilePharmacy,
        Role.doctor => context.l10n.profileClinic,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final auth = ref.watch(authControllerProvider).asData?.value;
    final account = auth?.account;
    final role = auth?.activeRole;
    // Аккаунт мог ещё грузиться в initState — подставляем ФИО, как только он есть.
    if (!_nameFilled && account != null) {
      _nameFilled = true;
      if (_name.text.isEmpty) _name.text = account.fullName;
    }
    final workLabel = _workLabel(role);
    final required = l.profileFieldRequired;

    final children = <Widget>[
      Center(child: ProfileAvatar(name: account?.fullName ?? '', size: 88)),
      _Field(
        label: l.profileFieldName,
        required: true,
        child: PqTextField(
          controller: _name,
          error: _submitted && _name.text.trim().isEmpty ? required : null,
          textCapitalization: TextCapitalization.words,
          autofillHints: const [AutofillHints.name],
          onChanged: (_) => setState(() {}),
        ),
      ),
      _Field(
        label: l.profilePhone,
        hint: l.profilePhoneLockedHint,
        child: _SelectBox(
          text: account == null ? '' : profileFormatPhone(account.phone),
          muted: true,
          trailing: PqIcons.lock,
          onTap: () => showProfilePhoneSheet(context),
        ),
      ),
      _Field(
        label: l.profileFieldCity,
        required: true,
        error: _submitted && _city == null ? required : null,
        child: _SelectBox(
          text: _city?.label.resolve(profileRefLanguage(context)),
          placeholder: l.profileCityHint,
          error: _submitted && _city == null,
          onTap: _pickCity,
        ),
      ),
      if (workLabel != null)
        _Field(
          label: workLabel,
          required: true,
          child: PqTextField(
            controller: _work,
            hint: l.profileWorkplaceHint,
            error: _submitted && _work.text.trim().isEmpty ? required : null,
            onChanged: (_) => setState(() {}),
          ),
        ),
      if (kMapPickerEnabled && role == Role.pharmacist)
        PqPressable(
          onTap: _pickOnMap,
          child: CustomPaint(
            painter: _DashedRRectPainter(pq.borderStrong, 14),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                PqIcon(PqIcons.mapPin, size: 18, color: pq.accent),
                const SizedBox(width: 8),
                Text(l.profileMapButton, style: PqText.text(15, FontWeight.w600, c: pq.accent)),
              ]),
            ),
          ),
        ),
    ];

    return PqScreen(
      child: Stack(children: [
        Column(children: [
          PqTopBar(
            title: l.profilePersonalDataRow,
            backLabel: l.profileBack,
            onBack: () => profileGoBack(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 140),
              child: PqStagger.auth(gap: 18, children: children),
            ),
          ),
        ]),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 28 + MediaQuery.paddingOf(context).bottom * .5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, .45],
                colors: [pq.bg.withValues(alpha: 0), pq.bg],
              ),
            ),
            child: PqButton(
              label: l.profileSave,
              icon: PqIcons.check,
              loading: _busy,
              onPressed: () => _save(role),
            ),
          ),
        ),
      ]),
    );
  }
}

/// Подпись поля 14/600 (+ красная «*»), поле, подсказка 12 / ошибка.
class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.child,
    this.required = false,
    this.hint,
    this.error,
  });

  final String label;
  final Widget child;
  final bool required;
  final String? hint;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text.rich(
        TextSpan(children: [
          TextSpan(text: label),
          if (required) TextSpan(text: ' *', style: TextStyle(color: pq.danger)),
        ]),
        style: PqText.text(14, FontWeight.w600, c: pq.textSecondary),
      ),
      const SizedBox(height: 6),
      child,
      if (error != null) ...[
        const SizedBox(height: 6),
        PqAnimate(
          fx: PqFx.fade,
          child: Row(children: [
            PqIcon(PqIcons.alertCircle, size: 16, color: pq.danger),
            const SizedBox(width: 6),
            Flexible(child: Text(error!, style: PqText.body(c: pq.danger))),
          ]),
        ),
      ] else if (hint != null) ...[
        const SizedBox(height: 6),
        Text(hint!, style: PqText.caption(c: pq.textMuted)),
      ],
    ]);
  }
}

/// Поле-кнопка 56/14 в стиле ввода: значение (или плейсхолдер) + иконка справа.
class _SelectBox extends StatelessWidget {
  const _SelectBox({
    required this.onTap,
    this.text,
    this.placeholder,
    this.muted = false,
    this.error = false,
    this.trailing = PqIcons.chevronRight,
  });

  final VoidCallback onTap;
  final String? text;
  final String? placeholder;
  final bool muted;
  final bool error;
  final PqIcons trailing;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final empty = text == null || text!.isEmpty;
    return PqPressable(
      onTap: onTap,
      semanticLabel: empty ? placeholder : text,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        constraints: const BoxConstraints(minHeight: 56),
        padding: EdgeInsets.symmetric(horizontal: error ? 15 : 16),
        decoration: BoxDecoration(
          color: pq.fieldBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: error ? pq.danger : pq.border, width: error ? 2 : 1),
        ),
        child: Row(children: [
          Expanded(
            child: Text(
              empty ? (placeholder ?? '') : text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: PqText.field(c: empty || muted ? pq.textMuted : pq.text),
            ),
          ),
          const SizedBox(width: 10),
          PqIcon(trailing, size: 18, color: pq.textMuted),
        ]),
      ),
    );
  }
}

/// Пунктирная рамка со скруглением (кнопка «Уточнить аптеку на карте»).
class _DashedRRectPainter extends CustomPainter {
  _DashedRRectPainter(this.color, this.radius);

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
        (Offset.zero & size).deflate(.5), Radius.circular(radius));
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (final ui.PathMetric m in (Path()..addRRect(rrect)).computeMetrics()) {
      for (double d = 0; d < m.length; d += 7) {
        canvas.drawPath(m.extractPath(d, (d + 4).clamp(0, m.length)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRectPainter old) => old.color != color;
}

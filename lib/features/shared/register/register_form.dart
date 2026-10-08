import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/legal.dart';
import '../../../core/models/account.dart';
import '../../../core/models/common.dart';
import '../../../core/models/medrep.dart';
import '../../../core/models/registration.dart';
import '../../../widgets/pq_states.dart';
import '../../medrep/medrep_widgets.dart' show MedAvatar;
import '../login/auth_ui.dart';
import '../pickers/city_picker.dart';
import '../pickers/map_picker.dart';
import '../providers.dart';
import 'register_success.dart';

/// Шаг 2 регистрации: динамическая форма по RegistrationSchema
/// (types.ts: A.2) в оформлении макетов RegPharmacist/RegDoctor.
class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({
    super.key,
    required this.role,
    required this.phone,
    this.linkToken,
    required this.onBack,
  });

  final Role role;
  final String? phone;
  final String? linkToken;
  final VoidCallback onBack;

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final Map<String, TextEditingController> _text = {};
  final Map<String, dynamic> _values = {};
  bool _loading = false;
  String? _error;

  // Кодовое слово медпреда (поле medrepCode): как только введено целиком —
  // проверяем на сервере и показываем, чьё оно.
  static const _codeField = 'medrepCode';
  MedrepCodeCheck? _codeCheck;
  int _codeSeq = 0;

  // Успешная регистрация: сессия удержана до нажатия «Начать обучение».
  bool _done = false;
  bool _completing = false;
  Session? _session;
  String _firstName = '';

  @override
  void dispose() {
    for (final c in _text.values) {
      c.dispose();
    }
    super.dispose();
  }

  Language get _lang => pickerLanguage(ref);

  TextEditingController _ctrl(RegField f) {
    return _text.putIfAbsent(f.name, () {
      if (f.type == RegFieldType.phone) {
        final digits = authPhoneDigits(widget.phone);
        if (digits.isNotEmpty) _values[f.name] = authFullPhone(digits);
        return TextEditingController(
          text:
              AuthPhoneFormatter()
                  .formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: digits))
                  .text,
        );
      }
      return TextEditingController();
    });
  }

  /// «Город» → «город», но аббревиатуры («ФИО») не трогаем.
  static String _lower(String s) =>
      s.length > 1 && s[1] != s[1].toLowerCase() ? s : s.toLowerCase();

  int _codeLength(RegField f) => f.maxLength ?? 6;

  /// Слово введено целиком и сервер не сказал, что такого нет. Если проверка
  /// не прошла из-за сети — не блокируем: слово проверит сервер при отправке.
  bool _codeUsable(RegField f) {
    final v = (_values[f.name] as String?) ?? '';
    return v.length == _codeLength(f) && _codeCheck?.ok != false;
  }

  void _onCode(RegField f, String raw) {
    final code = raw.toUpperCase();
    _codeSeq++;
    setState(() {
      if (code.isEmpty) {
        _values.remove(f.name);
      } else {
        _values[f.name] = code;
      }
      _codeCheck = null;
    });
    if (code.length == _codeLength(f)) _checkCode(code);
  }

  Future<void> _checkCode(String code) async {
    final seq = _codeSeq;
    try {
      final r = await ref.read(apiProvider).auth.checkMedrepCode(code);
      if (mounted && seq == _codeSeq) setState(() => _codeCheck = r);
    } catch (_) {
      // Нет сети или сервер недоступен — слово проверится при регистрации.
    }
  }

  /// Все обязательные поля заполнены и согласие дано.
  bool _complete(RegistrationSchema schema) {
    for (final f in schema.fields) {
      // Необязательное кодовое слово: пусто — можно, начато — нужно целиком.
      if (!f.required &&
          f.name == _codeField &&
          ((_values[f.name] as String?) ?? '').isNotEmpty &&
          !_codeUsable(f)) {
        return false;
      }
      if (!f.required) continue;
      final v = _values[f.name];
      switch (f.type) {
        case RegFieldType.text:
          if (v is! String || v.trim().isEmpty) return false;
          if (f.name == _codeField && !_codeUsable(f)) return false;
        case RegFieldType.phone:
          if (v is! String || authPhoneDigits(v).length != kAuthPhoneDigits) return false;
        case RegFieldType.select:
          if (v == null) return false;
        case RegFieldType.multiselect:
          if (v is! List || v.isEmpty) return false;
        case RegFieldType.consent:
          if (v != true) return false;
      }
    }
    return true;
  }

  /// Имя для приветствия: первое слово первого текстового поля (ФИО),
  /// с откатом на имя аккаунта из сессии.
  String _resolveFirstName(RegistrationSchema schema, Session session) {
    for (final f in schema.fields) {
      if (f.type == RegFieldType.text) {
        final v = (_values[f.name] as String?)?.trim() ?? '';
        if (v.isNotEmpty) return v.split(RegExp(r'\s+')).first;
      }
    }
    final full = session.account.fullName.trim();
    return full.isEmpty ? '' : full.split(RegExp(r'\s+')).first;
  }

  Future<void> _submit(RegistrationSchema schema) async {
    FocusScope.of(context).unfocus();
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final session = await ref
          .read(apiProvider)
          .auth
          .register(widget.role, schema.version, _values, oauthLinkToken: widget.linkToken);
      // Не логиним сразу — показываем экран успеха.
      if (mounted) {
        setState(() {
          _session = session;
          _firstName = _resolveFirstName(schema, session);
          _done = true;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _finish(String destination) async {
    if (_completing || _session == null) return;
    setState(() => _completing = true);
    await ref.read(authControllerProvider.notifier).completeLogin(_session!);
    if (mounted) context.go(destination);
  }

  @override
  Widget build(BuildContext context) {
    if (_done) {
      return RegisterSuccess(
        firstName: _firstName,
        completing: _completing,
        onStart: () => _finish('/app/learn'),
        onHome: () => _finish('/app'),
      );
    }

    final schema = ref.watch(registrationSchemaProvider(widget.role));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) widget.onBack();
      },
      child: AuthScreen(
        child: PqAsync<RegistrationSchema>(
          value: schema,
          loading: PqLoadingKind.spinner,
          onRetry: () => ref.invalidate(registrationSchemaProvider(widget.role)),
          data: _form,
        ),
      ),
    );
  }

  Widget _form(RegistrationSchema s) {
    final pq = context.pq;
    final l10n = context.l10n;
    final ready = _complete(s);
    return AuthFlow(
      children: [
        const AuthHeader(),
        AuthStepProgress(step: 2, label: l10n.registerStep2Of2(widget.role.label(l10n))),
        Text(l10n.registerTitle, style: PqText.display(c: pq.text)),
        for (final f in s.fields) ...[
          // Фармацевту — отметка аптеки на карте (перед согласием, как в макете).
          if (kMapPickerEnabled &&
              f.type == RegFieldType.consent &&
              widget.role == Role.pharmacist)
            _mapCard(),
          _field(f),
        ],
        if (_error != null) AuthErrorLine(_error!, key: ValueKey(_error)),
        const AuthPush(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PqButton(
              label: l10n.registerFinish,
              loading: _loading,
              onPressed: ready ? () => _submit(s) : null,
            ),
            if (!ready) ...[
              const SizedBox(height: 8),
              Text(
                l10n.authFillRequired,
                textAlign: TextAlign.center,
                style: PqText.body(c: pq.textMuted),
              ),
            ],
            const SizedBox(height: 8),
            PqButton(
              label: l10n.authBack,
              kind: PqButtonKind.text,
              height: 52,
              onPressed: _loading ? null : widget.onBack,
            ),
          ],
        ),
      ],
    );
  }

  /// Подсказка поля: для известных полей — пример из макета, иначе «Введите …».
  String _hint(RegField f, String label) {
    final l10n = context.l10n;
    final key = '${f.name} ${f.label.resolve()}'.toLowerCase();
    if (RegExp(r'fio|full_?name|фио').hasMatch(key)) return l10n.authHintFullName;
    if (RegExp(r'pharm|workplace|work_place|аптек').hasMatch(key)) return l10n.authHintPharmacy;
    if (RegExp(r'clinic|hospital|клиник').hasMatch(key)) return l10n.authHintClinic;
    return l10n.registerEnterField(_lower(label));
  }

  /// «Отметить аптеку на карте» (RegPharmacist): пунктирная рамка, плитка 44,
  /// кнопка-капсула. Карта пока заглушка — см. [showPqMapPicker].
  Widget _mapCard() {
    final pq = context.pq;
    final l10n = context.l10n;
    return CustomPaint(
      painter: _DashedBorder(pq.borderStrong),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            const PqIconTile(PqIcons.mapPin, size: 44, radius: 12),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.authMapCardTitle, style: PqText.text(15, FontWeight.w600, c: pq.text)),
                  const SizedBox(height: 2),
                  Text(l10n.authMapCardSub, style: PqText.body(c: pq.textMuted)),
                ],
              ),
            ),
            const SizedBox(width: 14),
            PqPillButton(
              label: l10n.authMapCardButton,
              semanticLabel: l10n.authMapCardTitle,
              onPressed: () => showPqMapPicker(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(RegField f) {
    final pq = context.pq;
    final l10n = context.l10n;
    final label = f.label.resolve(_lang);
    switch (f.type) {
      case RegFieldType.phone:
        return AuthPhoneField(
          controller: _ctrl(f),
          label: label,
          required: f.required,
          onChanged: (v) => setState(() => _values[f.name] = authFullPhone(authPhoneDigits(v))),
        );

      case RegFieldType.text:
        if (f.name == _codeField) return _codeFieldView(f);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthFieldLabel(label, required: f.required),
            const SizedBox(height: 8),
            PqTextField(
              controller: _ctrl(f),
              hint: _hint(f, label),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (v) => setState(() => _values[f.name] = v),
            ),
          ],
        );

      case RegFieldType.select:
        final options = f.options ?? const <RegOption>[];
        final current = _values[f.name] as String?;
        final selectedLabel =
            options.where((o) => o.value == current).map((o) => o.label.resolve(_lang)).firstOrNull;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthFieldLabel(label, required: f.required),
            const SizedBox(height: 8),
            PqPressable(
              onTap: () => _openSelect(f, label, options),
              semanticLabel: label,
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: pq.fieldBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: pq.border),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedLabel ?? l10n.authChooseField(_lower(label)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.field(c: selectedLabel == null ? pq.textMuted : pq.text),
                      ),
                    ),
                    const SizedBox(width: 8),
                    PqIcon(PqIcons.chevronDown, size: 20, color: pq.textMuted),
                  ],
                ),
              ),
            ),
          ],
        );

      case RegFieldType.multiselect:
        final options = f.options ?? const <RegOption>[];
        final selected = (_values[f.name] as List?)?.cast<String>() ?? <String>[];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthFieldLabel(label, required: f.required),
            const SizedBox(height: 4),
            Text(
              selected.isEmpty ? l10n.authMultiHintEmpty : l10n.authMultiHint(selected.length),
              style: PqText.body(c: pq.textMuted),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final o in options)
                  _MultiChip(
                    label: o.label.resolve(_lang),
                    selected: selected.contains(o.value),
                    onTap:
                        () => setState(() {
                          final list = [...selected];
                          list.contains(o.value) ? list.remove(o.value) : list.add(o.value);
                          _values[f.name] = list;
                        }),
                  ),
              ],
            ),
          ],
        );

      case RegFieldType.consent:
        final checked = _values[f.name] == true;
        return Semantics(
          checked: checked,
          child: PqPressable(
            scale: 1,
            onTap: () => setState(() => _values[f.name] = !checked),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: _ConsentBox(checked: checked),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(l10n.authConsent, style: PqText.body(c: pq.textSecondary)),
                      if (f.consentUrl != null)
                        GestureDetector(
                          onTap:
                              () => launchUrl(
                                Uri.parse(kSiteBaseUrl).resolve(f.consentUrl!),
                                mode: LaunchMode.externalApplication,
                              ),
                          child: Text(
                            l10n.registerConsentMore,
                            style: PqText.body(c: pq.accent, w: FontWeight.w600),
                          ),
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

  /// «Кодовое слово медпреда» (макеты RegDoctor / RegDoctorCode /
  /// RegPharmacist): поле 56 с ключом; верное слово — зелёная рамка 2,
  /// галочка и карточка медпреда; неверное — красная рамка, «тряска» и ошибка.
  Widget _codeFieldView(RegField f) {
    final pq = context.pq;
    final l10n = context.l10n;
    final doctor = widget.role == Role.doctor;
    final code = (_values[f.name] as String?) ?? '';
    final ok = _codeCheck?.ok == true;
    final bad = _codeCheck?.ok == false;
    final owner = ok ? _codeCheck?.medrep : null;
    final stateColor = ok ? pq.success : (bad ? pq.danger : null);

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
      child: Row(
        children: [
          PqIcon(PqIcons.key, size: 20, color: stateColor ?? pq.textMuted),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _ctrl(f),
              onChanged: (v) => _onCode(f, v),
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]')),
                LengthLimitingTextInputFormatter(_codeLength(f)),
                const _UpperCaseFormatter(),
              ],
              cursorColor: pq.accent,
              cursorWidth: 2,
              style:
                  code.isEmpty
                      ? PqText.field(c: pq.text)
                      : PqText.heading(18, FontWeight.w800, ls: 4, c: pq.text),
              decoration: InputDecoration(
                isDense: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: l10n.regCodeExample,
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
                decoration: BoxDecoration(color: pq.success, shape: BoxShape.circle),
                child: PqIcon(PqIcons.check, size: 14, color: pq.bg),
              ),
            ),
          ] else if (bad) ...[
            const SizedBox(width: 10),
            PqIcon(PqIcons.alertTriangle, size: 20, color: pq.danger),
          ],
        ],
      ),
    );
    if (bad) field = PqAnimate(key: ValueKey('bad-$code'), fx: PqFx.shake, child: field);

    final company = owner?.company?.trim() ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: l10n.regCodeLabel),
              if (f.required)
                TextSpan(text: ' *', style: TextStyle(color: pq.danger))
              else
                TextSpan(
                  text: ' ${l10n.regCodeOptional}',
                  style: PqText.text(14, FontWeight.w500, c: pq.textMuted),
                ),
            ],
          ),
          style: PqText.link(c: pq.textSecondary),
        ),
        const SizedBox(height: 8),
        field,
        if (owner != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: pq.successSoft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                MedAvatar(owner.name),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        owner.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.text(15, FontWeight.w700, c: pq.text),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        company.isEmpty
                            ? l10n.regCodeMedrep
                            : '${l10n.regCodeMedrep} · $company',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.caption(c: pq.textSecondary),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        doctor ? l10n.regCodeJoinDoctor : l10n.regCodeJoinPharm,
                        style: PqText.caption(w: FontWeight.w700, c: pq.success),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 8),
        if (bad)
          Semantics(
            liveRegion: true,
            child: Text(l10n.regCodeNotFound, style: PqText.body(c: pq.danger)),
          )
        else
          Text(
            doctor ? l10n.regCodeNoteDoctor : l10n.regCodeNotePharm,
            style: PqText.body(c: pq.textMuted),
          ),
      ],
    );
  }

  Future<void> _openSelect(RegField f, String label, List<RegOption> options) async {
    final chosen = await showPqOptionPicker(
      context,
      title: label,
      selectedValue: _values[f.name] as String?,
      options: [for (final o in options) PqPickerOption(o.value, o.label.resolve(_lang))],
    );
    if (chosen != null && mounted) setState(() => _values[f.name] = chosen);
  }
}

/// Латиница кодового слова — всегда заглавными.
class _UpperCaseFormatter extends TextInputFormatter {
  const _UpperCaseFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) =>
      newValue.copyWith(text: newValue.text.toUpperCase());
}

/// Чип специальности: 40, радиус 20; выбран — рамка акцентом, мягкая
/// заливка, галочка 14 и жирный текст.
class _MultiChip extends StatelessWidget {
  const _MultiChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      toggled: selected,
      child: PqPressable(
        onTap: onTap,
        scale: .96,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: selected ? authSelectedBg(pq) : pq.fieldBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: selected ? pq.accent : pq.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selected) ...[
                PqAnimate(
                  fx: PqFx.pop,
                  duration: const Duration(milliseconds: 300),
                  child: PqIcon(PqIcons.check, size: 14, color: pq.accent),
                ),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: PqText.text(14, selected ? FontWeight.w700 : FontWeight.w500, c: pq.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Флажок согласия 24, радиус 6.
class _ConsentBox extends StatelessWidget {
  const _ConsentBox({required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: checked ? pq.accent : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: checked ? null : Border.all(color: pq.borderStrong, width: 2),
      ),
      alignment: Alignment.center,
      child:
          checked
              ? PqAnimate(
                fx: PqFx.pop,
                duration: const Duration(milliseconds: 300),
                child: PqIcon(PqIcons.check, size: 16, color: pq.onAccent, strokeWidth: 2.6),
              )
              : null,
    );
  }
}

/// Пунктирная рамка 1 px, радиус 16 (`border: 1px dashed`).
class _DashedBorder extends CustomPainter {
  _DashedBorder(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(.5),
      const Radius.circular(16),
    );
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
    for (final m in (Path()..addRRect(rrect)).computeMetrics()) {
      for (double d = 0; d < m.length; d += 6) {
        canvas.drawPath(m.extractPath(d, d + 3), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorder old) => old.color != color;
}

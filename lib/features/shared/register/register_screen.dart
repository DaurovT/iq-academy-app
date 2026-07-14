import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/account.dart';
import '../../../core/models/common.dart';
import '../../../core/models/registration.dart';
import '../../../widgets/async_view.dart';
import '../widgets/pharm_academy_logo.dart';
import '../providers.dart';

// ── Палитра тёмного pre-auth флоу (Figma: pharmiq-doctor-register) ──
const _kGradTop = Color(0xFF0D0F1A);
const _kGradBottom = Color(0xFF1A1D35);
const _kAccent = Color(0xFF2563EB);
const _kSuccessBlue = Color(0xFF1A75FF);
const _kInputFill = Color(0xFF131D35);
const _kInputBorder = Color(0xFF253152);
const _kLabel = Color(0xFF6B7A99);
const _kWhite = Color(0xFFFEFEFE);
const _kCardFill = Color(0xFF1A2040);

/// Фон авторизационных экранов: тёмный градиент + мягкое свечение сверху-справа.
class _AuthBackground extends StatelessWidget {
  const _AuthBackground({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_kGradTop, _kGradBottom],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    const Color(0xFF1A75FF).withValues(alpha: 0.3),
                    const Color(0xFF1A75FF).withValues(alpha: 0),
                  ]),
                ),
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}

/// Индикатор «шаг N из 2»: две полоски, залитые синим по количеству шагов.
class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.step});
  final int step; // 1 или 2

  @override
  Widget build(BuildContext context) {
    Widget seg(bool filled) => Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: filled ? _kAccent : _kInputBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
    return Row(
      children: [
        seg(true),
        const SizedBox(width: 10),
        seg(step >= 2),
      ],
    );
  }
}

/// Регистрация: шаг 1 — выбор роли, шаг 2 — динамическая форма по
/// RegistrationSchema (types.ts: A.2). Телефон приходит из экрана входа.
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key, this.phone});

  final String? phone;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  Role? _role;

  @override
  Widget build(BuildContext context) {
    if (_role == null) {
      return _AuthBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          children: [
            const PharmAcademyLogo(height: 24),
            const SizedBox(height: 20),
            const _ProgressBar(step: 1),
            const SizedBox(height: 12),
            const Text('ШАГ 1 ИЗ 2',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: _kLabel)),
            const SizedBox(height: 12),
            const Text('Регистрация',
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.w700, color: _kWhite)),
            const SizedBox(height: 6),
            const Text('Выберите роль для входа',
                style: TextStyle(fontSize: 14, color: _kLabel)),
            const SizedBox(height: 20),
            for (final r in Role.values) ...[
              _RolePickCard(
                label: r.label,
                onTap: () => setState(() => _role = r),
              ),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('‹ Назад',
                    style: TextStyle(fontSize: 15, color: _kLabel)),
              ),
            ),
          ],
        ),
      );
    }

    return _SchemaForm(
      role: _role!,
      phone: widget.phone,
      onBack: () => setState(() => _role = null),
    );
  }
}

class _RolePickCard extends StatelessWidget {
  const _RolePickCard({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _kCardFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _kInputBorder),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _kWhite)),
              ),
              const Icon(Icons.chevron_right, color: _kLabel),
            ],
          ),
        ),
      ),
    );
  }
}

class _SchemaForm extends ConsumerStatefulWidget {
  const _SchemaForm(
      {required this.role, required this.phone, required this.onBack});

  final Role role;
  final String? phone;
  final VoidCallback onBack;

  @override
  ConsumerState<_SchemaForm> createState() => _SchemaFormState();
}

class _SchemaFormState extends ConsumerState<_SchemaForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _text = {};
  final Map<String, dynamic> _values = {};
  bool _loading = false;
  String? _error;

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

  TextEditingController _ctrl(RegField f) {
    return _text.putIfAbsent(f.name, () {
      final initial = f.type == RegFieldType.phone ? (widget.phone ?? '') : '';
      if (initial.isNotEmpty) _values[f.name] = initial;
      return TextEditingController(text: initial);
    });
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
    if (!_formKey.currentState!.validate()) return;
    // Проверка обязательных consent/select.
    for (final f in schema.fields) {
      if (!f.required) continue;
      final v = _values[f.name];
      if (f.type == RegFieldType.consent && v != true) {
        setState(() => _error = 'Подтвердите: ${f.label.resolve()}');
        return;
      }
      if ((f.type == RegFieldType.select ||
              f.type == RegFieldType.multiselect) &&
          (v == null || (v is List && v.isEmpty))) {
        setState(() => _error = 'Заполните: ${f.label.resolve()}');
        return;
      }
    }

    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final session = await ref
          .read(apiProvider)
          .auth
          .register(widget.role, schema.version, _values);
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
    if (_done) return _buildSuccess();

    final schema = ref.watch(registrationSchemaProvider(widget.role));
    return _AuthBackground(
      child: AsyncView(
        value: schema,
        onRetry: () => ref.invalidate(registrationSchemaProvider(widget.role)),
        data: (s) => Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            children: [
              const PharmAcademyLogo(height: 24),
              const SizedBox(height: 20),
              const _ProgressBar(step: 2),
              const SizedBox(height: 12),
              Text('ШАГ 2 ИЗ 2 · ${widget.role.label.toUpperCase()}',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: _kLabel)),
              const SizedBox(height: 12),
              const Text('Регистрация',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: _kWhite)),
              const SizedBox(height: 20),
              for (final f in s.fields) ...[
                _field(f),
                const SizedBox(height: 16),
              ],
              if (_error != null) ...[
                Text(_error!,
                    style: const TextStyle(color: Color(0xFFFF6B6B))),
                const SizedBox(height: 12),
              ],
              _PrimaryButton(
                label: 'Завершить регистрацию',
                loading: _loading,
                color: _kAccent,
                onPressed: _loading ? null : () => _submit(s),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: widget.onBack,
                  child: const Text('‹ Назад',
                      style: TextStyle(fontSize: 15, color: _kLabel)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Экран успеха (Figma: pharmiq-registration-success) ──
  Widget _buildSuccess() {
    return _AuthBackground(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96,
                height: 96,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _kSuccessBlue, width: 3),
                ),
                child: const Icon(Icons.check,
                    size: 32, color: _kSuccessBlue),
              ),
              const SizedBox(height: 34),
              const Text('Регистрация завершена!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const SizedBox(height: 12),
              Text(
                'Добро пожаловать в PharmIQ ACADEMY, $_firstName!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.8)),
              ),
              const SizedBox(height: 26),
              _PrimaryButton(
                label: 'Начать обучение',
                loading: _completing,
                color: _kSuccessBlue,
                onPressed: _completing ? null : () => _finish('/app/learn'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _completing ? null : () => _finish('/app'),
                child: const Text('Перейти на главную',
                    style: TextStyle(fontSize: 15, color: _kLabel)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(RegField f) {
    final label = f.label.resolve();
    switch (f.type) {
      case RegFieldType.text:
      case RegFieldType.phone:
        return _LabeledField(
          label: label,
          required: f.required,
          child: TextFormField(
            controller: _ctrl(f),
            keyboardType: f.type == RegFieldType.phone
                ? TextInputType.phone
                : TextInputType.text,
            style: const TextStyle(color: _kWhite, fontSize: 16),
            decoration: _inputDecoration(f.type == RegFieldType.phone
                ? '+998 90 123 45 67'
                : 'Введите ${label.toLowerCase()}'),
            onChanged: (v) => _values[f.name] = v,
            validator: (v) => f.required && (v == null || v.trim().isEmpty)
                ? 'Обязательное поле'
                : null,
          ),
        );

      case RegFieldType.select:
        final options = f.options ?? const <RegOption>[];
        final current = _values[f.name] as String?;
        final selectedLabel = current == null
            ? '— выберите —'
            : options
                .where((o) => o.value == current)
                .map((o) => o.label.resolve())
                .firstOrNull ??
                '— выберите —';
        return _LabeledField(
          label: label,
          required: f.required,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _openSelect(f, options),
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _kInputFill,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _kInputBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedLabel,
                      style: TextStyle(
                          fontSize: 16,
                          color: current == null ? _kLabel : _kWhite),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down,
                      size: 20, color: _kLabel),
                ],
              ),
            ),
          ),
        );

      case RegFieldType.multiselect:
        final options = f.options ?? const <RegOption>[];
        final selected =
            (_values[f.name] as List?)?.cast<String>() ?? <String>[];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fieldLabel('$label · Можно выбрать несколько', f.required),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final o in options)
                  _Chip(
                    label: o.label.resolve(),
                    selected: selected.contains(o.value),
                    onTap: () => setState(() {
                      final list = [...selected];
                      list.contains(o.value)
                          ? list.remove(o.value)
                          : list.add(o.value);
                      _values[f.name] = list;
                    }),
                  ),
              ],
            ),
          ],
        );

      case RegFieldType.consent:
        final checked = _values[f.name] == true;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setState(() => _values[f.name] = !checked),
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: checked ? _kAccent : _kInputFill,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: checked ? _kAccent : _kInputBorder),
                ),
                child: checked
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text('Я согласен на обработку персональных данных ',
                      style: TextStyle(fontSize: 13, color: _kLabel)),
                  if (f.consentUrl != null)
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(f.consentUrl!),
                          mode: LaunchMode.externalApplication),
                      child: const Text('подробнее',
                          style: TextStyle(
                              fontSize: 13,
                              color: _kAccent,
                              decoration: TextDecoration.underline,
                              decorationColor: _kAccent)),
                    ),
                ],
              ),
            ),
          ],
        );
    }
  }

  Future<void> _openSelect(RegField f, List<RegOption> options) async {
    final chosen = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: _kGradBottom,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: _kInputBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(f.label.resolve(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _kWhite)),
              const SizedBox(height: 8),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final o in options)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(o.label.resolve(),
                            style: const TextStyle(color: _kWhite)),
                        trailing: _values[f.name] == o.value
                            ? const Icon(Icons.check, color: _kAccent)
                            : null,
                        onTap: () => Navigator.of(ctx).pop(o.value),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (chosen != null) setState(() => _values[f.name] = chosen);
  }

  InputDecoration _inputDecoration(String hint) {
    OutlineInputBorder border(Color c) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c),
        );
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: _kInputFill,
      hintText: hint,
      hintStyle: const TextStyle(color: _kLabel, fontSize: 16),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      border: border(_kInputBorder),
      enabledBorder: border(_kInputBorder),
      focusedBorder: border(_kAccent),
      errorBorder: border(const Color(0xFFFF6B6B)),
      focusedErrorBorder: border(const Color(0xFFFF6B6B)),
    );
  }

  Widget _fieldLabel(String label, bool required) => Text(
        required ? '$label *' : label,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w500, color: _kLabel),
      );
}

class _LabeledField extends StatelessWidget {
  const _LabeledField(
      {required this.label, required this.required, required this.child});
  final String label;
  final bool required;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(required ? '$label *' : label,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: _kLabel)),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(
      {required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? _kAccent : _kInputFill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? _kAccent : _kInputBorder),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 13,
                color: selected ? Colors.white : _kWhite)),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.loading,
    required this.color,
    required this.onPressed,
  });
  final String label;
  final bool loading;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          disabledBackgroundColor: color.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: loading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white))
            : Text(label,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

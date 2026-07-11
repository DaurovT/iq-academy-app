import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/common.dart';
import '../../../core/models/registration.dart';
import '../../../widgets/async_view.dart';
import '../providers.dart';

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
      return Scaffold(
        appBar: AppBar(
          title: const Text('Регистрация'),
          leading: BackButton(onPressed: () => context.go('/login')),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Кто вы?', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            for (final r in Role.values)
              Card(
                child: ListTile(
                  title: Text(r.label),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => setState(() => _role = r),
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

class _SchemaForm extends ConsumerStatefulWidget {
  const _SchemaForm({required this.role, required this.phone, required this.onBack});

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
      if ((f.type == RegFieldType.select || f.type == RegFieldType.multiselect) &&
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
      await ref.read(authControllerProvider.notifier).completeLogin(session);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final schema = ref.watch(registrationSchemaProvider(widget.role));
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация · ${widget.role.label}'),
        leading: BackButton(onPressed: widget.onBack),
      ),
      body: AsyncView(
        value: schema,
        onRetry: () =>
            ref.invalidate(registrationSchemaProvider(widget.role)),
        data: (s) => Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final f in s.fields) ...[
                _field(f),
                const SizedBox(height: 16),
              ],
              if (_error != null) ...[
                Text(_error!,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error)),
                const SizedBox(height: 12),
              ],
              FilledButton(
                onPressed: _loading ? null : () => _submit(s),
                child: _loading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Зарегистрироваться'),
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
        return TextFormField(
          controller: _ctrl(f),
          keyboardType: f.type == RegFieldType.phone
              ? TextInputType.phone
              : TextInputType.text,
          decoration: InputDecoration(labelText: label),
          onChanged: (v) => _values[f.name] = v,
          validator: (v) =>
              f.required && (v == null || v.trim().isEmpty) ? 'Обязательное поле' : null,
        );

      case RegFieldType.select:
        return DropdownButtonFormField<String>(
          initialValue: _values[f.name] as String?,
          decoration: InputDecoration(labelText: label),
          items: [
            for (final o in f.options ?? [])
              DropdownMenuItem(value: o.value, child: Text(o.label.resolve())),
          ],
          onChanged: (v) => setState(() => _values[f.name] = v),
        );

      case RegFieldType.multiselect:
        final selected = (_values[f.name] as List?)?.cast<String>() ?? <String>[];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final o in f.options ?? [])
                  FilterChip(
                    label: Text(o.label.resolve()),
                    selected: selected.contains(o.value),
                    onSelected: (on) => setState(() {
                      final list = [...selected];
                      on ? list.add(o.value) : list.remove(o.value);
                      _values[f.name] = list;
                    }),
                  ),
              ],
            ),
          ],
        );

      case RegFieldType.consent:
        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          value: _values[f.name] == true,
          onChanged: (v) => setState(() => _values[f.name] = v ?? false),
          title: Text(label),
          subtitle: f.consentUrl != null
              ? Text(f.consentUrl!,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary))
              : null,
        );
    }
  }
}

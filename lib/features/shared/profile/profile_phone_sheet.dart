import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import 'profile_widgets.dart';

/// Смена номера телефона: номер → код из SMS (AccountApi.changePhoneStart/Confirm).
Future<void> showProfilePhoneSheet(BuildContext context) async {
  final changed = await showPqSheet<bool>(context, builder: (_) => const _PhoneSheet());
  if (changed == true && context.mounted) {
    showPqToast(context, context.l10n.profilePhoneChanged, icon: PqIcons.phone);
  }
}

class _PhoneSheet extends ConsumerStatefulWidget {
  const _PhoneSheet();

  @override
  ConsumerState<_PhoneSheet> createState() => _PhoneSheetState();
}

class _PhoneSheetState extends ConsumerState<_PhoneSheet> {
  final _phone = TextEditingController(text: '+998');
  final _code = TextEditingController();
  bool _codeStep = false;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _phone.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _next() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(apiProvider).account.changePhoneStart(_phone.text.trim());
      if (mounted) setState(() => _codeStep = true);
    } catch (e) {
      if (mounted) setState(() => _error = profileErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _confirm() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(apiProvider)
          .account
          .changePhoneConfirm(_phone.text.trim(), _code.text.trim());
      ref.invalidate(authControllerProvider);
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (mounted) setState(() => _error = profileErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ProfileSheetHeader(title: _codeStep ? l.profileSmsCodeTitle : l.profileNewPhoneTitle),
      const SizedBox(height: 16),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: PqMotion.ease,
        child: _codeStep
            ? PqTextField(
                key: const ValueKey('code'),
                controller: _code,
                label: l.profileCodeLabel,
                error: _error,
                autofocus: true,
                keyboardType: TextInputType.number,
                autofillHints: const [AutofillHints.oneTimeCode],
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSubmitted: (_) => _confirm(),
              )
            : PqTextField(
                key: const ValueKey('phone'),
                controller: _phone,
                label: l.profilePhone,
                error: _error,
                autofocus: true,
                keyboardType: TextInputType.phone,
                autofillHints: const [AutofillHints.telephoneNumber],
                onSubmitted: (_) => _next(),
              ),
      ),
      const SizedBox(height: 24),
      PqButton(
        label: _codeStep ? l.profileConfirm : l.profileNext,
        loading: _busy,
        onPressed: _codeStep ? _confirm : _next,
      ),
      const SizedBox(height: 8),
      PqButton(
        label: l.profileCancel,
        kind: PqButtonKind.secondary,
        onPressed: () => Navigator.of(context).pop(false),
      ),
    ]);
  }
}

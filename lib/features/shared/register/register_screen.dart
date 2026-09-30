import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../login/auth_ui.dart';
import 'register_form.dart';

/// Регистрация: шаг 1 — «Кто вы?» (макет RegRole), шаг 2 — форма по
/// RegistrationSchema (RegPharmacist/RegDoctor), затем экран успеха
/// (RegSuccess). Телефон приходит из экрана входа.
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key, this.phone, this.linkToken});

  final String? phone;

  /// Токен привязки после входа через Google/Apple: номер уже подтверждён по SMS,
  /// после регистрации этот вход привязывается к новому аккаунту.
  final String? linkToken;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  Role? _role;
  bool _form = false;

  @override
  Widget build(BuildContext context) {
    if (_form && _role != null) {
      return RegisterForm(
        role: _role!,
        phone: widget.phone,
        linkToken: widget.linkToken,
        onBack: () => setState(() => _form = false),
      );
    }

    final pq = context.pq;
    final l10n = context.l10n;
    // При регистрации доступны только фармацевт и врач.
    const roles = [Role.pharmacist, Role.doctor];
    String sub(Role r) => r == Role.pharmacist ? l10n.authRegPharmacistSub : l10n.authRegDoctorSub;

    return AuthScreen(
      child: AuthFlow(
        children: [
          const AuthHeader(),
          AuthStepProgress(step: 1, label: l10n.registerStep1Of2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.authRegWhoTitle,
                style: PqText.heading(32, FontWeight.w700, height: 1.15, ls: -0.3, c: pq.text),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.authRegWhoSubtitle,
                style: PqText.text(16, FontWeight.w400, c: pq.textMuted),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < roles.length; i++) ...[
                if (i > 0) const SizedBox(height: 10),
                AuthRoleCard(
                  icon: authRoleIcon(roles[i]),
                  title: roles[i].label(l10n),
                  subtitle: sub(roles[i]),
                  selected: _role == roles[i],
                  onTap: () => setState(() => _role = roles[i]),
                ),
              ],
            ],
          ),
          const AuthPush(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PqButton(
                label: l10n.authContinue,
                onPressed: _role == null ? null : () => setState(() => _form = true),
              ),
              const SizedBox(height: 8),
              PqButton(
                label: l10n.authBack,
                kind: PqButtonKind.text,
                height: 52,
                onPressed: () => context.go('/login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

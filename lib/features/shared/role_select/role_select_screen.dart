import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../login/auth_ui.dart';

String _roleSub(AppLocalizations l10n, Role r) => switch (r) {
  Role.pharmacist => l10n.roleSelectSubChecksQuests,
  Role.doctor => l10n.authRoleSubDoctor,
  Role.medrep => l10n.roleSelectSubMedrep,
  Role.productOwner => l10n.roleSelectSubProductOwner,
};

/// Выбор роли при входе, если у аккаунта их несколько (макет RoleLogin,
/// маршрут `/role`).
class RoleSelectScreen extends ConsumerWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l10n = context.l10n;
    final account = ref.watch(authControllerProvider).asData?.value.account;
    final roles = account?.roles ?? const <Role>[];
    final name = (account?.fullName ?? '').trim().split(RegExp(r'\s+')).first;

    return AuthScreen(
      child: AuthFlow(
        children: [
          const AuthHeader(),
          AuthHero(title: l10n.loginTagline, subtitle: l10n.authLoginSubtitle),
          const AuthPush(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthTitleBlock(
                title: name.isEmpty ? l10n.roleSelectGreeting : l10n.roleSelectGreetingName(name),
                subtitle: l10n.authRoleSubtitle,
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < roles.length; i++) ...[
                if (i > 0) const SizedBox(height: 10),
                AuthRoleCard(
                  icon: authRoleIcon(roles[i]),
                  title: roles[i].label(l10n),
                  subtitle: _roleSub(l10n, roles[i]),
                  onTap: () => ref.read(authControllerProvider.notifier).setActiveRole(roles[i]),
                ),
              ],
              const SizedBox(height: 16),
              Text(
                l10n.authRoleHint,
                textAlign: TextAlign.center,
                style: PqText.body(c: pq.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Открывает выбор роли нижним листом (кнопка «Сменить» в профиле).
Future<void> showRoleSelectSheet(BuildContext context) {
  return showPqSheet<void>(context, scrollable: true, builder: (_) => const _RoleSheet());
}

class _RoleSheet extends ConsumerStatefulWidget {
  const _RoleSheet();

  @override
  ConsumerState<_RoleSheet> createState() => _RoleSheetState();
}

class _RoleSheetState extends ConsumerState<_RoleSheet> {
  Role? _selected;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final auth = ref.watch(authControllerProvider).asData?.value;
    final roles = auth?.account?.roles ?? const <Role>[];
    final selected = _selected ?? auth?.activeRole ?? (roles.isNotEmpty ? roles.first : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(l10n.roleSelectSheetTitle, style: PqText.heading(22, FontWeight.w700, c: pq.text)),
        const SizedBox(height: 16),
        for (final role in roles) ...[
          AuthRoleCard(
            icon: authRoleIcon(role),
            title: role.label(l10n),
            subtitle: _roleSub(l10n, role),
            selected: role == selected,
            onTap: () => setState(() => _selected = role),
          ),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 14),
        PqButton(
          label: l10n.roleSelectEnter,
          onPressed:
              selected == null
                  ? null
                  : () {
                    ref.read(authControllerProvider.notifier).setActiveRole(selected);
                    Navigator.of(context).pop();
                  },
        ),
      ],
    );
  }
}

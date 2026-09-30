import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import 'profile_widgets.dart';

/// «Сменить роль» — нижний лист из профиля (макет ProfileRole).
Future<void> showProfileRoleSheet(BuildContext context) => showPqSheet<void>(
  context,
  scrollable: true,
  padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
  handleGap: 16,
  bordered: true,
  scrim: const Color(0x9E05060A),
  builder: (_) => const _RoleSheet(),
);

class _RoleSheet extends ConsumerStatefulWidget {
  const _RoleSheet();

  @override
  ConsumerState<_RoleSheet> createState() => _RoleSheetState();
}

class _RoleSheetState extends ConsumerState<_RoleSheet> {
  Role? _selected;
  bool _busy = false;

  String _desc(Role r) {
    final l = context.l10n;
    return switch (r) {
      Role.pharmacist => l.profileRoleDescPharmacist,
      Role.doctor => l.profileRoleDescDoctor,
      Role.medrep => l.profileRoleDescMedrep,
      Role.productOwner => l.profileRoleDescBrand,
    };
  }

  Future<void> _switch(Role role) async {
    setState(() => _busy = true);
    final router = GoRouter.of(context);
    final nav = Navigator.of(context);
    await ref.read(authControllerProvider.notifier).setActiveRole(role);
    if (!mounted) return;
    nav.pop();
    router.go('/app');
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final auth = ref.watch(authControllerProvider).asData?.value;
    final roles = auth?.account?.roles ?? const <Role>[];
    final current = auth?.activeRole;
    final selected =
        _selected ??
        roles.where((r) => r != current).firstOrNull ??
        current ??
        roles.firstOrNull;
    final canSwitch = selected != null && selected != current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileSheetHeader(
          title: l.profileRoleSheetTitle,
          subtitle: l.profileRoleSheetSubtitle,
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < roles.length; i++) ...[
          if (i > 0) const SizedBox(height: 10),
          _RoleOption(
            role: roles[i],
            title: roles[i].label(l),
            description: _desc(roles[i]),
            current: roles[i] == current,
            selected: roles[i] == selected,
            onTap: () => setState(() => _selected = roles[i]),
          ),
        ],
        const SizedBox(height: 16),
        Text(l.profileRoleNote, style: PqText.body(c: pq.textMuted)),
        const SizedBox(height: 16),
        PqButton(
          label: l.profileRoleSwitch(selected?.label(l) ?? ''),
          loading: _busy,
          onPressed: canSwitch ? () => _switch(selected) : null,
        ),
      ],
    );
  }
}

class _RoleOption extends StatelessWidget {
  const _RoleOption({
    required this.role,
    required this.title,
    required this.description,
    required this.current,
    required this.selected,
    required this.onTap,
  });

  final Role role;
  final String title;
  final String description;
  final bool current;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      child: PqPressable(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          constraints: const BoxConstraints(minHeight: 76),
          // box-sizing: border-box — рамка (1/2) добавляется к полям 12/16.
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            // Выбранная: тёмная — accentSoft, светлая — #eef2ff (нет в токенах).
            color:
                selected
                    ? (pq.isDark ? pq.accentSoft : const Color(0xFFEEF2FF))
                    : pq.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected ? pq.accent : pq.border,
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: pq.accentSoft,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: PqIcon(
                  profileRoleIcon(role),
                  size: 22,
                  color: pq.accentText,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          title,
                          style: PqText.text(
                            17,
                            FontWeight.w700,
                            height: 1.2,
                            c: pq.text,
                          ),
                        ),
                        if (current)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: pq.successSoft,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              l.profileRoleCurrent,
                              style: PqText.tag(
                                c: pq.success,
                              ).copyWith(height: 1.2),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    // Текст внутри <button>: line-height normal.
                    Text(
                      description,
                      style: PqText.text(
                        14,
                        FontWeight.w400,
                        height: 1.2,
                        c: pq.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? pq.accent : pq.accent.withValues(alpha: 0),
                  border:
                      selected
                          ? null
                          : Border.all(color: pq.borderStrong, width: 2),
                ),
                child:
                    selected
                        ? PqAnimate(
                          fx: PqFx.pop,
                          duration: const Duration(milliseconds: 300),
                          child: PqIcon(
                            PqIcons.check,
                            size: 14,
                            color: pq.onAccent,
                          ),
                        )
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

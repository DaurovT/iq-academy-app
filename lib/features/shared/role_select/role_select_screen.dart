import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/common.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/pharm_academy_logo.dart';

IconData _roleIcon(Role r) => switch (r) {
      Role.pharmacist => Icons.work_outline,
      Role.doctor => Icons.medical_services_outlined,
      Role.medrep => Icons.groups_outlined,
      Role.productOwner => Icons.storefront_outlined,
    };

String _roleSub(Role r) => switch (r) {
      Role.pharmacist => 'Чеки, квесты, обучение и кошелёк',
      Role.doctor => 'Чеки, квесты, обучение и кошелёк',
      Role.medrep => 'Портфель провизоров и рейтинг',
      Role.productOwner => 'Дашборд, продукты и бренды',
    };

/// Полноэкранный выбор роли при входе (маршрут `/role`). Перенесён один в
/// один из макета Figma «pharmiq-role-select-login».
class RoleSelectScreen extends ConsumerWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authControllerProvider).asData?.value.account;
    final roles = account?.roles ?? const <Role>[];
    final name = account?.fullName ?? '';

    return Scaffold(
      body: Container(
        // Явные размеры: без них контейнер сжимается по контенту и снизу
        // просвечивает белый фон Scaffold (проявлялось на Android).
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D0F1A), Color(0xFF1A1D35)],
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
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PharmAcademyLogo(height: 34),
                    const SizedBox(height: 40),
                    const Text('Обучайся.\nПрименяй.\nДостигай.',
                        style: TextStyle(
                            fontSize: 38,
                            height: 1.05,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFEFEFE))),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            name.isEmpty ? 'Здравствуйте' : 'Здравствуйте, $name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFEFEFE)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A2040),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFFFEFEFE)),
                          ),
                          child: const Text('RU',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFEFEFE))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Выберите роль для входа',
                        style: TextStyle(fontSize: 14, color: Color(0xFF6B7A99))),
                    const SizedBox(height: 24),
                    for (final role in roles) ...[
                      _RoleCard(
                        role: role,
                        onTap: () => ref
                            .read(authControllerProvider.notifier)
                            .setActiveRole(role),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({required this.role, required this.onTap});
  final Role role;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1A2040),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF253152)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFF253152),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(_roleIcon(role),
                    size: 24, color: const Color(0xFFE4E2ED)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(role.label,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFEFEFE))),
                    const SizedBox(height: 4),
                    Text(_roleSub(role),
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xFF6B7A99))),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF6B7A99)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Открывает выбор роли модальным нижним листом (кнопка «Сменить» в профиле).
Future<void> showRoleSelectSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const _RoleSheet(isModal: true),
  );
}

class _RoleSheet extends ConsumerStatefulWidget {
  const _RoleSheet({required this.isModal});
  final bool isModal;

  @override
  ConsumerState<_RoleSheet> createState() => _RoleSheetState();
}

class _RoleSheetState extends ConsumerState<_RoleSheet> {
  Role? _selected;

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final roles =
        ref.watch(authControllerProvider).asData?.value.account?.roles ??
            const <Role>[];
    final selected = _selected ?? (roles.isNotEmpty ? roles.first : null);

    // Figma 107:50 (тёмная) / 107:114 (светлая).
    final sheetBg = isDark ? const Color(0xFF1E2039) : Colors.white;
    final divider = isDark ? const Color(0xFF3F4168) : const Color(0xFFF3F4F6);
    const brandBlue = Color(0xFF2563EB);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: sheetBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Выберите роль',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: p.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              for (final role in roles)
                _RoleRow(
                  palette: p,
                  divider: divider,
                  label: role.label,
                  selected: role == selected,
                  onTap: () => setState(() => _selected = role),
                ),
              const SizedBox(height: 24),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: brandBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: selected == null
                      ? null
                      : () {
                          ref
                              .read(authControllerProvider.notifier)
                              .setActiveRole(selected);
                          if (widget.isModal) Navigator.of(context).pop();
                        },
                  child: const Text(
                    'Войти',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleRow extends StatelessWidget {
  const _RoleRow({
    required this.palette,
    required this.divider,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final PharmPalette palette;
  final Color divider;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: divider)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 16, color: palette.textPrimary),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? const Color(0xFF2563EB) : divider,
                  width: 2,
                ),
              ),
              child: selected
                  ? Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF2563EB),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/common.dart';
import '../../../core/theme/theme_controller.dart';
import '../../pharmacist/providers.dart';
import '../role_select/role_select_screen.dart';
import '../widgets/pharm_top_bar.dart';

/// Профиль пользователя. Перенесён один в один из макета Figma
/// «pharmiq-profile-connected» (node 20:493 / 46:1147).
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _Pal.of(context);
    final auth = ref.watch(authControllerProvider).asData?.value;
    final account = auth?.account;
    final themeMode = ref.watch(themeModeProvider);
    final iqc = ref.watch(walletProvider).asData?.value.balanceIqc ?? 0;
    final questsCount =
        ref.watch(questsListProvider(null)).asData?.value.length ?? 0;
    final multiRole = (account?.roles.length ?? 0) > 1;
    final roleLabel = auth?.activeRole?.label ?? '';
    final name = account?.fullName ?? '—';

    return Scaffold(
      backgroundColor: c.page,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              children: [
                Text('Профиль',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: c.text)),
                const SizedBox(height: 15),

                // ── Карточка профиля ──
                _ProfileCard(
                  c: c,
                  name: name,
                  roleLabel: roleLabel,
                  subtitle: account?.phone ?? '',
                  iqc: iqc,
                  quests: questsCount,
                ),
                const SizedBox(height: 15),

                // ── Настройки ──
                Text('Настройки',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: c.text)),
                const SizedBox(height: 12),
                _Card(
                  c: c,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MiniLabel(c: c, text: 'ЯЗЫК'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          for (final l in Language.values) ...[
                            _Pill(
                              c: c,
                              label: _langName(l),
                              selected: account?.language == l,
                              onTap: () => _setLanguage(context, ref, l),
                            ),
                            const SizedBox(width: 4),
                          ],
                        ],
                      ),
                      const SizedBox(height: 12),
                      _Divider(c: c),
                      const SizedBox(height: 12),
                      _MiniLabel(c: c, text: 'ОФОРМЛЕНИЕ'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          for (final (m, label) in const [
                            (ThemeMode.light, 'Светлая'),
                            (ThemeMode.dark, 'Тёмная'),
                            (ThemeMode.system, 'Система'),
                          ]) ...[
                            _Pill(
                              c: c,
                              label: label,
                              selected: themeMode == m,
                              onTap: () =>
                                  ref.read(themeModeProvider.notifier).set(m),
                            ),
                            const SizedBox(width: 4),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // ── Аккаунт ──
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text('Аккаунт',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: c.text)),
                ),
                _Card(
                  c: c,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MiniLabel(c: c, text: 'ЛИЧНЫЕ ДАННЫЕ'),
                      const SizedBox(height: 12),
                      _AccountRow(
                        c: c,
                        circle: c.circleNavy,
                        icon: Icons.person_outline,
                        iconColor: c.iconOnNavy,
                        title: name,
                        trailing: _OutlineBadge(c: c, text: roleLabel),
                      ),
                      const SizedBox(height: 12),
                      _AccountRow(
                        c: c,
                        circle: c.circleRole,
                        icon: Icons.work_outline,
                        iconColor: c.iconOnNavy,
                        title: 'Роль',
                        subtitle: roleLabel,
                        trailing: multiRole
                            ? _ChangeBtn(
                                c: c,
                                text: 'Сменить',
                                border: c.changeAccent,
                                textColor: c.changeAccentText,
                                onTap: () => showRoleSelectSheet(context),
                              )
                            : null,
                      ),
                      const SizedBox(height: 12),
                      _Divider(c: c),
                      const SizedBox(height: 12),
                      _MiniLabel(c: c, text: 'ПРИВЯЗАННЫЕ СЕРВИСЫ'),
                      const SizedBox(height: 12),
                      _AccountRow(
                        c: c,
                        circle: c.circlePhone,
                        icon: Icons.phone_outlined,
                        iconColor: c.iconOnNavy,
                        title: 'Телефон',
                        subtitle: account?.phone ?? '—',
                        trailing: _ChangeBtn(
                          c: c,
                          text: 'Сменить',
                          border: c.changeNeutral,
                          textColor: c.text,
                          onTap: () => _changePhone(context, ref),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _Divider(c: c),
                      const SizedBox(height: 12),
                      _AccountRow(
                        c: c,
                        circle: const Color(0xFF1A73C8),
                        icon: Icons.send,
                        iconColor: Colors.white,
                        title: 'Telegram',
                        subtitle: 'Подключён',
                        trailing: _StatusPill(
                          bg: c.tgPillBg,
                          text: 'Привязан',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // ── Поддержка ──
                _TileCard(
                  c: c,
                  circle: const Color(0xFF1A3566),
                  icon: Icons.headset_mic_outlined,
                  iconColor: Colors.white,
                  title: 'Поддержка',
                  subtitle: 'Мы всегда на связи',
                  chevron: true,
                  onTap: () => context.push('/app/support'),
                ),
                const SizedBox(height: 12),
                _TileCard(
                  c: c,
                  circle: c.circlePlain,
                  icon: Icons.logout,
                  iconColor: c.iconOnNavy,
                  title: 'Выйти из аккаунта',
                  onTap: () => _confirmLogout(context, ref),
                ),
                const SizedBox(height: 15),

                // ── Удаление ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Удалить аккаунт и данные',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: c.deleteText)),
                            const SizedBox(height: 2),
                            Text('Действие необратимо',
                                style: TextStyle(
                                    fontSize: 11, color: c.deleteSub)),
                          ],
                        ),
                      ),
                      Material(
                        color: c.deleteBtn,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => _deleteAccount(context, ref),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text('Удалить',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _langName(Language l) => switch (l) {
        Language.ru => 'Русский',
        Language.uz => "O'zbekcha",
        Language.kz => 'Қазақша',
      };

  Future<void> _setLanguage(
      BuildContext context, WidgetRef ref, Language lang) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiProvider).account.setLanguage(lang);
      ref.invalidate(authControllerProvider);
      messenger.showSnackBar(const SnackBar(content: Text('Язык обновлён')));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _changePhone(BuildContext context, WidgetRef ref) async {
    final phone = TextEditingController(text: '+998');
    final started = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Новый номер'),
        content: TextField(
          controller: phone,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(labelText: 'Телефон'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Далее')),
        ],
      ),
    );
    if (started != true || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiProvider).account.changePhoneStart(phone.text.trim());
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
      return;
    }
    if (!context.mounted) return;

    final code = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Код из SMS'),
        content: TextField(
          controller: code,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Код'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Подтвердить')),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    try {
      await ref
          .read(apiProvider)
          .account
          .changePhoneConfirm(phone.text.trim(), code.text.trim());
      ref.invalidate(authControllerProvider);
      messenger.showSnackBar(const SnackBar(content: Text('Телефон изменён')));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Выйти из аккаунта?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Выйти')),
        ],
      ),
    );
    if (ok == true) await ref.read(authControllerProvider.notifier).logout();
  }

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить аккаунт?'),
        content: const Text('Действие необратимо. Все данные будут удалены.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена')),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Theme.of(ctx).colorScheme.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiProvider).account.deleteAccount();
      await ref.read(authControllerProvider.notifier).logout();
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

// ── Карточка профиля ────────────────────────────────────────────────────

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.c,
    required this.name,
    required this.roleLabel,
    required this.subtitle,
    required this.iqc,
    required this.quests,
  });

  final _Pal c;
  final String name;
  final String roleLabel;
  final String subtitle;
  final int iqc;
  final int quests;

  @override
  Widget build(BuildContext context) {
    final initials = name.trim().isEmpty
        ? '?'
        : name
            .trim()
            .split(RegExp(r'\s+'))
            .take(2)
            .map((w) => w[0])
            .join()
            .toUpperCase();
    final fmt = NumberFormat.decimalPattern('ru');
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(16),
        border: c.cardBorder == null ? null : Border.all(color: c.cardBorder!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: c.avatarBg,
                  shape: BoxShape.circle,
                  border: Border.all(color: c.avatarBorder),
                ),
                child: Text(initials,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: c.text)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: c.text)),
                        ),
                        const SizedBox(width: 8),
                        if (roleLabel.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: c.badgeBg,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(roleLabel.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: c.text)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: TextStyle(fontSize: 13, color: c.muted)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _Stat(c: c, value: fmt.format(iqc), label: 'IQC')),
              _statDivider(c),
              Expanded(child: _Stat(c: c, value: '$quests', label: 'КВЕСТОВ')),
              _statDivider(c),
              Expanded(child: _Stat(c: c, value: '1', label: 'УРОВЕНЬ')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statDivider(_Pal c) =>
      Container(width: 1, height: 40, color: c.divider);
}

class _Stat extends StatelessWidget {
  const _Stat({required this.c, required this.value, required this.label});
  final _Pal c;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: c.text)),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: c.muted)),
      ],
    );
  }
}

// ── Строки аккаунта / плитки ────────────────────────────────────────────

class _AccountRow extends StatelessWidget {
  const _AccountRow({
    required this.c,
    required this.circle,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  final _Pal c;
  final Color circle;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: circle, borderRadius: BorderRadius.circular(18)),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: c.text)),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: c.muted)),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ),
    );
  }
}

class _TileCard extends StatelessWidget {
  const _TileCard({
    required this.c,
    required this.circle,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.chevron = false,
    required this.onTap,
  });

  final _Pal c;
  final Color circle;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final bool chevron;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: c.card,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border:
                c.cardBorder == null ? null : Border.all(color: c.cardBorder!),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: circle, borderRadius: BorderRadius.circular(18)),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: c.text)),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(subtitle!,
                          style: TextStyle(fontSize: 12, color: c.muted)),
                    ],
                  ],
                ),
              ),
              if (chevron)
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: c.circlePlain,
                      borderRadius: BorderRadius.circular(14)),
                  child: Icon(Icons.chevron_right, size: 16, color: c.muted),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Мелкие элементы ─────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  const _Card({required this.c, required this.child});
  final _Pal c;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(16),
        border: c.cardBorder == null ? null : Border.all(color: c.cardBorder!),
      ),
      child: child,
    );
  }
}

class _MiniLabel extends StatelessWidget {
  const _MiniLabel({required this.c, required this.text});
  final _Pal c;
  final String text;

  @override
  Widget build(BuildContext context) => Text(text,
      style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: c.muted));
}

class _Divider extends StatelessWidget {
  const _Divider({required this.c});
  final _Pal c;
  @override
  Widget build(BuildContext context) =>
      Container(height: 1, color: c.divider);
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.c,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final _Pal c;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 32,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: selected ? c.pillSelBg : c.pillUnselBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: selected ? c.pillSelBorder : c.pillUnselBorder),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                color: selected ? c.pillSelText : c.pillUnselText)),
      ),
    );
  }
}

class _OutlineBadge extends StatelessWidget {
  const _OutlineBadge({required this.c, required this.text});
  final _Pal c;
  final String text;
  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: c.circleNavy),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, color: c.text)),
    );
  }
}

class _ChangeBtn extends StatelessWidget {
  const _ChangeBtn({
    required this.c,
    required this.text,
    required this.border,
    required this.textColor,
    required this.onTap,
  });

  final _Pal c;
  final String text;
  final Color border;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border),
        ),
        child: Text(text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: textColor)),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.bg, required this.text});
  final Color bg;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
    );
  }
}

// ── Палитра профиля (точные токены макета) ──────────────────────────────

class _Pal {
  const _Pal({
    required this.page,
    required this.card,
    required this.cardBorder,
    required this.text,
    required this.muted,
    required this.divider,
    required this.avatarBg,
    required this.avatarBorder,
    required this.badgeBg,
    required this.pillSelBg,
    required this.pillSelBorder,
    required this.pillSelText,
    required this.pillUnselBg,
    required this.pillUnselBorder,
    required this.pillUnselText,
    required this.circleNavy,
    required this.circleRole,
    required this.circlePhone,
    required this.circlePlain,
    required this.iconOnNavy,
    required this.changeAccent,
    required this.changeAccentText,
    required this.changeNeutral,
    required this.tgPillBg,
    required this.deleteText,
    required this.deleteSub,
    required this.deleteBtn,
  });

  final Color page;
  final Color card;
  final Color? cardBorder;
  final Color text;
  final Color muted;
  final Color divider;
  final Color avatarBg;
  final Color avatarBorder;
  final Color badgeBg;
  final Color pillSelBg;
  final Color pillSelBorder;
  final Color pillSelText;
  final Color pillUnselBg;
  final Color pillUnselBorder;
  final Color pillUnselText;
  final Color circleNavy;
  final Color circleRole;
  final Color circlePhone;
  final Color circlePlain;
  final Color iconOnNavy;
  final Color changeAccent;
  final Color changeAccentText;
  final Color changeNeutral;
  final Color tgPillBg;
  final Color deleteText;
  final Color deleteSub;
  final Color deleteBtn;

  static _Pal of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _Pal(
    page: Color(0xFF0B0E17),
    card: Color(0xFF12192B),
    cardBorder: null,
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF8F909A),
    divider: Color(0x14FFFFFF),
    avatarBg: Color(0xFF0B0E17),
    avatarBorder: Color(0x1FFFFFFF),
    badgeBg: Color(0x14FFFFFF),
    pillSelBg: Color(0xFF151B2A),
    pillSelBorder: Color(0x1FFFFFFF),
    pillSelText: Color(0xFFE4E2ED),
    pillUnselBg: Color(0xFF0B0E17),
    pillUnselBorder: Color(0x14FFFFFF),
    pillUnselText: Color(0xFF8F909A),
    circleNavy: Color(0xFF1A2540),
    circleRole: Color(0xFF1E202D),
    circlePhone: Color(0xFF2D2E38),
    circlePlain: Color(0xFF0B0E17),
    iconOnNavy: Color(0xFFAAB6DA),
    changeAccent: Color(0xFF2563EB),
    changeAccentText: Color(0xFF60A5FA),
    changeNeutral: Colors.white,
    tgPillBg: Color(0xFF1B5E20),
    deleteText: Color(0xFFFF5252),
    deleteSub: Color(0xFF6B7280),
    deleteBtn: Color(0xFFB71C1C),
  );

  static const _light = _Pal(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    cardBorder: Color(0xFFEBEDF0),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    divider: Color(0xFFEBEDF0),
    avatarBg: Color(0xFFEEF2FF),
    avatarBorder: Color(0xFFD4DAFB),
    badgeBg: Color(0xFFEEF2FF),
    pillSelBg: Color(0xFF2563EB),
    pillSelBorder: Color(0xFF2563EB),
    pillSelText: Colors.white,
    pillUnselBg: Colors.white,
    pillUnselBorder: Color(0xFFEBEDF0),
    pillUnselText: Color(0xFF6B7280),
    circleNavy: Color(0xFFEEF2FF),
    circleRole: Color(0xFFEEF2FF),
    circlePhone: Color(0xFFF2F5F7),
    circlePlain: Color(0xFFF2F5F7),
    iconOnNavy: Color(0xFF2563EB),
    changeAccent: Color(0xFF2563EB),
    changeAccentText: Color(0xFF2563EB),
    changeNeutral: Color(0xFFD0D5DD),
    tgPillBg: Color(0xFF10B981),
    deleteText: Color(0xFFEF4444),
    deleteSub: Color(0xFF9CA3AF),
    deleteBtn: Color(0xFFDC2626),
  );
}

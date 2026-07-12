import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../providers.dart';

/// Общая верхняя панель PharmIQ (логотип + колокольчик уведомлений).
/// Фон уходит под статус-бар, значок непрочитанных берётся из провайдера.
/// Перенесена из макета Figma «top-app-bar».
class PharmTopBar extends ConsumerWidget {
  const PharmTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoText = isDark ? p.textPrimary : const Color(0xFF293B71);
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    final topInset = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topInset),
      decoration: BoxDecoration(
        color: isDark ? p.bg : Colors.white,
        border: isDark
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE5E8EB))),
      ),
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 28,
                    height: 20,
                    colorFilter: ColorFilter.mode(logoText, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'PharmIQ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: logoText,
                    ),
                  ),
                ],
              ),
              _BellButton(
                palette: p,
                isDark: isDark,
                unread: unread,
                onTap: () => context.go('/app/notifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BellButton extends StatelessWidget {
  const _BellButton({
    required this.palette,
    required this.isDark,
    required this.unread,
    required this.onTap,
  });

  final PharmPalette palette;
  final bool isDark;
  final int unread;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: unread > 0,
      label: Text(unread > 99 ? '99+' : '$unread'),
      child: Material(
        color: isDark ? const Color(0x14FFFFFF) : Colors.white,
        shape: CircleBorder(
          side: isDark
              ? BorderSide.none
              : const BorderSide(color: Color(0xFFE8EBF0)),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(Icons.notifications_none_rounded,
                size: 22, color: palette.textPrimary),
          ),
        ),
      ),
    );
  }
}

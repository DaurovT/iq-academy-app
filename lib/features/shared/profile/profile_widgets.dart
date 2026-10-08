import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';

/// Общие элементы раздела «Профиль, уведомления, поддержка» (макеты 1.2).

/// Версия приложения для подвала профиля. Пакета package_info в проекте нет —
/// значение можно передать при сборке: `--dart-define=APP_VERSION=1.2.0`.
const kProfileAppVersion = String.fromEnvironment(
  'APP_VERSION',
  defaultValue: '1.2.0',
);

/// Текст ошибки API для пользователя: `detail` сервера или общий текст.
String profileErrorText(BuildContext context, Object e) {
  if (e is DioException && e.error is ApiException) {
    return (e.error as ApiException).message;
  }
  if (e is ApiException) return e.message;
  return context.l10n.profileErrorGeneric;
}

/// Телефон в виде макета: `+998903196963` → `+998 90 319 69 63`.
String profileFormatPhone(String phone) {
  final d = phone.replaceAll(RegExp(r'\D'), '');
  if (d.length != 12 || !d.startsWith('998')) return phone;
  return '+998 ${d.substring(3, 5)} ${d.substring(5, 8)} ${d.substring(8, 10)} ${d.substring(10)}';
}

/// Инициалы для аватара: «Аралбек Тошматов» → «АТ».
String profileInitials(String name) {
  final parts = name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
  if (parts.isEmpty) return '';
  return parts.take(2).map((w) => w.characters.first).join().toUpperCase();
}

/// Язык справочников (LocalizedText) по языку интерфейса.
Language profileRefLanguage(BuildContext context) =>
    switch (Localizations.localeOf(context).languageCode) {
      'uz' => Language.uz,
      'kk' => Language.kz,
      _ => Language.ru,
    };

/// Иконка роли (выбор роли, профиль).
PqIcons profileRoleIcon(Role r) => switch (r) {
  Role.pharmacist => PqIcons.pill,
  Role.doctor => PqIcons.stethoscope,
  Role.medrep => PqIcons.users,
  Role.productOwner => PqIcons.package,
};

/// Градиент аватара (одинаковый в обеих темах).
const kProfileAvatarGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
);

/// Круглый аватар с инициалами; без имени — серый кружок с иконкой.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.name, this.size = 64});

  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final initials = profileInitials(name);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: initials.isEmpty ? null : kProfileAvatarGradient,
        color: initials.isEmpty ? pq.surfaceAlt : null,
      ),
      child:
          initials.isEmpty
              ? PqIcon(PqIcons.user, size: size * 28 / 64, color: pq.textMuted)
              : Text(
                initials,
                style: PqText.heading(
                  size * 22 / 64,
                  FontWeight.w700,
                  c: Colors.white,
                ),
              ),
    );
  }
}

/// Секция профиля: подпись капсом (12/600, трекинг .8) + карточка-список.
class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, this.title, required this.children});

  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title!.toUpperCase(),
              style: PqText.overline(c: pq.textMuted),
            ),
          ),
          const SizedBox(height: 8),
        ],
        PqCard(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              for (var i = 0; i < children.length; i++)
                Container(
                  // Container учитывает рамку в размере: border-bottom = 1 px, как в CSS.
                  decoration: BoxDecoration(
                    border:
                        i < children.length - 1
                            ? Border(bottom: BorderSide(color: pq.divider))
                            : null,
                  ),
                  child: children[i],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Плитка 36×36 (радиус 10) с иконкой 18 — строки профиля и настроек.
class ProfileRowTile extends StatelessWidget {
  const ProfileRowTile(this.icon, {super.key, this.accent = false});

  final PqIcons icon;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: accent ? pq.accentSoft : pq.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
      ),
      child: PqIcon(
        icon,
        size: 18,
        color: accent ? pq.accentText : pq.textSecondary,
      ),
    );
  }
}

/// Строка профиля: плитка 36 · заголовок 16/500 (+ подпись 13) · значение 15 · шеврон.
class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.subtitleMaxLines = 1,
    this.value,
    this.valueColor,
    this.trailing,
    this.chevron = true,
    this.accent = false,
    this.onTap,
  });

  final PqIcons icon;
  final String title;
  final String? subtitle;
  final int subtitleMaxLines;
  final String? value;
  final Color? valueColor;
  final Widget? trailing;
  final bool chevron;
  final bool accent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    // В макете min-height 56 — у содержимого (content-box) + поля 8/8.
    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Row(
          children: [
            ProfileRowTile(icon, accent: accent),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: PqText.text(16, FontWeight.w500, c: pq.text),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 1),
                    Text(
                      subtitle!,
                      maxLines: subtitleMaxLines,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.text(13, FontWeight.w400, c: pq.textMuted),
                    ),
                  ],
                ],
              ),
            ),
            if (value != null) ...[
              const SizedBox(width: 12),
              // Значение не сжимается (white-space: nowrap), сжимается заголовок.
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: Text(
                  value!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: PqText.text(
                    15,
                    FontWeight.w400,
                    c: valueColor ?? pq.textMuted,
                  ),
                ),
              ),
            ],
            if (trailing != null) ...[const SizedBox(width: 12), trailing!],
            if (chevron && trailing == null) ...[
              const SizedBox(width: 12),
              PqIcon(PqIcons.chevronRight, size: 18, color: pq.textMuted),
            ],
          ],
        ),
      ),
    );
    return onTap == null ? row : PqPressable(onTap: onTap, child: row);
  }
}

/// Группа радиокнопок-сегментов в сетке (язык — 2 колонки, тема — 3):
/// подложка surfaceAlt с полем 4, радиус 14; выбранная кнопка «поднята».
class ProfileSegGrid<T> extends StatelessWidget {
  const ProfileSegGrid({
    super.key,
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onChanged,
    required this.columns,
    required this.semanticLabel,
  });

  final List<T> values;
  final T selected;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;
  final int columns;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    const gap = 4.0;
    final rows = (values.length / columns).ceil();
    return Semantics(
      label: semanticLabel,
      container: true,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: pq.surfaceAlt,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            for (var r = 0; r < rows; r++) ...[
              if (r > 0) const SizedBox(height: gap),
              Row(
                children: [
                  for (var c = 0; c < columns; c++) ...[
                    if (c > 0) const SizedBox(width: gap),
                    Expanded(
                      child:
                          r * columns + c < values.length
                              ? _SegButton(
                                label: labelOf(values[r * columns + c]),
                                selected: values[r * columns + c] == selected,
                                onTap: () => onChanged(values[r * columns + c]),
                              )
                              : const SizedBox(height: 36),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SegButton extends StatelessWidget {
  const _SegButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                selected
                    ? pq.segmentActive
                    : pq.segmentActive.withValues(alpha: 0),
            borderRadius: BorderRadius.circular(10),
            boxShadow:
                selected
                    ? const [
                      BoxShadow(
                        color: Color(0x1F000000),
                        offset: Offset(0, 1),
                        blurRadius: 3,
                      ),
                    ]
                    : null,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: PqText.text(
              14,
              selected ? FontWeight.w700 : FontWeight.w500,
              c: selected ? pq.text : pq.textMuted,
            ),
            child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }
}

/// Шапка нижнего листа: заголовок Onest 22/700 + подпись 14 · «Закрыть» 44.
class ProfileSheetHeader extends StatelessWidget {
  const ProfileSheetHeader({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                header: true,
                child: Text(
                  title,
                  style: PqText.heading(22, FontWeight.w700, c: pq.text),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(subtitle!, style: PqText.body(c: pq.textMuted)),
              ],
            ],
          ),
        ),
        const SizedBox(width: 12),
        PqIconButton(
          icon: PqIcons.x,
          iconSize: 18,
          label: context.l10n.profileClose,
          background: pq.surfaceAlt,
          onTap: () => Navigator.of(context).maybePop(),
        ),
      ],
    );
  }
}

/// Кружок с пунктирной рамкой (шаг «Активация администратором»).
class ProfileDashedCircle extends StatelessWidget {
  const ProfileDashedCircle({
    super.key,
    required this.size,
    required this.color,
    this.child,
  });

  final double size;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _DashedCirclePainter(color),
    child: SizedBox.square(dimension: size, child: Center(child: child)),
  );
}

class _DashedCirclePainter extends CustomPainter {
  _DashedCirclePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 2.0;
    final r = size.width / 2 - stroke / 2;
    final p =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke;
    const dashes = 12;
    const sweep = 2 * math.pi / dashes;
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: r);
    for (var i = 0; i < dashes; i++) {
      canvas.drawArc(rect, i * sweep, sweep * .55, false, p);
    }
  }

  @override
  bool shouldRepaint(_DashedCirclePainter old) => old.color != color;
}

/// «Назад»: по стеку, а если экран открыт ссылкой — на [fallback].
void profileGoBack(BuildContext context, [String fallback = '/app/profile']) {
  final router = GoRouter.of(context);
  if (router.canPop()) {
    router.pop();
  } else {
    router.go(fallback);
  }
}

/// Жёлтая плашка-предупреждение (Privacy/PrivacyFull): поля 14/16, радиус 18,
/// иконка 20, текст 14/600, интерлиньяж 1.5.
class ProfileWarnBanner extends StatelessWidget {
  const ProfileWarnBanner(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: pq.warningSoft,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PqIcon(PqIcons.alertCircle, size: 20, color: pq.warning),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: PqText.text(
                14,
                FontWeight.w600,
                height: 1.5,
                c: pq.warning,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

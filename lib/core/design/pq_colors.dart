import 'package:flutter/material.dart';

/// Цветовые токены редизайна PharmIQ Academy 1.2.
///
/// Значения перенесены 1:1 из макетов «Экраны приложения» (тёмная тема —
/// файлы `*.dc.html`, светлая — `*Light.dc.html`). Подключены в тему как
/// [ThemeExtension], в экранах берутся через `context.pq`.
@immutable
class PqColors extends ThemeExtension<PqColors> {
  const PqColors({
    required this.brightness,
    required this.bg,
    required this.surface,
    required this.surfaceAlt,
    required this.fieldBg,
    required this.fieldDisabledBg,
    required this.border,
    required this.divider,
    required this.borderStrong,
    required this.text,
    required this.textSecondary,
    required this.textMuted,
    required this.textFaint,
    required this.accent,
    required this.accentPressed,
    required this.onAccent,
    required this.accentText,
    required this.accentSoft,
    required this.accentShadow,
    required this.success,
    required this.successSoft,
    required this.warning,
    required this.warningSoft,
    required this.danger,
    required this.dangerSoft,
    required this.info,
    required this.infoSoft,
    required this.segmentActive,
    required this.chipActiveBg,
    required this.chipActiveText,
    required this.toggleOff,
    required this.iconButtonBg,
    required this.iconButtonBorder,
    required this.navBg,
    required this.navBorder,
    required this.navPill,
    required this.navPillIcon,
    required this.navActiveLabel,
    required this.navInactive,
    required this.glow,
    required this.driftPurple,
    required this.driftTeal,
    required this.walletGradient,
    required this.walletText,
    required this.walletMuted,
    required this.walletLine,
    required this.walletPillBg,
    required this.walletPillBorder,
    required this.walletBorder,
    required this.walletShadow,
    required this.skeletonBase,
    required this.skeletonHighlight,
    required this.scrim,
    required this.sheetBg,
    required this.sheetHandle,
    required this.cardShadow,
    required this.toastShadow,
    required this.archiveGradient,
  });

  final Brightness brightness;
  bool get isDark => brightness == Brightness.dark;

  /// Фон экрана.
  final Color bg;

  /// Карточки, строки списков, bottom sheet.
  final Color surface;

  /// Плитки иконок, вторичные заливки, «пустые» кружки.
  final Color surfaceAlt;

  /// Поля ввода.
  final Color fieldBg;
  final Color fieldDisabledBg;

  /// Рамка карточек и полей.
  final Color border;

  /// Разделитель строк внутри карточки.
  final Color divider;

  /// Контрастная рамка: радио/флажок/выключатель, пунктир.
  final Color borderStrong;

  final Color text;
  final Color textSecondary;
  final Color textMuted;
  final Color textFaint;

  final Color accent;
  final Color accentPressed;
  final Color onAccent;

  /// Акцентный текст на мягкой заливке (ссылки, «+144 IQC», номер секции).
  final Color accentText;

  /// Мягкая акцентная заливка (плитки иконок, выбранный вариант).
  final Color accentSoft;
  final Color accentShadow;

  final Color success;
  final Color successSoft;
  final Color warning;
  final Color warningSoft;
  final Color danger;
  final Color dangerSoft;

  /// «Начислено» — голубой статус.
  final Color info;
  final Color infoSoft;

  final Color segmentActive;
  final Color chipActiveBg;
  final Color chipActiveText;
  final Color toggleOff;

  /// Круглые кнопки в шапке (назад, колокольчик).
  final Color iconButtonBg;
  final Color? iconButtonBorder;

  final Color navBg;
  final Color navBorder;
  final Color navPill;
  final Color navPillIcon;
  final Color navActiveLabel;
  final Color navInactive;

  /// Радиальное свечение в левом верхнем углу каждого экрана.
  final Color glow;

  /// Плавающие пятна на экранах входа (pqDrift).
  final Color driftPurple;
  final Color driftTeal;

  final List<Color> walletGradient;
  final Color walletText;
  final Color walletMuted;
  final Color walletLine;
  final Color walletPillBg;
  final Color walletPillBorder;
  final Color walletBorder;
  final Color walletShadow;

  final Color skeletonBase;
  final Color skeletonHighlight;

  /// Затемнение под нижним листом: 0.6 / 0.4 (у части макетов своё — см. showPqSheet).
  final Color scrim;
  final Color sheetBg;
  final Color sheetHandle;

  /// Тень карточек (в тёмной теме её нет).
  final List<BoxShadow> cardShadow;
  final List<BoxShadow> toastShadow;

  final List<Color> archiveGradient;

  // Цвета, одинаковые в обеих темах.
  static const reward = Color(0xFF7C3AED);
  static const voucher = Color(0xFFFDE047);
  static const onVoucher = Color(0xFF111827);
  static const badge = Color(0xFFEF4444);
  static const questBorder = Color(0xFFA855F7);
  static const questProgress = Color(0xFFC084FC);

  static const dark = PqColors(
    brightness: Brightness.dark,
    bg: Color(0xFF0F0F14),
    surface: Color(0xFF1A1B23),
    surfaceAlt: Color(0xFF22232B),
    fieldBg: Color(0xFF22232B),
    fieldDisabledBg: Color(0xFF22232B),
    border: Color(0xFF2E2F3A),
    divider: Color(0xFF2A2B35),
    borderStrong: Color(0xFF3A3B48),
    text: Color(0xFFE4E2ED),
    textSecondary: Color(0xFFC7C9D9),
    textMuted: Color(0xFF8F909A),
    textFaint: Color(0xFF5D5F70),
    accent: Color(0xFF6B9EF5),
    accentPressed: Color(0xFF4F86E8),
    onAccent: Color(0xFF0F0F14),
    accentText: Color(0xFF8FB5F8),
    accentSoft: Color(0xFF1A3566),
    accentShadow: Color(0x996B9EF5),
    success: Color(0xFF79D384),
    successSoft: Color(0xFF173F20),
    warning: Color(0xFFFCD34D),
    warningSoft: Color(0xFF3A2E0E),
    danger: Color(0xFFFF9B8F),
    dangerSoft: Color(0xFF3A1620),
    info: Color(0xFF8FB5F8),
    infoSoft: Color(0xFF1A3566),
    segmentActive: Color(0xFF2E2F3A),
    chipActiveBg: Color(0xFFE4E2ED),
    chipActiveText: Color(0xFF0F0F14),
    toggleOff: Color(0xFF3A3B48),
    iconButtonBg: Color(0x14FFFFFF),
    iconButtonBorder: null,
    navBg: Color(0xF01B1C22),
    navBorder: Color(0xFF2A2B35),
    navPill: Color(0xFF1A3566),
    navPillIcon: Color(0xFF6B9EF5),
    navActiveLabel: Color(0xFFE4E2ED),
    navInactive: Color(0xFF8F909A),
    glow: Color(0x662A4B8A),
    driftPurple: Color(0x597C3AED),
    driftTeal: Color(0x3814B8A6),
    walletGradient: [Color(0xFF1A3566), Color(0xFF2A4B8A)],
    walletText: Color(0xFFD6E3FF),
    walletMuted: Color(0xB8D6E3FF),
    walletLine: Color(0x24D6E3FF),
    walletPillBg: Color(0x14FFFFFF),
    walletPillBorder: Color(0x24FFFFFF),
    walletBorder: Color(0x1FD6E3FF),
    walletShadow: Color(0xCC1A3566),
    skeletonBase: Color(0xFF1D1E27),
    skeletonHighlight: Color(0xFF2B2C38),
    scrim: Color(0x9905060A),
    sheetBg: Color(0xFF1A1B23),
    sheetHandle: Color(0xFF3A3B48),
    cardShadow: [],
    toastShadow: [
      BoxShadow(
          color: Color(0xBF000000),
          offset: Offset(0, 18),
          blurRadius: 36,
          spreadRadius: -14),
    ],
    archiveGradient: [Color(0xFF5B5F6B), Color(0xFF3F434D)],
  );

  static const light = PqColors(
    brightness: Brightness.light,
    bg: Color(0xFFF5F6FA),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFE9EBF0),
    fieldBg: Color(0xFFE9EBF0),
    fieldDisabledBg: Color(0xFFEEF0F4),
    border: Color(0xFFEBEDF0),
    divider: Color(0xFFF0F2F5),
    borderStrong: Color(0xFFD9DDE3),
    text: Color(0xFF1A1D26),
    textSecondary: Color(0xFF374151),
    textMuted: Color(0xFF5F6673),
    textFaint: Color(0xFF7C828E),
    accent: Color(0xFF2563EB),
    accentPressed: Color(0xFF1D4ED8),
    onAccent: Color(0xFFFFFFFF),
    accentText: Color(0xFF1D4ED8),
    accentSoft: Color(0xFFDBEAFE),
    accentShadow: Color(0x992563EB),
    success: Color(0xFF047857),
    successSoft: Color(0xFFD1FAE5),
    warning: Color(0xFFB45309),
    warningSoft: Color(0xFFFEF3C7),
    danger: Color(0xFFB91C1C),
    dangerSoft: Color(0xFFFEE2E2),
    info: Color(0xFF1D4ED8),
    infoSoft: Color(0xFFDBEAFE),
    segmentActive: Color(0xFFFFFFFF),
    chipActiveBg: Color(0xFF1A1D26),
    chipActiveText: Color(0xFFFFFFFF),
    toggleOff: Color(0xFFD9DDE3),
    iconButtonBg: Color(0xFFFFFFFF),
    iconButtonBorder: Color(0xFFE8EBF0),
    navBg: Color(0xFFFFFFFF),
    navBorder: Color(0xFFE5E8EB),
    navPill: Color(0xFF2563EB),
    navPillIcon: Color(0xFFFFFFFF),
    navActiveLabel: Color(0xFF2563EB),
    navInactive: Color(0xFF5F6673),
    glow: Color(0x242563EB),
    driftPurple: Color(0x247C3AED),
    driftTeal: Color(0x1A2563EB),
    walletGradient: [Color(0xFF2563EB), Color(0xFF7C3AED)],
    walletText: Color(0xFFFFFFFF),
    walletMuted: Color(0xD9FFFFFF),
    walletLine: Color(0x47FFFFFF),
    walletPillBg: Color(0x33FFFFFF),
    walletPillBorder: Color(0x66FFFFFF),
    walletBorder: Color(0x00000000),
    walletShadow: Color(0x662563EB),
    skeletonBase: Color(0xFFE6E8EE),
    skeletonHighlight: Color(0xFFF4F5F8),
    scrim: Color(0x6605060A),
    sheetBg: Color(0xFFFFFFFF),
    sheetHandle: Color(0xFFD9DDE3),
    cardShadow: [
      BoxShadow(
          color: Color(0x1A111827),
          offset: Offset(0, 4),
          blurRadius: 12,
          spreadRadius: -6),
    ],
    toastShadow: [
      BoxShadow(
          color: Color(0x38111827),
          offset: Offset(0, 16),
          blurRadius: 32,
          spreadRadius: -12),
    ],
    archiveGradient: [Color(0xFF5F6673), Color(0xFF4B5563)],
  );

  /// Тон статуса (чек, рецепт, квест): мягкий фон + цвет текста/иконки.
  ({Color bg, Color fg}) tone(PqTone t) => switch (t) {
        PqTone.accent => (bg: accentSoft, fg: accentText),
        PqTone.success => (bg: successSoft, fg: success),
        PqTone.warning => (bg: warningSoft, fg: warning),
        PqTone.danger => (bg: dangerSoft, fg: danger),
        PqTone.info => (bg: infoSoft, fg: info),
        PqTone.neutral => (bg: surfaceAlt, fg: textSecondary),
      };

  @override
  PqColors copyWith() => this;

  @override
  PqColors lerp(covariant PqColors? other, double t) =>
      t < 0.5 ? this : (other ?? this);
}

/// Смысловой тон: «один цвет — одно значение во всём приложении».
/// На проверке — warning, одобрен — success, начислено — info, отклонён — danger.
enum PqTone { accent, success, warning, danger, info, neutral }

extension PqColorsContext on BuildContext {
  /// Токены редизайна для текущей темы.
  PqColors get pq =>
      Theme.of(this).extension<PqColors>() ??
      (Theme.of(this).brightness == Brightness.dark
          ? PqColors.dark
          : PqColors.light);
}

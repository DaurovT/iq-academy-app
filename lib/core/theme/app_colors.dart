import 'package:flutter/material.dart';

/// Палитра PharmIQ — перенесена из макетов Figma «pharmiq-home-md3»
/// (тёмная) и «pharmiq-home-md3-light» (светлая). Разрешается по яркости
/// темы через [PharmPalette.of], используется и в теме, и в экранах для
/// точного соответствия дизайну.
class PharmPalette {
  const PharmPalette({
    required this.bg,
    required this.textPrimary,
    required this.textMuted,
    required this.accent,
    required this.card,
    required this.cardBorder,
    required this.walletGradient,
    required this.walletText,
    required this.walletPillBg,
    required this.walletPillBorder,
    required this.quickBg,
    required this.quickBorder,
    required this.quickIconBg,
    required this.chipNeutralBg,
    required this.chipNeutralText,
    required this.receiptIconBg,
    required this.approvedChipBg,
    required this.approvedText,
    required this.rejectedChipBg,
    required this.rejectedText,
    required this.progressTrack,
    required this.softBorder,
    required this.newsCardBg,
    required this.surveyGradient,
    required this.surveyBorder,
    required this.surveyBadgeBg,
    required this.surveyBadgeText,
    required this.pollSelectBg,
    required this.pollSelectBorder,
    required this.inputHint,
    required this.inputText,
    required this.submitGradient,
    required this.submitText,
    required this.miniIconBg,
    required this.navBg,
    required this.navPill,
    required this.navActiveIcon,
    required this.navActiveLabel,
    required this.navInactive,
  });

  final Color bg;
  final Color textPrimary;
  final Color textMuted;
  final Color accent;
  final Color card;
  final Color cardBorder;
  final List<Color> walletGradient;
  final Color walletText;
  final Color walletPillBg;
  final Color walletPillBorder;
  final Color quickBg;
  final Color quickBorder;
  final Color quickIconBg;
  final Color chipNeutralBg;
  final Color chipNeutralText;
  final Color receiptIconBg;
  final Color approvedChipBg;
  final Color approvedText;
  final Color rejectedChipBg;
  final Color rejectedText;
  final Color progressTrack;

  /// Тонкая рамка карточек новостей / опроса / мини-приложений.
  final Color softBorder;
  final Color newsCardBg;
  final List<Color> surveyGradient;
  final Color surveyBorder;
  final Color surveyBadgeBg;
  final Color surveyBadgeText;
  final Color pollSelectBg;
  final Color pollSelectBorder;
  final Color inputHint;
  final Color inputText;
  final List<Color> submitGradient;
  final Color submitText;
  final Color miniIconBg;

  final Color navBg;
  final Color navPill;
  final Color navActiveIcon;
  final Color navActiveLabel;
  final Color navInactive;

  static PharmPalette of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? dark : light;

  static const dark = PharmPalette(
    bg: Color(0xFF0F0F14),
    textPrimary: Color(0xFFE4E2ED),
    textMuted: Color(0xFF8F909A),
    accent: Color(0xFF6B9EF5),
    card: Color(0xFF22232B),
    cardBorder: Color(0xFF46474E),
    walletGradient: [Color(0xFF1A3566), Color(0xFF2A4B8A)],
    walletText: Color(0xFFD6E3FF),
    walletPillBg: Color(0x14FFFFFF), // white 8%
    walletPillBorder: Color(0x1FFFFFFF), // white 12%
    quickBg: Color(0xFF2D2E38),
    quickBorder: Color(0xFF46474E),
    quickIconBg: Color(0xFF6B9EF5),
    chipNeutralBg: Color(0xFF3D4758),
    chipNeutralText: Color(0xFFD6E3FF),
    receiptIconBg: Color(0xFF2D2E38),
    approvedChipBg: Color(0xFF14421E),
    approvedText: Color(0xFF79D384),
    rejectedChipBg: Color(0xFF5C1A28),
    rejectedText: Color(0xFFFFDAD6),
    progressTrack: Color(0xFF2D2E38),
    softBorder: Color(0xFF2E2F3A),
    newsCardBg: Color(0xFF1A1B23),
    surveyGradient: [Color(0xFF1A0B2E), Color(0xFF1E1B4B), Color(0xFF0D1B3E)],
    surveyBorder: Color(0x33A855F7), // purple 20%
    surveyBadgeBg: Color(0xFF14421E),
    surveyBadgeText: Color(0xFF79D384),
    pollSelectBg: Color(0xFFFFFFFF),
    pollSelectBorder: Color(0x00000000),
    inputHint: Color(0xFF8F909A),
    inputText: Color(0xFF0F0F14),
    submitGradient: [Color(0xFF6B9EF5), Color(0xFF6B9EF5)],
    submitText: Color(0xFF0F0F14),
    miniIconBg: Color(0xFF1A3566),
    navBg: Color(0xFF22232B),
    navPill: Color(0xFF1A3566),
    navActiveIcon: Color(0xFF6B9EF5),
    navActiveLabel: Color(0xFFE4E2ED),
    navInactive: Color(0xFF8F909A),
  );

  static const light = PharmPalette(
    bg: Color(0xFFF5F6FA),
    textPrimary: Color(0xFF1A1D26),
    textMuted: Color(0xFF6B7280),
    accent: Color(0xFF2563EB),
    card: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFEBEDF0),
    walletGradient: [Color(0xFF2563EB), Color(0xFF7C3AED)],
    walletText: Color(0xFFFFFFFF),
    walletPillBg: Color(0x33FFFFFF), // white 20%
    walletPillBorder: Color(0x66FFFFFF), // white 40%
    quickBg: Color(0xFFEEF2FF),
    quickBorder: Color(0xFFD4DAFB),
    quickIconBg: Color(0xFF2563EB),
    chipNeutralBg: Color(0xFF3D4758),
    chipNeutralText: Color(0xFFFFFFFF),
    receiptIconBg: Color(0xFFF2F5F7),
    approvedChipBg: Color(0xFF10B981),
    approvedText: Color(0xFFFFFFFF),
    rejectedChipBg: Color(0xFFEF4444),
    rejectedText: Color(0xFFFFFFFF),
    progressTrack: Color(0xFFE8EBF0),
    softBorder: Color(0xFFEBEDF0),
    newsCardBg: Color(0xFFFFFFFF),
    surveyGradient: [Color(0xFFFFFFFF), Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
    surveyBorder: Color(0xFFE5E7EB),
    surveyBadgeBg: Color(0xFFDCFCE7),
    surveyBadgeText: Color(0xFF166534),
    pollSelectBg: Color(0xFFF9FAFB),
    pollSelectBorder: Color(0xFFE5E7EB),
    inputHint: Color(0xFF6B7280),
    inputText: Color(0xFF111827),
    submitGradient: [Color(0xFF3B82F6), Color(0xFF3B82F6)],
    submitText: Color(0xFFFFFFFF),
    miniIconBg: Color(0xFFDFE7F4),
    navBg: Color(0xFFFFFFFF),
    navPill: Color(0xFF2563EB),
    navActiveIcon: Color(0xFFFFFFFF),
    navActiveLabel: Color(0xFF2563EB),
    navInactive: Color(0xFF9CA3AF),
  );
}

import 'package:flutter/material.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/common.dart';

/// Пункт навигации. `tab: true` — попадает в нижнюю навигацию (макс. 4,
/// пятая ячейка — профиль). Полный список — для бокового меню/десктопа.
class NavItem {
  const NavItem({
    required this.path,
    required this.label,
    required this.icon,
    this.iconAsset,
    this.tab = false,
    this.module,
  });

  final String path;
  final String label;
  final IconData icon;

  /// Необязательный SVG-значок из макета (перекрашивается под тему).
  /// Если задан — используется вместо [icon] в нижней навигации.
  final String? iconAsset;
  final bool tab;

  /// Ключ модуля: раздел можно спрятать из админки (см. core/app_modules.dart).
  final String? module;
}

/// Навигация по ролям — зеркало NAV из web/AppShell.tsx.
/// Функция (а не const-структура), потому что подписи берутся из локализации.
Map<Role, List<NavItem>> navConfig(AppLocalizations l10n) => {
      Role.pharmacist: [
        NavItem(path: '/app', label: l10n.navHome, icon: Icons.home_outlined, iconAsset: 'assets/nav/home.svg', tab: true),
        NavItem(path: '/app/checks', label: l10n.navChecks, icon: Icons.receipt_long_outlined, iconAsset: 'assets/nav/checks.svg', tab: true, module: 'checks'),
        NavItem(path: '/app/quests', label: l10n.navQuests, icon: Icons.flag_outlined, iconAsset: 'assets/nav/quests.svg', tab: true, module: 'quests'),
        NavItem(path: '/app/learn', label: l10n.navLearn, icon: Icons.school_outlined, iconAsset: 'assets/nav/learn.svg', tab: true, module: 'learn'),
        NavItem(path: '/app/wallet', label: l10n.navWallet, icon: Icons.account_balance_wallet_outlined, module: 'wallet'),
      ],
      Role.doctor: [
        NavItem(path: '/app', label: l10n.navHome, icon: Icons.home_outlined, tab: true),
        NavItem(path: '/app/recipes', label: l10n.navRecipes, icon: Icons.description_outlined, tab: true, module: 'recipes'),
        NavItem(path: '/app/quests', label: l10n.navQuests, icon: Icons.flag_outlined, tab: true, module: 'quests'),
        NavItem(path: '/app/learn', label: l10n.navLearn, icon: Icons.school_outlined, tab: true, module: 'learn'),
        NavItem(path: '/app/wallet', label: l10n.navWallet, icon: Icons.account_balance_wallet_outlined, module: 'wallet'),
      ],
      Role.medrep: [
        NavItem(path: '/app', label: l10n.navPortfolio, icon: Icons.insights_outlined, tab: true),
        NavItem(path: '/app/portfolio', label: l10n.navPharm, icon: Icons.people_alt_outlined, tab: true, module: 'medrep_portfolio'),
        NavItem(path: '/app/medrep/quests', label: l10n.navQuests, icon: Icons.flag_outlined, tab: true, module: 'medrep_quests'),
        NavItem(path: '/app/leaderboard', label: l10n.navTop, icon: Icons.emoji_events_outlined, tab: true, module: 'leaderboard'),
        // Не таб: нижняя панель уже занята (макс. 4). Вход — с главной и из меню.
        NavItem(path: '/app/doctors', label: l10n.navDoctors, icon: Icons.medical_services_outlined, module: 'medrep_doctors'),
      ],
      Role.productOwner: [
        NavItem(path: '/app', label: l10n.navDashboard, icon: Icons.insights_outlined, tab: true),
        NavItem(path: '/app/brand/quests', label: l10n.navQuests, icon: Icons.flag_outlined, tab: true, module: 'brand'),
        NavItem(path: '/app/brand/products', label: l10n.navProducts, icon: Icons.medication_outlined, tab: true, module: 'brand'),
        NavItem(path: '/app/brand/brands', label: l10n.navBrands, icon: Icons.sell_outlined, tab: true, module: 'brand'),
      ],
    };

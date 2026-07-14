import 'package:flutter/material.dart';
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
  });

  final String path;
  final String label;
  final IconData icon;

  /// Необязательный SVG-значок из макета (перекрашивается под тему).
  /// Если задан — используется вместо [icon] в нижней навигации.
  final String? iconAsset;
  final bool tab;
}

/// Навигация по ролям — зеркало NAV из web/AppShell.tsx.
const Map<Role, List<NavItem>> kRoleNav = {
  Role.pharmacist: [
    NavItem(path: '/app', label: 'Главная', icon: Icons.home_outlined, iconAsset: 'assets/nav/home.svg', tab: true),
    NavItem(path: '/app/checks', label: 'Чеки', icon: Icons.receipt_long_outlined, iconAsset: 'assets/nav/checks.svg', tab: true),
    NavItem(path: '/app/quests', label: 'Квесты', icon: Icons.flag_outlined, iconAsset: 'assets/nav/quests.svg', tab: true),
    NavItem(path: '/app/learn', label: 'Обучение', icon: Icons.school_outlined, iconAsset: 'assets/nav/learn.svg', tab: true),
    NavItem(path: '/app/wallet', label: 'Кошелёк', icon: Icons.account_balance_wallet_outlined),
  ],
  Role.doctor: [
    NavItem(path: '/app', label: 'Главная', icon: Icons.home_outlined, tab: true),
    NavItem(path: '/app/recipes', label: 'Рецепты', icon: Icons.description_outlined, tab: true),
    NavItem(path: '/app/quests', label: 'Квесты', icon: Icons.flag_outlined, tab: true),
    NavItem(path: '/app/learn', label: 'Обучение', icon: Icons.school_outlined, tab: true),
    NavItem(path: '/app/wallet', label: 'Кошелёк', icon: Icons.account_balance_wallet_outlined),
  ],
  Role.medrep: [
    NavItem(path: '/app', label: 'Портфель', icon: Icons.insights_outlined, tab: true),
    NavItem(path: '/app/portfolio', label: 'Форм.', icon: Icons.people_alt_outlined, tab: true),
    NavItem(path: '/app/medrep/quests', label: 'Квесты', icon: Icons.flag_outlined, tab: true),
    NavItem(path: '/app/leaderboard', label: 'Топ', icon: Icons.emoji_events_outlined, tab: true),
  ],
  Role.productOwner: [
    NavItem(path: '/app', label: 'Дашборд', icon: Icons.insights_outlined, tab: true),
    NavItem(path: '/app/brand/quests', label: 'Квесты', icon: Icons.flag_outlined, tab: true),
    NavItem(path: '/app/brand/products', label: 'Продукты', icon: Icons.medication_outlined, tab: true),
    NavItem(path: '/app/brand/brands', label: 'Бренды', icon: Icons.sell_outlined, tab: true),
  ],
};

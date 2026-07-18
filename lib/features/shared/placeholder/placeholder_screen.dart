import 'package:flutter/material.dart';
import '../../../core/l10n/l10n.dart';
import '../widgets/home_app_bar.dart';

/// Заглушка раздела, который ещё не собран (роли врача/медпреда/бренда,
/// экраны следующих фаз). Показывает шапку и понятный текст.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    this.home = false,
  });

  final String title;

  /// На главном экране показываем общую шапку (тема/уведомления/роль).
  final bool home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: home
          ? const HomeAppBar()
          : AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.construction_outlined, size: 56),
              const SizedBox(height: 12),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(context.l10n.placeholderComingSoon,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

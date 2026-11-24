import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_modules.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../shared/onboarding/app_version.dart';
import '../shared/onboarding/force_update_screen.dart' show appStoreUrl;

/// Закрытая плашка — до следующего запуска приложения.
final _dismissed = ValueNotifier<String?>(null);

/// «Доступна новая версия X · Обновить» над нижним меню, если в админке
/// указана версия новее установленной (docs/SERVER_TASKS.md, задача 9).
class UpdateBanner extends ConsumerWidget {
  const UpdateBanner({super.key, this.currentVersion = kAppVersion});

  /// Установленная версия (для снимков — подставная).
  final String currentVersion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appModulesProvider).asData?.value;
    if (cfg == null || !hasNewerVersion(cfg, currentVersion)) {
      return const SizedBox.shrink();
    }
    final latest = cfg.latestVersion!;
    return ValueListenableBuilder<String?>(
      valueListenable: _dismissed,
      builder: (context, dismissed, _) {
        if (dismissed == latest) return const SizedBox.shrink();
        final pq = context.pq;
        final l = context.l10n;
        return PqAnimate(
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 8, 6, 8),
            decoration: BoxDecoration(
              color: pq.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: pq.accent),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  offset: Offset(0, 6),
                  blurRadius: 18,
                  spreadRadius: -6,
                ),
              ],
            ),
            child: Row(children: [
              PqIcon(PqIcons.sparkles, size: 18, color: pq.accentText),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l.updateAvailable(latest),
                  maxLines: 2,
                  style: PqText.text(14, FontWeight.w600, c: pq.text),
                ),
              ),
              const SizedBox(width: 8),
              PqPressable(
                onTap: () => launchUrl(
                  Uri.parse(appStoreUrl()),
                  mode: LaunchMode.externalApplication,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: pq.accent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(l.updateAction,
                      style: PqText.text(14, FontWeight.w700, c: pq.onAccent)),
                ),
              ),
              PqPressable(
                onTap: () => _dismissed.value = latest,
                semanticLabel: l.walletClose,
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: PqIcon(PqIcons.x, size: 18, color: pq.textMuted),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/legal.dart';
import '../login/auth_ui.dart';
import 'app_version.dart';

/// Ссылка на приложение в сторе. Android — по applicationId; для iOS нужен
/// числовой id из App Store Connect: `--dart-define=APP_STORE_URL=…`
/// (без него откроется сайт).
const _appStoreUrl = String.fromEnvironment('APP_STORE_URL');
const _playStoreUrl = 'https://play.google.com/store/apps/details?id=uz.iqacademy.platform_app';

String _storeUrl() {
  if (_appStoreUrl.isNotEmpty) return _appStoreUrl;
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) return _playStoreUrl;
  return kSiteBaseUrl;
}

/// Принудительное обновление (макет ForceUpdate), маршрут
/// `/force-update?min=1.3`. Назад уйти нельзя.
class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key, this.minVersion, this.currentVersion = kAppVersion});

  /// Минимальная поддерживаемая версия (для подписи внизу).
  final String? minVersion;

  /// Текущая версия приложения (по умолчанию — из `APP_VERSION`).
  final String currentVersion;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final min = minVersion?.trim() ?? '';
    final caption =
        min.isEmpty
            ? null
            : currentVersion.isEmpty
            ? l10n.authUpdateRequired(min)
            : l10n.authUpdateVersions(currentVersion, min);

    return PopScope(
      canPop: false,
      child: AuthScreen(
        child: AuthFlow(
          padding: const EdgeInsets.fromLTRB(24, 150, 24, 32),
          gap: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthSelfAnimated(
              child: PqAnimate(
                fx: PqFx.pop,
                child: PqBob(
                  duration: const Duration(milliseconds: 3200),
                  delay: const Duration(milliseconds: 600),
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: pq.accentSoft,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    alignment: Alignment.center,
                    child: PqIcon(PqIcons.rocket, size: 44, color: pq.accentText),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                l10n.authUpdateTitle,
                textAlign: TextAlign.center,
                style: PqText.heading(24, FontWeight.w700, height: 1.2, c: pq.text),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Text(
                l10n.authUpdateBody,
                textAlign: TextAlign.center,
                style: PqText.bodyLarge(c: pq.textMuted),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  PqButton(
                    label: l10n.authUpdateButton,
                    icon: PqIcons.download,
                    onPressed:
                        () =>
                            launchUrl(Uri.parse(_storeUrl()), mode: LaunchMode.externalApplication),
                  ),
                  if (caption != null) ...[
                    const SizedBox(height: 14),
                    Text(
                      caption,
                      textAlign: TextAlign.center,
                      style: PqText.caption(c: pq.textMuted),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

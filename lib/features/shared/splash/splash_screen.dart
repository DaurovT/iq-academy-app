import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../login/auth_ui.dart';
import '../onboarding/app_version.dart';

/// Заставка (макет Splash) — показывается, пока проверяется сессия:
/// логотип с pqLogo .9s, внизу — полоса загрузки pqLoad и версия.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, this.version = kAppVersion});

  /// Версия под полосой загрузки (пусто — строка остаётся, но без текста,
  /// чтобы полоса стояла на месте, как в макете).
  final String version;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return AuthScreen(
      safeBottom: false,
      child: Stack(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: PqAnimate(
                fx: PqFx.logo,
                child: FittedBox(fit: BoxFit.scaleDown, child: AuthBrand(large: true)),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 64,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Semantics(
                  label: l10n.authLoading,
                  child: PqLoadBar(
                    color: pq.accent,
                    trackColor: pq.isDark ? pq.border : const Color(0xFFE5E7EB),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  version.isEmpty ? '' : l10n.authVersion(version),
                  style: PqText.caption(c: pq.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

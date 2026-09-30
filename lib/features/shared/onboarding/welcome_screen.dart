import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/providers.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/locale_controller.dart';
import '../login/auth_ui.dart';

/// Показан ли уже экран приветствия. Признак первого запуска — язык
/// интерфейса ещё ни разу не сохранялся (выбор на Welcome его сохраняет).
class WelcomeGate extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    try {
      return await ref.read(tokenStoreProvider).readLocale() != null;
    } catch (_) {
      return true; // хранилище недоступно — не мешаем входу
    }
  }

  void markSeen() => state = const AsyncData(true);
}

final welcomeSeenProvider = AsyncNotifierProvider<WelcomeGate, bool>(WelcomeGate.new);

/// Приветствие и выбор языка при первом запуске (макет Welcome).
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  void _continue(BuildContext context, WidgetRef ref, String path) {
    // Сохраняем язык явно — даже если оставили предложенный.
    ref.read(localeProvider.notifier).set(ref.read(localeProvider));
    ref.read(welcomeSeenProvider.notifier).markSeen();
    context.go(path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l10n = context.l10n;
    final current = ref.watch(localeProvider).languageCode;
    return AuthScreen(
      child: AuthFlow(
        children: [
          const AuthHeader(language: false),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.authWelcomeTitle,
                  style: PqText.heading(36, FontWeight.w700, height: 1.1, ls: -0.5, c: pq.text),
                ),
                const SizedBox(height: 12),
                Text(l10n.authWelcomeSubtitle, style: PqText.bodyLarge(c: pq.textMuted)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Semantics(
              label: l10n.authAppLanguage,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.authAppLanguage, style: PqText.link(c: pq.textSecondary)),
                  for (final l in supportedAppLocales) ...[
                    const SizedBox(height: 10),
                    AuthLanguageOption(
                      label: authLanguageName(l.languageCode),
                      selected: l.languageCode == current,
                      onTap: () => ref.read(localeProvider.notifier).set(l),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const AuthPush(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PqButton(
                label: l10n.authStart,
                onPressed: () => _continue(context, ref, '/register'),
              ),
              const SizedBox(height: 16),
              AuthTextLink(
                text: l10n.authHaveAccount,
                link: l10n.loginEnter,
                onTap: () => _continue(context, ref, '/login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

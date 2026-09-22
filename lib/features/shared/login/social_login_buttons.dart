import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/social_sign_in.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/oauth.dart';

/// Кнопки «Войти через Google / Apple» — идут под кнопкой Telegram. Показываются только там, где вход
/// реально настроен: Apple — на iOS, Google — при заданных client ID.
class SocialLoginButtons extends ConsumerStatefulWidget {
  const SocialLoginButtons({super.key});

  @override
  ConsumerState<SocialLoginButtons> createState() => _SocialLoginButtonsState();
}

class _SocialLoginButtonsState extends ConsumerState<SocialLoginButtons> {
  String? _busy; // провайдер, вход через который сейчас идёт

  Future<void> _signIn(String provider) async {
    if (_busy != null) return;
    setState(() => _busy = provider);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final c = provider == 'apple'
          ? await SocialSignIn.apple()
          : await SocialSignIn.google();
      final res = await ref.read(apiProvider).auth.oauth(c.provider, c.idToken,
          nonce: c.nonce,
          authorizationCode: c.authorizationCode,
          fullName: c.fullName);
      if (!mounted) return;
      switch (res) {
        case OAuthDone(:final session):
          // дальше переводит защита роутера — как после входа по SMS
          await ref.read(authControllerProvider.notifier).completeLogin(session);
        case OAuthLinkRequired(:final linkToken, :final fullName):
          context.push(Uri(path: '/oauth-link', queryParameters: {
            'token': linkToken,
            if (fullName != null) 'name': fullName,
          }).toString());
        case OAuthRegisterRequired():
          break; // /auth/oauth так не отвечает — только шаг подтверждения номера
      }
    } on SocialSignInCanceled {
      // пользователь закрыл окно входа
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final apple = SocialSignIn.appleAvailable;
    final google = SocialSignIn.googleAvailable;
    if (!apple && !google) return const SizedBox.shrink();
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (google) ...[
          const SizedBox(height: 12),
          SocialButton(
            label: l10n.loginWithGoogle,
            icon: SvgPicture.string(_googleG, width: 20, height: 20),
            background: Colors.white,
            foreground: _socialDark,
            busy: _busy == 'google',
            onTap: () => _signIn('google'),
          ),
        ],
        if (apple) ...[
          const SizedBox(height: 12),
          SocialButton(
            label: l10n.loginWithApple,
            icon: const Icon(Icons.apple, size: 24, color: Colors.black),
            background: Colors.white,
            foreground: _socialDark,
            busy: _busy == 'apple',
            onTap: () => _signIn('apple'),
          ),
        ],
      ],
    );
  }
}

const _socialDark = Color(0xFF111111);

/// Общая кнопка входа через Apple / Google / Telegram. Размеры и шрифт — как у
/// основной кнопки экрана входа; значок прижат к левому краю на одном отступе,
/// чтобы у всех провайдеров стоять ровно в столбик, а надпись — по центру.
class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
    required this.busy,
    required this.onTap,
  });

  final String label;
  final Widget icon;
  final Color background;
  final Color foreground;
  final bool busy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: busy ? null : onTap,
        child: SizedBox(
          height: 52,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 20,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: busy
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: foreground))
                        : icon,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: Text(label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: foreground)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const _googleG =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">'
    '<path fill="#FFC107" d="M43.611 20.083H42V20H24v8h11.303c-1.649 4.657-6.08 8-11.303 8-6.627 0-12-5.373-12-12s5.373-12 12-12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4 12.955 4 4 12.955 4 24s8.955 20 20 20 20-8.955 20-20c0-1.341-.138-2.65-.389-3.917z"/>'
    '<path fill="#FF3D00" d="M6.306 14.691l6.571 4.819C14.655 15.108 18.961 12 24 12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4 16.318 4 9.656 8.337 6.306 14.691z"/>'
    '<path fill="#4CAF50" d="M24 44c5.166 0 9.86-1.977 13.409-5.192l-6.19-5.238A11.91 11.91 0 0 1 24 36c-5.202 0-9.619-3.317-11.283-7.946l-6.522 5.025C9.505 39.556 16.227 44 24 44z"/>'
    '<path fill="#1976D2" d="M43.611 20.083H42V20H24v8h11.303a12.04 12.04 0 0 1-4.087 5.571l.003-.002 6.19 5.238C36.971 39.205 44 34 44 24c0-1.341-.138-2.65-.389-3.917z"/>'
    '</svg>';

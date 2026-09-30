import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../login/auth_ui.dart';

/// Конфетти макета RegSuccess: 20 деталей (left, размер, цвет, длительность,
/// задержка — как в макете).
const _confettiColors = [
  Color(0xFF6B9EF5),
  Color(0xFFA855F7),
  Color(0xFFFDE047),
  Color(0xFF79D384),
  Color(0xFFF5A031),
];
const _confettiLeft = <double>[
  17,
  58,
  99,
  140,
  181,
  222,
  263,
  304,
  345,
  386,
  31,
  72,
  113,
  154,
  195,
  236,
  277,
  318,
  359,
  4,
];

/// [width] — ширина экрана: позиции из макета (414) масштабируются.
List<PqConfettiPiece> _confetti(double width) => [
  for (var i = 0; i < 20; i++)
    PqConfettiPiece(
      left: _confettiLeft[i] * width / 414,
      color: _confettiColors[i % 5],
      width: 6.0 + (i % 3) * 2,
      height: 10.0 + (i % 4) * 2,
      duration: Duration(milliseconds: 2200 + (i % 5) * 250),
      delay: Duration(milliseconds: (i % 7) * 120),
    ),
];

/// Экран «Регистрация завершена!» (макет RegSuccess): конфетти pqFall,
/// значок успеха pqPop + pqRing ×2, кнопки «Начать обучение» / «На главную».
class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({
    super.key,
    required this.firstName,
    required this.completing,
    required this.onStart,
    required this.onHome,
  });

  final String firstName;
  final bool completing;
  final VoidCallback onStart;
  final VoidCallback onHome;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    return PopScope(
      canPop: false,
      child: AuthScreen(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 600,
              child: ClipRect(
                child: LayoutBuilder(
                  builder: (_, box) => PqConfetti(pieces: _confetti(box.maxWidth)),
                ),
              ),
            ),
            AuthFlow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Column(
                    children: [
                      PqAnimate(
                        fx: PqFx.pop,
                        duration: const Duration(milliseconds: 600),
                        child: PqPulseRing.success(
                          borderRadius: BorderRadius.circular(52),
                          delay: const Duration(milliseconds: 600),
                          repeat: 2,
                          child: Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                              color: pq.successSoft,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: PqIcon(PqIcons.check, size: 48, color: pq.success),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.registerSuccessTitle,
                        textAlign: TextAlign.center,
                        style: PqText.display(c: pq.text),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        firstName.isEmpty ? l10n.authWelcomeTitle : l10n.authRegWelcome(firstName),
                        textAlign: TextAlign.center,
                        style: PqText.bodyLarge(c: pq.textSecondary),
                      ),
                    ],
                  ),
                ),
                const AuthPush(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PqButton(
                      label: l10n.registerStartLearning,
                      icon: PqIcons.bookOpen,
                      loading: completing,
                      onPressed: completing ? null : onStart,
                    ),
                    const SizedBox(height: 8),
                    PqButton(
                      label: l10n.authGoHome,
                      kind: PqButtonKind.text,
                      height: 52,
                      onPressed: completing ? null : onHome,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

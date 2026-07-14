import 'package:flutter/material.dart';
import '../widgets/pharm_academy_logo.dart';

/// Заглавный экран (splash) — показывается, пока проверяется сессия.
/// Перенесён из макета Figma «pharmiq-splash».
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A14),
      body: Stack(
        children: [
          // «полярные» свечения
          Positioned(
            top: -120,
            right: -140,
            child: _Blob(color: const Color(0xFF6D28D9).withValues(alpha: 0.45), size: 460),
          ),
          Positioned(
            top: 300,
            left: -120,
            child: _Blob(color: const Color(0xFF1D4ED8).withValues(alpha: 0.35), size: 420),
          ),
          Positioned(
            bottom: -60,
            left: -80,
            child: _Blob(color: const Color(0xFF7C3AED).withValues(alpha: 0.3), size: 320),
          ),
          // центр — только логотип (Figma 36:5: без карточки и слогана)
          const Center(
            child: PharmAcademyLogo(height: 64),
          ),
          // версия
          Positioned(
            bottom: 24,
            right: 24,
            child: Text(
              'v1.0.0',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

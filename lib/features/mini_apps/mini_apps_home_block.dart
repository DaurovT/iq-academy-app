import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

/// CTA-карточка «Мини-приложения» на главной. Перенесена 1:1 из макета Figma
/// (mini-apps-cta, ноды 180:34 / 181:46): иконка-сетка + подпись + шеврон.
/// Всегда видна и ведёт в список мини-приложений.
class MiniAppsHomeBlock extends StatelessWidget {
  const MiniAppsHomeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    return Material(
      color: p.card,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/app/mini-apps'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: p.softBorder),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: p.miniIconBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.grid_view_rounded, size: 24, color: p.accent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Мини-приложения',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: p.textPrimary,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 20, color: p.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}

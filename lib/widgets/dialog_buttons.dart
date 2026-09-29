import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';

/// Кнопки диалога подтверждения: «Отмена» и основное действие — одной ширины
/// в ряд, чтобы безопасный вариант не терялся рядом с главным.
/// [destructive] — для выхода и необратимых действий: основная кнопка красная.
class DialogButtons extends StatelessWidget {
  const DialogButtons({
    super.key,
    required this.cancelLabel,
    required this.onCancel,
    required this.confirmLabel,
    required this.onConfirm,
    this.destructive = false,
  });

  final String cancelLabel;
  final VoidCallback onCancel;
  final String confirmLabel;
  final VoidCallback? onConfirm;
  final bool destructive;

  /// Второстепенная кнопка диалога — спокойная заливка без акцента.
  static ButtonStyle secondaryStyle(BuildContext context) {
    final p = PharmPalette.of(context);
    return FilledButton.styleFrom(
      minimumSize: kDialogButtonSize,
      backgroundColor: p.neutralFill,
      foregroundColor: p.textPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // IntrinsicHeight + stretch: если подпись перенеслась на вторую строку,
    // обе кнопки остаются одной высоты.
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FilledButton(
              style: secondaryStyle(context),
              onPressed: onCancel,
              child: _label(cancelLabel),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: kDialogButtonSize,
                backgroundColor: destructive ? scheme.error : null,
                foregroundColor: destructive ? scheme.onError : null,
              ),
              onPressed: onConfirm,
              child: _label(confirmLabel),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _label(String text) => Text(text,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600));
}

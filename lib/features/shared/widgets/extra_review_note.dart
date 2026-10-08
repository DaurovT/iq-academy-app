import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';

/// «Ничего делать не нужно» — пояснение к дополнительной проверке
/// (макеты CheckReview / RxReview): фон surfaceAlt, радиус 18, иконка 20.
class CheckExtraReviewNote extends StatelessWidget {
  const CheckExtraReviewNote({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: pq.surfaceAlt,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: PqIcon(
              PqIcons.info,
              size: 20,
              color: pq.tone(PqTone.violet).fg,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.checksExtraNoteTitle,
                  style: PqText.text(15, FontWeight.w700, c: pq.text),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: PqText.text(
                    14,
                    FontWeight.w400,
                    height: 1.45,
                    c: pq.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

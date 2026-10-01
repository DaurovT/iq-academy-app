import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/design/design.dart';
import '../../../core/format.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/wallet.dart';

// ── Форматирование ─────────────────────────────────────────────────────

final _num = NumberFormat.decimalPattern('ru');

/// «1200» → «1 200».
String walletNum(num v) => _num.format(v);

/// Последние 4 символа кода ваучера — «••1008».
String codeTail(String code) {
  final clean = code.replaceAll(RegExp(r'\s'), '');
  return clean.length <= 4 ? clean : clean.substring(clean.length - 4);
}

/// ISO → «15.06».
String walletShortDate(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return DateFormat('dd.MM').format(d.toLocal());
}

/// ISO → «15.06.2026».
String walletDate(String iso) => formatDate(iso);

bool isUsed(IssuedVoucher v) => v.status == 'used';

/// Скопировать код ваучера и показать тост «Код скопирован».
Future<void> copyVoucherCode(BuildContext context, String code) async {
  await Clipboard.setData(ClipboardData(text: code));
  if (context.mounted) {
    showPqToast(context, context.l10n.voucherCodeCopied, icon: PqIcons.copy);
  }
}

// ── Цвета макета (не токены — одинаковые в обеих темах) ────────────────

const kKorzinkaName = 'Korzinka';
const kKorzinkaRed = Color(0xFFE53935);
const kQrInk = Color(0xFF111827);

/// `linear-gradient(160deg, #e53935, #c62828)` — карта Korzinka.
const kVoucherGradient = LinearGradient(
  begin: Alignment(-0.34, -0.94),
  end: Alignment(0.34, 0.94),
  colors: [Color(0xFFE53935), Color(0xFFC62828)],
);

/// 160deg-градиент из произвольной пары цветов (архивные карты).
LinearGradient gradient160(List<Color> colors) => LinearGradient(
  begin: const Alignment(-0.34, -0.94),
  end: const Alignment(0.34, 0.94),
  colors: colors,
);

/// Цвета «корешков» стопки ваучеров: от #b92624 (самый старый) к #e53935.
Color stackBackColor(int index, int backCount) {
  if (backCount <= 1) return const Color(0xFFB92624);
  return Color.lerp(const Color(0xFFB92624), kKorzinkaRed, index / backCount)!;
}

/// Цена ваучера в IQC — фиолетовая (#c4b5fd / #6d28d9).
Color iqcPriceColor(PqColors pq) =>
    pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);

/// Заливка прогресса накопления (#a855f7 / #7c3aed).
Color iqcBarColor(PqColors pq) =>
    pq.isDark ? const Color(0xFFA855F7) : const Color(0xFF7C3AED);

/// Дорожка прогресса и шагов (#2e2f3a / #e5e7eb).
Color walletTrackColor(PqColors pq) =>
    pq.isDark ? pq.border : const Color(0xFFE5E7EB);

const _white75 = Color(0xBFFFFFFF);

/// `line-height: normal` шрифтов: внутри <button> в макетах интерлиньяж не
/// наследуется от body (1.4). Inter — 1.21, Onest — 1.275.
const kInterNormal = 1.21;
const kOnestNormal = 1.275;

// ── Бренд Korzinka: плитка 28 с корзиной + надпись «Korzinka» ──────────

class KorzinkaBrand extends StatelessWidget {
  const KorzinkaBrand({
    super.key,
    this.fontSize = 16,
    this.onest = true,
    this.tile = 28,
    this.tileAlpha = .22,
    this.iconSize = 16,
    this.gap = 8,
    this.tight = false,
  });

  final double fontSize;

  /// Onest (карты) или Inter (мини-карта, лист подтверждения).
  final bool onest;

  /// 0 — иконка корзины без плитки.
  final double tile;
  final double tileAlpha;
  final double iconSize;
  final double gap;

  /// Интерлиньяж `normal` (карта-кнопка).
  final bool tight;

  @override
  Widget build(BuildContext context) {
    final icon = PqIcon(PqIcons.cart, size: iconSize, color: Colors.white);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      if (tile > 0)
        Container(
          width: tile,
          height: tile,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: tileAlpha),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: icon,
        )
      else
        icon,
      SizedBox(width: gap),
      Text(
        kKorzinkaName,
        style: onest
            ? PqText.heading(fontSize, FontWeight.w700,
                ls: .2, height: tight ? kOnestNormal : null, c: Colors.white)
            : PqText.text(fontSize, FontWeight.w700,
                height: tight ? kInterNormal : null, c: Colors.white),
      ),
    ]);
  }
}

/// Подпись капсом на карте (12/600, трекинг .8, белый .75).
class CardOverline extends StatelessWidget {
  const CardOverline(this.text,
      {super.key, this.align = TextAlign.start, this.tight = false});

  final String text;
  final TextAlign align;
  final bool tight;

  @override
  Widget build(BuildContext context) => Text(
        text.toUpperCase(),
        textAlign: align,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: PqText.text(12, FontWeight.w600,
            ls: .8, height: tight ? kInterNormal : null, c: _white75),
      );
}

/// Пара «ПОДПИСЬ / значение» в сетке карты.
class CardField extends StatelessWidget {
  const CardField(this.label, this.value,
      {super.key, this.align = CrossAxisAlignment.start, this.tight = false});

  final String label;
  final String value;
  final CrossAxisAlignment align;
  final bool tight;

  @override
  Widget build(BuildContext context) {
    final ta = switch (align) {
      CrossAxisAlignment.end => TextAlign.end,
      CrossAxisAlignment.center => TextAlign.center,
      _ => TextAlign.start,
    };
    return Column(crossAxisAlignment: align, mainAxisSize: MainAxisSize.min, children: [
      CardOverline(label, align: ta, tight: tight),
      const SizedBox(height: 2),
      Text(
        value,
        textAlign: ta,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: PqText.heading(16, FontWeight.w700,
            height: tight ? kOnestNormal : null, c: Colors.white),
      ),
    ]);
  }
}

/// Бейдж на карте: «АКТИВЕН», «В АРХИВЕ».
class CardBadge extends StatelessWidget {
  const CardBadge(this.text, {super.key, this.alpha = .2, this.tight = false});

  final String text;
  final double alpha;
  final bool tight;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: alpha),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text.toUpperCase(),
          style: PqText.text(12, FontWeight.w700,
              ls: .8, height: tight ? kInterNormal : null, c: Colors.white),
        ),
      );
}

// ── Билет ваучера: красная часть + белый отрывной блок с QR ─────────────

class VoucherTicket extends StatelessWidget {
  const VoucherTicket({
    super.key,
    required this.voucher,
    required this.status,
    this.archived = false,
    this.notchColor,
    this.animateReveal = false,
    this.shortDate = false,
    this.shadow = const [
      BoxShadow(
        color: Color(0x8C000000),
        offset: Offset(0, 24),
        blurRadius: 40,
        spreadRadius: -20,
      ),
    ],
  });

  final IssuedVoucher voucher;

  /// «Активен» / «Использован» / «В архиве».
  final String status;
  final bool archived;

  /// Цвет «вырезов» по краям линии отрыва (фон экрана); null — без них.
  final Color? notchColor;

  /// pqReveal .45s после .18s для блока с QR (открытие из кошелька).
  final bool animateReveal;

  /// «25.06» вместо «25.06.2026» (открытие из кошелька).
  final bool shortDate;
  final List<BoxShadow> shadow;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final used = isUsed(voucher);
    final top = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient:
            archived || used
                ? gradient160(pq.archiveGradient)
                : kVoucherGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const KorzinkaBrand(),
              const Spacer(),
              CardField(
                l.walletStatusLabel,
                status,
                align: CrossAxisAlignment.end,
              ),
            ],
          ),
          const SizedBox(height: 22),
          CardOverline(l.walletGiftCardBoth),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              formatUzs(voucher.amountUzs),
              style: PqText.heading(
                40,
                FontWeight.w800,
                height: 1.05,
                c: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: CardField(
                  l.walletReceived,
                  shortDate
                      ? walletShortDate(voucher.issuedAt)
                      : walletDate(voucher.issuedAt),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CardField(
                  l.walletWhere,
                  kKorzinkaName,
                  align: CrossAxisAlignment.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget bottom = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
          child: Column(
            children: [
              Semantics(
                label: l.walletQrLabel,
                image: true,
                child: ExcludeSemantics(
                  child: Opacity(
                    opacity: used ? .3 : 1,
                    child: QrImageView(
                      data: voucher.code,
                      size: 158,
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: kQrInk,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: kQrInk,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _CodePill(code: voucher.code),
              const SizedBox(height: 12),
              Text(
                l.walletShowQrCashier,
                textAlign: TextAlign.center,
                style: PqText.text(
                  14,
                  FontWeight.w400,
                  c: const Color(0xFF4B5563),
                ),
              ),
            ],
          ),
        ),
        // линия отрыва 2px dashed #e5e7eb
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: DashedLine(
            color: Color(0xFFE5E7EB),
            thickness: 2,
            dash: 6,
            gap: 5,
          ),
        ),
        if (notchColor != null) ...[
          Positioned(left: -12, top: -12, child: _Notch(notchColor!)),
          Positioned(right: -12, top: -12, child: _Notch(notchColor!)),
        ],
      ],
    );
    if (animateReveal) {
      bottom = PqAnimate(
        fx: PqFx.reveal,
        delay: const Duration(milliseconds: 180),
        child: bottom,
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: shadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [top, bottom],
        ),
      ),
    );
  }
}

class _Notch extends StatelessWidget {
  const _Notch(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

/// Код ваучера в капсуле 44 — нажатие копирует.
class _CodePill extends StatelessWidget {
  const _CodePill({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: () => copyVoucherCode(context, code),
      semanticLabel: context.l10n.walletCopyCode,
      scale: .96,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                code,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.heading(17, FontWeight.w700, ls: 1.5, c: kQrInk),
              ),
            ),
            const SizedBox(width: 8),
            PqIcon(
              PqIcons.copy,
              size: 17,
              color:
                  pq.isDark ? const Color(0xFF6B7280) : const Color(0xFF5F6673),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Пунктир ───────────────────────────────────────────────────────────

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    required this.color,
    this.thickness = 1,
    this.dash = 3,
    this.gap = 3,
  });

  final Color color;
  final double thickness;
  final double dash;
  final double gap;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(double.infinity, thickness),
    painter: _DashPainter(color, thickness, dash, gap),
  );
}

class _DashPainter extends CustomPainter {
  _DashPainter(this.color, this.thickness, this.dash, this.gap);

  final Color color;
  final double thickness;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final p =
        Paint()
          ..color = color
          ..strokeWidth = thickness;
    final y = thickness / 2;
    for (double x = 0; x < size.width; x += dash + gap) {
      canvas.drawLine(
        Offset(x, y),
        Offset(math.min(x + dash, size.width), y),
        p,
      );
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) =>
      old.color != color || old.thickness != thickness;
}

/// Пунктирная рамка со скруглением (пустой блок «Все ваучеры в архиве»).
class DashedBorderBox extends StatelessWidget {
  const DashedBorderBox({
    super.key,
    required this.child,
    required this.color,
    this.radius = 20,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final Color color;
  final double radius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _DashedRRectPainter(color, radius),
    child: Padding(padding: padding, child: child),
  );
}

class _DashedRRectPainter extends CustomPainter {
  _DashedRRectPainter(this.color, this.radius);

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            (Offset.zero & size).deflate(.5),
            Radius.circular(radius),
          ),
        );
    for (final m in path.computeMetrics()) {
      for (double d = 0; d < m.length; d += 7) {
        canvas.drawPath(m.extractPath(d, math.min(d + 4, m.length)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRectPainter old) => old.color != color;
}

// ── Заголовок секции кошелька: h2 · растяжка · счётчик · ссылка ─────────

class WalletSectionHead extends StatelessWidget {
  const WalletSectionHead(
    this.title, {
    super.key,
    this.count,
    this.countTone = PqTone.neutral,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final int? count;
  final PqTone countTone;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final t = pq.tone(countTone);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 28),
      child: Row(
        children: [
          Expanded(child: Text(title, style: PqText.section(c: pq.text))),
          if (count != null) ...[
            const SizedBox(width: 8),
            Container(
              constraints: const BoxConstraints(minWidth: 22),
              height: 22,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: t.bg,
                borderRadius: BorderRadius.circular(11),
              ),
              alignment: Alignment.center,
              child: Text('$count', style: PqText.tag(c: t.fg)),
            ),
          ],
          if (actionLabel != null) ...[
            const SizedBox(width: 8),
            PqPressable(
              onTap: onAction,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 44),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(actionLabel!, style: PqText.link(c: pq.accent)),
                      const SizedBox(width: 2),
                      PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Карточка со строками и разделителями ───────────────────────────────

class WalletRowsCard extends StatelessWidget {
  const WalletRowsCard({super.key, required this.children, this.footer});

  final List<Widget> children;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++)
            Container(
              decoration: BoxDecoration(
                border:
                    i < children.length - 1
                        ? Border(bottom: BorderSide(color: pq.divider))
                        : null,
              ),
              child: children[i],
            ),
          if (footer != null) ...[DashedLine(color: pq.borderStrong), footer!],
        ],
      ),
    );
  }
}

/// Строка «ждёт выдачи»: плитка 44 · название квеста · «7 шт. / ваучеров».
class PendingRow extends StatelessWidget {
  const PendingRow({
    super.key,
    required this.accrual,
    this.icon = PqIcons.clock,
    this.amountColor,
    this.titleLines,
  });

  final PendingAccrual accrual;
  final PqIcons icon;

  /// null — цвет текста.
  final Color? amountColor;

  /// Ограничение строк названия (null — без ограничения).
  final int? titleLines;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          PqIconTile(icon, tone: PqTone.warning),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleLines == 1
                    ? OneLineClamp(
                      accrual.questName,
                      style: PqText.rowTitle(c: pq.text),
                    )
                    : Text(
                      accrual.questName,
                      maxLines: titleLines,
                      overflow:
                          titleLines == null ? null : TextOverflow.ellipsis,
                      style: PqText.rowTitle(c: pq.text),
                    ),
                const SizedBox(height: 3),
                Text(
                  l.walletQuestDoneOn(walletDate(accrual.requestedAt)),
                  style: PqText.caption(c: pq.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                l.walletPcs(accrual.count),
                style: PqText.amount(c: amountColor ?? pq.text),
              ),
              const SizedBox(height: 2),
              Text(
                l.walletVouchersCaption(accrual.count),
                style: PqText.caption(c: pq.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Баланс-карта экранов обмена: «ВАШ БАЛАНС · 1 450 IQC · Хватает на 1 ваучер».
class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({super.key, required this.iqc, this.caption});

  final int iqc;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pq.walletGradient,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: pq.walletBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0xCC1A3566),
            offset: Offset(0, 16),
            blurRadius: 32,
            spreadRadius: -16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.walletYourBalance.toUpperCase(),
            style: PqText.overline(c: pq.walletMuted),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                walletNum(iqc),
                style: PqText.heading(
                  40,
                  FontWeight.w800,
                  height: 1.05,
                  c: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'IQC',
                style: PqText.text(16, FontWeight.w700, c: Colors.white),
              ),
            ],
          ),
          if (caption != null) ...[
            const SizedBox(height: 6),
            Text(
              caption!,
              style: PqText.text(14, FontWeight.w400, c: pq.walletMuted),
            ),
          ],
        ],
      ),
    );
  }
}

/// Одна строка с многоточием по границе слова — как `-webkit-line-clamp: 1`:
/// берём слова первой строки переноса и добавляем «…».
class OneLineClamp extends StatelessWidget {
  const OneLineClamp(this.text, {super.key, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) {
      final scaler = MediaQuery.textScalerOf(context);
      final dir = Directionality.of(context);
      TextPainter measure(String s, {int? maxLines}) => TextPainter(
        text: TextSpan(text: s, style: style),
        textDirection: dir,
        textScaler: scaler,
        maxLines: maxLines,
      )..layout(maxWidth: box.maxWidth);
      final full = measure(text);
      var shown = text;
      if (full.computeLineMetrics().length > 1) {
        final end = full.getLineBoundary(const TextPosition(offset: 0)).end;
        var head = text.substring(0, end).trimRight();
        while (head.isNotEmpty &&
            measure('$head…', maxLines: 1).didExceedMaxLines) {
          head = head.substring(0, head.length - 1).trimRight();
        }
        shown = '$head…';
      }
      full.dispose();
      return Text(
        shown,
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: style,
      );
    },
  );
}

/// Мини-карта Korzinka 112×72 с логотипом и номиналом. Номинал ваучера
/// показывается только на самой карточке — не текстом рядом с баллами IQC.
class VoucherMiniCard extends StatelessWidget {
  const VoucherMiniCard({super.key, required this.faceUzs});

  final int faceUzs;

  @override
  Widget build(BuildContext context) => Container(
    width: 112,
    height: 72,
    decoration: BoxDecoration(
      gradient: kVoucherGradient,
      borderRadius: BorderRadius.circular(14),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      children: [
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .12),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const KorzinkaBrand(
                fontSize: 12,
                onest: false,
                tile: 0,
                iconSize: 14,
                gap: 6,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  walletNum(faceUzs),
                  style: PqText.heading(16, FontWeight.w800, c: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

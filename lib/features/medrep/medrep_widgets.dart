import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/design/design.dart';
import '../../core/format.dart';
import '../../core/l10n/l10n.dart';

/// Общие виджеты раздела «Роль медпреда» (редизайн 1.2).

/// «Зиёда Азизова» → «ЗА».
String initialsOf(String name) {
  final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
  final letters = parts.take(2).map((p) => p.characters.first.toUpperCase());
  final s = letters.join();
  return s.isEmpty ? '?' : s;
}

/// Градиенты аватаров из макетов (135°).
const _avatarGradients = <List<Color>>[
  [Color(0xFF3B82F6), Color(0xFF06B6D4)],
  [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
  [Color(0xFF10B981), Color(0xFF06B6D4)],
  [Color(0xFFF59E0B), Color(0xFFEF4444)],
  [Color(0xFFEC4899), Color(0xFF8B5CF6)],
];

/// Серый градиент — пассивные провизоры и «прочие» строки рейтинга.
const kMedMutedGradient = [Color(0xFF64748B), Color(0xFF94A3B8)];

/// «Сейчас» для относительных дат и статусов (в тестах подменяется).
final medrepNowProvider = Provider<DateTime Function()>((_) => DateTime.now);

/// Градиент аватара по id (стабилен между экранами).
List<Color> medGradientForId(int id) =>
    _avatarGradients[id.abs() % _avatarGradients.length];

/// Стабильный градиент по имени.
List<Color> medGradientFor(String name) {
  var h = 0;
  for (final c in name.codeUnits) {
    h = (h * 31 + c) & 0x7fffffff;
  }
  return _avatarGradients[h % _avatarGradients.length];
}

/// Круглый аватар с инициалами на градиенте: 40 (строки), 48 (карточки),
/// 56 (герой-карточка).
class MedAvatar extends StatelessWidget {
  const MedAvatar(
    this.name, {
    super.key,
    this.size = 40,
    this.colors,
    this.label,
    this.seed,
  });

  final String name;
  final double size;
  final List<Color>? colors;

  /// id человека — градиент по нему (иначе по имени).
  final int? seed;

  /// Текст вместо инициалов («ВЫ»).
  final String? label;

  @override
  Widget build(BuildContext context) {
    final fs = size >= 56 ? 18.0 : (size >= 48 ? 16.0 : 14.0);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors ?? (seed != null ? medGradientForId(seed!) : medGradientFor(name)),
        ),
      ),
      child: Text(
        label ?? initialsOf(name),
        style: PqText.text(fs, FontWeight.w700, height: 1, c: Colors.white),
      ),
    );
  }
}

/// «Назад» для экранов в оболочке: по стеку, а если его нет — на [fallback].
void medBack(BuildContext context, [String fallback = '/app']) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(fallback);
  }
}

/// Копирует кодовое слово и показывает тост «Кодовое слово скопировано».
Future<void> medCopyCode(BuildContext context, String code) async {
  if (code.isEmpty) return;
  await Clipboard.setData(ClipboardData(text: code));
  if (!context.mounted) return;
  showPqToast(context, context.l10n.medrepCodeCopied, icon: PqIcons.copy);
}

/// Системное «Поделиться» с кодовым словом. Ссылки-приглашения в приложении
/// нет — коллеге достаточно ввести слово при регистрации.
Future<void> medShareCode(BuildContext context, String code) async {
  if (code.isEmpty) return;
  final text = context.l10n.medrepShareText(code);
  try {
    await SharePlus.instance.share(ShareParams(text: text));
  } catch (_) {
    // Нет системного окна «Поделиться» — хотя бы скопируем слово.
    if (context.mounted) await medCopyCode(context, code);
  }
}

/// Кодовое слово крупными буквами: Onest 800 с разрядкой (22/5 в строке
/// «Команды», 28/6 на главной, 48/10 на экране приглашения). Пока слово не
/// загрузилось — прочерки той же ширины.
class MedCodeWord extends StatelessWidget {
  const MedCodeWord(this.code, {super.key, this.size = 28, this.spacing = 6, this.color});

  final String? code;
  final double size;
  final double spacing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final text = code == null || code!.isEmpty ? '——————' : code!;
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        softWrap: false,
        style: PqText.heading(size, FontWeight.w800,
            height: size >= 40 ? 1 : null,
            ls: spacing,
            c: (color ?? pq.text).withValues(alpha: code == null ? .35 : 1)),
      ),
    );
  }
}

/// Пунктирная рамка 1 px (CSS `border: 1px dashed`) поверх блока.
class MedDashedBorder extends CustomPainter {
  MedDashedBorder({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
        (Offset.zero & size).deflate(.5), Radius.circular(radius));
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (final m in (Path()..addRRect(rrect)).computeMetrics()) {
      for (double d = 0; d < m.length; d += 6) {
        canvas.drawPath(m.extractPath(d, d + 3), paint);
      }
    }
  }

  @override
  bool shouldRepaint(MedDashedBorder old) =>
      old.color != color || old.radius != radius;
}

/// Приглушённый текст на градиентной карточке.
Color medHeroMuted(PqColors pq) => pq.walletMuted;

/// Линии-разделители на градиентной карточке (.16 / .28).
Color medHeroLine(PqColors pq) =>
    pq.isDark ? const Color(0x29D6E3FF) : const Color(0x47FFFFFF);

/// Капсула на градиенте (статус «Активный», «Идёт»).
const kMedHeroPill = Color(0x24FFFFFF);

/// Градиентная карточка-герой (портфель, фармацевт, квест, сеть):
/// 135° walletGradient, рамка, тень 0 16 32 −16.
class MedHeroCard extends StatelessWidget {
  const MedHeroCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 24,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pq.walletGradient,
        ),
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
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white),
        child: child,
      ),
    );
    return onTap == null ? card : PqPressable(onTap: onTap, child: card);
  }
}

/// Строка из трёх показателей на герой-карточке: линии сверху и снизу,
/// вертикальные разделители.
class MedHeroStats extends StatelessWidget {
  const MedHeroStats({super.key, required this.items});

  final List<(String value, String label)> items;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final line = medHeroLine(pq);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: line),
          bottom: BorderSide(color: line),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (var i = 0; i < items.length; i++)
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: i == 0 ? 0 : 14),
                decoration: i == 0
                    ? null
                    : BoxDecoration(border: Border(left: BorderSide(color: line))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(items[i].$1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.statSmall(c: Colors.white)),
                    const SizedBox(height: 2),
                    Text(items[i].$2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.caption(c: medHeroMuted(pq))),
                  ],
                ),
              ),
            ),
        ]),
      ),
    );
  }
}

/// Капсула статуса на градиенте: точка 6 + текст 12/700.
class MedHeroPill extends StatelessWidget {
  const MedHeroPill(
    this.label, {
    super.key,
    this.dot = const Color(0xFF4ADE80),
    this.height = 28,
  });

  final String label;
  final Color? dot;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: height >= 28 ? 12 : 10),
      decoration: BoxDecoration(
        color: kMedHeroPill,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (dot != null) ...[
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
        ],
        Text(label, style: PqText.tag(c: Colors.white)),
      ]),
    );
  }
}

/// Строка «человек» в карточке-списке: место · аватар 40 · имя и подпись ·
/// число и единица справа.
class MedPersonRow extends StatelessWidget {
  const MedPersonRow({
    super.key,
    required this.name,
    this.subtitle,
    this.rank,
    this.rankColor,
    this.value,
    this.unit,
    this.onTap,
    this.avatarColors,
    this.avatarLabel,
    this.avatarSeed,
    this.verticalPadding = 12,
    this.rankWidth = 20,
    this.rankSize = 15,
    this.titleWeight = FontWeight.w600,
  });

  final String name;
  final String? subtitle;
  final int? rank;
  final Color? rankColor;
  final String? value;
  final String? unit;
  final VoidCallback? onTap;
  final List<Color>? avatarColors;
  final String? avatarLabel;
  final int? avatarSeed;
  final double verticalPadding;
  final double rankWidth;
  final double rankSize;
  final FontWeight titleWeight;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final row = Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Row(children: [
        if (rank != null) ...[
          SizedBox(
            width: rankWidth,
            child: Text('$rank',
                style: PqText.heading(rankSize, FontWeight.w700,
                    c: rankColor ?? pq.textMuted)),
          ),
          const SizedBox(width: 12),
        ],
        MedAvatar(name, colors: avatarColors, label: avatarLabel, seed: avatarSeed),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.text(16, titleWeight, c: pq.text)),
              if (subtitle != null && subtitle!.isNotEmpty)
                Text(subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.caption(c: pq.textMuted)),
            ],
          ),
        ),
        if (value != null) ...[
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value!, style: PqText.amount(c: pq.text)),
              if (unit != null)
                Text(unit!, style: PqText.caption(c: pq.textMuted)),
            ],
          ),
        ],
      ]),
    );
    return onTap == null ? row : PqPressable(onTap: onTap, child: row);
  }
}

/// Пункт меню в карточке-списке: плитка 40 · заголовок + подпись · шеврон.
class MedMenuRow extends StatelessWidget {
  const MedMenuRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final PqIcons icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 60),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(children: [
            PqIconTile(icon,
                size: 40,
                iconSize: 20,
                background: pq.surfaceAlt,
                foreground: pq.accentText),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: PqText.text(16, FontWeight.w600, c: pq.text)),
                  Text(subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.caption(c: pq.textMuted)),
                ],
              ),
            ),
            const SizedBox(width: 14),
            PqIcon(PqIcons.chevronRight, size: 18, color: pq.textMuted),
          ]),
        ),
      ),
    );
  }
}

/// Поле поиска 48 (радиус 16, фон surface): фокус — рамка 2 акцентом,
/// при вводе — круглая кнопка «Очистить» 36.
class MedSearchField extends StatefulWidget {
  const MedSearchField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  State<MedSearchField> createState() => _MedSearchFieldState();
}

class _MedSearchFieldState extends State<MedSearchField> {
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_update);
    widget.controller.addListener(_update);
  }

  void _update() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_update);
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final focused = _focus.hasFocus;
    final hasText = widget.controller.text.isNotEmpty;
    final bw = focused ? 2.0 : 1.0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      // Как в макете (content-box): 48 + рамка сверху и снизу.
      height: 48 + bw * 2,
      padding: EdgeInsets.only(left: 14, right: hasText ? 6 : 14),
      decoration: BoxDecoration(
        color: pq.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: focused ? pq.accent : pq.border, width: bw),
      ),
      child: Row(children: [
        PqIcon(PqIcons.search, size: 20, color: pq.textMuted),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: widget.controller,
            focusNode: _focus,
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.search,
            cursorColor: pq.accent,
            cursorWidth: 2,
            style: PqText.field(c: pq.text),
            decoration: InputDecoration(
              isDense: true,
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: widget.hint,
              hintStyle: PqText.field(c: pq.textMuted),
            ),
          ),
        ),
        if (hasText) ...[
          const SizedBox(width: 10),
          PqIconButton(
            icon: PqIcons.x,
            size: 36,
            iconSize: 16,
            background: pq.surfaceAlt,
            color: pq.textMuted,
            label: context.l10n.medrepClear,
            onTap: () {
              widget.controller.clear();
              widget.onChanged('');
            },
          ),
        ],
      ]),
    );
  }
}

/// Плитка пустого состояния: появление pqPop .5s + покачивание pqBob 3.2s
/// после .6s.
class MedPopTile extends StatelessWidget {
  const MedPopTile({
    super.key,
    required this.icon,
    required this.background,
    required this.foreground,
    this.size = 88,
    this.radius = 28,
    this.iconSize = 40,
    this.borderColor,
  });

  final PqIcons icon;
  final Color background;
  final Color foreground;
  final double size;
  final double radius;
  final double iconSize;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return PqAnimate(
      fx: PqFx.pop,
      child: PqBob(
        duration: const Duration(milliseconds: 3200),
        delay: const Duration(milliseconds: 600),
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(radius),
            border: borderColor == null ? null : Border.all(color: borderColor!),
          ),
          child: PqIcon(icon, size: iconSize, color: foreground),
        ),
      ),
    );
  }
}

/// Пустое состояние экранов медпреда: плитка (pop + bob) · заголовок 22/700 ·
/// текст 15/1.5 · действие.
class MedEmptyBlock extends StatelessWidget {
  const MedEmptyBlock({
    super.key,
    required this.tile,
    required this.title,
    this.message,
    this.action,
    this.padding = const EdgeInsets.fromLTRB(24, 56, 24, 0),
    this.gap = 12,
    this.messageMaxWidth = 300,
  });

  /// Зазор колонки: плитка→заголовок и текст→действие — 2×gap
  /// (gap + margin-top в макете), заголовок→текст — gap.
  final double gap;
  final double messageMaxWidth;
  final Widget tile;
  final String title;
  final String? message;
  final Widget? action;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Padding(
      padding: padding,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        tile,
        SizedBox(height: gap * 2),
        Text(title, textAlign: TextAlign.center, style: PqText.emptyTitle(c: pq.text)),
        if (message != null) ...[
          SizedBox(height: gap),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: messageMaxWidth),
            child: Text(message!,
                textAlign: TextAlign.center,
                style: PqText.text(15, FontWeight.w400, height: 1.5, c: pq.textMuted)),
          ),
        ],
        if (action != null) ...[SizedBox(height: gap * 2), action!],
      ]),
    );
  }
}

/// Контурная кнопка 48 (радиус 16, фон surface) — «Сбросить поиск».
class MedOutlineButton extends StatelessWidget {
  const MedOutlineButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.height = 48,
    this.radius = 16,
    this.fontSize = 15,
    this.iconSize = 18,
    this.transparent = false,
    this.expand = false,
  });

  final String label;
  final VoidCallback? onTap;
  final PqIcons? icon;
  final double height;
  final double radius;
  final double fontSize;
  final double iconSize;
  final bool transparent;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        height: height,
        width: expand ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: transparent ? Colors.transparent : pq.surface,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: pq.border),
        ),
        child: Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              PqIcon(icon!, size: iconSize, color: pq.text),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.text(fontSize, FontWeight.w600, c: pq.text)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Сплошная акцентная кнопка с настраиваемой высотой/радиусом (48/14 в
/// карточке приглашения, 44/14 в заявках).
class MedAccentButton extends StatelessWidget {
  const MedAccentButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.height = 48,
    this.radius = 14,
    this.fontSize = 15,
    this.iconSize = 18,
    this.background,
    this.foreground,
    this.loading = false,
    this.iconGap = 6,
  });

  final String label;
  final VoidCallback? onTap;
  final PqIcons? icon;
  final double height;
  final double radius;
  final double fontSize;
  final double iconSize;
  final Color? background;
  final Color? foreground;
  final bool loading;
  final double iconGap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final fg = foreground ?? pq.onAccent;
    return PqPressable(
      onTap: loading ? null : onTap,
      semanticLabel: label,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: background ?? pq.accent,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (loading) ...[
            PqSpinner(color: fg, trackColor: fg.withValues(alpha: .3), size: 18),
            const SizedBox(width: 8),
          ] else if (icon != null) ...[
            PqIcon(icon!, size: iconSize, color: fg),
            SizedBox(width: iconGap),
          ],
          Flexible(
            child: Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.text(fontSize, FontWeight.w700, c: fg)),
          ),
        ]),
      ),
    );
  }
}

/// «2 ч назад», «вчера», «3 дня назад»; старше недели — дата.
String medAgo(AppLocalizations l, String iso, DateTime now) {
  final t = DateTime.tryParse(iso)?.toLocal();
  if (t == null) return iso;
  final d = now.difference(t);
  if (d.inMinutes < 1) return l.medrepAgoNow;
  if (d.inMinutes < 60) return l.medrepAgoMinutes(d.inMinutes);
  final days = DateTime(now.year, now.month, now.day)
      .difference(DateTime(t.year, t.month, t.day))
      .inDays;
  if (days == 0) return l.medrepAgoHours(d.inHours);
  if (days == 1) return l.medrepAgoYesterday;
  if (days < 7) return l.medrepAgoDays(days);
  return formatDate(iso);
}

/// «2026-06-01» → «01.06».
String medDayMonth(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}';
}


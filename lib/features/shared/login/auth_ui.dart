import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/models/common.dart';

/// Общие элементы экранов входа и регистрации (макеты Login, SmsCode,
/// RoleLogin, Reg*): фон с плавающими пятнами, логотип, выбор языка,
/// поле телефона, ячейки кода, карточки ролей.

/// Каркас экрана входа: фон + свечение + пятна pqDrift, светлые/тёмные
/// значки статус-бара по теме.
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.child, this.drift = true, this.safeBottom = true});

  final Widget child;
  final bool drift;
  final bool safeBottom;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: pq.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      // Фон остаётся на весь экран под клавиатурой (как в макетах), отступ
      // под клавиатуру добавляет [AuthFlow].
      child: PqScreen(
        drift: drift,
        safeBottom: safeBottom,
        resizeToAvoidBottomInset: false,
        child: child,
      ),
    );
  }
}

/// Цвет слова «PharmIQ» в логотипе: в светлой теме — фирменный тёмно-синий.
Color authBrandColor(PqColors pq) => pq.isDark ? pq.text : const Color(0xFF293B71);

/// Знак логотипа. `assets/logo.svg` белый — в светлой теме макеты берут
/// тёмный вариант знака, поэтому красим его в фирменный #293B71.
class AuthLogoMark extends StatelessWidget {
  const AuthLogoMark({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return SvgPicture.asset(
      'assets/logo.svg',
      width: width,
      height: height,
      colorFilter: pq.isDark ? null : ColorFilter.mode(authBrandColor(pq), BlendMode.srcIn),
    );
  }
}

/// Логотип «PharmIQ ACADEMY»: знак 26×25 + Onest 20/700 + ACADEMY 12/600
/// (трекинг 3). [large] — вариант заставки: 58×55, 40/700, 14/600 трекинг 8.
class AuthBrand extends StatelessWidget {
  const AuthBrand({super.key, this.large = false});

  final bool large;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthLogoMark(width: large ? 58 : 26, height: large ? 55 : 25),
        SizedBox(width: large ? 16 : 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PharmIQ',
              style: PqText.heading(
                large ? 40 : 20,
                FontWeight.w700,
                height: 1,
                c: authBrandColor(pq),
              ),
            ),
            SizedBox(height: large ? 6 : 2),
            Text(
              'ACADEMY',
              style: PqText.text(
                large ? 14 : 12,
                FontWeight.w600,
                height: 1,
                ls: large ? 8 : 3,
                c: pq.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Шапка экранов входа (высота 64): логотип и кнопка языка «RU».
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, this.language = true});

  final bool language;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: [const AuthBrand(), const Spacer(), if (language) const AuthLanguageChip()],
      ),
    );
  }
}

/// Языки интерфейса. Названия всегда на самом языке — не локализуются.
String authLanguageName(String code) => switch (code) {
  'ru' => 'Русский',
  'uz' => "O'zbekcha",
  'kk' => 'Қазақша',
  'tg' => 'Тоҷикӣ',
  'ky' => 'Кыргызча',
  _ => code,
};

/// Сменить язык интерфейса. Если пользователь уже вошёл — синхронизируем
/// язык с сервером (best effort, как в профиле; tg/ky сервер не знает).
void authSetLocale(WidgetRef ref, Locale locale) {
  ref.read(localeProvider.notifier).set(locale);
  final authed = ref.read(authControllerProvider).asData?.value.isAuthed ?? false;
  if (!authed) return;
  final lang = switch (locale.languageCode) {
    'ru' => Language.ru,
    'uz' => Language.uz,
    'kk' => Language.kz,
    _ => null,
  };
  if (lang == null) return;
  ref.read(apiProvider).account.setLanguage(lang).catchError((_) {});
}

/// Кнопка языка 44×44 с капсулой «RU» (высота 28, радиус 8).
class AuthLanguageChip extends ConsumerWidget {
  const AuthLanguageChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final code = ref.watch(localeProvider).languageCode;
    return PqPressable(
      onTap: () => showAuthLanguageSheet(context),
      semanticLabel: context.l10n.authLanguageLabel(authLanguageName(code)),
      scale: .94,
      child: SizedBox.square(
        dimension: 44,
        child: Center(
          child: Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: pq.border),
            ),
            alignment: Alignment.center,
            child: Text(code.toUpperCase(), style: PqText.tag(c: pq.text)),
          ),
        ),
      ),
    );
  }
}

/// Нижний лист выбора языка (варианты — как на экране Welcome).
Future<void> showAuthLanguageSheet(BuildContext context) {
  return showPqSheet<void>(
    context,
    scrollable: true,
    builder:
        (ctx) => Consumer(
          builder: (ctx, ref, _) {
            final pq = ctx.pq;
            final current = ref.watch(localeProvider).languageCode;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ctx.l10n.authAppLanguage,
                  style: PqText.heading(22, FontWeight.w700, c: pq.text),
                ),
                const SizedBox(height: 16),
                for (final l in supportedAppLocales) ...[
                  AuthLanguageOption(
                    label: authLanguageName(l.languageCode),
                    selected: l.languageCode == current,
                    onTap: () {
                      authSetLocale(ref, l);
                      Navigator.of(ctx).pop();
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ],
            );
          },
        ),
  );
}

/// Мягкая заливка выбранного варианта: в светлой теме — светлее accentSoft.
Color authSelectedBg(PqColors pq) => pq.isDark ? pq.accentSoft : const Color(0xFFEEF2FF);

/// Круглая радиокнопка 24 макетов входа: выбрана — заливка акцентом
/// с галочкой 14, иначе рамка 2.
class AuthRadioDot extends StatelessWidget {
  const AuthRadioDot({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: PqMotion.ease,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: selected ? pq.accent : Colors.transparent,
        shape: BoxShape.circle,
        border: selected ? null : Border.all(color: pq.borderStrong, width: 2),
      ),
      alignment: Alignment.center,
      child:
          selected
              ? PqAnimate(
                fx: PqFx.pop,
                duration: const Duration(milliseconds: 300),
                child: PqIcon(PqIcons.check, size: 14, color: pq.onAccent),
              )
              : null,
    );
  }
}

/// Вариант языка (Welcome): высота 60, радиус 16, Inter 17.
class AuthLanguageOption extends StatelessWidget {
  const AuthLanguageOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      selected: selected,
      inMutuallyExclusiveGroup: true,
      child: PqPressable(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: selected ? 17 : 18),
          decoration: BoxDecoration(
            color: selected ? authSelectedBg(pq) : pq.fieldBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: selected ? pq.accent : pq.border, width: selected ? 2 : 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: PqText.text(17, selected ? FontWeight.w700 : FontWeight.w500, c: pq.text),
                ),
              ),
              AuthRadioDot(selected: selected),
            ],
          ),
        ),
      ),
    );
  }
}

/// Отступ `margin-top: auto` внутри [AuthFlow] — прижимает следующие
/// элементы к низу экрана.
class AuthPush extends StatelessWidget {
  const AuthPush({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// Элемент [AuthFlow] со своей анимацией появления (в макете inline
/// `animation: pqPop …` перекрывает каскадный pqUp) — не оборачивается.
class AuthSelfAnimated extends StatelessWidget {
  const AuthSelfAnimated({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}

/// Колонка экрана входа на всю высоту (`min-height: 100%`, `gap`), с
/// каскадом появления `.pq-stagger` экранов входа (шаг 50 мс, до .2s).
/// Элементы с ключами сохраняют состояние (и не анимируются заново),
/// когда набор детей меняется (например, при открытии клавиатуры).
class AuthFlow extends StatelessWidget {
  const AuthFlow({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.fromLTRB(20, 0, 20, 32),
    this.gap = 20,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  final List<Widget> children;
  final EdgeInsets padding;
  final double gap;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    var index = 0;
    var pushNext = false;
    for (final c in children) {
      if (c is AuthPush) {
        pushNext = true;
        continue;
      }
      if (index > 0) items.add(SizedBox(height: gap));
      if (pushNext) {
        items.add(const Spacer());
        pushNext = false;
      }
      items.add(
        c is AuthSelfAnimated
            ? c
            : PqAnimate(
              key: c.key == null ? null : ValueKey(c.key),
              delay: PqMotion.staggerDelay(index, maxIndex: 4),
              child: c,
            ),
      );
      index++;
    }
    // Поля — внутри заполняющего блока: SliverPadding после
    // SliverFillRemaining добавил бы высоту сверх экрана (лишняя прокрутка).
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: padding + EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
            child: Column(crossAxisAlignment: crossAxisAlignment, children: items),
          ),
        ),
      ],
    );
  }
}

/// Слоган экрана входа: Onest 36/700 + подзаголовок 16.
class AuthHero extends StatelessWidget {
  const AuthHero({super.key, required this.title, required this.subtitle, this.top = 24});

  final String title;
  final String subtitle;
  final double top;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PqText.heading(36, FontWeight.w700, height: 1.1, ls: -0.5, c: pq.text),
          ),
          const SizedBox(height: 10),
          Text(subtitle, style: PqText.text(16, FontWeight.w400, c: pq.textMuted)),
        ],
      ),
    );
  }
}

/// Заголовок шага: Onest 22/700 + подпись 15 (приглушённая).
class AuthTitleBlock extends StatelessWidget {
  const AuthTitleBlock({super.key, required this.title, this.subtitle, this.subtitleWidget});

  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: PqText.heading(22, FontWeight.w700, c: pq.text)),
        const SizedBox(height: 4),
        subtitleWidget ??
            Text(subtitle ?? '', style: PqText.text(15, FontWeight.w400, c: pq.textMuted)),
      ],
    );
  }
}

/// «Нет аккаунта? Зарегистрироваться» — текст 15 + жирная ссылка акцентом.
class AuthTextLink extends StatelessWidget {
  const AuthTextLink({super.key, required this.text, required this.link, required this.onTap});

  final String text;
  final String link;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Center(
      child: PqPressable(
        onTap: onTap,
        semanticLabel: '$text $link',
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '$text '),
              TextSpan(text: link, style: PqText.text(15, FontWeight.w700, c: pq.accent)),
            ],
          ),
          textAlign: TextAlign.center,
          style: PqText.text(15, FontWeight.w400, c: pq.textMuted),
        ),
      ),
    );
  }
}

/// Подпись поля (Inter 14/600) и красная звёздочка обязательного поля.
class AuthFieldLabel extends StatelessWidget {
  const AuthFieldLabel(this.text, {super.key, this.required = false});

  final String text;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text),
          if (required) TextSpan(text: ' *', style: TextStyle(color: pq.danger)),
        ],
      ),
      style: PqText.link(c: pq.textSecondary),
    );
  }
}

/// Строка ошибки под полем: иконка 16 + текст 14 красным.
class AuthErrorLine extends StatelessWidget {
  const AuthErrorLine(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqAnimate(
      fx: PqFx.fade,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // В макете значок 16 во flex-строке ужимается длинным текстом до
          // 12 px (рамка 12×16, круг по центру) — повторяем.
          SizedBox(
            width: 12,
            height: 16,
            child: Center(child: PqIcon(PqIcons.alertCircle, size: 12, color: pq.danger)),
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: PqText.text(14, FontWeight.w400, c: pq.danger))),
        ],
      ),
    );
  }
}

// ── Телефон ──

/// Код страны в поле телефона (макеты: фиксированный «+998»).
const kAuthPhonePrefix = '+998';
const kAuthPhoneDigits = 9;

/// Цифры номера без кода страны: «+998 90 123 45 67» → «901234567».
String authPhoneDigits(String? phone) {
  var d = (phone ?? '').replaceAll(RegExp(r'\D'), '');
  if (d.length > kAuthPhoneDigits && d.startsWith('998')) d = d.substring(3);
  return d.length > kAuthPhoneDigits ? d.substring(0, kAuthPhoneDigits) : d;
}

/// Полный номер для API: «+998901234567».
String authFullPhone(String digits) => '$kAuthPhonePrefix$digits';

/// Номер для показа: «+998 90 123 45 67».
String authPrettyPhone(String phone) {
  final d = authPhoneDigits(phone);
  return '$kAuthPhonePrefix ${_groupPhone(d)}'.trim();
}

String _groupPhone(String d) {
  final b = StringBuffer();
  for (var i = 0; i < d.length; i++) {
    if (i == 2 || i == 5 || i == 7) b.write(' ');
    b.write(d[i]);
  }
  return b.toString();
}

/// Маска «90 123 45 67»: только цифры, не больше 9; вставка «+998…» режет код.
class AuthPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = authPhoneDigits(newValue.text);
    final text = _groupPhone(digits);
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}

/// Поле телефона: префикс «+998» с разделителем, маска номера,
/// фокус — рамка 2 акцентом, ошибка — рамка 2 красным, pqShake и строка
/// ошибки. [shakeKey] — смена значения повторяет встряску.
class AuthPhoneField extends StatefulWidget {
  const AuthPhoneField({
    super.key,
    required this.controller,
    this.focusNode,
    this.label,
    this.error,
    this.shakeKey = 0,
    this.enabled = true,
    this.autofocus = false,
    this.required = false,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? label;
  final String? error;
  final int shakeKey;
  final bool enabled;
  final bool autofocus;
  final bool required;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AuthPhoneField> createState() => _AuthPhoneFieldState();
}

class _AuthPhoneFieldState extends State<AuthPhoneField> {
  late final FocusNode _focus = widget.focusNode ?? FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  void _onFocus() => setState(() => _focused = _focus.hasFocus);

  @override
  void dispose() {
    _focus.removeListener(_onFocus);
    if (widget.focusNode == null) _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final hasError = widget.error != null;
    final strong = hasError || _focused;
    final bw = strong ? 2.0 : 1.0;
    Widget box = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16 - (bw - 1)),
      decoration: BoxDecoration(
        color: widget.enabled ? pq.fieldBg : pq.fieldDisabledBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color:
              hasError
                  ? pq.danger
                  : _focused
                  ? pq.accent
                  : pq.border,
          width: bw,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(border: Border(right: BorderSide(color: pq.border))),
            alignment: Alignment.center,
            child: Text(kAuthPhonePrefix, style: PqText.field(c: pq.text, w: FontWeight.w600)),
          ),
          Expanded(
            child: Center(
              child: TextField(
                controller: widget.controller,
                focusNode: _focus,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.telephoneNumberNational],
                inputFormatters: [AuthPhoneFormatter()],
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                cursorColor: pq.accent,
                cursorWidth: 2,
                cursorHeight: 20,
                style: PqText.field(c: widget.enabled ? pq.text : pq.textMuted),
                decoration: InputDecoration(
                  isDense: true,
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: '90 000 00 00',
                  hintStyle: PqText.field(c: pq.textMuted),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    if (hasError) {
      box = PqAnimate(
        key: ValueKey('shake${widget.shakeKey}'),
        fx: PqFx.shake,
        delay: const Duration(milliseconds: 300),
        child: box,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          AuthFieldLabel(widget.label!, required: widget.required),
          const SizedBox(height: 8),
        ],
        box,
        if (hasError) ...[const SizedBox(height: 8), AuthErrorLine(widget.error!)],
      ],
    );
  }
}

// ── Код из SMS ──

/// Состояние ячеек кода.
enum AuthCodeState { normal, error, success }

/// Шесть ячеек кода 50×60 (радиус 14, Onest 24/700) поверх скрытого поля
/// системной клавиатуры. Текущая ячейка — рамка 2 акцентом с кареткой
/// pqCaret; ошибка — красные рамки и pqShake; успех — зелёные с pqPop/pqRing.
class AuthCodeCells extends StatefulWidget {
  const AuthCodeCells({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.length = 6,
    this.state = AuthCodeState.normal,
    this.shakeKey = 0,
    this.enabled = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final int length;
  final AuthCodeState state;
  final int shakeKey;
  final bool enabled;

  @override
  State<AuthCodeCells> createState() => _AuthCodeCellsState();
}

class _AuthCodeCellsState extends State<AuthCodeCells> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_refresh);
    widget.controller.addListener(_refresh);
  }

  @override
  void didUpdateWidget(AuthCodeCells old) {
    super.didUpdateWidget(old);
    if (old.focusNode != widget.focusNode) {
      old.focusNode.removeListener(_refresh);
      widget.focusNode.addListener(_refresh);
    }
    if (old.controller != widget.controller) {
      old.controller.removeListener(_refresh);
      widget.controller.addListener(_refresh);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_refresh);
    widget.controller.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final code = widget.controller.text;
    final focused = widget.focusNode.hasFocus;
    final state = widget.state;
    final length = widget.length;

    Widget cell(int i, double w) {
      final filled = i < code.length;
      final current = i == code.length && state == AuthCodeState.normal;
      Color border;
      double bw = 1;
      Color bg = pq.fieldBg;
      switch (state) {
        case AuthCodeState.error:
          border = pq.danger;
          bw = 2;
        case AuthCodeState.success:
          border = pq.success;
          bw = 2;
          bg = pq.successSoft;
        case AuthCodeState.normal:
          if (current && focused) {
            border = pq.accent;
            bw = 2;
          } else {
            border = filled ? pq.borderStrong : pq.border;
          }
      }
      Widget digit = Text(
        filled ? code[i] : '',
        style: PqText.heading(
          24,
          FontWeight.w700,
          c: switch (state) {
            AuthCodeState.error => pq.danger,
            AuthCodeState.success => pq.success,
            AuthCodeState.normal => pq.text,
          },
        ),
      );
      if (state == AuthCodeState.success && filled) {
        digit = PqAnimate(fx: PqFx.pop, delay: Duration(milliseconds: 40 * i), child: digit);
      }
      Widget box = AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: w,
        height: 60,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border, width: bw),
        ),
        alignment: Alignment.center,
        child: current && focused ? PqCaret(color: pq.accent, height: 26) : digit,
      );
      if (state == AuthCodeState.success) {
        box = PqPulseRing.success(borderRadius: BorderRadius.circular(14), child: box);
      }
      return box;
    }

    return Semantics(
      label: context.l10n.authCodeGroup,
      textField: true,
      child: SizedBox(
        height: 60,
        child: LayoutBuilder(
          builder: (context, box) {
            final w = ((box.maxWidth - 6.0 * (length - 1)) / length).clamp(36.0, 50.0);
            Widget row = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [for (var i = 0; i < length; i++) cell(i, w)],
            );
            if (state == AuthCodeState.error) {
              row = PqAnimate(key: ValueKey('shake${widget.shakeKey}'), fx: PqFx.shake, child: row);
            }
            return Stack(
              children: [
                Positioned.fill(child: row),
                // Скрытое поле: системная цифровая клавиатура + автоподстановка
                // кода из SMS (iOS «Из Сообщений», Android — autofill).
                // Без maxLength: iOS может подставить код с пробелом или
                // дважды («123456123456») — встроенный лимит тогда отбрасывает
                // ввод целиком. Берём первые [length] цифр сами. Выделение
                // включено — чтобы работала вставка скопированного кода.
                Positioned.fill(
                  child: Opacity(
                    opacity: 0,
                    child: AutofillGroup(
                      child: TextField(
                        controller: widget.controller,
                        focusNode: widget.focusNode,
                        enabled: widget.enabled,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.oneTimeCode],
                        showCursor: false,
                        inputFormatters: [_CodeFormatter(length)],
                        onChanged: widget.onChanged,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          filled: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Оставляет только цифры и не больше [length] — для ручного ввода,
/// автоподстановки из SMS и вставки из буфера («Код: 123 456»).
class _CodeFormatter extends TextInputFormatter {
  _CodeFormatter(this.length);

  final int length;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length > length) digits = digits.substring(0, length);
    return TextEditingValue(
      text: digits,
      selection: TextSelection.collapsed(offset: digits.length),
    );
  }
}

// ── Регистрация / роли ──

/// Прогресс шагов регистрации: 2 полосы 4 px (зазор 6) + подпись капсом.
class AuthStepProgress extends StatelessWidget {
  const AuthStepProgress({super.key, required this.step, required this.label});

  final int step;
  final String label;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final track = pq.isDark ? pq.border : const Color(0xFFE5E7EB);
    Widget seg(bool on) => Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: PqMotion.ease,
        height: 4,
        decoration: BoxDecoration(
          color: on ? pq.accent : track,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [seg(true), const SizedBox(width: 6), seg(step >= 2)]),
        const SizedBox(height: 10),
        Text(label.toUpperCase(), style: PqText.overline(c: pq.textMuted)),
      ],
    );
  }
}

/// Иконка роли из макетов RoleLogin/RegRole.
PqIcons authRoleIcon(Role r) => switch (r) {
  Role.pharmacist => PqIcons.pill,
  Role.doctor => PqIcons.stethoscope,
  Role.medrep => PqIcons.users,
  Role.productOwner => PqIcons.building,
};

/// Карточка роли: высота ≥76, радиус 18, плитка 48 (радиус 14),
/// название 17/700 и подпись 14. [selected] == null — строка-ссылка со
/// стрелкой (RoleLogin), иначе вариант выбора с радиокнопкой (RegRole).
class AuthRoleCard extends StatelessWidget {
  const AuthRoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.selected,
  });

  final PqIcons icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final on = selected ?? false;
    // Вариант выбора в макете — <button>: у него line-height: normal
    // (Inter ≈ 1.21), у строки-ссылки <a> — 1.4 как у body.
    final double? lh = selected == null ? null : 1.21;
    final card = PqPressable(
      onTap: onTap,
      semanticLabel: title,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: PqMotion.ease,
        constraints: const BoxConstraints(minHeight: 76),
        padding: EdgeInsets.symmetric(horizontal: on ? 15 : 16, vertical: on ? 11 : 12),
        decoration: BoxDecoration(
          color: on ? authSelectedBg(pq) : pq.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: on ? pq.accent : pq.border, width: on ? 2 : 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: pq.accentSoft,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: PqIcon(icon, size: 22, color: pq.accentText),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: PqText.text(17, FontWeight.w700, height: lh, c: pq.text)),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: PqText.text(14, FontWeight.w400, height: lh, c: pq.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            if (selected == null)
              PqIcon(PqIcons.chevronRight, size: 20, color: pq.textMuted)
            else
              AuthRadioDot(selected: on),
          ],
        ),
      ),
    );
    if (selected == null) return card;
    return Semantics(selected: on, inMutuallyExclusiveGroup: true, child: card);
  }
}

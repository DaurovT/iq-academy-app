import 'package:flutter/material.dart';

/// Типографика редизайна 1.2: Onest — заголовки, суммы и цифры;
/// Inter — основной текст и кнопки. Цифры везде табличные
/// (`font-variant-numeric: tabular-nums` в макетах).
///
/// Цвет не задаётся — наследуется от [DefaultTextStyle]/темы, либо
/// передаётся через `.copyWith(color: ...)` / параметр [c].
abstract final class PqText {
  static const onest = 'Onest';
  static const inter = 'Inter';
  static const _tnum = [FontFeature.tabularFigures()];

  // В макетах body{line-height:1.4} наследуется всем текстом, а CSS делит
  // интерлиньяж поровну сверху и снизу — поэтому height 1.4 и even.
  static TextStyle _o(double size, FontWeight w,
          {double? height, double? ls, Color? c}) =>
      TextStyle(
        fontFamily: onest,
        fontSize: size,
        fontWeight: w,
        height: height ?? 1.4,
        leadingDistribution: TextLeadingDistribution.even,
        // Явный 0: иначе TextField подмешивает letterSpacing 0.5 из темы M3.
        letterSpacing: ls ?? 0,
        color: c,
        fontFeatures: _tnum,
      );

  static TextStyle _i(double size, FontWeight w,
          {double? height, double? ls, Color? c, bool tnum = true}) =>
      TextStyle(
        fontFamily: inter,
        fontSize: size,
        fontWeight: w,
        height: height ?? 1.4,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: ls ?? 0,
        color: c,
        // Кнопки и поля: в макетах <button>/<input> получают font из
        // UA-стиля, который сбрасывает font-variant-numeric.
        fontFeatures: tnum ? _tnum : const [],
      );

  /// Заголовок экрана: «Привет, Дауров!», «Мои чеки». Onest 30/700.
  static TextStyle display({Color? c}) =>
      _o(30, FontWeight.w700, height: 1.15, ls: -0.3, c: c);

  /// Заголовок экранов входа/результата: «Аккаунт удалён». Onest 26/700.
  static TextStyle headline({Color? c}) => _o(26, FontWeight.w700, c: c);

  /// Заголовок пустого состояния. Onest 22/700.
  static TextStyle emptyTitle({Color? c}) => _o(22, FontWeight.w700, c: c);

  /// Заголовок секции: «Активные квесты». Onest 20/600.
  static TextStyle section({Color? c}) => _o(20, FontWeight.w600, c: c);

  /// Заголовок в bottom sheet / блоке. Onest 20/700.
  static TextStyle sheetTitle({Color? c}) =>
      _o(20, FontWeight.w700, height: 1.3, c: c);

  /// Название карточки квеста. Onest 18/700.
  static TextStyle title({Color? c}) => _o(18, FontWeight.w700, c: c);

  /// Логотип в шапке «PharmIQ». Onest 18/700.
  static TextStyle brand({Color? c}) => _o(18, FontWeight.w700, c: c);

  /// Название в строке списка. Onest 16/600.
  static TextStyle rowTitle({Color? c}) => _o(16, FontWeight.w600, c: c);

  /// Сумма в строке: «+144 IQC». Onest 16/700.
  static TextStyle amount({Color? c}) => _o(16, FontWeight.w700, c: c);

  /// Заголовок в верхней панели с «назад». Onest 16/600.
  static TextStyle topBar({Color? c}) => _o(16, FontWeight.w600, c: c);

  /// Крупная сумма баланса. Onest 60/800.
  static TextStyle balance({Color? c}) =>
      _o(60, FontWeight.w800, height: 1, c: c);

  /// Число показателя. Onest 30/800.
  static TextStyle stat({Color? c}) =>
      _o(30, FontWeight.w800, height: 1.1, c: c);

  /// Цифра в строке показателей кошелька. Onest 18/700.
  static TextStyle statSmall({Color? c}) => _o(18, FontWeight.w700, c: c);

  /// Произвольный Onest.
  static TextStyle heading(double size, FontWeight w,
          {double? height, double? ls, Color? c}) =>
      _o(size, w, height: height, ls: ls, c: c);

  /// Подзаголовок экрана. Inter 15.
  static TextStyle subtitle({Color? c}) => _i(15, FontWeight.w400, c: c);

  /// Основной текст абзацев. Inter 16, интерлиньяж 1.5.
  static TextStyle bodyLarge({Color? c}) =>
      _i(16, FontWeight.w400, height: 1.5, c: c);

  /// Текст поля ввода / варианта ответа. Inter 16/500.
  static TextStyle field({Color? c, FontWeight w = FontWeight.w400}) =>
      _i(16, w, c: c, tnum: false);

  /// Вспомогательный текст. Inter 14, интерлиньяж 1.45.
  static TextStyle body({Color? c, FontWeight w = FontWeight.w400}) =>
      _i(14, w, height: 1.45, c: c);

  /// Ссылка/действие в заголовке секции. Inter 14/600.
  static TextStyle link({Color? c}) => _i(14, FontWeight.w600, c: c);

  /// Мелкая подпись: дата, номер. Inter 12.
  static TextStyle caption({Color? c, FontWeight w = FontWeight.w400}) =>
      _i(12, w, c: c);

  /// Надпись капсом: «БАЛАНС КОШЕЛЬКА». Inter 12/600, трекинг 0.8.
  static TextStyle overline({Color? c}) =>
      _i(12, FontWeight.w600, ls: 0.8, c: c);

  /// Метка статуса/награды. Inter 12/700.
  static TextStyle tag({Color? c, FontWeight w = FontWeight.w700}) =>
      _i(12, w, c: c);

  /// Текст основной кнопки. Inter 16/700.
  static TextStyle button({Color? c, FontWeight w = FontWeight.w700}) =>
      _i(16, w, c: c, tnum: false);

  /// Текст маленькой кнопки/капсулы. Inter 14/700.
  static TextStyle buttonSmall({Color? c}) =>
      _i(14, FontWeight.w700, c: c, tnum: false);

  /// Произвольный Inter.
  static TextStyle text(double size, FontWeight w,
          {double? height, double? ls, Color? c}) =>
      _i(size, w, height: height, ls: ls, c: c);
}

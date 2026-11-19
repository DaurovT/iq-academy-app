import 'package:flutter/services.dart';

/// Поле кодового слова: только латиница и цифры, в верхнем регистре.
/// Клавиатуры Android (Gboard, Xiaomi) часто открываются на русской раскладке,
/// и русские буквы раньше молча пропадали — теперь [onCyrillic] сообщает о
/// них, чтобы показать «Переключите клавиатуру на английскую».
class LatinCodeFormatter extends TextInputFormatter {
  LatinCodeFormatter({required this.maxLength, required this.onCyrillic});

  final int maxLength;
  final void Function(bool typed) onCyrillic;

  static final _cyr = RegExp('[А-Яа-яЁёЎўҚқҒғҲҳ]');
  static final _bad = RegExp('[^A-Za-z0-9]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    onCyrillic(_cyr.hasMatch(newValue.text));
    var text = newValue.text.replaceAll(_bad, '').toUpperCase();
    if (text.length > maxLength) text = text.substring(0, maxLength);
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../l10n/gen/app_localizations.dart';

export '../../l10n/gen/app_localizations.dart';

/// Короткий доступ к строкам: `context.l10n.someKey`.
extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// flutter_localizations не содержит таджикского (tg) — для системных
/// виджетов (даты, копирование, диалоги) подставляем русские строки,
/// иначе Material/Cupertino-делегаты падают при загрузке локали.
class _TgMaterialDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _TgMaterialDelegate();
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tg';
  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      GlobalMaterialLocalizations.delegate.load(const Locale('ru'));
  @override
  bool shouldReload(_TgMaterialDelegate old) => false;
}

class _TgCupertinoDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TgCupertinoDelegate();
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tg';
  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      GlobalCupertinoLocalizations.delegate.load(const Locale('ru'));
  @override
  bool shouldReload(_TgCupertinoDelegate old) => false;
}

class _TgWidgetsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const _TgWidgetsDelegate();
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tg';
  @override
  Future<WidgetsLocalizations> load(Locale locale) =>
      GlobalWidgetsLocalizations.delegate.load(const Locale('ru'));
  @override
  bool shouldReload(_TgWidgetsDelegate old) => false;
}

/// Полный набор делегатов приложения (свои строки + системные + tg-фолбэк).
const appLocalizationDelegates = <LocalizationsDelegate<dynamic>>[
  AppLocalizations.delegate,
  _TgMaterialDelegate(),
  _TgCupertinoDelegate(),
  _TgWidgetsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/providers.dart';

/// Поддерживаемые языки интерфейса.
/// uz — узбекская латиница, kk — казахский, tg — таджикский, ky — киргизский.
const supportedAppLocales = [
  Locale('ru'),
  Locale('uz'),
  Locale('kk'),
  Locale('tg'),
  Locale('ky'),
];

/// Язык интерфейса с сохранением между запусками (в защищённом хранилище).
/// Работает так же, как ThemeModeController: стартуем с ru, асинхронно
/// подтягиваем сохранённый выбор.
class LocaleController extends Notifier<Locale> {
  @override
  Locale build() {
    _load();
    return const Locale('ru');
  }

  Future<void> _load() async {
    final saved = await ref.read(tokenStoreProvider).readLocale();
    if (saved == null) return;
    final match = supportedAppLocales.where((l) => l.languageCode == saved);
    if (match.isNotEmpty) state = match.first;
  }

  void set(Locale locale) {
    state = locale;
    ref.read(tokenStoreProvider).writeLocale(locale.languageCode);
  }
}

final localeProvider =
    NotifierProvider<LocaleController, Locale>(LocaleController.new);

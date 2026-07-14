import 'package:intl/intl.dart';

final _uzs = NumberFormat.decimalPattern('ru');

/// «100000» → «100 000 сум».
String formatUzs(num v) => '${_uzs.format(v)} сум';

/// Баллы IQC (1 IQC = 1000 UZS).
String formatIqc(num v) => '${_uzs.format(v)} IQC';

/// ISO-строка → «10.07.2026». При ошибке парсинга — исходная строка.
String formatDate(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return DateFormat('dd.MM.yyyy').format(d.toLocal());
}

/// ISO-строка → «10.07.2026 14:30».
String formatDateTime(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return DateFormat('dd.MM.yyyy HH:mm').format(d.toLocal());
}

/// ISO-строка → «08.06, 13:16» (короткий формат без года).
String formatShortDateTime(String iso) {
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return DateFormat('dd.MM, HH:mm').format(d.toLocal());
}

/// «10 000» без суффикса — для строки под балансом кошелька.
String formatUzsPlain(num v) => _uzs.format(v);

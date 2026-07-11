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

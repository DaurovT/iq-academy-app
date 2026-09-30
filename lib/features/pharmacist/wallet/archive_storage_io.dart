import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Мобильная реализация: список id архивных ваучеров — JSON-файл в папке
/// поддержки приложения. Ошибки диска не роняют экран (архив — удобство).
class VoucherArchiveStorage {
  Future<File> _file() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/wallet_voucher_archive.json');
  }

  Future<Set<int>> read() async {
    try {
      final f = await _file();
      if (!f.existsSync()) return <int>{};
      final raw = jsonDecode(await f.readAsString()) as List;
      return raw.map((e) => (e as num).toInt()).toSet();
    } catch (_) {
      return <int>{};
    }
  }

  Future<void> write(Set<int> ids) async {
    try {
      final f = await _file();
      await f.writeAsString(jsonEncode(ids.toList()));
    } catch (_) {}
  }
}

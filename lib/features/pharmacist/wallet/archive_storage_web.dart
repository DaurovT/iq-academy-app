import 'dart:convert';

import 'package:web/web.dart' as web;

/// Веб-реализация: список id архивных ваучеров в localStorage вкладки.
class VoucherArchiveStorage {
  static const _key = 'wallet_voucher_archive';

  Future<Set<int>> read() async {
    try {
      final raw = web.window.localStorage.getItem(_key);
      if (raw == null) return <int>{};
      return (jsonDecode(raw) as List).map((e) => (e as num).toInt()).toSet();
    } catch (_) {
      return <int>{};
    }
  }

  Future<void> write(Set<int> ids) async {
    try {
      web.window.localStorage.setItem(_key, jsonEncode(ids.toList()));
    } catch (_) {}
  }
}

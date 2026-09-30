import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/wallet.dart';
import 'archive_storage_io.dart'
    if (dart.library.js_interop) 'archive_storage_web.dart';
import 'wallet_common.dart';

/// Локальный архив ваучеров (id). В API архивации нет — «В архив» лишь
/// прячет ваучер из кошелька на этом устройстве; статус на сервере не
/// меняется. Хранится в файле (мобильные) / localStorage (веб).
class VoucherArchive extends Notifier<Set<int>> {
  final _storage = VoucherArchiveStorage();

  @override
  Set<int> build() {
    _load();
    return const <int>{};
  }

  Future<void> _load() async {
    final saved = await _storage.read();
    if (saved.isNotEmpty) state = {...state, ...saved};
  }

  void archive(int id) {
    state = {...state, id};
    _storage.write(state);
  }

  void restore(int id) {
    state = {...state}..remove(id);
    _storage.write(state);
  }
}

final voucherArchiveProvider = NotifierProvider<VoucherArchive, Set<int>>(
  VoucherArchive.new,
);

/// Действующие ваучеры (не использованы и не в архиве), старые → новые.
List<IssuedVoucher> activeVouchers(
  List<IssuedVoucher> all,
  Set<int> archived,
) =>
    all.where((v) => !isUsed(v) && !archived.contains(v.id)).toList()
      ..sort((a, b) => a.issuedAt.compareTo(b.issuedAt));

/// Архив: убранные вручную + использованные на кассе, новые → старые.
List<IssuedVoucher> archivedVouchers(
  List<IssuedVoucher> all,
  Set<int> archived,
) =>
    all.where((v) => isUsed(v) || archived.contains(v.id)).toList()
      ..sort((a, b) => b.issuedAt.compareTo(a.issuedAt));

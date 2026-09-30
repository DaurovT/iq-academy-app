import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/features/pharmacist/voucher_screen.dart';
import 'package:platform_app/features/pharmacist/wallet/voucher_archive_screen.dart';
import 'package:platform_app/features/pharmacist/wallet/voucher_queue_screen.dart';
import 'package:platform_app/features/pharmacist/wallet/voucher_shop_screen.dart';
import 'package:platform_app/features/pharmacist/wallet/wallet_history_screen.dart';
import 'package:platform_app/features/pharmacist/wallet_screen.dart';

import 'fixtures/wallet_fixtures.dart';
import 'pq_shot.dart';

Future<void> _wait(WidgetTester t, int ms) async {
  for (var i = 0; i < ms ~/ 100; i++) {
    await t.pump(const Duration(milliseconds: 100));
  }
}

Future<void> _openFront(WidgetTester t) async {
  await _wait(t, 1000);
  await t.tap(find.text('АКТИВЕН'));
  await _wait(t, 200);
}

void main() {
  // Кошелёк и состояния прототипа (открытие ваучера, тост архива, всё в архиве).
  pqShotBoth('Wallet', (t, dark) => pqShot(t,
      name: 'Wallet', dark: dark, height: 1720, nav: pharmacistNav,
      screen: const WalletScreen(), overrides: walletOverrides()));
  pqShotBoth('WalletOpen', (t, dark) => pqShot(t,
      name: 'WalletOpen', dark: dark, height: 1720, nav: pharmacistNav,
      screen: const WalletScreen(), overrides: walletOverrides(), before: _openFront));
  pqShotBoth('WalletToast', (t, dark) => pqShot(t,
      name: 'WalletToast', dark: dark, height: 1720, nav: pharmacistNav,
      screen: const WalletScreen(), overrides: walletOverrides(),
      settle: const Duration(milliseconds: 1500),
      before: (t) async {
        await _openFront(t);
        await _wait(t, 1000);
        await t.tap(find.text('В архив — ваучер использован'));
      }));
  pqShotBoth('WalletEmpty', (t, dark) => pqShot(t,
      name: 'WalletEmpty', dark: dark, height: 1720, nav: pharmacistNav,
      screen: const WalletScreen(),
      overrides: walletOverrides(archived: {1008, 4009, 4007})));

  pqShotBoth('WalletHistory', (t, dark) => pqShot(t,
      name: 'WalletHistory', dark: dark,
      screen: const WalletHistoryScreen(), overrides: walletOverrides(txns: walletHistoryTxns)));
  pqShotBoth('VoucherShop', (t, dark) => pqShot(t,
      name: 'VoucherShop', dark: dark,
      screen: const VoucherShopScreen(), overrides: walletOverrides(balance: 1450)));
  pqShotBoth('ExchangeConfirm', (t, dark) => pqShot(t,
      name: 'ExchangeConfirm', dark: dark,
      screen: const VoucherShopScreen(), overrides: walletOverrides(balance: 1450),
      before: (t) async {
        await _wait(t, 1000);
        await t.tap(find.textContaining('Обменять за').first);
      }));
  pqShotBoth('VoucherQueue', (t, dark) => pqShot(t,
      name: 'VoucherQueue', dark: dark,
      screen: const VoucherQueueScreen(), overrides: walletOverrides()));
  pqShotBoth('Voucher', (t, dark) => pqShot(t,
      name: 'Voucher', dark: dark, height: 960,
      screen: const VoucherScreen(id: 2036),
      overrides: walletOverrides(vouchers: voucherScreenVouchers)));
  pqShotBoth('Archive', (t, dark) => pqShot(t,
      name: 'Archive', dark: dark,
      screen: const VoucherArchiveScreen(), overrides: walletOverrides(archived: {1008, 4009})));
  pqShotBoth('ArchiveEmpty', (t, dark) => pqShot(t,
      name: 'ArchiveEmpty', dark: dark,
      screen: const VoucherArchiveScreen(), overrides: walletOverrides()));
}

// Данные макетов раздела «Кошелёк» (Wallet, WalletHistory, VoucherShop,
// ExchangeConfirm, VoucherQueue, Voucher, Archive, ArchiveEmpty).
import 'package:platform_app/core/models/wallet.dart';
import 'package:platform_app/features/pharmacist/providers.dart';
import 'package:platform_app/features/pharmacist/wallet/voucher_archive.dart';
import 'package:platform_app/features/shared/providers.dart';

const walletVouchers = [
  IssuedVoucher(id: 1008, code: 'V5852 1333 71008', amountUzs: 100000, status: 'issued', issuedAt: '2026-06-15T10:00:00'),
  IssuedVoucher(id: 4009, code: 'V5828 0255 64009', amountUzs: 50000, status: 'issued', issuedAt: '2026-06-20T10:00:00'),
  IssuedVoucher(id: 4007, code: 'V5849 8841 34007', amountUzs: 100000, status: 'issued', issuedAt: '2026-06-25T10:00:00'),
];

/// Экран «Мой ваучер»: код и номинал из макета Voucher.
const voucherScreenVouchers = [
  IssuedVoucher(id: 1008, code: 'V5852 1333 71008', amountUzs: 100000, status: 'issued', issuedAt: '2026-06-15T10:00:00'),
  IssuedVoucher(id: 4009, code: 'V5828 0255 64009', amountUzs: 50000, status: 'issued', issuedAt: '2026-06-20T10:00:00'),
  IssuedVoucher(id: 2036, code: 'V5819 3138 12036', amountUzs: 100000, status: 'issued', issuedAt: '2026-06-30T10:00:00'),
];

const walletPending = [
  PendingAccrual(id: 1, questName: 'БронхоВеда N24 + БронхоВеда', count: 7, requestedAt: '2026-07-01T10:00:00'),
  PendingAccrual(id: 2, questName: 'Бронхипрет (сироп, капли) июнь', count: 38, requestedAt: '2026-06-30T10:00:00'),
  PendingAccrual(id: 3, questName: 'КАНЕФРОН Н (капли) июнь', count: 15, requestedAt: '2026-06-30T10:00:00'),
  PendingAccrual(id: 4, questName: 'Магнерот N50 июнь', count: 10, requestedAt: '2026-06-28T10:00:00'),
  PendingAccrual(id: 5, questName: 'Цинкорот N50', count: 12, requestedAt: '2026-06-25T10:00:00'),
  PendingAccrual(id: 6, questName: 'Доритрицин N10', count: 10, requestedAt: '2026-06-20T10:00:00'),
];

const walletDenoms = [
  VoucherDenomination(faceUzs: 100000, label: '100 000 Korzinka', costIqc: 1200),
  VoucherDenomination(faceUzs: 200000, label: '200 000 Korzinka', costIqc: 2400),
];

const walletHistoryTxns = [
  WalletTxn(id: 1, type: WalletTxnType.earn, deltaUzs: 144000, refType: 'check', createdAt: '2026-07-01T12:00:00', note: 'Цинкорот №50'),
  WalletTxn(id: 2, type: WalletTxnType.earn, deltaUzs: 3000, refType: 'survey', createdAt: '2026-07-01T11:00:00', note: 'Препараты при ОРВИ'),
  WalletTxn(id: 3, type: WalletTxnType.redeem, deltaUzs: -1200000, refType: 'voucher', createdAt: '2026-06-30T10:00:00', note: 'Korzinka 100 000 сум'),
  WalletTxn(id: 4, type: WalletTxnType.earn, deltaUzs: 60000, refType: 'quest', createdAt: '2026-06-28T10:00:00', note: 'Магнерот N50'),
  WalletTxn(id: 5, type: WalletTxnType.earn, deltaUzs: 30000, refType: 'lesson', createdAt: '2026-06-18T10:00:00', note: 'Доритрицин (Андижан)'),
  WalletTxn(id: 6, type: WalletTxnType.earn, deltaUzs: 60000, refType: 'check', createdAt: '2026-06-21T10:00:00', note: 'Магнерот N50'),
];

/// Архив с заданными id (без чтения с диска).
class FixedVoucherArchive extends VoucherArchive {
  FixedVoucherArchive(this.ids);
  final Set<int> ids;

  @override
  Set<int> build() => ids;
}

List walletOverrides({
  int balance = 0,
  List<IssuedVoucher> vouchers = walletVouchers,
  Set<int> archived = const {},
  List<PendingAccrual> pending = walletPending,
  List<WalletTxn> txns = const [],
}) =>
    [
      walletProvider.overrideWith((_) async => Wallet(balanceUzs: balance * 1000, balanceIqc: balance)),
      walletTxnsProvider.overrideWith((_) async => txns),
      availableVouchersProvider.overrideWith((_) async => walletDenoms),
      myVouchersProvider.overrideWith((_) async => vouchers),
      pendingAccrualsProvider.overrideWith((_) async => pending),
      unreadCountProvider.overrideWith((_) async => 0),
      voucherArchiveProvider.overrideWith(() => FixedVoucherArchive(archived)),
    ];

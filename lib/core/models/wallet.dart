import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

/// Тип движения по кошельку (1 IQC = 1000 UZS).
enum WalletTxnType {
  @JsonValue('earn')
  earn,
  @JsonValue('redeem')
  redeem,
  @JsonValue('reversal')
  reversal,
  @JsonValue('adjust')
  adjust,
}

@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    required int balanceUzs,
    required int balanceIqc,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@freezed
abstract class WalletTxn with _$WalletTxn {
  const factory WalletTxn({
    required int id,
    required WalletTxnType type,
    required int deltaUzs,
    required String refType,
    required String createdAt,
    String? note,
  }) = _WalletTxn;

  factory WalletTxn.fromJson(Map<String, dynamic> json) =>
      _$WalletTxnFromJson(json);
}

/// Номинал ваучера (напр. «100 000 Корзинка»), покупается за IQC.
@freezed
abstract class VoucherDenomination with _$VoucherDenomination {
  const factory VoucherDenomination({
    required int faceUzs,
    required String label,
    required int costIqc,
  }) = _VoucherDenomination;

  factory VoucherDenomination.fromJson(Map<String, dynamic> json) =>
      _$VoucherDenominationFromJson(json);
}

/// Выпущенный ваучер (с QR — тот же код, что в Telegram).
@freezed
abstract class IssuedVoucher with _$IssuedVoucher {
  const factory IssuedVoucher({
    required int id,
    required String code,
    required int amountUzs,
    required String status, // 'issued' | 'used'
    required String issuedAt,
    String? qr,
  }) = _IssuedVoucher;

  factory IssuedVoucher.fromJson(Map<String, dynamic> json) =>
      _$IssuedVoucherFromJson(json);
}

/// Ожидающее начисление: квест выполнен, ваучер ждёт ручной выдачи.
@freezed
abstract class PendingAccrual with _$PendingAccrual {
  const factory PendingAccrual({
    required int id,
    required String questName,
    required int count,
    required String requestedAt,
  }) = _PendingAccrual;

  factory PendingAccrual.fromJson(Map<String, dynamic> json) =>
      _$PendingAccrualFromJson(json);
}

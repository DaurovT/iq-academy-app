// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Wallet _$WalletFromJson(Map<String, dynamic> json) => _Wallet(
  balanceUzs: (json['balanceUzs'] as num).toInt(),
  balanceIqc: (json['balanceIqc'] as num).toInt(),
);

Map<String, dynamic> _$WalletToJson(_Wallet instance) => <String, dynamic>{
  'balanceUzs': instance.balanceUzs,
  'balanceIqc': instance.balanceIqc,
};

_WalletTxn _$WalletTxnFromJson(Map<String, dynamic> json) => _WalletTxn(
  id: (json['id'] as num).toInt(),
  type: $enumDecode(_$WalletTxnTypeEnumMap, json['type']),
  deltaUzs: (json['deltaUzs'] as num).toInt(),
  refType: json['refType'] as String,
  createdAt: json['createdAt'] as String,
  note: json['note'] as String?,
);

Map<String, dynamic> _$WalletTxnToJson(_WalletTxn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$WalletTxnTypeEnumMap[instance.type]!,
      'deltaUzs': instance.deltaUzs,
      'refType': instance.refType,
      'createdAt': instance.createdAt,
      'note': instance.note,
    };

const _$WalletTxnTypeEnumMap = {
  WalletTxnType.earn: 'earn',
  WalletTxnType.redeem: 'redeem',
  WalletTxnType.reversal: 'reversal',
  WalletTxnType.adjust: 'adjust',
};

_VoucherDenomination _$VoucherDenominationFromJson(Map<String, dynamic> json) =>
    _VoucherDenomination(
      faceUzs: (json['faceUzs'] as num).toInt(),
      label: json['label'] as String,
      costIqc: (json['costIqc'] as num).toInt(),
    );

Map<String, dynamic> _$VoucherDenominationToJson(
  _VoucherDenomination instance,
) => <String, dynamic>{
  'faceUzs': instance.faceUzs,
  'label': instance.label,
  'costIqc': instance.costIqc,
};

_IssuedVoucher _$IssuedVoucherFromJson(Map<String, dynamic> json) =>
    _IssuedVoucher(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      amountUzs: (json['amountUzs'] as num).toInt(),
      status: json['status'] as String,
      issuedAt: json['issuedAt'] as String,
      qr: json['qr'] as String?,
    );

Map<String, dynamic> _$IssuedVoucherToJson(_IssuedVoucher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'amountUzs': instance.amountUzs,
      'status': instance.status,
      'issuedAt': instance.issuedAt,
      'qr': instance.qr,
    };

_PendingAccrual _$PendingAccrualFromJson(Map<String, dynamic> json) =>
    _PendingAccrual(
      id: (json['id'] as num).toInt(),
      questName: json['questName'] as String,
      count: (json['count'] as num).toInt(),
      requestedAt: json['requestedAt'] as String,
    );

Map<String, dynamic> _$PendingAccrualToJson(_PendingAccrual instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questName': instance.questName,
      'count': instance.count,
      'requestedAt': instance.requestedAt,
    };

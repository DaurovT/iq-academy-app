// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SegmentPart _$SegmentPartFromJson(Map<String, dynamic> json) => _SegmentPart(
  count: (json['count'] as num).toInt(),
  pct: (json['pct'] as num).toDouble(),
);

Map<String, dynamic> _$SegmentPartToJson(_SegmentPart instance) =>
    <String, dynamic>{'count': instance.count, 'pct': instance.pct};

_BrandSegment _$BrandSegmentFromJson(Map<String, dynamic> json) =>
    _BrandSegment(
      retail: SegmentPart.fromJson(json['retail'] as Map<String, dynamic>),
      chain: SegmentPart.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrandSegmentToJson(_BrandSegment instance) =>
    <String, dynamic>{'retail': instance.retail, 'chain': instance.chain};

_RegionStat _$RegionStatFromJson(Map<String, dynamic> json) => _RegionStat(
  region: json['region'] as String,
  value: (json['value'] as num).toInt(),
);

Map<String, dynamic> _$RegionStatToJson(_RegionStat instance) =>
    <String, dynamic>{'region': instance.region, 'value': instance.value};

_TopProduct _$TopProductFromJson(Map<String, dynamic> json) => _TopProduct(
  name: json['name'] as String,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$TopProductToJson(_TopProduct instance) =>
    <String, dynamic>{'name': instance.name, 'total': instance.total};

_BrandDashboard _$BrandDashboardFromJson(Map<String, dynamic> json) =>
    _BrandDashboard(
      checksTotal: (json['checksTotal'] as num).toInt(),
      packsTotal: (json['packsTotal'] as num).toInt(),
      activeQuests: (json['activeQuests'] as num).toInt(),
      participants: (json['participants'] as num).toInt(),
      topProducts:
          (json['topProducts'] as List<dynamic>)
              .map((e) => TopProduct.fromJson(e as Map<String, dynamic>))
              .toList(),
      topSellers:
          (json['topSellers'] as List<dynamic>)
              .map((e) => TopSeller.fromJson(e as Map<String, dynamic>))
              .toList(),
      segmentation: BrandSegment.fromJson(
        json['segmentation'] as Map<String, dynamic>,
      ),
      regions:
          (json['regions'] as List<dynamic>)
              .map((e) => RegionStat.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BrandDashboardToJson(_BrandDashboard instance) =>
    <String, dynamic>{
      'checksTotal': instance.checksTotal,
      'packsTotal': instance.packsTotal,
      'activeQuests': instance.activeQuests,
      'participants': instance.participants,
      'topProducts': instance.topProducts,
      'topSellers': instance.topSellers,
      'segmentation': instance.segmentation,
      'regions': instance.regions,
    };

_BrandQuest _$BrandQuestFromJson(Map<String, dynamic> json) => _BrandQuest(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: $enumDecode(_$QuestStatusEnumMap, json['status']),
  sponsor: json['sponsor'] as String,
  products:
      (json['products'] as List<dynamic>).map((e) => e as String).toList(),
  mxik: json['mxik'] as String,
  prizeIqc: (json['prizeIqc'] as num).toInt(),
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
  perUserLimit: (json['perUserLimit'] as num?)?.toInt(),
  budgetFunded: (json['budgetFunded'] as num).toInt(),
  budgetSpent: (json['budgetSpent'] as num).toInt(),
  participants: (json['participants'] as num).toInt(),
  completions: (json['completions'] as num).toInt(),
);

Map<String, dynamic> _$BrandQuestToJson(_BrandQuest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$QuestStatusEnumMap[instance.status]!,
      'sponsor': instance.sponsor,
      'products': instance.products,
      'mxik': instance.mxik,
      'prizeIqc': instance.prizeIqc,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'perUserLimit': instance.perUserLimit,
      'budgetFunded': instance.budgetFunded,
      'budgetSpent': instance.budgetSpent,
      'participants': instance.participants,
      'completions': instance.completions,
    };

const _$QuestStatusEnumMap = {
  QuestStatus.active: 'active',
  QuestStatus.disabled: 'disabled',
};

_BrandProduct _$BrandProductFromJson(Map<String, dynamic> json) =>
    _BrandProduct(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as String,
      mxik: json['mxik'] as String,
      divisible: json['divisible'] as bool,
      format: json['format'] as String,
      imageUrl: json['imageUrl'] as String?,
      questCount: (json['questCount'] as num).toInt(),
    );

Map<String, dynamic> _$BrandProductToJson(_BrandProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'mxik': instance.mxik,
      'divisible': instance.divisible,
      'format': instance.format,
      'imageUrl': instance.imageUrl,
      'questCount': instance.questCount,
    };

_BrandInfo _$BrandInfoFromJson(Map<String, dynamic> json) => _BrandInfo(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  manufacturer: json['manufacturer'] as String,
  bannerUrl: json['bannerUrl'] as String?,
  subBrands:
      (json['subBrands'] as List<dynamic>).map((e) => e as String).toList(),
  questCount: (json['questCount'] as num).toInt(),
);

Map<String, dynamic> _$BrandInfoToJson(_BrandInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'manufacturer': instance.manufacturer,
      'bannerUrl': instance.bannerUrl,
      'subBrands': instance.subBrands,
      'questCount': instance.questCount,
    };

_SalesLogRow _$SalesLogRowFromJson(Map<String, dynamic> json) => _SalesLogRow(
  id: (json['id'] as num).toInt(),
  date: json['date'] as String,
  pharmacist: json['pharmacist'] as String,
  shop: json['shop'] as String,
  product: json['product'] as String,
  qty: (json['qty'] as num).toInt(),
  region: json['region'] as String,
);

Map<String, dynamic> _$SalesLogRowToJson(_SalesLogRow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'pharmacist': instance.pharmacist,
      'shop': instance.shop,
      'product': instance.product,
      'qty': instance.qty,
      'region': instance.region,
    };

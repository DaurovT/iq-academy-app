import 'package:freezed_annotation/freezed_annotation.dart';
import 'quest.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

@freezed
abstract class SegmentPart with _$SegmentPart {
  const factory SegmentPart({
    required int count,
    required double pct,
  }) = _SegmentPart;

  factory SegmentPart.fromJson(Map<String, dynamic> json) =>
      _$SegmentPartFromJson(json);
}

@freezed
abstract class BrandSegment with _$BrandSegment {
  const factory BrandSegment({
    required SegmentPart retail,
    required SegmentPart chain,
  }) = _BrandSegment;

  factory BrandSegment.fromJson(Map<String, dynamic> json) =>
      _$BrandSegmentFromJson(json);
}

@freezed
abstract class RegionStat with _$RegionStat {
  const factory RegionStat({
    required String region,
    required int value,
  }) = _RegionStat;

  factory RegionStat.fromJson(Map<String, dynamic> json) =>
      _$RegionStatFromJson(json);
}

@freezed
abstract class TopProduct with _$TopProduct {
  const factory TopProduct({
    required String name,
    required int total,
  }) = _TopProduct;

  factory TopProduct.fromJson(Map<String, dynamic> json) =>
      _$TopProductFromJson(json);
}

@freezed
abstract class BrandDashboard with _$BrandDashboard {
  const factory BrandDashboard({
    required int checksTotal,
    required int packsTotal,
    required int activeQuests,
    required int participants,
    required List<TopProduct> topProducts,
    required List<TopSeller> topSellers,
    required BrandSegment segmentation,
    required List<RegionStat> regions,
  }) = _BrandDashboard;

  factory BrandDashboard.fromJson(Map<String, dynamic> json) =>
      _$BrandDashboardFromJson(json);
}

@freezed
abstract class BrandQuest with _$BrandQuest {
  const factory BrandQuest({
    required int id,
    required String name,
    required QuestStatus status,
    required String sponsor,
    required List<String> products,
    required String mxik,
    required int prizeIqc,
    required String startDate,
    String? endDate,
    int? perUserLimit,
    required int budgetFunded,
    required int budgetSpent,
    required int participants,
    required int completions,
  }) = _BrandQuest;

  factory BrandQuest.fromJson(Map<String, dynamic> json) =>
      _$BrandQuestFromJson(json);
}

@freezed
abstract class BrandProduct with _$BrandProduct {
  const factory BrandProduct({
    required int id,
    required String name,
    required String brand,
    required String mxik,
    required bool divisible,
    required String format,
    String? imageUrl,
    required int questCount,
  }) = _BrandProduct;

  factory BrandProduct.fromJson(Map<String, dynamic> json) =>
      _$BrandProductFromJson(json);
}

@freezed
abstract class BrandInfo with _$BrandInfo {
  const factory BrandInfo({
    required int id,
    required String name,
    required String manufacturer,
    String? bannerUrl,
    required List<String> subBrands,
    required int questCount,
  }) = _BrandInfo;

  factory BrandInfo.fromJson(Map<String, dynamic> json) =>
      _$BrandInfoFromJson(json);
}

@freezed
abstract class SalesLogRow with _$SalesLogRow {
  const factory SalesLogRow({
    required int id,
    required String date,
    required String pharmacist,
    required String shop,
    required String product,
    required int qty,
    required String region,
  }) = _SalesLogRow;

  factory SalesLogRow.fromJson(Map<String, dynamic> json) =>
      _$SalesLogRowFromJson(json);
}

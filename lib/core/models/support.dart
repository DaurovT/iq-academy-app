import 'package:freezed_annotation/freezed_annotation.dart';

part 'support.freezed.dart';
part 'support.g.dart';

@freezed
abstract class SupportMessage with _$SupportMessage {
  const factory SupportMessage({
    required int id,
    required String from, // 'user' | 'admin'
    required String text,
    required String createdAt,
  }) = _SupportMessage;

  factory SupportMessage.fromJson(Map<String, dynamic> json) =>
      _$SupportMessageFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'common.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// Аккаунт пользователя (types.ts: Account). Один аккаунт может иметь
/// несколько ролей — активную выбирает пользователь после входа.
@freezed
abstract class Account with _$Account {
  const factory Account({
    required int id,
    required String phone,
    required String fullName,
    required Language language,
    required List<Role> roles,

    /// Имя для обращения, если сервер его отдаёт (иначе берём из [fullName]).
    String? firstName,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// Сессия — токен + аккаунт (возврат confirmCode / register).
@freezed
abstract class Session with _$Session {
  const factory Session({
    required String token,
    required Account account,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

/// Старт входа через Telegram-бота (deep-link + nonce для поллинга).
@freezed
abstract class TgLoginStart with _$TgLoginStart {
  const factory TgLoginStart({
    required String nonce,
    required String botUrl,
    required String deepLink,
    required int expiresIn,
  }) = _TgLoginStart;

  factory TgLoginStart.fromJson(Map<String, dynamic> json) =>
      _$TgLoginStartFromJson(json);
}

/// Результат поллинга Telegram-входа. Union по полю `status`
/// (аналог TS-объединения TgPollResult).
@Freezed(unionKey: 'status')
sealed class TgPollResult with _$TgPollResult {
  const factory TgPollResult.pending() = TgPollPending;
  /// `reason: "not_registered"` — этого Telegram нет в PharmIQ, аккаунт не создан:
  /// ведём на регистрацию. Без причины — обычное истечение ссылки.
  const factory TgPollResult.expired({String? reason, String? message}) = TgPollExpired;
  const factory TgPollResult.done({
    required String token,
    required Account account,
  }) = TgPollDone;

  factory TgPollResult.fromJson(Map<String, dynamic> json) =>
      _$TgPollResultFromJson(json);
}

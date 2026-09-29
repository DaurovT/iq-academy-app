import 'account.dart';

/// Результат входа через Google/Apple и шагов подтверждения номера.
///
/// Аккаунт у нас привязан к телефону, поэтому внешний вход — это «ключ» к нему:
/// уже привязан → [OAuthDone]; нет → подтвердить номер ([OAuthLinkRequired]);
/// номера нет ни у нас, ни в ботах → регистрация ([OAuthRegisterRequired]).
sealed class OAuthResult {
  const OAuthResult();
}

class OAuthDone extends OAuthResult {
  const OAuthDone(this.session);
  final Session session;
}

class OAuthLinkRequired extends OAuthResult {
  const OAuthLinkRequired({required this.linkToken, this.email, this.fullName});
  final String linkToken;
  final String? email;
  final String? fullName;
}

class OAuthRegisterRequired extends OAuthResult {
  const OAuthRegisterRequired(
      {required this.linkToken, required this.phone, this.fullName});
  final String linkToken;
  final String phone;
  final String? fullName;
}

OAuthResult parseOAuthResult(Map<String, dynamic> j) => switch (j['status']) {
      'done' => OAuthDone(Session.fromJson(j)),
      'link_required' => OAuthLinkRequired(
          linkToken: j['linkToken'] as String,
          email: j['email'] as String?,
          fullName: j['fullName'] as String?,
        ),
      'register_required' => OAuthRegisterRequired(
          linkToken: j['linkToken'] as String,
          phone: j['phone'] as String,
          fullName: j['fullName'] as String?,
        ),
      _ => throw FormatException('Неизвестный ответ входа: ${j['status']}'),
    };

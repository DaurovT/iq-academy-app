import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/account.dart';
import '../models/common.dart';
import '../models/wallet.dart';
import '../models/quest.dart';
import '../models/learn.dart';
import '../models/check.dart';
import '../models/notification.dart';
import '../models/medrep.dart';
import '../models/brand.dart';
import '../models/registration.dart';
import '../models/support.dart';
import '../models/news.dart';
import '../models/survey.dart';
import '../models/sapper.dart';
import 'platform_api.dart';
import 'upload.dart';

/// Реализация контракта против platform_api (аналог http.ts).
class HttpApi implements PlatformApi {
  HttpApi(Dio dio)
      : auth = HttpAuthApi(dio),
        reference = HttpReferenceApi(dio),
        account = HttpAccountApi(dio),
        wallet = HttpWalletApi(dio),
        quests = HttpQuestsApi(dio),
        catalog = HttpCatalogApi(dio),
        checks = HttpChecksApi(dio),
        recipes = HttpRecipesApi(dio),
        notifications = HttpNotificationsApi(dio),
        medrep = HttpMedrepApi(dio),
        brand = HttpBrandApi(dio),
        support = HttpSupportApi(dio),
        news = HttpNewsApi(dio),
        surveys = HttpSurveysApi(dio),
        miniApps = HttpMiniAppsApi(dio),
        sapper = HttpSapperApi(dio);

  @override
  final AuthApi auth;
  @override
  final ReferenceApi reference;
  @override
  final AccountApi account;
  @override
  final WalletApi wallet;
  @override
  final QuestsApi quests;
  @override
  final CatalogApi catalog;
  @override
  final ChecksApi checks;
  @override
  final RecipesApi recipes;
  @override
  final NotificationsApi notifications;
  @override
  final MedrepApi medrep;
  @override
  final BrandApi brand;
  @override
  final SupportApi support;
  @override
  final NewsApi news;
  @override
  final SurveysApi surveys;
  @override
  final MiniAppsApi miniApps;
  @override
  final SapperApi sapper;
}

/// Разбор JSON-массива в список моделей.
List<T> _list<T>(Object? data, T Function(Map<String, dynamic>) fromJson) =>
    (data as List)
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList(growable: false);

Map<String, dynamic> _obj(Object? data) => data as Map<String, dynamic>;

class HttpAuthApi implements AuthApi {
  HttpAuthApi(this._dio);
  final Dio _dio;

  @override
  Future<({bool exists})> checkNumber(String phone) async {
    final r = await _dio.post('/auth/check-number', data: {'phone': phone});
    return (exists: r.data['exists'] as bool);
  }

  @override
  Future<void> sendSms(String phone) async {
    await _dio.post('/auth/send-sms', data: {'phone': phone});
  }

  @override
  Future<Session> confirmCode(String phone, String code) async {
    final r = await _dio
        .post('/auth/confirm-code', data: {'phone': phone, 'code': code});
    return Session.fromJson(_obj(r.data));
  }

  @override
  Future<Account> session() async {
    final r = await _dio.post('/auth/userCheck');
    return Account.fromJson(_obj(r.data));
  }

  @override
  Future<void> logout() async {
    await _dio.post('/auth/logOut');
  }

  @override
  Future<Session> register(
      Role role, String schemaVersion, Map<String, dynamic> values) async {
    final r = await _dio.post('/auth/register', data: {
      'role': role.apiValue,
      'schemaVersion': schemaVersion,
      'values': values,
    });
    return Session.fromJson(_obj(r.data));
  }

  @override
  Future<TgLoginStart> telegramStart() async {
    final r = await _dio.post('/auth/telegram/start', data: {});
    return TgLoginStart.fromJson(_obj(r.data));
  }

  @override
  Future<TgPollResult> telegramPoll(String nonce) async {
    final r = await _dio.post('/auth/telegram/poll', data: {'nonce': nonce});
    // Диагностика: печатаем сырой ответ, чтобы видеть точную форму `done`.
    if (kDebugMode) debugPrint('[tg/poll] raw response: ${r.data}');
    return TgPollResult.fromJson(_obj(r.data));
  }
}

class HttpReferenceApi implements ReferenceApi {
  HttpReferenceApi(this._dio);
  final Dio _dio;

  @override
  Future<RegistrationSchema> registrationSchema(Role role) async {
    final r = await _dio.get('/reference/registration-schema',
        queryParameters: {'role': role.apiValue});
    return RegistrationSchema.fromJson(_obj(r.data));
  }

  @override
  Future<List<RefItem>> cities() async {
    final r = await _dio.get('/reference/cities');
    return _list(r.data, RefItem.fromJson);
  }

  @override
  Future<List<RefItem>> specialties() async {
    final r = await _dio.get('/reference/specialties');
    return _list(r.data, RefItem.fromJson);
  }
}

class HttpAccountApi implements AccountApi {
  HttpAccountApi(this._dio);
  final Dio _dio;

  @override
  Future<AccountSettings> settings() async {
    final r = await _dio.get('/client/account/settings');
    return AccountSettings.fromJson(_obj(r.data));
  }

  @override
  Future<void> setLanguage(Language lang) async {
    await _dio.post('/client/account/language', data: {'lang': lang.code});
  }

  @override
  Future<({String botUrl, String deepLink})> telegramLinkStart() async {
    final r = await _dio.post('/client/account/telegram/start');
    return (
      botUrl: r.data['botUrl'] as String,
      deepLink: r.data['deepLink'] as String,
    );
  }

  @override
  Future<({bool linked})> telegramLinkConfirm() async {
    final r = await _dio.post('/client/account/telegram/confirm');
    return (linked: r.data['linked'] as bool);
  }

  @override
  Future<void> logoutAll() async {
    await _dio.post('/client/account/logout-all');
  }

  @override
  Future<void> deleteAccount() async {
    await _dio.delete('/client/account');
  }

  @override
  Future<({bool sent})> changePhoneStart(String phone) async {
    final r =
        await _dio.post('/client/account/phone/start', data: {'phone': phone});
    return (sent: r.data['sent'] as bool);
  }

  @override
  Future<({String phone})> changePhoneConfirm(String phone, String code) async {
    final r = await _dio.post('/client/account/phone/confirm',
        data: {'phone': phone, 'code': code});
    return (phone: r.data['phone'] as String);
  }
}

class HttpWalletApi implements WalletApi {
  HttpWalletApi(this._dio);
  final Dio _dio;

  @override
  Future<Wallet> get() async {
    final r = await _dio.get('/client/wallet');
    return Wallet.fromJson(_obj(r.data));
  }

  @override
  Future<List<WalletTxn>> transactions() async {
    final r = await _dio.get('/client/wallet/transactions');
    return _list(r.data, WalletTxn.fromJson);
  }

  @override
  Future<List<PendingAccrual>> pendingAccruals() async {
    final r = await _dio.get('/client/wallet/pending');
    return _list(r.data, PendingAccrual.fromJson);
  }

  @override
  Future<List<VoucherDenomination>> availableVouchers() async {
    final r = await _dio.get('/client/rewards/vouchers/available');
    return _list(r.data, VoucherDenomination.fromJson);
  }

  @override
  Future<List<IssuedVoucher>> myVouchers() async {
    final r = await _dio.get('/client/rewards/vouchers/mine');
    return _list(r.data, IssuedVoucher.fromJson);
  }

  @override
  Future<({bool ok, Wallet wallet})> redeem(int faceUzs) async {
    final r =
        await _dio.post('/client/wallet/redeem', data: {'faceUzs': faceUzs});
    return (ok: r.data['ok'] as bool, wallet: Wallet.fromJson(_obj(r.data['wallet'])));
  }
}

class HttpQuestsApi implements QuestsApi {
  HttpQuestsApi(this._dio);
  final Dio _dio;

  @override
  Future<List<Quest>> list([QuestTarget? target]) async {
    final r = await _dio.get('/client/quests',
        queryParameters: target == null ? null : {'target': target.code});
    return _list(r.data, Quest.fromJson);
  }

  @override
  Future<QuestDetail> get(int id) async {
    final r = await _dio.get('/client/quests/$id');
    return QuestDetail.fromJson(_obj(r.data));
  }

  @override
  Future<List<QuestParticipation>> participations() async {
    final r = await _dio.get('/client/quests/participations');
    return _list(r.data, QuestParticipation.fromJson);
  }
}

class HttpCatalogApi implements CatalogApi {
  HttpCatalogApi(this._dio);
  final Dio _dio;

  @override
  Future<List<Course>> courses([Role? role]) async {
    final r = await _dio.get('/client/catalog/courses',
        queryParameters: role == null ? null : {'role': role.apiValue});
    return _list(r.data, Course.fromJson);
  }

  @override
  Future<CourseDetail> course(int id, [Role? role]) async {
    final r = await _dio.get('/client/catalog/courses/$id',
        queryParameters: role == null ? null : {'role': role.apiValue});
    return CourseDetail.fromJson(_obj(r.data));
  }

  @override
  Future<({Wallet wallet, int rewardIqc})> completeLesson(
      int courseId, int lessonId) async {
    final r = await _dio
        .post('/client/catalog/courses/$courseId/lessons/$lessonId/complete');
    return (
      wallet: Wallet.fromJson(_obj(r.data['wallet'])),
      rewardIqc: r.data['rewardIqc'] as int,
    );
  }

  @override
  Future<Quiz> quiz(int courseId, int lessonId) async {
    final r = await _dio
        .get('/client/catalog/courses/$courseId/lessons/$lessonId/quiz');
    return Quiz.fromJson(_obj(r.data));
  }

  @override
  Future<QuizResult> submitQuiz(
      int courseId, int lessonId, List<QuizAnswer> answers) async {
    final r = await _dio.post(
      '/client/catalog/courses/$courseId/lessons/$lessonId/quiz',
      data: {'answers': answers.map((a) => a.toJson()).toList()},
    );
    return QuizResult.fromJson(_obj(r.data));
  }
}

/// Multipart-загрузка фото (чеки/рецепты).
Future<Response> _upload(Dio dio, String path, List<UploadFile> files,
    Map<String, String?> fields) async {
  final form = FormData();
  for (var i = 0; i < files.length; i++) {
    form.files.add(MapEntry(
      'files',
      await MultipartFile.fromFile(files[i].path,
          filename: files[i].filename ?? 'photo_$i.jpg'),
    ));
  }
  fields.forEach((k, v) {
    if (v != null) form.fields.add(MapEntry(k, v));
  });
  return dio.post(path, data: form);
}

class HttpChecksApi implements ChecksApi {
  HttpChecksApi(this._dio);
  final Dio _dio;

  @override
  Future<List<Check>> mine() async {
    final r = await _dio.get('/client/checks');
    return _list(r.data, Check.fromJson);
  }

  @override
  Future<Check> submit(List<UploadFile> files,
      {String? checkDate, String? idempotencyKey}) async {
    final r = await _upload(_dio, '/client/checks', files, {
      'checkDate': checkDate,
      'idempotencyKey': idempotencyKey,
    });
    return Check.fromJson(_obj(r.data));
  }

  @override
  Future<CheckDetail> get(int id) async {
    final r = await _dio.get('/client/checks/$id');
    return CheckDetail.fromJson(_obj(r.data));
  }
}

class HttpRecipesApi implements RecipesApi {
  HttpRecipesApi(this._dio);
  final Dio _dio;

  @override
  Future<List<Recipe>> mine() async {
    final r = await _dio.get('/client/recipes');
    return _list(r.data, Recipe.fromJson);
  }

  @override
  Future<Recipe> submit(List<UploadFile> files,
      {String? checkDate,
      String? idempotencyKey,
      DoctorRecipeInfo? doctor}) async {
    final r = await _upload(_dio, '/client/recipes', files, {
      'checkDate': checkDate,
      'idempotencyKey': idempotencyKey,
      'doctorName': doctor?.name,
      'doctorWorkplace': doctor?.workplace,
      'doctorCity': doctor?.city,
      'doctorPhone': doctor?.phone,
    });
    return Recipe.fromJson(_obj(r.data));
  }

  @override
  Future<RecipeDetail> get(int id) async {
    final r = await _dio.get('/client/recipes/$id');
    return RecipeDetail.fromJson(_obj(r.data));
  }
}

class HttpNotificationsApi implements NotificationsApi {
  HttpNotificationsApi(this._dio);
  final Dio _dio;

  @override
  Future<List<AppNotification>> list() async {
    final r = await _dio.get('/client/notifications');
    return _list(r.data, AppNotification.fromJson);
  }

  @override
  Future<int> unreadCount() async {
    final r = await _dio.get('/client/notifications/unread-count');
    // Бэк может вернуть число или {count}.
    final d = r.data;
    if (d is int) return d;
    if (d is Map && d['count'] is int) return d['count'] as int;
    return 0;
  }

  @override
  Future<void> markAllRead() async {
    await _dio.post('/client/notifications/mark-read');
  }

  @override
  Future<void> markRead(int id) async {
    await _dio.post('/client/notifications/$id/read');
  }

  @override
  Future<NotificationSettings> settings() async {
    final r = await _dio.get('/client/notifications/settings');
    return NotificationSettings.fromJson(_obj(r.data));
  }

  @override
  Future<void> setSettings(NotificationSettings s) async {
    await _dio.put('/client/notifications/settings', data: s.toJson());
  }
}

class HttpMedrepApi implements MedrepApi {
  HttpMedrepApi(this._dio);
  final Dio _dio;

  @override
  Future<MedrepMetrics> metrics({String? dateFrom, String? dateTo}) async {
    final r = await _dio.get('/client/medrep/metrics',
        queryParameters: dateFrom == null
            ? null
            : {'from': dateFrom, 'to': dateTo});
    return MedrepMetrics.fromJson(_obj(r.data));
  }

  @override
  Future<List<PortfolioPharmacist>> portfolio() async {
    final r = await _dio.get('/client/medrep/pharmacists');
    return _list(r.data, PortfolioPharmacist.fromJson);
  }

  @override
  Future<PharmacistDetail> pharmacist(int telegramId) async {
    final r = await _dio.get('/client/medrep/pharmacists/$telegramId');
    return PharmacistDetail.fromJson(_obj(r.data));
  }

  @override
  Future<Leaderboard> leaderboard(String metric) async {
    final r = await _dio.get('/client/medrep/leaderboard',
        queryParameters: {'metric': metric});
    return Leaderboard.fromJson(_obj(r.data));
  }

  @override
  Future<List<MedrepQuest>> quests() async {
    final r = await _dio.get('/client/medrep/quests');
    return _list(r.data, MedrepQuest.fromJson);
  }

  @override
  Future<String> reflink() async {
    final r = await _dio.get('/client/medrep/reflink');
    return r.data['url'] as String;
  }

  @override
  Future<List<Company>> companies() async {
    final r = await _dio.get('/client/medrep/companies');
    return _list(r.data, Company.fromJson);
  }

  @override
  Future<List<PendingReferral>> pendingReferrals() async {
    final r = await _dio.get('/client/medrep/referrals/pending');
    return _list(r.data, PendingReferral.fromJson);
  }

  @override
  Future<void> acceptReferral(int id) async {
    await _dio.post('/client/medrep/referrals/$id/accept');
  }

  @override
  Future<void> rejectReferral(int id) async {
    await _dio.post('/client/medrep/referrals/$id/reject');
  }

  @override
  Future<void> incentivize(int telegramId, int rating, String note) async {
    await _dio.post('/client/medrep/pharmacists/$telegramId/incentivize',
        data: {'rating': rating, 'note': note});
  }
}

class HttpBrandApi implements BrandApi {
  HttpBrandApi(this._dio);
  final Dio _dio;

  @override
  Future<BrandDashboard> dashboard() async {
    final r = await _dio.get('/brand/dashboard');
    return BrandDashboard.fromJson(_obj(r.data));
  }

  @override
  Future<List<BrandQuest>> quests() async {
    final r = await _dio.get('/brand/quests');
    return _list(r.data, BrandQuest.fromJson);
  }

  @override
  Future<BrandQuest> quest(int id) async {
    final r = await _dio.get('/brand/quests/$id');
    return BrandQuest.fromJson(_obj(r.data));
  }

  @override
  Future<List<BrandProduct>> products() async {
    final r = await _dio.get('/brand/products');
    return _list(r.data, BrandProduct.fromJson);
  }

  @override
  Future<BrandProduct> product(int id) async {
    final r = await _dio.get('/brand/products/$id');
    return BrandProduct.fromJson(_obj(r.data));
  }

  @override
  Future<List<BrandInfo>> brands() async {
    final r = await _dio.get('/brand/brands');
    return _list(r.data, BrandInfo.fromJson);
  }

  @override
  Future<BrandInfo> brandInfo(int id) async {
    final r = await _dio.get('/brand/brands/$id');
    return BrandInfo.fromJson(_obj(r.data));
  }

  @override
  Future<List<SalesLogRow>> salesLog([int? questId]) async {
    final r = await _dio.get('/brand/sales-log',
        queryParameters: questId == null ? null : {'questId': questId});
    return _list(r.data, SalesLogRow.fromJson);
  }
}

class HttpSupportApi implements SupportApi {
  HttpSupportApi(this._dio);
  final Dio _dio;

  @override
  Future<List<SupportMessage>> thread() async {
    final r = await _dio.get('/client/support/thread');
    return _list(r.data, SupportMessage.fromJson);
  }

  @override
  Future<SupportMessage> send(String text) async {
    final r = await _dio.post('/client/support/thread', data: {'text': text});
    return SupportMessage.fromJson(_obj(r.data));
  }
}

class HttpNewsApi implements NewsApi {
  HttpNewsApi(this._dio);
  final Dio _dio;

  @override
  Future<List<NewsItem>> list() async {
    final r = await _dio.get('/client/news');
    return _list(r.data, NewsItem.fromJson);
  }

  @override
  Future<NewsDetail> get(int id) async {
    final r = await _dio.get('/client/news/$id');
    return NewsDetail.fromJson(_obj(r.data));
  }
}

class HttpSurveysApi implements SurveysApi {
  HttpSurveysApi(this._dio);
  final Dio _dio;

  @override
  Future<Survey?> next() async {
    final r = await _dio.get('/client/surveys/next');
    if (r.data == null) return null;
    return Survey.fromJson(_obj(r.data));
  }

  @override
  Future<SurveyAnswerResult> answer(int id,
      {int? optionId, String? text, int? rating}) async {
    final r = await _dio.post('/client/surveys/$id/answer', data: {
      if (optionId != null) 'optionId': optionId,
      if (text != null) 'text': text,
      if (rating != null) 'rating': rating,
    });
    return SurveyAnswerResult.fromJson(_obj(r.data));
  }
}

class HttpMiniAppsApi implements MiniAppsApi {
  HttpMiniAppsApi(this._dio);
  final Dio _dio;

  @override
  Future<List<MiniApp>> list() async {
    final r = await _dio.get('/client/mini-apps');
    return _list(r.data, MiniApp.fromJson);
  }
}

class HttpSapperApi implements SapperApi {
  HttpSapperApi(this._dio);
  final Dio _dio;

  @override
  Future<List<SapperDrawItem>> draws() async {
    final r = await _dio.get('/client/sapper/draws');
    return _list(r.data, SapperDrawItem.fromJson);
  }

  @override
  Future<SapperField> field(int id) async {
    final r = await _dio.get('/client/sapper/draws/$id');
    return SapperField.fromJson(_obj(r.data));
  }

  @override
  Future<SapperReserveResult> reserve(int id, int cellIndex) async {
    final r = await _dio.post('/client/sapper/draws/$id/reserve', data: {'cellIndex': cellIndex});
    return SapperReserveResult.fromJson(_obj(r.data));
  }
}

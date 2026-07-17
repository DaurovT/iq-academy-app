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
import 'upload.dart';

/// Контракт платформы — прямое зеркало web/src/lib/api/contract.ts.
/// UI и провайдеры зависят ТОЛЬКО от этих интерфейсов, а не от Dio.
abstract interface class PlatformApi {
  AuthApi get auth;
  ReferenceApi get reference;
  AccountApi get account;
  WalletApi get wallet;
  QuestsApi get quests;
  CatalogApi get catalog;
  ChecksApi get checks;
  RecipesApi get recipes;
  NotificationsApi get notifications;
  MedrepApi get medrep;
  BrandApi get brand;
  SupportApi get support;
  NewsApi get news;
  SurveysApi get surveys;
  MiniAppsApi get miniApps;
  SapperApi get sapper;
  DevicesApi get devices;
}

/// Токены устройств для пуш-уведомлений (FCM).
abstract interface class DevicesApi {
  Future<void> register(String token, String platform);
  Future<void> unregister(String token);
}

abstract interface class MiniAppsApi {
  Future<List<MiniApp>> list();
}

abstract interface class SapperApi {
  Future<List<SapperDrawItem>> draws();
  Future<SapperField> field(int id);
  Future<SapperReserveResult> reserve(int id, int cellIndex);
}

abstract interface class NewsApi {
  Future<List<NewsItem>> list();
  Future<NewsDetail> get(int id);
}

abstract interface class SurveysApi {
  Future<Survey?> next();
  Future<SurveyAnswerResult> answer(int id,
      {int? optionId, String? text, int? rating});
}

abstract interface class AuthApi {
  Future<({bool exists})> checkNumber(String phone);
  Future<void> sendSms(String phone);
  Future<Session> confirmCode(String phone, String code);
  Future<Account> session();
  Future<void> logout();
  Future<Session> register(
      Role role, String schemaVersion, Map<String, dynamic> values);
  Future<TgLoginStart> telegramStart();
  Future<TgPollResult> telegramPoll(String nonce);
}

abstract interface class ReferenceApi {
  Future<RegistrationSchema> registrationSchema(Role role);
  Future<List<RefItem>> cities();
  Future<List<RefItem>> specialties();
}

abstract interface class AccountApi {
  Future<AccountSettings> settings();
  Future<void> setLanguage(Language lang);
  Future<({String botUrl, String deepLink})> telegramLinkStart();
  Future<({bool linked})> telegramLinkConfirm();
  Future<void> logoutAll();
  Future<void> deleteAccount();
  Future<({bool sent})> changePhoneStart(String phone);
  Future<({String phone})> changePhoneConfirm(String phone, String code);
}

abstract interface class WalletApi {
  Future<Wallet> get();
  Future<List<WalletTxn>> transactions();
  Future<List<PendingAccrual>> pendingAccruals();
  Future<List<VoucherDenomination>> availableVouchers();
  Future<List<IssuedVoucher>> myVouchers();
  Future<({bool ok, Wallet wallet})> redeem(int faceUzs);
}

abstract interface class QuestsApi {
  Future<List<Quest>> list([QuestTarget? target]);
  Future<QuestDetail> get(int id);
  Future<List<QuestParticipation>> participations();
}

abstract interface class CatalogApi {
  Future<List<Course>> courses([Role? role]);
  Future<CourseDetail> course(int id, [Role? role]);
  Future<({Wallet wallet, int rewardIqc})> completeLesson(
      int courseId, int lessonId);
  Future<Quiz> quiz(int courseId, int lessonId);
  Future<QuizResult> submitQuiz(
      int courseId, int lessonId, List<QuizAnswer> answers);
}

abstract interface class ChecksApi {
  Future<List<Check>> mine();
  Future<Check> submit(List<UploadFile> files,
      {String? checkDate, String? idempotencyKey});
  Future<CheckDetail> get(int id);
}

abstract interface class RecipesApi {
  Future<List<Recipe>> mine();
  Future<Recipe> submit(List<UploadFile> files,
      {String? checkDate, String? idempotencyKey, DoctorRecipeInfo? doctor});
  Future<RecipeDetail> get(int id);
}

abstract interface class NotificationsApi {
  Future<List<AppNotification>> list();
  Future<int> unreadCount();
  Future<void> markAllRead();
  Future<void> markRead(int id);
  Future<NotificationSettings> settings();
  Future<void> setSettings(NotificationSettings s);
}

abstract interface class MedrepApi {
  Future<MedrepMetrics> metrics({String? dateFrom, String? dateTo});
  Future<List<PortfolioPharmacist>> portfolio();
  Future<PharmacistDetail> pharmacist(int telegramId);
  Future<Leaderboard> leaderboard(String metric);
  Future<List<MedrepQuest>> quests();
  Future<String> reflink();
  Future<List<Company>> companies();
  Future<List<PendingReferral>> pendingReferrals();
  Future<void> acceptReferral(int id);
  Future<void> rejectReferral(int id);
  Future<void> incentivize(int telegramId, int rating, String note);
}

abstract interface class BrandApi {
  Future<BrandDashboard> dashboard();
  Future<List<BrandQuest>> quests();
  Future<BrandQuest> quest(int id);
  Future<List<BrandProduct>> products();
  Future<BrandProduct> product(int id);
  Future<List<BrandInfo>> brands();
  Future<BrandInfo> brandInfo(int id);
  Future<List<SalesLogRow>> salesLog([int? questId]);
}

abstract interface class SupportApi {
  Future<List<SupportMessage>> thread();
  Future<SupportMessage> send(String text);
}

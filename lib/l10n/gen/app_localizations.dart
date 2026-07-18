import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'IQ Academy'**
  String get appTitle;

  /// No description provided for @apiNetworkError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка сети'**
  String get apiNetworkError;

  /// No description provided for @apiNoAccess.
  ///
  /// In ru, this message translates to:
  /// **'Нет доступа'**
  String get apiNoAccess;

  /// No description provided for @checkModelStatusPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get checkModelStatusPending;

  /// No description provided for @checkModelStatusAiDetected.
  ///
  /// In ru, this message translates to:
  /// **'Распознан ИИ'**
  String get checkModelStatusAiDetected;

  /// No description provided for @checkModelStatusAiWrong.
  ///
  /// In ru, this message translates to:
  /// **'ИИ не распознал'**
  String get checkModelStatusAiWrong;

  /// No description provided for @checkModelStatusApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get checkModelStatusApproved;

  /// No description provided for @checkModelStatusRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get checkModelStatusRejected;

  /// No description provided for @commonRolePharmacist.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевт'**
  String get commonRolePharmacist;

  /// No description provided for @commonRoleDoctor.
  ///
  /// In ru, this message translates to:
  /// **'Врач'**
  String get commonRoleDoctor;

  /// No description provided for @commonRoleMedrep.
  ///
  /// In ru, this message translates to:
  /// **'Мед. представитель'**
  String get commonRoleMedrep;

  /// No description provided for @commonRoleProductOwner.
  ///
  /// In ru, this message translates to:
  /// **'Бренд / Продукт-оунер'**
  String get commonRoleProductOwner;

  /// No description provided for @commonCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get commonCancel;

  /// No description provided for @navHome.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get navHome;

  /// No description provided for @navChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеки'**
  String get navChecks;

  /// No description provided for @navQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квесты'**
  String get navQuests;

  /// No description provided for @navLearn.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get navLearn;

  /// No description provided for @navWallet.
  ///
  /// In ru, this message translates to:
  /// **'Кошелёк'**
  String get navWallet;

  /// No description provided for @navRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Рецепты'**
  String get navRecipes;

  /// No description provided for @navPortfolio.
  ///
  /// In ru, this message translates to:
  /// **'Портфель'**
  String get navPortfolio;

  /// No description provided for @navPharm.
  ///
  /// In ru, this message translates to:
  /// **'Фарм.'**
  String get navPharm;

  /// No description provided for @navTop.
  ///
  /// In ru, this message translates to:
  /// **'Топ'**
  String get navTop;

  /// No description provided for @navDashboard.
  ///
  /// In ru, this message translates to:
  /// **'Дашборд'**
  String get navDashboard;

  /// No description provided for @navProducts.
  ///
  /// In ru, this message translates to:
  /// **'Продукты'**
  String get navProducts;

  /// No description provided for @navBrands.
  ///
  /// In ru, this message translates to:
  /// **'Бренды'**
  String get navBrands;

  /// No description provided for @navProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get navProfile;

  /// No description provided for @miniAppsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мини-приложения'**
  String get miniAppsTitle;

  /// No description provided for @miniAppsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Играй и выигрывай призы за IQC'**
  String get miniAppsSubtitle;

  /// No description provided for @miniAppsSoon.
  ///
  /// In ru, this message translates to:
  /// **'Скоро'**
  String get miniAppsSoon;

  /// No description provided for @sapperCountdownSoon.
  ///
  /// In ru, this message translates to:
  /// **'скоро'**
  String get sapperCountdownSoon;

  /// No description provided for @sapperCountdownDaysHours.
  ///
  /// In ru, this message translates to:
  /// **'{days}д {hours}ч'**
  String sapperCountdownDaysHours(Object days, Object hours);

  /// No description provided for @sapperCountdownHoursMinutes.
  ///
  /// In ru, this message translates to:
  /// **'{hours}ч {minutes}м'**
  String sapperCountdownHoursMinutes(Object hours, Object minutes);

  /// No description provided for @sapperCountdownMinutesSeconds.
  ///
  /// In ru, this message translates to:
  /// **'{minutes}м {seconds}с'**
  String sapperCountdownMinutesSeconds(Object minutes, Object seconds);

  /// No description provided for @sapperTitle.
  ///
  /// In ru, this message translates to:
  /// **'Супер Сапёр'**
  String get sapperTitle;

  /// No description provided for @sapperSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Занимай клетки за IQC — в час вскрытия узнаешь, что под ними'**
  String get sapperSubtitle;

  /// No description provided for @sapperNoDraws.
  ///
  /// In ru, this message translates to:
  /// **'Нет розыгрышей'**
  String get sapperNoDraws;

  /// No description provided for @sapperRevealed.
  ///
  /// In ru, this message translates to:
  /// **'Вскрыт'**
  String get sapperRevealed;

  /// No description provided for @sapperPrizesAndPrice.
  ///
  /// In ru, this message translates to:
  /// **'🎁 {prizeCount} призов  💎 {priceIqc} IQC/клетка  '**
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc);

  /// No description provided for @sapperMyCells.
  ///
  /// In ru, this message translates to:
  /// **'твоих клеток: {count}'**
  String sapperMyCells(Object count);

  /// No description provided for @sapperOccupancy.
  ///
  /// In ru, this message translates to:
  /// **'занято {occupied} из {total} ({percent}%)'**
  String sapperOccupancy(Object occupied, Object total, Object percent);

  /// No description provided for @sapperGoToGame.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к игре'**
  String get sapperGoToGame;

  /// No description provided for @sapperReserveTitle.
  ///
  /// In ru, this message translates to:
  /// **'Занять клетку №{number}?'**
  String sapperReserveTitle(Object number);

  /// No description provided for @sapperReserveBody.
  ///
  /// In ru, this message translates to:
  /// **'Спишется {price} IQC. Отменить нельзя — клетка закрепится за вами до вскрытия.'**
  String sapperReserveBody(Object price);

  /// No description provided for @sapperReserveConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Занять за {price} IQC'**
  String sapperReserveConfirm(Object price);

  /// No description provided for @sapperCellReserved.
  ///
  /// In ru, this message translates to:
  /// **'Клетка №{number} занята'**
  String sapperCellReserved(Object number);

  /// No description provided for @sapperDraws.
  ///
  /// In ru, this message translates to:
  /// **'Розыгрыши'**
  String get sapperDraws;

  /// No description provided for @sapperAcceptClosed.
  ///
  /// In ru, this message translates to:
  /// **'Приём клеток закрыт — идёт подготовка к вскрытию'**
  String get sapperAcceptClosed;

  /// No description provided for @sapperHiddenTitle.
  ///
  /// In ru, this message translates to:
  /// **'НА ПОЛЕ СПРЯТАНО'**
  String get sapperHiddenTitle;

  /// No description provided for @sapperRevealIn.
  ///
  /// In ru, this message translates to:
  /// **'вскрытие через {time}'**
  String sapperRevealIn(Object time);

  /// No description provided for @sapperNoPrizes.
  ///
  /// In ru, this message translates to:
  /// **'призы не заявлены'**
  String get sapperNoPrizes;

  /// No description provided for @sapperPrizeChip.
  ///
  /// In ru, this message translates to:
  /// **'🎁 {count}× {label}'**
  String sapperPrizeChip(Object count, Object label);

  /// No description provided for @sapperBalance.
  ///
  /// In ru, this message translates to:
  /// **'Баланс: {balance} IQC'**
  String sapperBalance(Object balance);

  /// No description provided for @sapperCellPrice.
  ///
  /// In ru, this message translates to:
  /// **'цена клетки {price} IQC'**
  String sapperCellPrice(Object price);

  /// No description provided for @sapperYourBalance.
  ///
  /// In ru, this message translates to:
  /// **'Ваш баланс'**
  String get sapperYourBalance;

  /// No description provided for @sapperCellPriceLabel.
  ///
  /// In ru, this message translates to:
  /// **'цена клетки'**
  String get sapperCellPriceLabel;

  /// No description provided for @sapperWinBannerWin.
  ///
  /// In ru, this message translates to:
  /// **'🎉 Вы выиграли {count} {word}!'**
  String sapperWinBannerWin(Object count, Object word);

  /// No description provided for @sapperNoWin.
  ///
  /// In ru, this message translates to:
  /// **'В этот раз без выигрыша'**
  String get sapperNoWin;

  /// No description provided for @sapperPrizeOne.
  ///
  /// In ru, this message translates to:
  /// **'приз'**
  String get sapperPrizeOne;

  /// No description provided for @sapperPrizeFew.
  ///
  /// In ru, this message translates to:
  /// **'приза'**
  String get sapperPrizeFew;

  /// No description provided for @sapperPrizeMany.
  ///
  /// In ru, this message translates to:
  /// **'призов'**
  String get sapperPrizeMany;

  /// No description provided for @sapperLegendMine.
  ///
  /// In ru, this message translates to:
  /// **'Мои'**
  String get sapperLegendMine;

  /// No description provided for @sapperLegendTheirs.
  ///
  /// In ru, this message translates to:
  /// **'Чужие'**
  String get sapperLegendTheirs;

  /// No description provided for @sapperLegendEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пустые'**
  String get sapperLegendEmpty;

  /// No description provided for @sapperLegendVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер'**
  String get sapperLegendVoucher;

  /// No description provided for @sapperLegendSelected.
  ///
  /// In ru, this message translates to:
  /// **'Выбрано'**
  String get sapperLegendSelected;

  /// No description provided for @sapperLegendOccupied.
  ///
  /// In ru, this message translates to:
  /// **'Занято'**
  String get sapperLegendOccupied;

  /// No description provided for @sapperLegendFree.
  ///
  /// In ru, this message translates to:
  /// **'Свободно'**
  String get sapperLegendFree;

  /// No description provided for @sapperWinners.
  ///
  /// In ru, this message translates to:
  /// **'Победители'**
  String get sapperWinners;

  /// No description provided for @newsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новости'**
  String get newsTitle;

  /// No description provided for @newsAll.
  ///
  /// In ru, this message translates to:
  /// **'Все новости'**
  String get newsAll;

  /// No description provided for @newsMore.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее →'**
  String get newsMore;

  /// No description provided for @newsDateMonths.
  ///
  /// In ru, this message translates to:
  /// **'янв,фев,мар,апр,мая,июн,июл,авг,сен,окт,ноя,дек'**
  String get newsDateMonths;

  /// No description provided for @newsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет новостей'**
  String get newsEmpty;

  /// No description provided for @newsPinned.
  ///
  /// In ru, this message translates to:
  /// **'ВАЖНОЕ'**
  String get newsPinned;

  /// No description provided for @newsDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новость'**
  String get newsDetailTitle;

  /// No description provided for @surveyRewardCredited.
  ///
  /// In ru, this message translates to:
  /// **'+{amount} IQC зачислено'**
  String surveyRewardCredited(Object amount);

  /// No description provided for @surveyThanks.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо за ответ!'**
  String get surveyThanks;

  /// No description provided for @surveySubmitError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось отправить: {error}'**
  String surveySubmitError(Object error);

  /// No description provided for @surveyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Опрос'**
  String get surveyTitle;

  /// No description provided for @surveyRewardBadge.
  ///
  /// In ru, this message translates to:
  /// **'+ {amount} IQC'**
  String surveyRewardBadge(Object amount);

  /// No description provided for @surveyChooseOption.
  ///
  /// In ru, this message translates to:
  /// **'Выберите вариант ответа'**
  String get surveyChooseOption;

  /// No description provided for @surveyEnterAnswer.
  ///
  /// In ru, this message translates to:
  /// **'Введите ответ вручную'**
  String get surveyEnterAnswer;

  /// No description provided for @surveySubmit.
  ///
  /// In ru, this message translates to:
  /// **'Ответить'**
  String get surveySubmit;

  /// No description provided for @loginTagline.
  ///
  /// In ru, this message translates to:
  /// **'Обучайся.\nПрименяй.\nДостигай.'**
  String get loginTagline;

  /// No description provided for @loginTitle.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get loginTitle;

  /// No description provided for @loginByPhone.
  ///
  /// In ru, this message translates to:
  /// **'Войдите по номеру телефона'**
  String get loginByPhone;

  /// No description provided for @loginCodeSent.
  ///
  /// In ru, this message translates to:
  /// **'Код из SMS на {phone}'**
  String loginCodeSent(Object phone);

  /// No description provided for @loginPhoneLabel.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get loginPhoneLabel;

  /// No description provided for @loginPhoneNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Номер не найден в системе'**
  String get loginPhoneNotFound;

  /// No description provided for @loginConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get loginConfirm;

  /// No description provided for @loginGoRegister.
  ///
  /// In ru, this message translates to:
  /// **'Пройти регистрацию'**
  String get loginGoRegister;

  /// No description provided for @loginRegister.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get loginRegister;

  /// No description provided for @loginEnter.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get loginEnter;

  /// No description provided for @loginResendIn.
  ///
  /// In ru, this message translates to:
  /// **'Повтор через {seconds} с'**
  String loginResendIn(Object seconds);

  /// No description provided for @loginResendAgain.
  ///
  /// In ru, this message translates to:
  /// **'Отправить снова'**
  String get loginResendAgain;

  /// No description provided for @loginChangeNumber.
  ///
  /// In ru, this message translates to:
  /// **'‹ Изменить номер'**
  String get loginChangeNumber;

  /// No description provided for @loginOr.
  ///
  /// In ru, this message translates to:
  /// **'или'**
  String get loginOr;

  /// No description provided for @tgLoginExpired.
  ///
  /// In ru, this message translates to:
  /// **'Время входа истекло'**
  String get tgLoginExpired;

  /// No description provided for @tgLoginParseError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось обработать ответ входа: {error}'**
  String tgLoginParseError(Object error);

  /// No description provided for @tgWaitingConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Ожидание подтверждения…'**
  String get tgWaitingConfirm;

  /// No description provided for @tgLoginButton.
  ///
  /// In ru, this message translates to:
  /// **'Войти через Telegram'**
  String get tgLoginButton;

  /// No description provided for @notifTitle.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifTitle;

  /// No description provided for @notifUnreadOne.
  ///
  /// In ru, this message translates to:
  /// **'{count} непрочитанное'**
  String notifUnreadOne(Object count);

  /// No description provided for @notifUnreadMany.
  ///
  /// In ru, this message translates to:
  /// **'{count} непрочитанных'**
  String notifUnreadMany(Object count);

  /// No description provided for @notifMarkAllRead.
  ///
  /// In ru, this message translates to:
  /// **'Отметить все прочитанными'**
  String get notifMarkAllRead;

  /// No description provided for @notifRead.
  ///
  /// In ru, this message translates to:
  /// **'✓ Прочитано'**
  String get notifRead;

  /// No description provided for @notifMarkRead.
  ///
  /// In ru, this message translates to:
  /// **'Отметить прочитанным'**
  String get notifMarkRead;

  /// No description provided for @notifOpen.
  ///
  /// In ru, this message translates to:
  /// **'Открыть'**
  String get notifOpen;

  /// No description provided for @notifEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Уведомлений нет'**
  String get notifEmptyTitle;

  /// No description provided for @notifEmptyBody.
  ///
  /// In ru, this message translates to:
  /// **'Здесь появятся статусы чеков, награды за квесты и новости обучения.'**
  String get notifEmptyBody;

  /// No description provided for @placeholderComingSoon.
  ///
  /// In ru, this message translates to:
  /// **'Раздел появится в следующих фазах.'**
  String get placeholderComingSoon;

  /// No description provided for @profileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profileTitle;

  /// No description provided for @profileSettings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get profileSettings;

  /// No description provided for @profileLanguage.
  ///
  /// In ru, this message translates to:
  /// **'ЯЗЫК'**
  String get profileLanguage;

  /// No description provided for @profileAppearance.
  ///
  /// In ru, this message translates to:
  /// **'ОФОРМЛЕНИЕ'**
  String get profileAppearance;

  /// No description provided for @profileThemeLight.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get profileThemeLight;

  /// No description provided for @profileThemeDark.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная'**
  String get profileThemeDark;

  /// No description provided for @profileThemeSystem.
  ///
  /// In ru, this message translates to:
  /// **'Система'**
  String get profileThemeSystem;

  /// No description provided for @profileAccount.
  ///
  /// In ru, this message translates to:
  /// **'Аккаунт'**
  String get profileAccount;

  /// No description provided for @profilePersonalData.
  ///
  /// In ru, this message translates to:
  /// **'ЛИЧНЫЕ ДАННЫЕ'**
  String get profilePersonalData;

  /// No description provided for @profileRole.
  ///
  /// In ru, this message translates to:
  /// **'Роль'**
  String get profileRole;

  /// No description provided for @profileChange.
  ///
  /// In ru, this message translates to:
  /// **'Сменить'**
  String get profileChange;

  /// No description provided for @profileLinkedServices.
  ///
  /// In ru, this message translates to:
  /// **'ПРИВЯЗАННЫЕ СЕРВИСЫ'**
  String get profileLinkedServices;

  /// No description provided for @profilePhone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get profilePhone;

  /// No description provided for @profileTgConnected.
  ///
  /// In ru, this message translates to:
  /// **'Подключён'**
  String get profileTgConnected;

  /// No description provided for @profileTgLinked.
  ///
  /// In ru, this message translates to:
  /// **'Привязан'**
  String get profileTgLinked;

  /// No description provided for @profileSupport.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка'**
  String get profileSupport;

  /// No description provided for @profileSupportSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Мы всегда на связи'**
  String get profileSupportSubtitle;

  /// No description provided for @profileLogout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти из аккаунта'**
  String get profileLogout;

  /// No description provided for @profileDeleteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт и данные'**
  String get profileDeleteTitle;

  /// No description provided for @profileDeleteIrreversible.
  ///
  /// In ru, this message translates to:
  /// **'Действие необратимо'**
  String get profileDeleteIrreversible;

  /// No description provided for @profileDelete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get profileDelete;

  /// No description provided for @profileLanguageUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Язык обновлён'**
  String get profileLanguageUpdated;

  /// No description provided for @profileNewPhoneTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новый номер'**
  String get profileNewPhoneTitle;

  /// No description provided for @profileCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get profileCancel;

  /// No description provided for @profileNext.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get profileNext;

  /// No description provided for @profileSmsCodeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Код из SMS'**
  String get profileSmsCodeTitle;

  /// No description provided for @profileCodeLabel.
  ///
  /// In ru, this message translates to:
  /// **'Код'**
  String get profileCodeLabel;

  /// No description provided for @profileConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get profileConfirm;

  /// No description provided for @profilePhoneChanged.
  ///
  /// In ru, this message translates to:
  /// **'Телефон изменён'**
  String get profilePhoneChanged;

  /// No description provided for @profileLogoutConfirmTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выйти из аккаунта?'**
  String get profileLogoutConfirmTitle;

  /// No description provided for @profileLogoutAction.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get profileLogoutAction;

  /// No description provided for @profileDeleteConfirmTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт?'**
  String get profileDeleteConfirmTitle;

  /// No description provided for @profileDeleteConfirmBody.
  ///
  /// In ru, this message translates to:
  /// **'Действие необратимо. Все данные будут удалены.'**
  String get profileDeleteConfirmBody;

  /// No description provided for @profileStatQuests.
  ///
  /// In ru, this message translates to:
  /// **'КВЕСТОВ'**
  String get profileStatQuests;

  /// No description provided for @profileStatLevel.
  ///
  /// In ru, this message translates to:
  /// **'УРОВЕНЬ'**
  String get profileStatLevel;

  /// No description provided for @questHistoryTitle.
  ///
  /// In ru, this message translates to:
  /// **'История участия'**
  String get questHistoryTitle;

  /// No description provided for @questHistoryEmpty.
  ///
  /// In ru, this message translates to:
  /// **'История пуста'**
  String get questHistoryEmpty;

  /// No description provided for @questHistoryVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер'**
  String get questHistoryVoucher;

  /// No description provided for @questHistoryActive.
  ///
  /// In ru, this message translates to:
  /// **'Активен'**
  String get questHistoryActive;

  /// No description provided for @questHistoryDone.
  ///
  /// In ru, this message translates to:
  /// **'Выполнен'**
  String get questHistoryDone;

  /// No description provided for @registerStep1Of2.
  ///
  /// In ru, this message translates to:
  /// **'ШАГ 1 ИЗ 2'**
  String get registerStep1Of2;

  /// No description provided for @registerStep2Of2.
  ///
  /// In ru, this message translates to:
  /// **'ШАГ 2 ИЗ 2 · {role}'**
  String registerStep2Of2(Object role);

  /// No description provided for @registerTitle.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get registerTitle;

  /// No description provided for @registerChooseRole.
  ///
  /// In ru, this message translates to:
  /// **'Выберите роль для входа'**
  String get registerChooseRole;

  /// No description provided for @registerBack.
  ///
  /// In ru, this message translates to:
  /// **'‹ Назад'**
  String get registerBack;

  /// No description provided for @registerConfirmField.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите: {label}'**
  String registerConfirmField(Object label);

  /// No description provided for @registerFillField.
  ///
  /// In ru, this message translates to:
  /// **'Заполните: {label}'**
  String registerFillField(Object label);

  /// No description provided for @registerFinish.
  ///
  /// In ru, this message translates to:
  /// **'Завершить регистрацию'**
  String get registerFinish;

  /// No description provided for @registerSuccessTitle.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация завершена!'**
  String get registerSuccessTitle;

  /// No description provided for @registerWelcome.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в PharmIQ ACADEMY, {name}!'**
  String registerWelcome(Object name);

  /// No description provided for @registerStartLearning.
  ///
  /// In ru, this message translates to:
  /// **'Начать обучение'**
  String get registerStartLearning;

  /// No description provided for @registerGoHome.
  ///
  /// In ru, this message translates to:
  /// **'Перейти на главную'**
  String get registerGoHome;

  /// No description provided for @registerEnterField.
  ///
  /// In ru, this message translates to:
  /// **'Введите {label}'**
  String registerEnterField(Object label);

  /// No description provided for @registerRequiredField.
  ///
  /// In ru, this message translates to:
  /// **'Обязательное поле'**
  String get registerRequiredField;

  /// No description provided for @registerSelectPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'— выберите —'**
  String get registerSelectPlaceholder;

  /// No description provided for @registerMultiSelectHintRequired.
  ///
  /// In ru, this message translates to:
  /// **'{label} * · Можно выбрать несколько'**
  String registerMultiSelectHintRequired(Object label);

  /// No description provided for @registerMultiSelectHint.
  ///
  /// In ru, this message translates to:
  /// **'{label} · Можно выбрать несколько'**
  String registerMultiSelectHint(Object label);

  /// No description provided for @registerConsentText.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен на обработку персональных данных '**
  String get registerConsentText;

  /// No description provided for @registerConsentMore.
  ///
  /// In ru, this message translates to:
  /// **'подробнее'**
  String get registerConsentMore;

  /// No description provided for @roleSelectTagline.
  ///
  /// In ru, this message translates to:
  /// **'Обучайся.\nПрименяй.\nДостигай.'**
  String get roleSelectTagline;

  /// No description provided for @roleSelectGreeting.
  ///
  /// In ru, this message translates to:
  /// **'Здравствуйте'**
  String get roleSelectGreeting;

  /// No description provided for @roleSelectGreetingName.
  ///
  /// In ru, this message translates to:
  /// **'Здравствуйте, {name}'**
  String roleSelectGreetingName(Object name);

  /// No description provided for @roleSelectChooseRole.
  ///
  /// In ru, this message translates to:
  /// **'Выберите роль для входа'**
  String get roleSelectChooseRole;

  /// No description provided for @roleSelectSubChecksQuests.
  ///
  /// In ru, this message translates to:
  /// **'Чеки, квесты, обучение и кошелёк'**
  String get roleSelectSubChecksQuests;

  /// No description provided for @roleSelectSubMedrep.
  ///
  /// In ru, this message translates to:
  /// **'Портфель провизоров и рейтинг'**
  String get roleSelectSubMedrep;

  /// No description provided for @roleSelectSubProductOwner.
  ///
  /// In ru, this message translates to:
  /// **'Дашборд, продукты и бренды'**
  String get roleSelectSubProductOwner;

  /// No description provided for @roleSelectSheetTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выберите роль'**
  String get roleSelectSheetTitle;

  /// No description provided for @roleSelectEnter.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get roleSelectEnter;

  /// No description provided for @notifSettingsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Настройки уведомлений'**
  String get notifSettingsTitle;

  /// No description provided for @notifSettingsChecks.
  ///
  /// In ru, this message translates to:
  /// **'Статусы чеков и рецептов'**
  String get notifSettingsChecks;

  /// No description provided for @notifSettingsQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квесты и награды'**
  String get notifSettingsQuests;

  /// No description provided for @notifSettingsLearning.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get notifSettingsLearning;

  /// No description provided for @notifSettingsMarketing.
  ///
  /// In ru, this message translates to:
  /// **'Новости и акции'**
  String get notifSettingsMarketing;

  /// No description provided for @supportBackProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get supportBackProfile;

  /// No description provided for @supportTitle.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка'**
  String get supportTitle;

  /// No description provided for @supportEmptyHint.
  ///
  /// In ru, this message translates to:
  /// **'Напишите нам — ответим здесь'**
  String get supportEmptyHint;

  /// No description provided for @supportInputHint.
  ///
  /// In ru, this message translates to:
  /// **'Напишите сообщение...'**
  String get supportInputHint;

  /// No description provided for @supportYou.
  ///
  /// In ru, this message translates to:
  /// **'Вы'**
  String get supportYou;

  /// No description provided for @supportTeam.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка'**
  String get supportTeam;

  /// No description provided for @appBarSwitchRole.
  ///
  /// In ru, this message translates to:
  /// **'Сменить роль'**
  String get appBarSwitchRole;

  /// No description provided for @asyncRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get asyncRetry;

  /// No description provided for @brandProductsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Продукты'**
  String get brandProductsTitle;

  /// No description provided for @brandProductsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Продуктов нет'**
  String get brandProductsEmpty;

  /// No description provided for @brandProductsQuestCount.
  ///
  /// In ru, this message translates to:
  /// **'{p1} квест.'**
  String brandProductsQuestCount(Object p1);

  /// No description provided for @brandProductsDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Продукт'**
  String get brandProductsDetailTitle;

  /// No description provided for @brandQuestsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Квесты бренда'**
  String get brandQuestsTitle;

  /// No description provided for @brandQuestsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Квестов нет'**
  String get brandQuestsEmpty;

  /// No description provided for @brandQuestsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'{p1} · {p2}/{p3} вып.'**
  String brandQuestsSubtitle(Object p1, Object p2, Object p3);

  /// No description provided for @brandQuestsStatusActive.
  ///
  /// In ru, this message translates to:
  /// **'Активен'**
  String get brandQuestsStatusActive;

  /// No description provided for @brandQuestsStatusOff.
  ///
  /// In ru, this message translates to:
  /// **'Выкл'**
  String get brandQuestsStatusOff;

  /// No description provided for @brandQuestsDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Квест бренда'**
  String get brandQuestsDetailTitle;

  /// No description provided for @brandQuestsSponsor.
  ///
  /// In ru, this message translates to:
  /// **'Спонсор: {p1}'**
  String brandQuestsSponsor(Object p1);

  /// No description provided for @brandQuestsParticipants.
  ///
  /// In ru, this message translates to:
  /// **'Участников'**
  String get brandQuestsParticipants;

  /// No description provided for @brandQuestsCompletions.
  ///
  /// In ru, this message translates to:
  /// **'Выполнений'**
  String get brandQuestsCompletions;

  /// No description provided for @brandQuestsBudget.
  ///
  /// In ru, this message translates to:
  /// **'Бюджет'**
  String get brandQuestsBudget;

  /// No description provided for @brandQuestsSpent.
  ///
  /// In ru, this message translates to:
  /// **'Потрачено'**
  String get brandQuestsSpent;

  /// No description provided for @brandQuestsProducts.
  ///
  /// In ru, this message translates to:
  /// **'Продукты'**
  String get brandQuestsProducts;

  /// No description provided for @brandQuestsMxik.
  ///
  /// In ru, this message translates to:
  /// **'МХИК'**
  String get brandQuestsMxik;

  /// No description provided for @brandQuestsReward.
  ///
  /// In ru, this message translates to:
  /// **'Награда'**
  String get brandQuestsReward;

  /// No description provided for @brandQuestsPeriod.
  ///
  /// In ru, this message translates to:
  /// **'Период'**
  String get brandQuestsPeriod;

  /// No description provided for @brandsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бренды'**
  String get brandsTitle;

  /// No description provided for @brandsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Брендов нет'**
  String get brandsEmpty;

  /// No description provided for @brandsQuestCount.
  ///
  /// In ru, this message translates to:
  /// **'{p1} квест.'**
  String brandsQuestCount(Object p1);

  /// No description provided for @brandsDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бренд'**
  String get brandsDetailTitle;

  /// No description provided for @brandsSubBrands.
  ///
  /// In ru, this message translates to:
  /// **'Суббренды'**
  String get brandsSubBrands;

  /// No description provided for @brandDashTitle.
  ///
  /// In ru, this message translates to:
  /// **'Дашборд'**
  String get brandDashTitle;

  /// No description provided for @brandDashChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеков'**
  String get brandDashChecks;

  /// No description provided for @brandDashPacks.
  ///
  /// In ru, this message translates to:
  /// **'Упаковок'**
  String get brandDashPacks;

  /// No description provided for @brandDashActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'Активных квестов'**
  String get brandDashActiveQuests;

  /// No description provided for @brandDashParticipants.
  ///
  /// In ru, this message translates to:
  /// **'Участников'**
  String get brandDashParticipants;

  /// No description provided for @brandDashSegmentation.
  ///
  /// In ru, this message translates to:
  /// **'Сегментация'**
  String get brandDashSegmentation;

  /// No description provided for @brandDashRetail.
  ///
  /// In ru, this message translates to:
  /// **'Розница'**
  String get brandDashRetail;

  /// No description provided for @brandDashChain.
  ///
  /// In ru, this message translates to:
  /// **'Сети'**
  String get brandDashChain;

  /// No description provided for @brandDashTopProducts.
  ///
  /// In ru, this message translates to:
  /// **'Топ продуктов'**
  String get brandDashTopProducts;

  /// No description provided for @brandDashTopSellers.
  ///
  /// In ru, this message translates to:
  /// **'Топ продавцов'**
  String get brandDashTopSellers;

  /// No description provided for @brandDashRegions.
  ///
  /// In ru, this message translates to:
  /// **'Регионы'**
  String get brandDashRegions;

  /// No description provided for @brandDashSalesLogs.
  ///
  /// In ru, this message translates to:
  /// **'Логи продаж'**
  String get brandDashSalesLogs;

  /// No description provided for @salesLogTitle.
  ///
  /// In ru, this message translates to:
  /// **'Логи продаж'**
  String get salesLogTitle;

  /// No description provided for @salesLogEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Записей нет'**
  String get salesLogEmpty;

  /// No description provided for @docHomeActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'Активные квесты'**
  String get docHomeActiveQuests;

  /// No description provided for @docHomeAllQuests.
  ///
  /// In ru, this message translates to:
  /// **'Все квесты'**
  String get docHomeAllQuests;

  /// No description provided for @docHomeNoActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'Нет активных квестов'**
  String get docHomeNoActiveQuests;

  /// No description provided for @docHomeRecommendedCourses.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендуемые курсы'**
  String get docHomeRecommendedCourses;

  /// No description provided for @docHomeAllCourses.
  ///
  /// In ru, this message translates to:
  /// **'Все курсы'**
  String get docHomeAllCourses;

  /// No description provided for @docHomeNoCourses.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет курсов'**
  String get docHomeNoCourses;

  /// No description provided for @docHomeGreetingNoName.
  ///
  /// In ru, this message translates to:
  /// **'Привет!'**
  String get docHomeGreetingNoName;

  /// No description provided for @docHomeGreeting.
  ///
  /// In ru, this message translates to:
  /// **'Привет, {name}'**
  String docHomeGreeting(Object name);

  /// No description provided for @docHomeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Отправляйте рецепты и получайте вознаграждение'**
  String get docHomeSubtitle;

  /// No description provided for @docHomeWalletBalance.
  ///
  /// In ru, this message translates to:
  /// **'БАЛАНС КОШЕЛЬКА'**
  String get docHomeWalletBalance;

  /// No description provided for @docHomeWallet.
  ///
  /// In ru, this message translates to:
  /// **'Кошелёк'**
  String get docHomeWallet;

  /// No description provided for @docHomeSendRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Отправить рецепт'**
  String get docHomeSendRecipe;

  /// No description provided for @docHomeSendRecipeHint.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте рецепт — ИИ распознает препараты'**
  String get docHomeSendRecipeHint;

  /// No description provided for @docHomeStatRecipes.
  ///
  /// In ru, this message translates to:
  /// **'всего рецептов'**
  String get docHomeStatRecipes;

  /// No description provided for @docHomeStatApproved.
  ///
  /// In ru, this message translates to:
  /// **'одобрено'**
  String get docHomeStatApproved;

  /// No description provided for @docHomeStatIqc.
  ///
  /// In ru, this message translates to:
  /// **'баллов IQC'**
  String get docHomeStatIqc;

  /// No description provided for @docHomeVoucher.
  ///
  /// In ru, this message translates to:
  /// **'ВАУЧЕР'**
  String get docHomeVoucher;

  /// No description provided for @docHomeProgress.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс'**
  String get docHomeProgress;

  /// No description provided for @docHomeProgressDone.
  ///
  /// In ru, this message translates to:
  /// **'{pct}% выполнено'**
  String docHomeProgressDone(Object pct);

  /// No description provided for @recipeDetailMyRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Мои рецепты'**
  String get recipeDetailMyRecipes;

  /// No description provided for @recipeDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Рецепт №{id}'**
  String recipeDetailTitle(Object id);

  /// No description provided for @recipeDetailPhotoCount.
  ///
  /// In ru, this message translates to:
  /// **'Фото {p1}'**
  String recipeDetailPhotoCount(Object p1);

  /// No description provided for @recipeDetailStatusApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get recipeDetailStatusApproved;

  /// No description provided for @recipeDetailStatusRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get recipeDetailStatusRejected;

  /// No description provided for @recipeDetailStatusPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get recipeDetailStatusPending;

  /// No description provided for @recipeDetailAiRecognized.
  ///
  /// In ru, this message translates to:
  /// **'Распознано ИИ'**
  String get recipeDetailAiRecognized;

  /// No description provided for @recipeDetailNoDrugs.
  ///
  /// In ru, this message translates to:
  /// **'Препараты не распознаны'**
  String get recipeDetailNoDrugs;

  /// No description provided for @recipesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мои рецепты'**
  String get recipesTitle;

  /// No description provided for @recipesTotal.
  ///
  /// In ru, this message translates to:
  /// **'{p1} всего'**
  String recipesTotal(Object p1);

  /// No description provided for @recipesTabAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get recipesTabAll;

  /// No description provided for @recipesTabActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get recipesTabActive;

  /// No description provided for @recipesTabDone.
  ///
  /// In ru, this message translates to:
  /// **'Завершенные'**
  String get recipesTabDone;

  /// No description provided for @recipesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Рецептов пока нет'**
  String get recipesEmpty;

  /// No description provided for @recipesTakePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Сделать фото'**
  String get recipesTakePhoto;

  /// No description provided for @recipesFromGallery.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из галереи'**
  String get recipesFromGallery;

  /// No description provided for @recipesUploading.
  ///
  /// In ru, this message translates to:
  /// **'Рецепт добавлен — загружается'**
  String get recipesUploading;

  /// No description provided for @recipesDoctorInfoTitle.
  ///
  /// In ru, this message translates to:
  /// **'Данные врача (по желанию)'**
  String get recipesDoctorInfoTitle;

  /// No description provided for @recipesDoctorName.
  ///
  /// In ru, this message translates to:
  /// **'ФИО'**
  String get recipesDoctorName;

  /// No description provided for @recipesDoctorWorkplace.
  ///
  /// In ru, this message translates to:
  /// **'Место работы'**
  String get recipesDoctorWorkplace;

  /// No description provided for @recipesDoctorCity.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get recipesDoctorCity;

  /// No description provided for @recipesDoctorPhone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get recipesDoctorPhone;

  /// No description provided for @recipesSkip.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get recipesSkip;

  /// No description provided for @recipesSend.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get recipesSend;

  /// No description provided for @recipesSubmitButton.
  ///
  /// In ru, this message translates to:
  /// **'Отправить рецепт'**
  String get recipesSubmitButton;

  /// No description provided for @recipesPhotoCount.
  ///
  /// In ru, this message translates to:
  /// **'фото: {p1}'**
  String recipesPhotoCount(Object p1);

  /// No description provided for @recipesStatusApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get recipesStatusApproved;

  /// No description provided for @recipesStatusRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get recipesStatusRejected;

  /// No description provided for @recipesStatusPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get recipesStatusPending;

  /// No description provided for @recipesUploadingBanner.
  ///
  /// In ru, this message translates to:
  /// **'Загружается: {count}'**
  String recipesUploadingBanner(Object count);

  /// No description provided for @recipesRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get recipesRetry;

  /// No description provided for @companiesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Компании'**
  String get companiesTitle;

  /// No description provided for @companiesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Компаний нет'**
  String get companiesEmpty;

  /// No description provided for @companiesCode.
  ///
  /// In ru, this message translates to:
  /// **'Код: {p1}'**
  String companiesCode(Object p1);

  /// No description provided for @medrepHomeAttributionPrimary.
  ///
  /// In ru, this message translates to:
  /// **'Первичная'**
  String get medrepHomeAttributionPrimary;

  /// No description provided for @medrepHomeAttributionTotal.
  ///
  /// In ru, this message translates to:
  /// **'Общая'**
  String get medrepHomeAttributionTotal;

  /// No description provided for @medrepHomeMenuPharmacists.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевты'**
  String get medrepHomeMenuPharmacists;

  /// No description provided for @medrepHomeMenuPending.
  ///
  /// In ru, this message translates to:
  /// **'Ожидают подтверждения'**
  String get medrepHomeMenuPending;

  /// No description provided for @medrepHomeMenuCompanies.
  ///
  /// In ru, this message translates to:
  /// **'Компании'**
  String get medrepHomeMenuCompanies;

  /// No description provided for @medrepHomeMenuLeaderboard.
  ///
  /// In ru, this message translates to:
  /// **'Рейтинг'**
  String get medrepHomeMenuLeaderboard;

  /// No description provided for @medrepHomeGreetingNoName.
  ///
  /// In ru, this message translates to:
  /// **'Привет!'**
  String get medrepHomeGreetingNoName;

  /// No description provided for @medrepHomeGreeting.
  ///
  /// In ru, this message translates to:
  /// **'Привет, {name}'**
  String medrepHomeGreeting(Object name);

  /// No description provided for @medrepHomeAttribution.
  ///
  /// In ru, this message translates to:
  /// **'Атрибуция: {attribution}'**
  String medrepHomeAttribution(Object attribution);

  /// No description provided for @medrepHomeStatPharmacists.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевтов'**
  String get medrepHomeStatPharmacists;

  /// No description provided for @medrepHomeStatChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеков'**
  String get medrepHomeStatChecks;

  /// No description provided for @medrepHomeStatPacks.
  ///
  /// In ru, this message translates to:
  /// **'Упаковок'**
  String get medrepHomeStatPacks;

  /// No description provided for @medrepHomeStatQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квестов'**
  String get medrepHomeStatQuests;

  /// No description provided for @medrepHomeLinkCopied.
  ///
  /// In ru, this message translates to:
  /// **'Ссылка скопирована'**
  String get medrepHomeLinkCopied;

  /// No description provided for @medrepHomeReferralTitle.
  ///
  /// In ru, this message translates to:
  /// **'Реферальная ссылка'**
  String get medrepHomeReferralTitle;

  /// No description provided for @medrepHomeReferralHint.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте ссылку провизору — он привяжется к вам при регистрации'**
  String get medrepHomeReferralHint;

  /// No description provided for @medrepHomeCopy.
  ///
  /// In ru, this message translates to:
  /// **'Копировать'**
  String get medrepHomeCopy;

  /// No description provided for @medrepHomeShare.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться'**
  String get medrepHomeShare;

  /// No description provided for @medrepHomeRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get medrepHomeRetry;

  /// No description provided for @leaderboardUnitPharm.
  ///
  /// In ru, this message translates to:
  /// **'аптек'**
  String get leaderboardUnitPharm;

  /// No description provided for @leaderboardUnitQuests.
  ///
  /// In ru, this message translates to:
  /// **'квестов'**
  String get leaderboardUnitQuests;

  /// No description provided for @leaderboardUnitChecks.
  ///
  /// In ru, this message translates to:
  /// **'чеков'**
  String get leaderboardUnitChecks;

  /// No description provided for @leaderboardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Рейтинг'**
  String get leaderboardTitle;

  /// No description provided for @leaderboardAttributionPrimary.
  ///
  /// In ru, this message translates to:
  /// **'Первичная'**
  String get leaderboardAttributionPrimary;

  /// No description provided for @leaderboardAttributionTotal.
  ///
  /// In ru, this message translates to:
  /// **'Общая'**
  String get leaderboardAttributionTotal;

  /// No description provided for @leaderboardCompanyFallback.
  ///
  /// In ru, this message translates to:
  /// **'Компания'**
  String get leaderboardCompanyFallback;

  /// No description provided for @leaderboardRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get leaderboardRetry;

  /// No description provided for @pharmDetailIncentivizeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Поощрить фармацевта'**
  String get pharmDetailIncentivizeTitle;

  /// No description provided for @pharmDetailRating.
  ///
  /// In ru, this message translates to:
  /// **'Оценка: {p1}'**
  String pharmDetailRating(Object p1);

  /// No description provided for @pharmDetailComment.
  ///
  /// In ru, this message translates to:
  /// **'Комментарий'**
  String get pharmDetailComment;

  /// No description provided for @pharmDetailCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get pharmDetailCancel;

  /// No description provided for @pharmDetailSend.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get pharmDetailSend;

  /// No description provided for @pharmDetailSent.
  ///
  /// In ru, this message translates to:
  /// **'Отправлено'**
  String get pharmDetailSent;

  /// No description provided for @pharmDetailBack.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевты'**
  String get pharmDetailBack;

  /// No description provided for @pharmDetailChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеков'**
  String get pharmDetailChecks;

  /// No description provided for @pharmDetailPacks.
  ///
  /// In ru, this message translates to:
  /// **'Упаковок'**
  String get pharmDetailPacks;

  /// No description provided for @pharmDetailQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квестов'**
  String get pharmDetailQuests;

  /// No description provided for @pharmDetailIqcPoints.
  ///
  /// In ru, this message translates to:
  /// **'IQC Очков'**
  String get pharmDetailIqcPoints;

  /// No description provided for @pharmDetailRecentChecks.
  ///
  /// In ru, this message translates to:
  /// **'Последние чеки'**
  String get pharmDetailRecentChecks;

  /// No description provided for @pharmDetailNoChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеков пока нет'**
  String get pharmDetailNoChecks;

  /// No description provided for @pharmDetailActive.
  ///
  /// In ru, this message translates to:
  /// **'Активный'**
  String get pharmDetailActive;

  /// No description provided for @pharmDetailPassive.
  ///
  /// In ru, this message translates to:
  /// **'Пассивный'**
  String get pharmDetailPassive;

  /// No description provided for @pharmDetailIncentivize.
  ///
  /// In ru, this message translates to:
  /// **'Поощрить'**
  String get pharmDetailIncentivize;

  /// No description provided for @pharmDetailRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get pharmDetailRetry;

  /// No description provided for @portfolioTitle.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевты'**
  String get portfolioTitle;

  /// No description provided for @portfolioUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Обновлено'**
  String get portfolioUpdated;

  /// No description provided for @portfolioInPortfolio.
  ///
  /// In ru, this message translates to:
  /// **'{total} в портфеле'**
  String portfolioInPortfolio(Object total);

  /// No description provided for @portfolioSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск фармацевта…'**
  String get portfolioSearchHint;

  /// No description provided for @portfolioTabAll.
  ///
  /// In ru, this message translates to:
  /// **'Все ({all})'**
  String portfolioTabAll(Object all);

  /// No description provided for @portfolioTabActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные ({active})'**
  String portfolioTabActive(Object active);

  /// No description provided for @portfolioTabPassive.
  ///
  /// In ru, this message translates to:
  /// **'Пассивные ({passive})'**
  String portfolioTabPassive(Object passive);

  /// No description provided for @portfolioNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевтов не найдено'**
  String get portfolioNotFound;

  /// No description provided for @portfolioRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get portfolioRetry;

  /// No description provided for @medrepQuestsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Квесты компании'**
  String get medrepQuestsTitle;

  /// No description provided for @medrepQuestsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Квестов нет'**
  String get medrepQuestsEmpty;

  /// No description provided for @medrepQuestsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Цель: {p1} · участников: {p2}'**
  String medrepQuestsSubtitle(Object p1, Object p2);

  /// No description provided for @medrepQuestsNoParticipants.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет участников'**
  String get medrepQuestsNoParticipants;

  /// No description provided for @referralsAccepted.
  ///
  /// In ru, this message translates to:
  /// **'Заявка принята'**
  String get referralsAccepted;

  /// No description provided for @referralsRejected.
  ///
  /// In ru, this message translates to:
  /// **'Заявка отклонена'**
  String get referralsRejected;

  /// No description provided for @referralsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Заявки рефералов'**
  String get referralsTitle;

  /// No description provided for @referralsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет новых заявок'**
  String get referralsEmpty;

  /// No description provided for @referralsDecline.
  ///
  /// In ru, this message translates to:
  /// **'Отклонить'**
  String get referralsDecline;

  /// No description provided for @referralsAccept.
  ///
  /// In ru, this message translates to:
  /// **'Принять'**
  String get referralsAccept;

  /// No description provided for @checkDetailBackMyChecks.
  ///
  /// In ru, this message translates to:
  /// **'Мои чеки'**
  String get checkDetailBackMyChecks;

  /// No description provided for @checkDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чек №{id}'**
  String checkDetailTitle(Object id);

  /// No description provided for @checkDetailRejectedFallback.
  ///
  /// In ru, this message translates to:
  /// **'Чек отклонён'**
  String get checkDetailRejectedFallback;

  /// No description provided for @checkDetailQuestDone.
  ///
  /// In ru, this message translates to:
  /// **'{p1} · Квест выполнен ✓'**
  String checkDetailQuestDone(Object p1);

  /// No description provided for @checkDetailQuestAfterApproval.
  ///
  /// In ru, this message translates to:
  /// **'Появится после одобрения чека'**
  String get checkDetailQuestAfterApproval;

  /// No description provided for @checkDetailQuestNone.
  ///
  /// In ru, this message translates to:
  /// **'Пока не зачтён ни в один квест'**
  String get checkDetailQuestNone;

  /// No description provided for @checkDetailChipApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get checkDetailChipApproved;

  /// No description provided for @checkDetailChipRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get checkDetailChipRejected;

  /// No description provided for @checkDetailChipPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get checkDetailChipPending;

  /// No description provided for @checkDetailOpenPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Открыть'**
  String get checkDetailOpenPhoto;

  /// No description provided for @checkDetailPhotoCount.
  ///
  /// In ru, this message translates to:
  /// **'фото: {p1}'**
  String checkDetailPhotoCount(Object p1);

  /// No description provided for @checkDetailRejectReasonTitle.
  ///
  /// In ru, this message translates to:
  /// **'Причина отклонения'**
  String get checkDetailRejectReasonTitle;

  /// No description provided for @checkDetailResubmit.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно'**
  String get checkDetailResubmit;

  /// No description provided for @checkDetailPendingTitle.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get checkDetailPendingTitle;

  /// No description provided for @checkDetailPendingBody.
  ///
  /// In ru, this message translates to:
  /// **'Ваш чек на проверке у специалиста. Обычно это занимает до 24 часов.'**
  String get checkDetailPendingBody;

  /// No description provided for @checkDetailSentAt.
  ///
  /// In ru, this message translates to:
  /// **'Отправлен: {sentAt}'**
  String checkDetailSentAt(Object sentAt);

  /// No description provided for @checkDetailAiWaitingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ожидание распознавания ИИ'**
  String get checkDetailAiWaitingTitle;

  /// No description provided for @checkDetailAiWaitingBody.
  ///
  /// In ru, this message translates to:
  /// **'Результат появится после проверки'**
  String get checkDetailAiWaitingBody;

  /// No description provided for @checkDetailAiTitle.
  ///
  /// In ru, this message translates to:
  /// **'Распознано ИИ'**
  String get checkDetailAiTitle;

  /// No description provided for @checkDetailPacks.
  ///
  /// In ru, this message translates to:
  /// **'{p1} уп.'**
  String checkDetailPacks(Object p1);

  /// No description provided for @checkDetailQuestCardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Зачёт в квесты'**
  String get checkDetailQuestCardTitle;

  /// No description provided for @checksEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Чеков пока нет'**
  String get checksEmpty;

  /// No description provided for @checksAddedUploading.
  ///
  /// In ru, this message translates to:
  /// **'Чек добавлен — загружается'**
  String get checksAddedUploading;

  /// No description provided for @checksNewCheckTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новый чек'**
  String get checksNewCheckTitle;

  /// No description provided for @checksTapToAddPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите чтобы добавить фото'**
  String get checksTapToAddPhoto;

  /// No description provided for @checksTakePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Сделать фото'**
  String get checksTakePhoto;

  /// No description provided for @checksSubmitForReview.
  ///
  /// In ru, this message translates to:
  /// **'Отправить на проверку'**
  String get checksSubmitForReview;

  /// No description provided for @checksTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мои чеки'**
  String get checksTitle;

  /// No description provided for @checksTotalCount.
  ///
  /// In ru, this message translates to:
  /// **'{p1} всего'**
  String checksTotalCount(Object p1);

  /// No description provided for @checksSendPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Отправить фото'**
  String get checksSendPhoto;

  /// No description provided for @checksCardMeta.
  ///
  /// In ru, this message translates to:
  /// **'{p1} · фото: {p2}'**
  String checksCardMeta(Object p1, Object p2);

  /// No description provided for @checksAwaitUsually24h.
  ///
  /// In ru, this message translates to:
  /// **'Ожидайте — обычно 24 часа'**
  String get checksAwaitUsually24h;

  /// No description provided for @checksUploadingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка фото'**
  String get checksUploadingTitle;

  /// No description provided for @checksPhotoFallback.
  ///
  /// In ru, this message translates to:
  /// **'Фото чека'**
  String get checksPhotoFallback;

  /// No description provided for @checksRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get checksRetry;

  /// No description provided for @courseDetailTabDescription.
  ///
  /// In ru, this message translates to:
  /// **'ОПИСАНИЕ'**
  String get courseDetailTabDescription;

  /// No description provided for @courseDetailTabContent.
  ///
  /// In ru, this message translates to:
  /// **'СОДЕРЖАНИЕ'**
  String get courseDetailTabContent;

  /// No description provided for @courseDetailMinutes.
  ///
  /// In ru, this message translates to:
  /// **'~{totalMin} минут'**
  String courseDetailMinutes(Object totalMin);

  /// No description provided for @courseDetailContinueLearning.
  ///
  /// In ru, this message translates to:
  /// **'ПРОДОЛЖИТЬ ОБУЧЕНИЕ'**
  String get courseDetailContinueLearning;

  /// No description provided for @courseDetailStartLearning.
  ///
  /// In ru, this message translates to:
  /// **'НАЧАТЬ ОБУЧЕНИЕ'**
  String get courseDetailStartLearning;

  /// No description provided for @courseDetailVideoLessonOne.
  ///
  /// In ru, this message translates to:
  /// **'видеоурок'**
  String get courseDetailVideoLessonOne;

  /// No description provided for @courseDetailVideoLessonFew.
  ///
  /// In ru, this message translates to:
  /// **'видеоурока'**
  String get courseDetailVideoLessonFew;

  /// No description provided for @courseDetailVideoLessonMany.
  ///
  /// In ru, this message translates to:
  /// **'видеоуроков'**
  String get courseDetailVideoLessonMany;

  /// No description provided for @courseDetailQuizAfterLesson.
  ///
  /// In ru, this message translates to:
  /// **'Тест после урока {videosBefore}'**
  String courseDetailQuizAfterLesson(Object videosBefore);

  /// No description provided for @courseDetailQuizForCourse.
  ///
  /// In ru, this message translates to:
  /// **'Тест по курсу'**
  String get courseDetailQuizForCourse;

  /// No description provided for @courseDetailLessonMin.
  ///
  /// In ru, this message translates to:
  /// **'{p1} мин'**
  String courseDetailLessonMin(Object p1);

  /// No description provided for @courseDetailQuizBadge.
  ///
  /// In ru, this message translates to:
  /// **'ТЕСТ'**
  String get courseDetailQuizBadge;

  /// No description provided for @homePhActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'Активные квесты'**
  String get homePhActiveQuests;

  /// No description provided for @homePhAllQuests.
  ///
  /// In ru, this message translates to:
  /// **'Все квесты'**
  String get homePhAllQuests;

  /// No description provided for @homePhNoActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'Нет активных квестов'**
  String get homePhNoActiveQuests;

  /// No description provided for @homePhRecentChecks.
  ///
  /// In ru, this message translates to:
  /// **'Последние чеки'**
  String get homePhRecentChecks;

  /// No description provided for @homePhAllChecks.
  ///
  /// In ru, this message translates to:
  /// **'Все чеки'**
  String get homePhAllChecks;

  /// No description provided for @homePhNoChecks.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет чеков'**
  String get homePhNoChecks;

  /// No description provided for @homePhGreeting.
  ///
  /// In ru, this message translates to:
  /// **'Привет!'**
  String get homePhGreeting;

  /// No description provided for @homePhGreetingName.
  ///
  /// In ru, this message translates to:
  /// **'Привет, {name}!'**
  String homePhGreetingName(Object name);

  /// No description provided for @homePhGreetingSub.
  ///
  /// In ru, this message translates to:
  /// **'Готовы к новым знаниям?'**
  String get homePhGreetingSub;

  /// No description provided for @homePhWalletBalanceLabel.
  ///
  /// In ru, this message translates to:
  /// **'БАЛАНС КОШЕЛЬКА'**
  String get homePhWalletBalanceLabel;

  /// No description provided for @homePhWalletButton.
  ///
  /// In ru, this message translates to:
  /// **'Кошелёк'**
  String get homePhWalletButton;

  /// No description provided for @homePhSendCheck.
  ///
  /// In ru, this message translates to:
  /// **'Отправить чек'**
  String get homePhSendCheck;

  /// No description provided for @homePhSendCheckSub.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте чек — ИИ распознает препараты'**
  String get homePhSendCheckSub;

  /// No description provided for @homePhStatActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'активных квестов'**
  String get homePhStatActiveQuests;

  /// No description provided for @homePhStatApprovedChecks.
  ///
  /// In ru, this message translates to:
  /// **'одобренных чеков'**
  String get homePhStatApprovedChecks;

  /// No description provided for @homePhStatIqcPoints.
  ///
  /// In ru, this message translates to:
  /// **'баллов IQC'**
  String get homePhStatIqcPoints;

  /// No description provided for @homePhVoucherBadge.
  ///
  /// In ru, this message translates to:
  /// **'ВАУЧЕР'**
  String get homePhVoucherBadge;

  /// No description provided for @homePhProgress.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс'**
  String get homePhProgress;

  /// No description provided for @homePhPctDone.
  ///
  /// In ru, this message translates to:
  /// **'{pct}% выполнено'**
  String homePhPctDone(Object pct);

  /// No description provided for @homePhCheckNumber.
  ///
  /// In ru, this message translates to:
  /// **'Чек №{p1}'**
  String homePhCheckNumber(Object p1);

  /// No description provided for @learnLessonOne.
  ///
  /// In ru, this message translates to:
  /// **'урок'**
  String get learnLessonOne;

  /// No description provided for @learnLessonFew.
  ///
  /// In ru, this message translates to:
  /// **'урока'**
  String get learnLessonFew;

  /// No description provided for @learnLessonMany.
  ///
  /// In ru, this message translates to:
  /// **'уроков'**
  String get learnLessonMany;

  /// No description provided for @learnTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get learnTitle;

  /// No description provided for @learnSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по курсам...'**
  String get learnSearchHint;

  /// No description provided for @learnTabAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get learnTabAll;

  /// No description provided for @learnTabMine.
  ///
  /// In ru, this message translates to:
  /// **'Мои курсы'**
  String get learnTabMine;

  /// No description provided for @learnTabDone.
  ///
  /// In ru, this message translates to:
  /// **'Пройденные'**
  String get learnTabDone;

  /// No description provided for @learnNewBadge.
  ///
  /// In ru, this message translates to:
  /// **'НОВЫЙ'**
  String get learnNewBadge;

  /// No description provided for @learnRepeatCourse.
  ///
  /// In ru, this message translates to:
  /// **'ПОВТОРИТЬ КУРС'**
  String get learnRepeatCourse;

  /// No description provided for @learnContinueLearning.
  ///
  /// In ru, this message translates to:
  /// **'ПРОДОЛЖИТЬ ОБУЧЕНИЕ'**
  String get learnContinueLearning;

  /// No description provided for @learnStartCourse.
  ///
  /// In ru, this message translates to:
  /// **'ПРОЙТИ КУРС'**
  String get learnStartCourse;

  /// No description provided for @learnCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Пройден'**
  String get learnCompleted;

  /// No description provided for @learnNotFoundTitle.
  ///
  /// In ru, this message translates to:
  /// **'Курсы не найдены'**
  String get learnNotFoundTitle;

  /// No description provided for @learnTryChangeFilters.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте изменить фильтры'**
  String get learnTryChangeFilters;

  /// No description provided for @learnNothingForQuery.
  ///
  /// In ru, this message translates to:
  /// **'По запросу «{query}» ничего не нашлось.\\nПопробуйте изменить запрос или сбросить фильтры.'**
  String learnNothingForQuery(Object query);

  /// No description provided for @learnResetFilters.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить фильтры'**
  String get learnResetFilters;

  /// No description provided for @lessonCompletedReward.
  ///
  /// In ru, this message translates to:
  /// **'Урок завершён · +{p1} IQC'**
  String lessonCompletedReward(Object p1);

  /// No description provided for @lessonNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Урок не найден'**
  String get lessonNotFound;

  /// No description provided for @lessonTabText.
  ///
  /// In ru, this message translates to:
  /// **'ТЕКСТ УРОКА'**
  String get lessonTabText;

  /// No description provided for @lessonTabMaterials.
  ///
  /// In ru, this message translates to:
  /// **'МАТЕРИАЛЫ УРОКА'**
  String get lessonTabMaterials;

  /// No description provided for @lessonNoMaterials.
  ///
  /// In ru, this message translates to:
  /// **'Материалов пока нет'**
  String get lessonNoMaterials;

  /// No description provided for @lessonStartQuiz.
  ///
  /// In ru, this message translates to:
  /// **'НАЧАТЬ ТЕСТИРОВАНИЕ'**
  String get lessonStartQuiz;

  /// No description provided for @lessonComplete.
  ///
  /// In ru, this message translates to:
  /// **'ЗАВЕРШИТЬ УРОК'**
  String get lessonComplete;

  /// No description provided for @questDetailBackQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квесты'**
  String get questDetailBackQuests;

  /// No description provided for @questDetailPillVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер'**
  String get questDetailPillVoucher;

  /// No description provided for @questDetailLeftLabel.
  ///
  /// In ru, this message translates to:
  /// **'осталось'**
  String get questDetailLeftLabel;

  /// No description provided for @questDetailDoneLabel.
  ///
  /// In ru, this message translates to:
  /// **'выполнено'**
  String get questDetailDoneLabel;

  /// No description provided for @questDetailRewardLabel.
  ///
  /// In ru, this message translates to:
  /// **'НАГРАДА'**
  String get questDetailRewardLabel;

  /// No description provided for @questDetailVoucherManual.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер выдаётся вручную после проверки'**
  String get questDetailVoucherManual;

  /// No description provided for @questDetailIqcToBalance.
  ///
  /// In ru, this message translates to:
  /// **'+{p1} IQC на баланс'**
  String questDetailIqcToBalance(Object p1);

  /// No description provided for @questDetailHowTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как засчитываются чеки'**
  String get questDetailHowTitle;

  /// No description provided for @questDetailHowBody.
  ///
  /// In ru, this message translates to:
  /// **'Отправляйте фото чеков с нужным препаратом. Проверка упаковки — автоматически.'**
  String get questDetailHowBody;

  /// No description provided for @questDetailTodoTitle.
  ///
  /// In ru, this message translates to:
  /// **'Что нужно сделать'**
  String get questDetailTodoTitle;

  /// No description provided for @questDetailDrugLabel.
  ///
  /// In ru, this message translates to:
  /// **'Препарат'**
  String get questDetailDrugLabel;

  /// No description provided for @questDetailLimitsLabel.
  ///
  /// In ru, this message translates to:
  /// **'Лимиты'**
  String get questDetailLimitsLabel;

  /// No description provided for @questDetailPeriodLabel.
  ///
  /// In ru, this message translates to:
  /// **'Период'**
  String get questDetailPeriodLabel;

  /// No description provided for @questDetailParticipantsLabel.
  ///
  /// In ru, this message translates to:
  /// **'Участников'**
  String get questDetailParticipantsLabel;

  /// No description provided for @questDetailPurchases.
  ///
  /// In ru, this message translates to:
  /// **'покупок'**
  String get questDetailPurchases;

  /// No description provided for @questsPeriodUntil.
  ///
  /// In ru, this message translates to:
  /// **'до {p1}'**
  String questsPeriodUntil(Object p1);

  /// No description provided for @questsPeriodFrom.
  ///
  /// In ru, this message translates to:
  /// **'с {p1}'**
  String questsPeriodFrom(Object p1);

  /// No description provided for @questsPeriodNone.
  ///
  /// In ru, this message translates to:
  /// **'Без срока'**
  String get questsPeriodNone;

  /// No description provided for @questsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Квесты'**
  String get questsTitle;

  /// No description provided for @questsTabActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get questsTabActive;

  /// No description provided for @questsTabArchive.
  ///
  /// In ru, this message translates to:
  /// **'Архив'**
  String get questsTabArchive;

  /// No description provided for @questsTabAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get questsTabAll;

  /// No description provided for @questsCountWordActive.
  ///
  /// In ru, this message translates to:
  /// **'активных'**
  String get questsCountWordActive;

  /// No description provided for @questsCountWordArchive.
  ///
  /// In ru, this message translates to:
  /// **'архивных'**
  String get questsCountWordArchive;

  /// No description provided for @questsCountQuestOne.
  ///
  /// In ru, this message translates to:
  /// **'квест'**
  String get questsCountQuestOne;

  /// No description provided for @questsCountQuestFew.
  ///
  /// In ru, this message translates to:
  /// **'квеста'**
  String get questsCountQuestFew;

  /// No description provided for @questsHistoryChip.
  ///
  /// In ru, this message translates to:
  /// **'История участия'**
  String get questsHistoryChip;

  /// No description provided for @questsSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get questsSearchHint;

  /// No description provided for @questsPacksItem.
  ///
  /// In ru, this message translates to:
  /// **'{p1} × {p2} уп.'**
  String questsPacksItem(Object p1, Object p2);

  /// No description provided for @questsIqcNoLimit.
  ///
  /// In ru, this message translates to:
  /// **'+{p1} IQC · без лимита'**
  String questsIqcNoLimit(Object p1);

  /// No description provided for @questsPillVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер'**
  String get questsPillVoucher;

  /// No description provided for @questsActive.
  ///
  /// In ru, this message translates to:
  /// **'Активен'**
  String get questsActive;

  /// No description provided for @questsFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершён'**
  String get questsFinished;

  /// No description provided for @questsEmptyArchiveTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нет архивных квестов'**
  String get questsEmptyArchiveTitle;

  /// No description provided for @questsEmptyArchiveSub.
  ///
  /// In ru, this message translates to:
  /// **'Завершённые квесты появятся здесь'**
  String get questsEmptyArchiveSub;

  /// No description provided for @questsEmptyActiveTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нет активных квестов'**
  String get questsEmptyActiveTitle;

  /// No description provided for @questsEmptyActiveSub.
  ///
  /// In ru, this message translates to:
  /// **'Новые квесты появятся здесь'**
  String get questsEmptyActiveSub;

  /// No description provided for @questsEmptyAllTitle.
  ///
  /// In ru, this message translates to:
  /// **'Квестов нет'**
  String get questsEmptyAllTitle;

  /// No description provided for @questsEmptyAllSub.
  ///
  /// In ru, this message translates to:
  /// **'Загляните позже'**
  String get questsEmptyAllSub;

  /// No description provided for @questsViewActive.
  ///
  /// In ru, this message translates to:
  /// **'Смотреть активные'**
  String get questsViewActive;

  /// No description provided for @quizTitle.
  ///
  /// In ru, this message translates to:
  /// **'Тестирование'**
  String get quizTitle;

  /// No description provided for @quizQuestionOf.
  ///
  /// In ru, this message translates to:
  /// **'Вопрос {p1} из {n}'**
  String quizQuestionOf(Object p1, Object n);

  /// No description provided for @quizFinish.
  ///
  /// In ru, this message translates to:
  /// **'ЗАВЕРШИТЬ ТЕСТ'**
  String get quizFinish;

  /// No description provided for @quizNext.
  ///
  /// In ru, this message translates to:
  /// **'СЛЕДУЮЩИЙ ВОПРОС →'**
  String get quizNext;

  /// No description provided for @quizAnswerLabel.
  ///
  /// In ru, this message translates to:
  /// **'Ответ'**
  String get quizAnswerLabel;

  /// No description provided for @quizCongrats.
  ///
  /// In ru, this message translates to:
  /// **'Поздравляем!'**
  String get quizCongrats;

  /// No description provided for @quizPassed.
  ///
  /// In ru, this message translates to:
  /// **'Тест успешно пройден!'**
  String get quizPassed;

  /// No description provided for @quizYouEarned.
  ///
  /// In ru, this message translates to:
  /// **'Вы заработали'**
  String get quizYouEarned;

  /// No description provided for @quizCorrectLabel.
  ///
  /// In ru, this message translates to:
  /// **'ПРАВИЛЬНЫХ'**
  String get quizCorrectLabel;

  /// No description provided for @quizResultLabel.
  ///
  /// In ru, this message translates to:
  /// **'РЕЗУЛЬТАТ'**
  String get quizResultLabel;

  /// No description provided for @quizToHome.
  ///
  /// In ru, this message translates to:
  /// **'НА ГЛАВНЫЙ ЭКРАН'**
  String get quizToHome;

  /// No description provided for @quizViewCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть сертификат →'**
  String get quizViewCertificate;

  /// No description provided for @quizTryAgainTitle.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте ещё раз'**
  String get quizTryAgainTitle;

  /// No description provided for @quizFailed.
  ///
  /// In ru, this message translates to:
  /// **'Тест не пройден'**
  String get quizFailed;

  /// No description provided for @quizYourResult.
  ///
  /// In ru, this message translates to:
  /// **'Ваш результат'**
  String get quizYourResult;

  /// No description provided for @quizCorrectLower.
  ///
  /// In ru, this message translates to:
  /// **'правильных'**
  String get quizCorrectLower;

  /// No description provided for @quizPassMinimum.
  ///
  /// In ru, this message translates to:
  /// **'Минимум для прохождения: {passScore}/{total} ({passPct}%)'**
  String quizPassMinimum(Object passScore, Object total, Object passPct);

  /// No description provided for @quizRetry.
  ///
  /// In ru, this message translates to:
  /// **'↺ ПРОЙТИ ЗАНОВО'**
  String get quizRetry;

  /// No description provided for @quizBackToLesson.
  ///
  /// In ru, this message translates to:
  /// **'Вернуться к уроку →'**
  String get quizBackToLesson;

  /// No description provided for @voucherNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер не найден'**
  String get voucherNotFound;

  /// No description provided for @voucherTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мой ваучер'**
  String get voucherTitle;

  /// No description provided for @voucherCodeCopied.
  ///
  /// In ru, this message translates to:
  /// **'Код скопирован'**
  String get voucherCodeCopied;

  /// No description provided for @voucherUsed.
  ///
  /// In ru, this message translates to:
  /// **'Использован'**
  String get voucherUsed;

  /// No description provided for @voucherActive.
  ///
  /// In ru, this message translates to:
  /// **'Активен'**
  String get voucherActive;

  /// No description provided for @voucherIssuedAt.
  ///
  /// In ru, this message translates to:
  /// **'Выпущен {p1}'**
  String voucherIssuedAt(Object p1);

  /// No description provided for @voucherGiftCardLabel.
  ///
  /// In ru, this message translates to:
  /// **'UZS · ПОДАРОЧНАЯ КАРТА'**
  String get voucherGiftCardLabel;

  /// No description provided for @voucherShowQr.
  ///
  /// In ru, this message translates to:
  /// **'Покажите QR-код кассиру или назовите код'**
  String get voucherShowQr;

  /// No description provided for @voucherStores.
  ///
  /// In ru, this message translates to:
  /// **'Магазины Korzinka.uz'**
  String get voucherStores;

  /// No description provided for @voucherSupport.
  ///
  /// In ru, this message translates to:
  /// **'Служба поддержки'**
  String get voucherSupport;

  /// No description provided for @walletPendingVouchers.
  ///
  /// In ru, this message translates to:
  /// **'Ваучеры в очереди'**
  String get walletPendingVouchers;

  /// No description provided for @walletUseIqc.
  ///
  /// In ru, this message translates to:
  /// **'Использовать IQC'**
  String get walletUseIqc;

  /// No description provided for @walletMyVouchers.
  ///
  /// In ru, this message translates to:
  /// **'Мои ваучеры'**
  String get walletMyVouchers;

  /// No description provided for @walletNoVouchers.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет ваучеров'**
  String get walletNoVouchers;

  /// No description provided for @walletRedeemTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обменять баллы?'**
  String get walletRedeemTitle;

  /// No description provided for @walletRedeemBody.
  ///
  /// In ru, this message translates to:
  /// **'{p1} за {p2} IQC'**
  String walletRedeemBody(Object p1, Object p2);

  /// No description provided for @walletCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get walletCancel;

  /// No description provided for @walletRedeem.
  ///
  /// In ru, this message translates to:
  /// **'Обменять'**
  String get walletRedeem;

  /// No description provided for @walletVoucherIssued.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер оформлен'**
  String get walletVoucherIssued;

  /// No description provided for @walletTitle.
  ///
  /// In ru, this message translates to:
  /// **'Кошелёк'**
  String get walletTitle;

  /// No description provided for @walletBalanceLabel.
  ///
  /// In ru, this message translates to:
  /// **'БАЛАНС'**
  String get walletBalanceLabel;

  /// No description provided for @walletTotalAccrued.
  ///
  /// In ru, this message translates to:
  /// **'Всего начислено: {p1} IQC'**
  String walletTotalAccrued(Object p1);

  /// No description provided for @walletHistoryArrow.
  ///
  /// In ru, this message translates to:
  /// **'История →'**
  String get walletHistoryArrow;

  /// No description provided for @walletQuestDoneAwaiting.
  ///
  /// In ru, this message translates to:
  /// **'Квест выполнен — ваучер ждёт выдачи'**
  String get walletQuestDoneAwaiting;

  /// No description provided for @walletForIqc.
  ///
  /// In ru, this message translates to:
  /// **'за {p1} IQC'**
  String walletForIqc(Object p1);

  /// No description provided for @walletGetVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Получить ваучер'**
  String get walletGetVoucher;

  /// No description provided for @walletNotEnoughIqc.
  ///
  /// In ru, this message translates to:
  /// **'Недостаточно IQC'**
  String get walletNotEnoughIqc;

  /// No description provided for @walletCodeMeta.
  ///
  /// In ru, this message translates to:
  /// **'Код: {p1} · {p2}'**
  String walletCodeMeta(Object p1, Object p2);

  /// No description provided for @walletVoucherUsed.
  ///
  /// In ru, this message translates to:
  /// **'Использован'**
  String get walletVoucherUsed;

  /// No description provided for @walletVoucherActive.
  ///
  /// In ru, this message translates to:
  /// **'Активен'**
  String get walletVoucherActive;

  /// No description provided for @walletHistoryTitle.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get walletHistoryTitle;

  /// No description provided for @walletNoTransactions.
  ///
  /// In ru, this message translates to:
  /// **'Операций пока нет'**
  String get walletNoTransactions;

  /// No description provided for @brandProductsBrand.
  ///
  /// In ru, this message translates to:
  /// **'Бренд'**
  String get brandProductsBrand;

  /// No description provided for @brandProductsFormat.
  ///
  /// In ru, this message translates to:
  /// **'Формат'**
  String get brandProductsFormat;

  /// No description provided for @brandProductsMxik.
  ///
  /// In ru, this message translates to:
  /// **'МХИК'**
  String get brandProductsMxik;

  /// No description provided for @brandProductsDivisible.
  ///
  /// In ru, this message translates to:
  /// **'Делимый'**
  String get brandProductsDivisible;

  /// No description provided for @brandProductsYes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get brandProductsYes;

  /// No description provided for @brandProductsNo.
  ///
  /// In ru, this message translates to:
  /// **'Нет'**
  String get brandProductsNo;

  /// No description provided for @brandProductsQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квестов'**
  String get brandProductsQuests;

  /// No description provided for @medrepHomePeriodAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get medrepHomePeriodAll;

  /// No description provided for @medrepHomePeriod30d.
  ///
  /// In ru, this message translates to:
  /// **'30 дн'**
  String get medrepHomePeriod30d;

  /// No description provided for @medrepHomePeriod7d.
  ///
  /// In ru, this message translates to:
  /// **'7 дн'**
  String get medrepHomePeriod7d;

  /// No description provided for @leaderboardTabChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеков'**
  String get leaderboardTabChecks;

  /// No description provided for @leaderboardTabPharm.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевтов'**
  String get leaderboardTabPharm;

  /// No description provided for @leaderboardTabQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квесты'**
  String get leaderboardTabQuests;

  /// No description provided for @leaderboardMyRankLabel.
  ///
  /// In ru, this message translates to:
  /// **'{company} | Мой ранг: '**
  String leaderboardMyRankLabel(Object company);

  /// No description provided for @leaderboardMyRank.
  ///
  /// In ru, this message translates to:
  /// **'#{rank} из {total}'**
  String leaderboardMyRank(Object rank, Object total);

  /// No description provided for @portfolioChecksChip.
  ///
  /// In ru, this message translates to:
  /// **'Чеков: {count}'**
  String portfolioChecksChip(Object count);

  /// No description provided for @portfolioQuestsChip.
  ///
  /// In ru, this message translates to:
  /// **'Квестов: {count}'**
  String portfolioQuestsChip(Object count);

  /// No description provided for @referralsDate.
  ///
  /// In ru, this message translates to:
  /// **'Заявка: {date}'**
  String referralsDate(Object date);

  /// No description provided for @checksStatusApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get checksStatusApproved;

  /// No description provided for @checksStatusRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get checksStatusRejected;

  /// No description provided for @checksStatusPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get checksStatusPending;

  /// No description provided for @questDetailRewardVoucherLine.
  ///
  /// In ru, this message translates to:
  /// **'Korzinka · {amount} сум'**
  String questDetailRewardVoucherLine(Object amount);

  /// No description provided for @questDetailRewardIqcLine.
  ///
  /// In ru, this message translates to:
  /// **'Все аптеки · без лимита'**
  String get questDetailRewardIqcLine;

  /// No description provided for @questDetailActiveUntil.
  ///
  /// In ru, this message translates to:
  /// **'Активен до {date}'**
  String questDetailActiveUntil(Object date);

  /// No description provided for @questDetailFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершён'**
  String get questDetailFinished;

  /// No description provided for @questsPurchasesOfGoal.
  ///
  /// In ru, this message translates to:
  /// **'{completed} / {goal} покупок'**
  String questsPurchasesOfGoal(Object completed, Object goal);

  /// No description provided for @questsPurchases.
  ///
  /// In ru, this message translates to:
  /// **'{completed} покупок'**
  String questsPurchases(Object completed);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

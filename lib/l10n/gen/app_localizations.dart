import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_kk.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tg.dart';
import 'app_localizations_uz.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('kk'),
    Locale('ky'),
    Locale('ru'),
    Locale('tg'),
    Locale('uz'),
  ];

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
  /// **'Бланки'**
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
  /// **'Акции для участников программы'**
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
  /// **'Выбирайте клетки за IQC — при подведении итогов узнаете, что под ними'**
  String get sapperSubtitle;

  /// No description provided for @sapperNoDraws.
  ///
  /// In ru, this message translates to:
  /// **'Нет активных акций'**
  String get sapperNoDraws;

  /// No description provided for @sapperRevealed.
  ///
  /// In ru, this message translates to:
  /// **'Завершена'**
  String get sapperRevealed;

  /// No description provided for @sapperPrizesAndPrice.
  ///
  /// In ru, this message translates to:
  /// **'🎁 призов: {prizeCount}  💎 {priceIqc} IQC/клетка  '**
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
  /// **'Открыть поле'**
  String get sapperGoToGame;

  /// No description provided for @sapperReserveTitle.
  ///
  /// In ru, this message translates to:
  /// **'Занять клетку №{number}?'**
  String sapperReserveTitle(Object number);

  /// No description provided for @sapperReserveBody.
  ///
  /// In ru, this message translates to:
  /// **'Будет использовано {price} IQC. Отменить нельзя — клетка закрепится за вами до подведения итогов.'**
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

  /// No description provided for @sapperNoIqcTitle.
  ///
  /// In ru, this message translates to:
  /// **'Недостаточно IQC'**
  String get sapperNoIqcTitle;

  /// No description provided for @sapperNoIqcBody.
  ///
  /// In ru, this message translates to:
  /// **'Для участия нужно {price} IQC, у вас {have}. Заработайте IQC — пройдите обучение, квест или опрос.'**
  String sapperNoIqcBody(Object price, Object have);

  /// No description provided for @sapperDraws.
  ///
  /// In ru, this message translates to:
  /// **'Акции'**
  String get sapperDraws;

  /// No description provided for @sapperAcceptClosed.
  ///
  /// In ru, this message translates to:
  /// **'Выбор клеток закрыт — подводим итоги'**
  String get sapperAcceptClosed;

  /// No description provided for @sapperHiddenTitle.
  ///
  /// In ru, this message translates to:
  /// **'ПРИЗЫ НА ПОЛЕ'**
  String get sapperHiddenTitle;

  /// No description provided for @sapperFieldTotal.
  ///
  /// In ru, this message translates to:
  /// **'НА ПОЛЕ {count, plural, one{{count} клетка} few{{count} клетки} many{{count} клеток} other{{count} клеток}}'**
  String sapperFieldTotal(int count);

  /// No description provided for @sapperRevealIn.
  ///
  /// In ru, this message translates to:
  /// **'итоги через {time}'**
  String sapperRevealIn(Object time);

  /// No description provided for @sapperNoPrizes.
  ///
  /// In ru, this message translates to:
  /// **'призы не указаны'**
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
  /// **'клетка — {price} IQC'**
  String sapperCellPrice(Object price);

  /// No description provided for @sapperYourBalance.
  ///
  /// In ru, this message translates to:
  /// **'Ваш баланс'**
  String get sapperYourBalance;

  /// No description provided for @sapperCellPriceLabel.
  ///
  /// In ru, this message translates to:
  /// **'за клетку'**
  String get sapperCellPriceLabel;

  /// No description provided for @sapperWinBannerWin.
  ///
  /// In ru, this message translates to:
  /// **'🎉 Вы получили {count} {word}!'**
  String sapperWinBannerWin(Object count, Object word);

  /// No description provided for @sapperNoWin.
  ///
  /// In ru, this message translates to:
  /// **'В этот раз без приза'**
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
  /// **'Пусто'**
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
  /// **'Заняты другими'**
  String get sapperLegendOccupied;

  /// No description provided for @sapperLegendFree.
  ///
  /// In ru, this message translates to:
  /// **'Свободно'**
  String get sapperLegendFree;

  /// No description provided for @sapperWinners.
  ///
  /// In ru, this message translates to:
  /// **'Получили призы'**
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

  /// No description provided for @loginChooseMethod.
  ///
  /// In ru, this message translates to:
  /// **'Выберите удобный способ входа'**
  String get loginChooseMethod;

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

  /// No description provided for @loginNoAccount.
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта?'**
  String get loginNoAccount;

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
  /// **'Отвечаем в Telegram и по телефону'**
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

  /// No description provided for @profileLogoutConfirmBody.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы снова пользоваться приложением, нужно будет войти ещё раз.'**
  String get profileLogoutConfirmBody;

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
  /// **'Удалим профиль, номер телефона, привязки входа, уведомления и переписку с поддержкой. Записи о начислениях и выданных ваучерах сохранятся без ваших персональных данных — они нужны для учёта. Действие необратимо.'**
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
  /// **'Статусы чеков и бланков'**
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
  /// **'Отправляйте бланки и получайте вознаграждение'**
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
  /// **'Отправить бланк'**
  String get docHomeSendRecipe;

  /// No description provided for @docHomeSendRecipeHint.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте бланк — ИИ распознает препараты'**
  String get docHomeSendRecipeHint;

  /// No description provided for @docHomeStatRecipes.
  ///
  /// In ru, this message translates to:
  /// **'всего бланков'**
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
  /// **'Мои бланки'**
  String get recipeDetailMyRecipes;

  /// No description provided for @recipeDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бланк №{id}'**
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
  /// **'Мои бланки'**
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
  /// **'Бланков пока нет'**
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
  /// **'Бланк добавлен — загружается'**
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
  /// **'Отправить бланк'**
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
  /// **'Оформить ваучер?'**
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
  /// **'Оформить'**
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
  /// **'Ваучер Korzinka · {amount} IQC'**
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

  /// No description provided for @profileLanguageTitle.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get profileLanguageTitle;

  /// No description provided for @profileChooseLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Выберите язык'**
  String get profileChooseLanguage;

  /// No description provided for @navDoctors.
  ///
  /// In ru, this message translates to:
  /// **'Врачи'**
  String get navDoctors;

  /// No description provided for @doctorsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Врачи'**
  String get doctorsTitle;

  /// No description provided for @doctorsHint.
  ///
  /// In ru, this message translates to:
  /// **'Врачи вашей компании и их прогресс по квесту на бланки'**
  String get doctorsHint;

  /// No description provided for @doctorsSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по врачу, клинике, городу'**
  String get doctorsSearchHint;

  /// No description provided for @doctorsCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Выполнили'**
  String get doctorsCompleted;

  /// No description provided for @doctorsInProgress.
  ///
  /// In ru, this message translates to:
  /// **'В процессе'**
  String get doctorsInProgress;

  /// No description provided for @doctorsIdle.
  ///
  /// In ru, this message translates to:
  /// **'Не начали'**
  String get doctorsIdle;

  /// No description provided for @doctorsNoQuest.
  ///
  /// In ru, this message translates to:
  /// **'Нет активного квеста на бланки'**
  String get doctorsNoQuest;

  /// No description provided for @doctorsUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'У вашей компании нет проекта с бланками, поэтому врачи не подключены'**
  String get doctorsUnavailable;

  /// No description provided for @doctorsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Врачей пока нет'**
  String get doctorsEmpty;

  /// No description provided for @doctorsNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get doctorsNotFound;

  /// No description provided for @doctorsRegionUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Регион не указан'**
  String get doctorsRegionUnknown;

  /// No description provided for @doctorsRecipesCount.
  ///
  /// In ru, this message translates to:
  /// **'Бланков за всё время: {count}'**
  String doctorsRecipesCount(Object count);

  /// No description provided for @doctorsQuestGoal.
  ///
  /// In ru, this message translates to:
  /// **'Норма: {goal}'**
  String doctorsQuestGoal(Object goal);

  /// No description provided for @doctorsDoneTimes.
  ///
  /// In ru, this message translates to:
  /// **'Выполнен ×{count}'**
  String doctorsDoneTimes(Object count);

  /// No description provided for @doctorsRegionSummary.
  ///
  /// In ru, this message translates to:
  /// **'{doctors} врач. · {completed} вып.'**
  String doctorsRegionSummary(Object doctors, Object completed);

  /// No description provided for @doctorsAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get doctorsAll;

  /// No description provided for @loginWithGoogle.
  ///
  /// In ru, this message translates to:
  /// **'Войти через Google'**
  String get loginWithGoogle;

  /// No description provided for @loginWithApple.
  ///
  /// In ru, this message translates to:
  /// **'Войти через Apple'**
  String get loginWithApple;

  /// No description provided for @oauthLinkTitle.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите номер телефона'**
  String get oauthLinkTitle;

  /// No description provided for @oauthLinkBody.
  ///
  /// In ru, this message translates to:
  /// **'Один раз подтвердите номер — так мы найдём ваш аккаунт и баллы. В следующий раз вход будет в одно касание.'**
  String get oauthLinkBody;

  /// No description provided for @oauthLinkPhoneLabel.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get oauthLinkPhoneLabel;

  /// No description provided for @oauthLinkSendCode.
  ///
  /// In ru, this message translates to:
  /// **'Получить код'**
  String get oauthLinkSendCode;

  /// No description provided for @oauthLinkCodeSent.
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен на {phone}'**
  String oauthLinkCodeSent(String phone);

  /// No description provided for @oauthLinkCodeLabel.
  ///
  /// In ru, this message translates to:
  /// **'Код из SMS'**
  String get oauthLinkCodeLabel;

  /// No description provided for @oauthLinkConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get oauthLinkConfirm;

  /// No description provided for @oauthLinkChangePhone.
  ///
  /// In ru, this message translates to:
  /// **'Изменить номер'**
  String get oauthLinkChangePhone;

  /// No description provided for @profilePrivacy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get profilePrivacy;

  /// No description provided for @profilePrivacySubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Какие данные мы собираем и как храним'**
  String get profilePrivacySubtitle;

  /// No description provided for @sapperRulesButton.
  ///
  /// In ru, this message translates to:
  /// **'Правила акции'**
  String get sapperRulesButton;

  /// No description provided for @sapperRulesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Правила акции «Супер Сапёр»'**
  String get sapperRulesTitle;

  /// No description provided for @sapperRulesFull.
  ///
  /// In ru, this message translates to:
  /// **'Полные официальные правила'**
  String get sapperRulesFull;

  /// No description provided for @sapperRulesAccept.
  ///
  /// In ru, this message translates to:
  /// **'Занимая клетку, вы принимаете правила акции.'**
  String get sapperRulesAccept;

  /// No description provided for @sapperRule1.
  ///
  /// In ru, this message translates to:
  /// **'Организатор — ООО «PHARMIQ ACADEMY». Apple и Google не являются спонсорами акции и никак в ней не участвуют.'**
  String get sapperRule1;

  /// No description provided for @sapperRule2.
  ///
  /// In ru, this message translates to:
  /// **'Деньги в акции не используются: участвовать можно только за баллы IQC.'**
  String get sapperRule2;

  /// No description provided for @sapperRule3.
  ///
  /// In ru, this message translates to:
  /// **'Баллы IQC начисляются за обучение, опросы и подтверждённые квесты. Их нельзя купить, передать другому пользователю или обменять на деньги.'**
  String get sapperRule3;

  /// No description provided for @sapperRule4.
  ///
  /// In ru, this message translates to:
  /// **'Сроки, цена клетки и полный список призов показаны на странице акции до участия.'**
  String get sapperRule4;

  /// No description provided for @sapperRule5.
  ///
  /// In ru, this message translates to:
  /// **'Баллы списываются при занятии клетки, отменить это нельзя. Одну клетку занимает один участник; приём закрывается за 1 минуту до итогов.'**
  String get sapperRule5;

  /// No description provided for @sapperRule6.
  ///
  /// In ru, this message translates to:
  /// **'Призы размещаются в клетках до начала акции и после старта не меняются. В назначенное время все клетки открываются одновременно, приз из клетки автоматически получает участник, который её занял. Итоги видны всем.'**
  String get sapperRule6;

  /// No description provided for @sapperRule7.
  ///
  /// In ru, this message translates to:
  /// **'Призы — подарочные ваучеры партнёров и бонусные баллы; на деньги они не обмениваются. Призы из незанятых клеток повторно не распределяются.'**
  String get sapperRule7;

  /// No description provided for @sapperRule8.
  ///
  /// In ru, this message translates to:
  /// **'Если акция отменена, все потраченные баллы возвращаются. Участвовать могут пользователи старше 18 лет, участие добровольное.'**
  String get sapperRule8;

  /// No description provided for @stateServerErrorTitle.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get stateServerErrorTitle;

  /// No description provided for @stateServerErrorText.
  ///
  /// In ru, this message translates to:
  /// **'Мы уже знаем о проблеме и чиним её. Попробуйте ещё раз через минуту'**
  String get stateServerErrorText;

  /// No description provided for @stateWriteSupport.
  ///
  /// In ru, this message translates to:
  /// **'Написать в поддержку'**
  String get stateWriteSupport;

  /// No description provided for @stateErrorCode.
  ///
  /// In ru, this message translates to:
  /// **'Код ошибки: {code}'**
  String stateErrorCode(String code);

  /// No description provided for @stateOfflineTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нет подключения к интернету'**
  String get stateOfflineTitle;

  /// No description provided for @stateOfflineText.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте Wi‑Fi или мобильный интернет. Экран обновится сам, как только связь появится'**
  String get stateOfflineText;

  /// No description provided for @stateOfflineBanner.
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения · данные от {time}'**
  String stateOfflineBanner(String time);

  /// No description provided for @stateOfflineBannerShort.
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения'**
  String get stateOfflineBannerShort;

  /// No description provided for @stateOfflineSendHint.
  ///
  /// In ru, this message translates to:
  /// **'Отправка станет доступна, когда появится интернет'**
  String get stateOfflineSendHint;

  /// No description provided for @stateRefreshing.
  ///
  /// In ru, this message translates to:
  /// **'Обновляем…'**
  String get stateRefreshing;

  /// No description provided for @miniAppsNewGamesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новые мини-приложения'**
  String get miniAppsNewGamesTitle;

  /// No description provided for @miniAppsNewGamesText.
  ///
  /// In ru, this message translates to:
  /// **'Уже в разработке — сообщим, когда появятся'**
  String get miniAppsNewGamesText;

  /// No description provided for @sapperBackTo.
  ///
  /// In ru, this message translates to:
  /// **'Назад: {label}'**
  String sapperBackTo(String label);

  /// No description provided for @sapperPrizesCount.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} приз} few{{n} приза} many{{n} призов} other{{n} приза}}'**
  String sapperPrizesCount(int n);

  /// No description provided for @sapperMyCellsCount.
  ///
  /// In ru, this message translates to:
  /// **'Ваших клеток: {n}'**
  String sapperMyCellsCount(int n);

  /// No description provided for @sapperResultsIn.
  ///
  /// In ru, this message translates to:
  /// **'Итоги через {time}'**
  String sapperResultsIn(String time);

  /// No description provided for @sapperCellPriceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Цена клетки'**
  String get sapperCellPriceTitle;

  /// No description provided for @sapperMyCellsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваших клеток'**
  String get sapperMyCellsTitle;

  /// No description provided for @sapperOccupiedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Занято клеток'**
  String get sapperOccupiedTitle;

  /// No description provided for @sapperOccupiedOf.
  ///
  /// In ru, this message translates to:
  /// **'{occupied} из {total}'**
  String sapperOccupiedOf(int occupied, int total);

  /// No description provided for @sapperOfTotal.
  ///
  /// In ru, this message translates to:
  /// **'из {total}'**
  String sapperOfTotal(int total);

  /// No description provided for @sapperHiddenLabel.
  ///
  /// In ru, this message translates to:
  /// **'На поле спрятано'**
  String get sapperHiddenLabel;

  /// No description provided for @sapperHowTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как участвовать'**
  String get sapperHowTitle;

  /// No description provided for @sapperStep1Title.
  ///
  /// In ru, this message translates to:
  /// **'Выберите клетки'**
  String get sapperStep1Title;

  /// No description provided for @sapperStep1Text.
  ///
  /// In ru, this message translates to:
  /// **'Каждая стоит {price} IQC. Можно занять сразу несколько'**
  String sapperStep1Text(int price);

  /// No description provided for @sapperStep2Title.
  ///
  /// In ru, this message translates to:
  /// **'Дождитесь подведения итогов'**
  String get sapperStep2Title;

  /// No description provided for @sapperStep2Text.
  ///
  /// In ru, this message translates to:
  /// **'Раз в неделю поле открывается для всех'**
  String get sapperStep2Text;

  /// No description provided for @sapperStep3Title.
  ///
  /// In ru, this message translates to:
  /// **'Получите приз'**
  String get sapperStep3Title;

  /// No description provided for @sapperStep3Text.
  ///
  /// In ru, this message translates to:
  /// **'IQC зачислим на баланс, ваучер появится в кошельке'**
  String get sapperStep3Text;

  /// No description provided for @sapperSelectHint.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите на свободные клетки, чтобы выбрать'**
  String get sapperSelectHint;

  /// No description provided for @sapperSelectedHint.
  ///
  /// In ru, this message translates to:
  /// **'Выбрано: {n} · спишем {price} IQC'**
  String sapperSelectedHint(int n, int price);

  /// No description provided for @sapperTakeCta.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Занять {n} клетку} few{Занять {n} клетки} many{Занять {n} клеток} other{Занять {n} клетки}} · {price} IQC'**
  String sapperTakeCta(int n, int price);

  /// No description provided for @sapperTakenToast.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{+{n} клетку} few{+{n} клетки} many{+{n} клеток} other{+{n} клетки}} — ждём итогов'**
  String sapperTakenToast(int n);

  /// No description provided for @sapperReserveManyTitle.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Занять {n} клетку?} few{Занять {n} клетки?} many{Занять {n} клеток?} other{Занять {n} клетки?}}'**
  String sapperReserveManyTitle(int n);

  /// No description provided for @sapperCellFree.
  ///
  /// In ru, this message translates to:
  /// **'Свободная клетка'**
  String get sapperCellFree;

  /// No description provided for @sapperCellTheirs.
  ///
  /// In ru, this message translates to:
  /// **'Занята другим участником'**
  String get sapperCellTheirs;

  /// No description provided for @sapperCellMine.
  ///
  /// In ru, this message translates to:
  /// **'Ваша клетка'**
  String get sapperCellMine;

  /// No description provided for @sapperCellSelected.
  ///
  /// In ru, this message translates to:
  /// **'Выбрана, нажмите чтобы снять'**
  String get sapperCellSelected;

  /// No description provided for @sapperCellEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пусто'**
  String get sapperCellEmpty;

  /// No description provided for @sapperCellPrize.
  ///
  /// In ru, this message translates to:
  /// **'Приз: {label}'**
  String sapperCellPrize(String label);

  /// No description provided for @sapperGridLabel.
  ///
  /// In ru, this message translates to:
  /// **'Поле {cols} на {rows}'**
  String sapperGridLabel(int cols, int rows);

  /// No description provided for @sapperGridRevealed.
  ///
  /// In ru, this message translates to:
  /// **'Открытое поле'**
  String get sapperGridRevealed;

  /// No description provided for @sapperWonTitle.
  ///
  /// In ru, this message translates to:
  /// **'Вы получили {prize}'**
  String sapperWonTitle(String prize);

  /// No description provided for @sapperWonText.
  ///
  /// In ru, this message translates to:
  /// **'Уже на балансе · призовых клеток: {wins} из {total}'**
  String sapperWonText(int wins, int total);

  /// No description provided for @sapperNotParticipated.
  ///
  /// In ru, this message translates to:
  /// **'Вы не участвовали в этой акции'**
  String get sapperNotParticipated;

  /// No description provided for @sapperRevealedOn.
  ///
  /// In ru, this message translates to:
  /// **'Итоги подведены · {date}'**
  String sapperRevealedOn(String date);

  /// No description provided for @sapperWinnerYou.
  ///
  /// In ru, this message translates to:
  /// **'вы'**
  String get sapperWinnerYou;

  /// No description provided for @sapperWinnerCell.
  ///
  /// In ru, this message translates to:
  /// **'Клетка №{n}'**
  String sapperWinnerCell(int n);

  /// No description provided for @sapperPlayNew.
  ///
  /// In ru, this message translates to:
  /// **'Участвовать в новой акции'**
  String get sapperPlayNew;

  /// No description provided for @sapperViewResults.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть итоги'**
  String get sapperViewResults;

  /// No description provided for @questsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Продавайте и получайте награды'**
  String get questsSubtitle;

  /// No description provided for @questsSubtitleDoctor.
  ///
  /// In ru, this message translates to:
  /// **'Выписывайте рецепты и получайте награды'**
  String get questsSubtitleDoctor;

  /// No description provided for @questsSearchLabel.
  ///
  /// In ru, this message translates to:
  /// **'Поиск квестов'**
  String get questsSearchLabel;

  /// No description provided for @questsTabDone.
  ///
  /// In ru, this message translates to:
  /// **'Завершённые'**
  String get questsTabDone;

  /// No description provided for @questsSortHint.
  ///
  /// In ru, this message translates to:
  /// **'Сначала — ближе всего к награде'**
  String get questsSortHint;

  /// No description provided for @questsAlmostDone.
  ///
  /// In ru, this message translates to:
  /// **'Почти готово'**
  String get questsAlmostDone;

  /// No description provided for @questsCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Выполнено'**
  String get questsCompleted;

  /// No description provided for @questsOfGoalSales.
  ///
  /// In ru, this message translates to:
  /// **'{goal, plural, one{из {goal} продажи} few{из {goal} продаж} many{из {goal} продаж} other{из {goal} продаж}}'**
  String questsOfGoalSales(int goal);

  /// No description provided for @questsOfGoalRecipes.
  ///
  /// In ru, this message translates to:
  /// **'{goal, plural, one{из {goal} рецепта} few{из {goal} рецептов} many{из {goal} рецептов} other{из {goal} рецептов}}'**
  String questsOfGoalRecipes(int goal);

  /// No description provided for @questsLeftShort.
  ///
  /// In ru, this message translates to:
  /// **'Ещё {n}'**
  String questsLeftShort(int n);

  /// No description provided for @questsMore.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get questsMore;

  /// No description provided for @questsHowTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как работают квесты'**
  String get questsHowTitle;

  /// No description provided for @questsStepSellTitle.
  ///
  /// In ru, this message translates to:
  /// **'Продайте'**
  String get questsStepSellTitle;

  /// No description provided for @questsStepSellSub.
  ///
  /// In ru, this message translates to:
  /// **'препарат'**
  String get questsStepSellSub;

  /// No description provided for @questsStepPrescribeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выпишите'**
  String get questsStepPrescribeTitle;

  /// No description provided for @questsStepPrescribeSub.
  ///
  /// In ru, this message translates to:
  /// **'рецепт'**
  String get questsStepPrescribeSub;

  /// No description provided for @questsStepSendTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте'**
  String get questsStepSendTitle;

  /// No description provided for @questsStepSendCheckSub.
  ///
  /// In ru, this message translates to:
  /// **'фото чека'**
  String get questsStepSendCheckSub;

  /// No description provided for @questsStepSendRecipeSub.
  ///
  /// In ru, this message translates to:
  /// **'фото рецепта'**
  String get questsStepSendRecipeSub;

  /// No description provided for @questsStepGetTitle.
  ///
  /// In ru, this message translates to:
  /// **'Получите'**
  String get questsStepGetTitle;

  /// No description provided for @questsStepGetSub.
  ///
  /// In ru, this message translates to:
  /// **'награду'**
  String get questsStepGetSub;

  /// No description provided for @questsDoneFooter.
  ///
  /// In ru, this message translates to:
  /// **'Здесь хранятся выполненные и завершённые квесты — с датой и полученной наградой'**
  String get questsDoneFooter;

  /// No description provided for @questsDoneOn.
  ///
  /// In ru, this message translates to:
  /// **'Выполнен · {date}'**
  String questsDoneOn(String date);

  /// No description provided for @questsEndedOn.
  ///
  /// In ru, this message translates to:
  /// **'Завершён · {date}'**
  String questsEndedOn(String date);

  /// No description provided for @questsEmptyDoneTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет завершённых квестов'**
  String get questsEmptyDoneTitle;

  /// No description provided for @questsMonthName.
  ///
  /// In ru, this message translates to:
  /// **'{m, select, m1{Январь} m2{Февраль} m3{Март} m4{Апрель} m5{Май} m6{Июнь} m7{Июль} m8{Август} m9{Сентябрь} m10{Октябрь} m11{Ноябрь} m12{Декабрь} other{}}'**
  String questsMonthName(String m);

  /// No description provided for @questsSalesLeftPrefix.
  ///
  /// In ru, this message translates to:
  /// **'Осталось продать'**
  String get questsSalesLeftPrefix;

  /// No description provided for @questsRecipesLeftPrefix.
  ///
  /// In ru, this message translates to:
  /// **'Осталось выписать'**
  String get questsRecipesLeftPrefix;

  /// No description provided for @questsPacks.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} упаковку} few{{n} упаковки} many{{n} упаковок} other{{n} упаковки}}'**
  String questsPacks(int n);

  /// No description provided for @questsRecipesCount.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} рецепт} few{{n} рецепта} many{{n} рецептов} other{{n} рецепта}}'**
  String questsRecipesCount(int n);

  /// No description provided for @questsGoalReached.
  ///
  /// In ru, this message translates to:
  /// **'Цель достигнута — награда будет начислена после проверки'**
  String get questsGoalReached;

  /// No description provided for @questsRewardLabel.
  ///
  /// In ru, this message translates to:
  /// **'Награда'**
  String get questsRewardLabel;

  /// No description provided for @questsVoucherTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер {shop}'**
  String questsVoucherTitle(String shop);

  /// No description provided for @questsRewardManual.
  ///
  /// In ru, this message translates to:
  /// **'Выдаётся вручную после проверки'**
  String get questsRewardManual;

  /// No description provided for @questsRewardIqcSub.
  ///
  /// In ru, this message translates to:
  /// **'Баллы придут на баланс после проверки'**
  String get questsRewardIqcSub;

  /// No description provided for @questsRewardReceived.
  ///
  /// In ru, this message translates to:
  /// **'Награда получена'**
  String get questsRewardReceived;

  /// No description provided for @questsStepSellDrug.
  ///
  /// In ru, this message translates to:
  /// **'Продайте {drug}'**
  String questsStepSellDrug(String drug);

  /// No description provided for @questsStepPrescribeDrug.
  ///
  /// In ru, this message translates to:
  /// **'Выпишите {drug}'**
  String questsStepPrescribeDrug(String drug);

  /// No description provided for @questsNeedSell.
  ///
  /// In ru, this message translates to:
  /// **'Нужно продать {packs}'**
  String questsNeedSell(String packs);

  /// No description provided for @questsNeedPrescribe.
  ///
  /// In ru, this message translates to:
  /// **'Нужно выписать {recipes}'**
  String questsNeedPrescribe(String recipes);

  /// No description provided for @questsStepPhotoCheck.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте чек'**
  String get questsStepPhotoCheck;

  /// No description provided for @questsStepPhotoCheckSub.
  ///
  /// In ru, this message translates to:
  /// **'ИИ проверит упаковку автоматически'**
  String get questsStepPhotoCheckSub;

  /// No description provided for @questsStepPhotoRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте рецепт'**
  String get questsStepPhotoRecipe;

  /// No description provided for @questsStepPhotoRecipeSub.
  ///
  /// In ru, this message translates to:
  /// **'ИИ проверит рецепт автоматически'**
  String get questsStepPhotoRecipeSub;

  /// No description provided for @questsStepGetVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Получите ваучер'**
  String get questsStepGetVoucher;

  /// No description provided for @questsStepGetIqc.
  ///
  /// In ru, this message translates to:
  /// **'Получите {n} IQC'**
  String questsStepGetIqc(int n);

  /// No description provided for @questsConditionsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Условия'**
  String get questsConditionsTitle;

  /// No description provided for @questsSalesLimit.
  ///
  /// In ru, this message translates to:
  /// **'Лимит продаж'**
  String get questsSalesLimit;

  /// No description provided for @questsRecipesLimit.
  ///
  /// In ru, this message translates to:
  /// **'Лимит рецептов'**
  String get questsRecipesLimit;

  /// No description provided for @questsNoLimit.
  ///
  /// In ru, this message translates to:
  /// **'Без ограничений'**
  String get questsNoLimit;

  /// No description provided for @questsPacksShort.
  ///
  /// In ru, this message translates to:
  /// **'{n} уп.'**
  String questsPacksShort(int n);

  /// No description provided for @questsCountedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Засчитанные чеки'**
  String get questsCountedTitle;

  /// No description provided for @questsCountedRecipesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Засчитанные рецепты'**
  String get questsCountedRecipesTitle;

  /// No description provided for @questsCountedEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пока ни одного чека'**
  String get questsCountedEmpty;

  /// No description provided for @questsCountedEmptyRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Пока ни одного рецепта'**
  String get questsCountedEmptyRecipes;

  /// No description provided for @questsCountedEmptySub.
  ///
  /// In ru, this message translates to:
  /// **'Чеки по квесту появятся здесь после проверки'**
  String get questsCountedEmptySub;

  /// No description provided for @questsCountedEmptySubRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Рецепты по квесту появятся здесь после проверки'**
  String get questsCountedEmptySubRecipes;

  /// No description provided for @questsCountedSales.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Засчитана {n} продажа} few{Засчитано {n} продажи} many{Засчитано {n} продаж} other{Засчитано {n} продажи}}'**
  String questsCountedSales(int n);

  /// No description provided for @questsCountedRecipes.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Засчитан {n} рецепт} few{Засчитано {n} рецепта} many{Засчитано {n} рецептов} other{Засчитано {n} рецепта}}'**
  String questsCountedRecipes(int n);

  /// No description provided for @questsAllChecks.
  ///
  /// In ru, this message translates to:
  /// **'Все чеки'**
  String get questsAllChecks;

  /// No description provided for @questsAllRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Все рецепты'**
  String get questsAllRecipes;

  /// No description provided for @questsSendCheck.
  ///
  /// In ru, this message translates to:
  /// **'Отправить чек по квесту'**
  String get questsSendCheck;

  /// No description provided for @questsSendRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Отправить рецепт по квесту'**
  String get questsSendRecipe;

  /// No description provided for @questsSearchPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'Название или препарат'**
  String get questsSearchPlaceholder;

  /// No description provided for @questsSearchClear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get questsSearchClear;

  /// No description provided for @questsFound.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Найден {n} квест} few{Найдено {n} квеста} many{Найдено {n} квестов} other{Найдено {n} квеста}}'**
  String questsFound(int n);

  /// No description provided for @questsPopular.
  ///
  /// In ru, this message translates to:
  /// **'Часто ищут'**
  String get questsPopular;

  /// No description provided for @questsNothingFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get questsNothingFound;

  /// No description provided for @questsNothingFoundSub.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте название препарата или попробуйте другой запрос'**
  String get questsNothingFoundSub;

  /// No description provided for @questsReceived.
  ///
  /// In ru, this message translates to:
  /// **'получено'**
  String get questsReceived;

  /// No description provided for @questsPending.
  ///
  /// In ru, this message translates to:
  /// **'ожидает'**
  String get questsPending;

  /// No description provided for @walletAccruedAllTime.
  ///
  /// In ru, this message translates to:
  /// **'начислено за всё время'**
  String get walletAccruedAllTime;

  /// No description provided for @walletAwaitingStat.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{ваучер ждёт выдачи} few{ваучера ждут выдачи} many{ваучеров ждут выдачи} other{ваучера ждут выдачи}}'**
  String walletAwaitingStat(int n);

  /// No description provided for @walletArchive.
  ///
  /// In ru, this message translates to:
  /// **'Архив'**
  String get walletArchive;

  /// No description provided for @walletArchiveTitle.
  ///
  /// In ru, this message translates to:
  /// **'Архив ваучеров'**
  String get walletArchiveTitle;

  /// No description provided for @walletTapCardHint.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите на карту — покажем QR-код'**
  String get walletTapCardHint;

  /// No description provided for @walletAllArchivedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Все ваучеры в архиве'**
  String get walletAllArchivedTitle;

  /// No description provided for @walletAllArchivedText.
  ///
  /// In ru, this message translates to:
  /// **'Новые появятся после выполнения квестов'**
  String get walletAllArchivedText;

  /// No description provided for @walletGiftCard.
  ///
  /// In ru, this message translates to:
  /// **'Подарочная карта'**
  String get walletGiftCard;

  /// No description provided for @walletGiftCardBoth.
  ///
  /// In ru, this message translates to:
  /// **'ПОДАРОЧНАЯ КАРТА · SOVG\'A KARTASI'**
  String get walletGiftCardBoth;

  /// No description provided for @walletGiftCardKorzinka.
  ///
  /// In ru, this message translates to:
  /// **'Подарочная карта Korzinka'**
  String get walletGiftCardKorzinka;

  /// No description provided for @walletReceived.
  ///
  /// In ru, this message translates to:
  /// **'Получен'**
  String get walletReceived;

  /// No description provided for @walletCode.
  ///
  /// In ru, this message translates to:
  /// **'Код'**
  String get walletCode;

  /// No description provided for @walletShowQr.
  ///
  /// In ru, this message translates to:
  /// **'Показать'**
  String get walletShowQr;

  /// No description provided for @walletStatusLabel.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get walletStatusLabel;

  /// No description provided for @walletWhere.
  ///
  /// In ru, this message translates to:
  /// **'Где'**
  String get walletWhere;

  /// No description provided for @walletStatusArchived.
  ///
  /// In ru, this message translates to:
  /// **'В архиве'**
  String get walletStatusArchived;

  /// No description provided for @walletAwaitingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ждут выдачи'**
  String get walletAwaitingTitle;

  /// No description provided for @walletQuestDoneOn.
  ///
  /// In ru, this message translates to:
  /// **'Квест выполнен · {date}'**
  String walletQuestDoneOn(String date);

  /// No description provided for @walletPcs.
  ///
  /// In ru, this message translates to:
  /// **'{n} шт.'**
  String walletPcs(int n);

  /// No description provided for @walletVouchersCaption.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{ваучер} few{ваучера} many{ваучеров} other{ваучера}}'**
  String walletVouchersCaption(int n);

  /// No description provided for @walletManualHint.
  ///
  /// In ru, this message translates to:
  /// **'Ваучеры выдаются вручную после проверки — обычно в течение нескольких дней'**
  String get walletManualHint;

  /// No description provided for @walletShowAll.
  ///
  /// In ru, this message translates to:
  /// **'Показать все {n}'**
  String walletShowAll(int n);

  /// No description provided for @walletExchangeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обменять IQC'**
  String get walletExchangeTitle;

  /// No description provided for @walletShopTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обмен IQC'**
  String get walletShopTitle;

  /// No description provided for @walletProgressOf.
  ///
  /// In ru, this message translates to:
  /// **'{have} из {need} IQC'**
  String walletProgressOf(String have, String need);

  /// No description provided for @walletMore.
  ///
  /// In ru, this message translates to:
  /// **'Ещё {n}'**
  String walletMore(String n);

  /// No description provided for @walletSaveUp.
  ///
  /// In ru, this message translates to:
  /// **'Копите IQC, чтобы обменять'**
  String get walletSaveUp;

  /// No description provided for @walletExchangeFor.
  ///
  /// In ru, this message translates to:
  /// **'Обменять за {amount} IQC'**
  String walletExchangeFor(String amount);

  /// No description provided for @walletOpenVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Открыть ваучер {sum}'**
  String walletOpenVoucher(String sum);

  /// No description provided for @walletClose.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get walletClose;

  /// No description provided for @walletVoucherDialog.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер Korzinka'**
  String get walletVoucherDialog;

  /// No description provided for @walletArchiveUsed.
  ///
  /// In ru, this message translates to:
  /// **'В архив — ваучер использован'**
  String get walletArchiveUsed;

  /// No description provided for @walletArchivedToast.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер ••{code} в архиве'**
  String walletArchivedToast(String code);

  /// No description provided for @walletUndo.
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get walletUndo;

  /// No description provided for @walletBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get walletBack;

  /// No description provided for @walletBackToWallet.
  ///
  /// In ru, this message translates to:
  /// **'Назад в кошелёк'**
  String get walletBackToWallet;

  /// No description provided for @walletArchiveSummary.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} ваучер} few{{n} ваучера} many{{n} ваучеров} other{{n} ваучера}} · {sum}'**
  String walletArchiveSummary(int n, String sum);

  /// No description provided for @walletRestore.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть'**
  String get walletRestore;

  /// No description provided for @walletRestoreA11y.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть ваучер ••{code}'**
  String walletRestoreA11y(String code);

  /// No description provided for @walletRestoreHint.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите «Вернуть», если убрали ваучер по ошибке — он снова появится в кошельке'**
  String get walletRestoreHint;

  /// No description provided for @walletArchiveEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Архив пуст'**
  String get walletArchiveEmptyTitle;

  /// No description provided for @walletArchiveEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Использовали ваучер? Уберите его сюда — в кошельке останутся только действующие'**
  String get walletArchiveEmptyText;

  /// No description provided for @walletReceivedMeta.
  ///
  /// In ru, this message translates to:
  /// **'Получен {date} · код ••{code}'**
  String walletReceivedMeta(String date, String code);

  /// No description provided for @walletHistoryAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get walletHistoryAll;

  /// No description provided for @walletHistoryEarned.
  ///
  /// In ru, this message translates to:
  /// **'Начисления'**
  String get walletHistoryEarned;

  /// No description provided for @walletHistorySpent.
  ///
  /// In ru, this message translates to:
  /// **'Списания'**
  String get walletHistorySpent;

  /// No description provided for @walletEarnedMonth.
  ///
  /// In ru, this message translates to:
  /// **'Начислено в этом месяце'**
  String get walletEarnedMonth;

  /// No description provided for @walletSpentMonth.
  ///
  /// In ru, this message translates to:
  /// **'Потрачено в этом месяце'**
  String get walletSpentMonth;

  /// No description provided for @walletMonths.
  ///
  /// In ru, this message translates to:
  /// **'Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,Сентябрь,Октябрь,Ноябрь,Декабрь'**
  String get walletMonths;

  /// No description provided for @walletAccrued.
  ///
  /// In ru, this message translates to:
  /// **'начислено'**
  String get walletAccrued;

  /// No description provided for @walletDebited.
  ///
  /// In ru, this message translates to:
  /// **'списано'**
  String get walletDebited;

  /// No description provided for @walletTxnCheck.
  ///
  /// In ru, this message translates to:
  /// **'Чек'**
  String get walletTxnCheck;

  /// No description provided for @walletTxnRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Рецепт'**
  String get walletTxnRecipe;

  /// No description provided for @walletTxnSurvey.
  ///
  /// In ru, this message translates to:
  /// **'Опрос'**
  String get walletTxnSurvey;

  /// No description provided for @walletTxnQuest.
  ///
  /// In ru, this message translates to:
  /// **'Квест выполнен'**
  String get walletTxnQuest;

  /// No description provided for @walletTxnCourse.
  ///
  /// In ru, this message translates to:
  /// **'Курс пройден'**
  String get walletTxnCourse;

  /// No description provided for @walletTxnRedeem.
  ///
  /// In ru, this message translates to:
  /// **'Обмен на ваучер'**
  String get walletTxnRedeem;

  /// No description provided for @walletTxnReversal.
  ///
  /// In ru, this message translates to:
  /// **'Возврат'**
  String get walletTxnReversal;

  /// No description provided for @walletTxnAdjust.
  ///
  /// In ru, this message translates to:
  /// **'Корректировка'**
  String get walletTxnAdjust;

  /// No description provided for @walletTxnOther.
  ///
  /// In ru, this message translates to:
  /// **'Начисление'**
  String get walletTxnOther;

  /// No description provided for @walletQueueQuests.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} квест} few{{n} квеста} many{{n} квестов} other{{n} квеста}}'**
  String walletQueueQuests(int n);

  /// No description provided for @walletQueueVouchers.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} ваучер ждёт выдачи} few{{n} ваучера ждут выдачи} many{{n} ваучеров ждут выдачи} other{{n} ваучера ждут выдачи}}'**
  String walletQueueVouchers(int n);

  /// No description provided for @walletStepDone.
  ///
  /// In ru, this message translates to:
  /// **'Квест выполнен'**
  String get walletStepDone;

  /// No description provided for @walletStepReview.
  ///
  /// In ru, this message translates to:
  /// **'Проверка'**
  String get walletStepReview;

  /// No description provided for @walletStepIssue.
  ///
  /// In ru, this message translates to:
  /// **'Выдача'**
  String get walletStepIssue;

  /// No description provided for @walletQueueHint.
  ///
  /// In ru, this message translates to:
  /// **'Ваучеры выдаются вручную после проверки — обычно в течение нескольких дней. Пришлём уведомление, когда ваучер появится в кошельке'**
  String get walletQueueHint;

  /// No description provided for @walletQueueEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Очередь пуста'**
  String get walletQueueEmptyTitle;

  /// No description provided for @walletQueueEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Выполните квест с наградой-ваучером — он появится здесь до выдачи'**
  String get walletQueueEmptyText;

  /// No description provided for @walletYourBalance.
  ///
  /// In ru, this message translates to:
  /// **'Ваш баланс'**
  String get walletYourBalance;

  /// No description provided for @walletEnoughFor.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, =0{Пока не хватает на ваучер} one{Хватает на {n} ваучер} few{Хватает на {n} ваучера} many{Хватает на {n} ваучеров} other{Хватает на {n} ваучера}}'**
  String walletEnoughFor(int n);

  /// No description provided for @walletShopNote.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер появится в кошельке после подтверждения обмена'**
  String get walletShopNote;

  /// No description provided for @walletConfirmTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обменять {amount} IQC?'**
  String walletConfirmTitle(String amount);

  /// No description provided for @walletConfirmText.
  ///
  /// In ru, this message translates to:
  /// **'Получите подарочную карту Korzinka на {sum}'**
  String walletConfirmText(String sum);

  /// No description provided for @walletWillDebit.
  ///
  /// In ru, this message translates to:
  /// **'Спишем'**
  String get walletWillDebit;

  /// No description provided for @walletWillRemain.
  ///
  /// In ru, this message translates to:
  /// **'Останется'**
  String get walletWillRemain;

  /// No description provided for @walletWhereTo.
  ///
  /// In ru, this message translates to:
  /// **'Куда придёт'**
  String get walletWhereTo;

  /// No description provided for @walletToWallet.
  ///
  /// In ru, this message translates to:
  /// **'В кошелёк'**
  String get walletToWallet;

  /// No description provided for @walletExchange.
  ///
  /// In ru, this message translates to:
  /// **'Обменять'**
  String get walletExchange;

  /// No description provided for @walletExchangeFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось обменять IQC'**
  String get walletExchangeFailed;

  /// No description provided for @walletShare.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться ваучером'**
  String get walletShare;

  /// No description provided for @walletCopyCode.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать код'**
  String get walletCopyCode;

  /// No description provided for @walletQrLabel.
  ///
  /// In ru, this message translates to:
  /// **'QR-код ваучера'**
  String get walletQrLabel;

  /// No description provided for @walletShowQrCashier.
  ///
  /// In ru, this message translates to:
  /// **'Покажите QR-код кассиру или продиктуйте код'**
  String get walletShowQrCashier;

  /// No description provided for @walletStores.
  ///
  /// In ru, this message translates to:
  /// **'Магазины Korzinka'**
  String get walletStores;

  /// No description provided for @walletToArchive.
  ///
  /// In ru, this message translates to:
  /// **'В архив'**
  String get walletToArchive;

  /// No description provided for @walletToArchiveHint.
  ///
  /// In ru, this message translates to:
  /// **'Использовали ваучер? Уберите его в архив — он останется в истории'**
  String get walletToArchiveHint;

  /// No description provided for @walletRestoreFromArchive.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть из архива'**
  String get walletRestoreFromArchive;

  /// No description provided for @learnSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Проходите курсы — получайте IQC'**
  String get learnSubtitle;

  /// No description provided for @learnSearchA11y.
  ///
  /// In ru, this message translates to:
  /// **'Поиск курсов'**
  String get learnSearchA11y;

  /// No description provided for @learnSearchPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'Название курса или бренда'**
  String get learnSearchPlaceholder;

  /// No description provided for @learnSearchClear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get learnSearchClear;

  /// No description provided for @learnSegNew.
  ///
  /// In ru, this message translates to:
  /// **'Новые'**
  String get learnSegNew;

  /// No description provided for @learnSegProgress.
  ///
  /// In ru, this message translates to:
  /// **'В процессе'**
  String get learnSegProgress;

  /// No description provided for @learnSegDone.
  ///
  /// In ru, this message translates to:
  /// **'Пройденные'**
  String get learnSegDone;

  /// No description provided for @learnTileVideo.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} видеоурок} few{{n} видеоурока} many{{n} видеоуроков} other{{n} видеоурока}}'**
  String learnTileVideo(int n);

  /// No description provided for @learnTileQuiz.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} тест} few{{n} теста} many{{n} тестов} other{{n} теста}}'**
  String learnTileQuiz(int n);

  /// No description provided for @learnTileReward.
  ///
  /// In ru, this message translates to:
  /// **'Награда'**
  String get learnTileReward;

  /// No description provided for @learnMinutesShort.
  ///
  /// In ru, this message translates to:
  /// **'~{n} мин'**
  String learnMinutesShort(int n);

  /// No description provided for @learnQuizStatusLocked.
  ///
  /// In ru, this message translates to:
  /// **'Закрыт'**
  String get learnQuizStatusLocked;

  /// No description provided for @learnQuizStatusOpen.
  ///
  /// In ru, this message translates to:
  /// **'Доступен'**
  String get learnQuizStatusOpen;

  /// No description provided for @learnIqc.
  ///
  /// In ru, this message translates to:
  /// **'+{n} IQC'**
  String learnIqc(int n);

  /// No description provided for @learnCtaStart.
  ///
  /// In ru, this message translates to:
  /// **'Начать курс'**
  String get learnCtaStart;

  /// No description provided for @learnCtaContinue.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get learnCtaContinue;

  /// No description provided for @learnCtaRepeat.
  ///
  /// In ru, this message translates to:
  /// **'Пройти повторно'**
  String get learnCtaRepeat;

  /// No description provided for @learnProgressLabel.
  ///
  /// In ru, this message translates to:
  /// **'Пройдено {pct}%'**
  String learnProgressLabel(int pct);

  /// No description provided for @learnEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет курсов'**
  String get learnEmptyTitle;

  /// No description provided for @learnEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Курсы для вашей аптеки ещё не добавлены. Как только появится новый курс, пришлём уведомление'**
  String get learnEmptyText;

  /// No description provided for @learnEnableNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Включить уведомления'**
  String get learnEnableNotifications;

  /// No description provided for @learnNoResultsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не нашлось'**
  String get learnNoResultsTitle;

  /// No description provided for @learnNoResultsInTab.
  ///
  /// In ru, this message translates to:
  /// **'По запросу «{query}» во вкладке «{tab}» курсов нет. Проверьте написание или поищите во всех курсах'**
  String learnNoResultsInTab(String query, String tab);

  /// No description provided for @learnNoResultsAll.
  ///
  /// In ru, this message translates to:
  /// **'По запросу «{query}» курсов нет. Проверьте написание или попробуйте другое название'**
  String learnNoResultsAll(String query);

  /// No description provided for @learnSearchEverywhere.
  ///
  /// In ru, this message translates to:
  /// **'Искать во всех курсах'**
  String get learnSearchEverywhere;

  /// No description provided for @learnTabEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Здесь пока пусто'**
  String get learnTabEmptyTitle;

  /// No description provided for @learnTabEmptyNew.
  ///
  /// In ru, this message translates to:
  /// **'Все курсы уже начаты — продолжайте обучение во вкладке «В процессе»'**
  String get learnTabEmptyNew;

  /// No description provided for @learnTabEmptyProgress.
  ///
  /// In ru, this message translates to:
  /// **'Начните любой курс из вкладки «Новые» — он появится здесь'**
  String get learnTabEmptyProgress;

  /// No description provided for @learnTabEmptyDone.
  ///
  /// In ru, this message translates to:
  /// **'Пройденные курсы появятся здесь после успешного теста'**
  String get learnTabEmptyDone;

  /// No description provided for @learnBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get learnBack;

  /// No description provided for @learnCourseTitle.
  ///
  /// In ru, this message translates to:
  /// **'Курс'**
  String get learnCourseTitle;

  /// No description provided for @learnMetaVideos.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} видеоурок} few{{n} видеоурока} many{{n} видеоуроков} other{{n} видеоурока}}'**
  String learnMetaVideos(int n);

  /// No description provided for @learnMetaMinutes.
  ///
  /// In ru, this message translates to:
  /// **'~{n, plural, one{{n} минута} few{{n} минуты} many{{n} минут} other{{n} минуты}}'**
  String learnMetaMinutes(int n);

  /// No description provided for @learnProgram.
  ///
  /// In ru, this message translates to:
  /// **'Программа курса'**
  String get learnProgram;

  /// No description provided for @learnRowVideo.
  ///
  /// In ru, this message translates to:
  /// **'Видеоурок'**
  String get learnRowVideo;

  /// No description provided for @learnRowQuiz.
  ///
  /// In ru, this message translates to:
  /// **'Тест'**
  String get learnRowQuiz;

  /// No description provided for @learnRowQuizLocked.
  ///
  /// In ru, this message translates to:
  /// **'Откроется после видео'**
  String get learnRowQuizLocked;

  /// No description provided for @learnRowRewardPending.
  ///
  /// In ru, this message translates to:
  /// **'Начислим после теста'**
  String get learnRowRewardPending;

  /// No description provided for @learnRowRewardDone.
  ///
  /// In ru, this message translates to:
  /// **'Начислено'**
  String get learnRowRewardDone;

  /// No description provided for @learnLessonOf.
  ///
  /// In ru, this message translates to:
  /// **'Урок {i} из {n}'**
  String learnLessonOf(int i, int n);

  /// No description provided for @learnLessonTabText.
  ///
  /// In ru, this message translates to:
  /// **'Текст урока'**
  String get learnLessonTabText;

  /// No description provided for @learnLessonTabMaterials.
  ///
  /// In ru, this message translates to:
  /// **'Материалы'**
  String get learnLessonTabMaterials;

  /// No description provided for @learnWatchVideo.
  ///
  /// In ru, this message translates to:
  /// **'Смотреть видео'**
  String get learnWatchVideo;

  /// No description provided for @learnVideoUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Видео недоступно'**
  String get learnVideoUnavailable;

  /// No description provided for @learnLessonHintLocked.
  ///
  /// In ru, this message translates to:
  /// **'Досмотрите видео — затем откроется тест'**
  String get learnLessonHintLocked;

  /// No description provided for @learnLessonHintFinish.
  ///
  /// In ru, this message translates to:
  /// **'Посмотрели видео? Завершите урок, чтобы перейти дальше'**
  String get learnLessonHintFinish;

  /// No description provided for @learnStartTest.
  ///
  /// In ru, this message translates to:
  /// **'Начать тест'**
  String get learnStartTest;

  /// No description provided for @learnNextLesson.
  ///
  /// In ru, this message translates to:
  /// **'Следующий урок'**
  String get learnNextLesson;

  /// No description provided for @learnFinishLesson.
  ///
  /// In ru, this message translates to:
  /// **'Завершить урок'**
  String get learnFinishLesson;

  /// No description provided for @learnFinishingLesson.
  ///
  /// In ru, this message translates to:
  /// **'Сохраняем…'**
  String get learnFinishingLesson;

  /// No description provided for @learnBackToCourse.
  ///
  /// In ru, this message translates to:
  /// **'К курсу'**
  String get learnBackToCourse;

  /// No description provided for @learnTestTopBar.
  ///
  /// In ru, this message translates to:
  /// **'Тест · {name}'**
  String learnTestTopBar(String name);

  /// No description provided for @learnQuestionOf.
  ///
  /// In ru, this message translates to:
  /// **'Вопрос {i} из {n}'**
  String learnQuestionOf(String i, int n);

  /// No description provided for @learnNext.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get learnNext;

  /// No description provided for @learnFinishTest.
  ///
  /// In ru, this message translates to:
  /// **'Завершить тест'**
  String get learnFinishTest;

  /// No description provided for @learnSubmitting.
  ///
  /// In ru, this message translates to:
  /// **'Проверяем…'**
  String get learnSubmitting;

  /// No description provided for @learnCoursePassed.
  ///
  /// In ru, this message translates to:
  /// **'Курс пройден!'**
  String get learnCoursePassed;

  /// No description provided for @learnTestPassed.
  ///
  /// In ru, this message translates to:
  /// **'Тест пройден!'**
  String get learnTestPassed;

  /// No description provided for @learnPassedText.
  ///
  /// In ru, this message translates to:
  /// **'Отличная работа. Баллы уже на вашем балансе.'**
  String get learnPassedText;

  /// No description provided for @learnPassedTextNoReward.
  ///
  /// In ru, this message translates to:
  /// **'Отличная работа!'**
  String get learnPassedTextNoReward;

  /// No description provided for @learnScoreOf.
  ///
  /// In ru, this message translates to:
  /// **'{score} из {total}'**
  String learnScoreOf(int score, int total);

  /// No description provided for @learnCorrectAnswers.
  ///
  /// In ru, this message translates to:
  /// **'правильных ответов'**
  String get learnCorrectAnswers;

  /// No description provided for @learnOpenWallet.
  ///
  /// In ru, this message translates to:
  /// **'Открыть кошелёк'**
  String get learnOpenWallet;

  /// No description provided for @learnToOtherCourses.
  ///
  /// In ru, this message translates to:
  /// **'К другим курсам'**
  String get learnToOtherCourses;

  /// No description provided for @learnContinueCourse.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить курс'**
  String get learnContinueCourse;

  /// No description provided for @learnFailedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Почти получилось'**
  String get learnFailedTitle;

  /// No description provided for @learnFailedText.
  ///
  /// In ru, this message translates to:
  /// **'Недостаточно правильных ответов. Пересмотрите урок — и попробуйте ещё раз, баллы ждут вас.'**
  String get learnFailedText;

  /// No description provided for @learnRewardStillAvailable.
  ///
  /// In ru, this message translates to:
  /// **'+{n} IQC всё ещё доступны'**
  String learnRewardStillAvailable(int n);

  /// No description provided for @learnCanRetry.
  ///
  /// In ru, this message translates to:
  /// **'Можно пройти тест повторно'**
  String get learnCanRetry;

  /// No description provided for @learnRewatchLesson.
  ///
  /// In ru, this message translates to:
  /// **'Пересмотреть урок'**
  String get learnRewatchLesson;

  /// No description provided for @learnRetryTest.
  ///
  /// In ru, this message translates to:
  /// **'Пройти тест снова'**
  String get learnRetryTest;

  /// No description provided for @rxHomeGreeting.
  ///
  /// In ru, this message translates to:
  /// **'Привет, {name}!'**
  String rxHomeGreeting(String name);

  /// No description provided for @rxHomeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Отправляйте бланки и получайте награды'**
  String get rxHomeSubtitle;

  /// No description provided for @rxHomeBellLabel.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get rxHomeBellLabel;

  /// No description provided for @rxHomeBellUnread.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления, есть новые'**
  String get rxHomeBellUnread;

  /// No description provided for @rxHomeStatQuests.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{активный квест} few{активных квеста} many{активных квестов} other{активного квеста}}'**
  String rxHomeStatQuests(int n);

  /// No description provided for @rxHomeStatApproved.
  ///
  /// In ru, this message translates to:
  /// **'одобрено бланков'**
  String get rxHomeStatApproved;

  /// No description provided for @rxHomeStatPending.
  ///
  /// In ru, this message translates to:
  /// **'на проверке'**
  String get rxHomeStatPending;

  /// No description provided for @rxHomeRecent.
  ///
  /// In ru, this message translates to:
  /// **'Последние бланки'**
  String get rxHomeRecent;

  /// No description provided for @rxHomeAllRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Все бланки'**
  String get rxHomeAllRecipes;

  /// No description provided for @rxQuestProgress.
  ///
  /// In ru, this message translates to:
  /// **'{done} из {goal, plural, one{{goal} бланка} other{{goal} бланков}}'**
  String rxQuestProgress(int done, int goal);

  /// No description provided for @rxQuestLeft.
  ///
  /// In ru, this message translates to:
  /// **'Ещё {n}'**
  String rxQuestLeft(int n);

  /// No description provided for @rxQuestDone.
  ///
  /// In ru, this message translates to:
  /// **'Выполнено {pct}%'**
  String rxQuestDone(int pct);

  /// No description provided for @rxRewardIqc.
  ///
  /// In ru, this message translates to:
  /// **'+{n} IQC'**
  String rxRewardIqc(int n);

  /// No description provided for @rxRewardVoucher.
  ///
  /// In ru, this message translates to:
  /// **'Ваучер'**
  String get rxRewardVoucher;

  /// No description provided for @rxWaitValue.
  ///
  /// In ru, this message translates to:
  /// **'~24 ч'**
  String get rxWaitValue;

  /// No description provided for @rxWaitCaption.
  ///
  /// In ru, this message translates to:
  /// **'ожидание'**
  String get rxWaitCaption;

  /// No description provided for @rxSoon.
  ///
  /// In ru, this message translates to:
  /// **'Скоро'**
  String get rxSoon;

  /// No description provided for @rxSoonCaption.
  ///
  /// In ru, this message translates to:
  /// **'начисление'**
  String get rxSoonCaption;

  /// No description provided for @rxRetake.
  ///
  /// In ru, this message translates to:
  /// **'Переснять'**
  String get rxRetake;

  /// No description provided for @rxRetakeRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Переснять бланк'**
  String get rxRetakeRecipe;

  /// No description provided for @rxMeta.
  ///
  /// In ru, this message translates to:
  /// **'{date} · {n} фото'**
  String rxMeta(String date, int n);

  /// No description provided for @rxListCount.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} бланк} few{{n} бланка} many{{n} бланков} other{{n} бланка}}'**
  String rxListCount(int n);

  /// No description provided for @rxTabPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get rxTabPending;

  /// No description provided for @rxTabDone.
  ///
  /// In ru, this message translates to:
  /// **'Завершённые'**
  String get rxTabDone;

  /// No description provided for @rxFilterEmpty.
  ///
  /// In ru, this message translates to:
  /// **'В этом разделе пока нет бланков'**
  String get rxFilterEmpty;

  /// No description provided for @rxPendingHint.
  ///
  /// In ru, this message translates to:
  /// **'Проверим до 24 часов'**
  String get rxPendingHint;

  /// No description provided for @rxRejectedDefault.
  ///
  /// In ru, this message translates to:
  /// **'Бланк не прошёл проверку'**
  String get rxRejectedDefault;

  /// No description provided for @rxEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Здесь появятся ваши бланки'**
  String get rxEmptyTitle;

  /// No description provided for @rxEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте выписанный бланк — ИИ распознает препараты, а после проверки вы получите IQC'**
  String get rxEmptyText;

  /// No description provided for @rxHowTo.
  ///
  /// In ru, this message translates to:
  /// **'Как сфотографировать'**
  String get rxHowTo;

  /// No description provided for @rxTipWholeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бланк целиком'**
  String get rxTipWholeTitle;

  /// No description provided for @rxTipWholeText.
  ///
  /// In ru, this message translates to:
  /// **'Все края листа в кадре'**
  String get rxTipWholeText;

  /// No description provided for @rxTipStampTitle.
  ///
  /// In ru, this message translates to:
  /// **'Печать и подпись'**
  String get rxTipStampTitle;

  /// No description provided for @rxTipStampText.
  ///
  /// In ru, this message translates to:
  /// **'Без них бланк не примут'**
  String get rxTipStampText;

  /// No description provided for @rxTipLightTitle.
  ///
  /// In ru, this message translates to:
  /// **'Хороший свет'**
  String get rxTipLightTitle;

  /// No description provided for @rxTipLightText.
  ///
  /// In ru, this message translates to:
  /// **'Без бликов и тени от телефона'**
  String get rxTipLightText;

  /// No description provided for @rxSendFirst.
  ///
  /// In ru, this message translates to:
  /// **'Отправить первый бланк'**
  String get rxSendFirst;

  /// No description provided for @rxStatePendingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бланк на проверке'**
  String get rxStatePendingTitle;

  /// No description provided for @rxStatePendingText.
  ///
  /// In ru, this message translates to:
  /// **'Специалист проверяет бланк. Обычно это занимает до 24 часов'**
  String get rxStatePendingText;

  /// No description provided for @rxStateApprovedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бланк одобрен'**
  String get rxStateApprovedTitle;

  /// No description provided for @rxStateApprovedText.
  ///
  /// In ru, this message translates to:
  /// **'Всё в порядке. IQC поступят на баланс в ближайшее время'**
  String get rxStateApprovedText;

  /// No description provided for @rxStateRejectedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бланк отклонён'**
  String get rxStateRejectedTitle;

  /// No description provided for @rxStateRejectedHint.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте бланк целиком при хорошем свете — баллы ещё можно получить'**
  String get rxStateRejectedHint;

  /// No description provided for @rxStepSent.
  ///
  /// In ru, this message translates to:
  /// **'Отправлен'**
  String get rxStepSent;

  /// No description provided for @rxStepReview.
  ///
  /// In ru, this message translates to:
  /// **'Проверка'**
  String get rxStepReview;

  /// No description provided for @rxStepApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get rxStepApproved;

  /// No description provided for @rxStepCredited.
  ///
  /// In ru, this message translates to:
  /// **'Начислено'**
  String get rxStepCredited;

  /// No description provided for @rxStepRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get rxStepRejected;

  /// No description provided for @rxPhotos.
  ///
  /// In ru, this message translates to:
  /// **'Фото бланка'**
  String get rxPhotos;

  /// No description provided for @rxOpenPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Открыть фото бланка {n}'**
  String rxOpenPhoto(int n);

  /// No description provided for @rxAiLater.
  ///
  /// In ru, this message translates to:
  /// **'Список препаратов появится после проверки'**
  String get rxAiLater;

  /// No description provided for @rxAccrual.
  ///
  /// In ru, this message translates to:
  /// **'Начисление'**
  String get rxAccrual;

  /// No description provided for @rxAccrualPendingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Начислим после одобрения'**
  String get rxAccrualPendingTitle;

  /// No description provided for @rxAccrualPendingText.
  ///
  /// In ru, this message translates to:
  /// **'После одобрения бланка'**
  String get rxAccrualPendingText;

  /// No description provided for @rxAccrualApprovedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ожидает начисления'**
  String get rxAccrualApprovedTitle;

  /// No description provided for @rxQuests.
  ///
  /// In ru, this message translates to:
  /// **'Зачёт в квесты'**
  String get rxQuests;

  /// No description provided for @rxQuestsPending.
  ///
  /// In ru, this message translates to:
  /// **'Появится после одобрения бланка'**
  String get rxQuestsPending;

  /// No description provided for @rxQuestsNone.
  ///
  /// In ru, this message translates to:
  /// **'Пока не зачтён ни в один квест'**
  String get rxQuestsNone;

  /// No description provided for @rxData.
  ///
  /// In ru, this message translates to:
  /// **'Данные бланка'**
  String get rxData;

  /// No description provided for @rxShowText.
  ///
  /// In ru, this message translates to:
  /// **'Показать распознанный текст'**
  String get rxShowText;

  /// No description provided for @rxSupport.
  ///
  /// In ru, this message translates to:
  /// **'Вопрос по бланку? Напишите нам'**
  String get rxSupport;

  /// No description provided for @rxCameraClose.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get rxCameraClose;

  /// No description provided for @rxCameraLabel.
  ///
  /// In ru, this message translates to:
  /// **'Бланк'**
  String get rxCameraLabel;

  /// No description provided for @rxCameraTip.
  ///
  /// In ru, this message translates to:
  /// **'Печать и подпись должны быть видны'**
  String get rxCameraTip;

  /// No description provided for @rxCameraHold.
  ///
  /// In ru, this message translates to:
  /// **'Держите телефон ровно над бланком'**
  String get rxCameraHold;

  /// No description provided for @rxCameraShoot.
  ///
  /// In ru, this message translates to:
  /// **'Сделать снимок'**
  String get rxCameraShoot;

  /// No description provided for @rxCameraDenied.
  ///
  /// In ru, this message translates to:
  /// **'Нет доступа к камере. Разрешите его в настройках'**
  String get rxCameraDenied;

  /// No description provided for @rxOcrTitle.
  ///
  /// In ru, this message translates to:
  /// **'Распознанный текст'**
  String get rxOcrTitle;

  /// No description provided for @rxOcrSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Так ИИ прочитал фото бланка'**
  String get rxOcrSubtitle;

  /// No description provided for @rxOcrNote.
  ///
  /// In ru, this message translates to:
  /// **'ФИО пациента скрыто. Текст распознан автоматически — возможны ошибки'**
  String get rxOcrNote;

  /// No description provided for @rxOcrEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Текст ещё не распознан'**
  String get rxOcrEmpty;

  /// No description provided for @rxOcrEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Он появится здесь после обработки фото'**
  String get rxOcrEmptyText;

  /// No description provided for @rxCopy.
  ///
  /// In ru, this message translates to:
  /// **'Копировать'**
  String get rxCopy;

  /// No description provided for @rxCopied.
  ///
  /// In ru, this message translates to:
  /// **'Текст скопирован'**
  String get rxCopied;

  /// No description provided for @rxReportError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка в тексте'**
  String get rxReportError;

  /// No description provided for @rxBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get rxBack;

  /// No description provided for @homeBellUnread.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления, есть новые'**
  String get homeBellUnread;

  /// No description provided for @homeStatActiveQuests.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{активный квест} few{активных квеста} many{активных квестов} other{активного квеста}}'**
  String homeStatActiveQuests(int n);

  /// No description provided for @homeStatApproved.
  ///
  /// In ru, this message translates to:
  /// **'одобрено чеков'**
  String get homeStatApproved;

  /// No description provided for @homeStatPending.
  ///
  /// In ru, this message translates to:
  /// **'на проверке'**
  String get homeStatPending;

  /// No description provided for @homeQuestSales.
  ///
  /// In ru, this message translates to:
  /// **'{goal, plural, one{{done} из {goal} продажи} other{{done} из {goal} продаж}}'**
  String homeQuestSales(int done, int goal);

  /// No description provided for @homeQuestLeft.
  ///
  /// In ru, this message translates to:
  /// **'Ещё {n}'**
  String homeQuestLeft(int n);

  /// No description provided for @homeQuestDone.
  ///
  /// In ru, this message translates to:
  /// **'Выполнено'**
  String get homeQuestDone;

  /// No description provided for @homeRewardIqc.
  ///
  /// In ru, this message translates to:
  /// **'+{n} IQC'**
  String homeRewardIqc(int n);

  /// No description provided for @homeCheckMeta.
  ///
  /// In ru, this message translates to:
  /// **'№{id} · {date}'**
  String homeCheckMeta(int id, String date);

  /// No description provided for @homeCheckWait.
  ///
  /// In ru, this message translates to:
  /// **'~24 ч'**
  String get homeCheckWait;

  /// No description provided for @homeCheckWaitCaption.
  ///
  /// In ru, this message translates to:
  /// **'ожидание'**
  String get homeCheckWaitCaption;

  /// No description provided for @homeCheckRetake.
  ///
  /// In ru, this message translates to:
  /// **'Переснять'**
  String get homeCheckRetake;

  /// No description provided for @homeMiniAppsSub.
  ///
  /// In ru, this message translates to:
  /// **'Сапёр и другие акции'**
  String get homeMiniAppsSub;

  /// No description provided for @homeNewTitle.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get homeNewTitle;

  /// No description provided for @homeNewSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Три шага — и вы в программе'**
  String get homeNewSubtitle;

  /// No description provided for @homeNewStepsLabel.
  ///
  /// In ru, this message translates to:
  /// **'Первые шаги'**
  String get homeNewStepsLabel;

  /// No description provided for @homeNewStepsCount.
  ///
  /// In ru, this message translates to:
  /// **'{done} из {total}'**
  String homeNewStepsCount(int done, int total);

  /// No description provided for @homeNewHeadline.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте первый чек и получите IQC'**
  String get homeNewHeadline;

  /// No description provided for @homeNewStepRegister.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get homeNewStepRegister;

  /// No description provided for @homeNewStepDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get homeNewStepDone;

  /// No description provided for @homeNewStepCheck.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте первый чек'**
  String get homeNewStepCheck;

  /// No description provided for @homeNewStepCheckSub.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте чек из аптеки'**
  String get homeNewStepCheckSub;

  /// No description provided for @homeNewStepCourse.
  ///
  /// In ru, this message translates to:
  /// **'Пройдите первый курс'**
  String get homeNewStepCourse;

  /// No description provided for @homeNewStepCourseReward.
  ///
  /// In ru, this message translates to:
  /// **'+{iqc} IQC за «{title}»'**
  String homeNewStepCourseReward(int iqc, String title);

  /// No description provided for @homeNewStepCourseSub.
  ///
  /// In ru, this message translates to:
  /// **'Курс «{title}»'**
  String homeNewStepCourseSub(String title);

  /// No description provided for @homeNewStepCourseAny.
  ///
  /// In ru, this message translates to:
  /// **'Курсы — в разделе «Обучение»'**
  String get homeNewStepCourseAny;

  /// No description provided for @homeNewSendFirst.
  ///
  /// In ru, this message translates to:
  /// **'Отправить первый чек'**
  String get homeNewSendFirst;

  /// No description provided for @homeNewCourseSection.
  ///
  /// In ru, this message translates to:
  /// **'Начните с курса'**
  String get homeNewCourseSection;

  /// No description provided for @homeNewAllCourses.
  ///
  /// In ru, this message translates to:
  /// **'Все курсы'**
  String get homeNewAllCourses;

  /// No description provided for @homeNewCourseLessons.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} урок} few{{n} урока} many{{n} уроков} other{{n} урока}}'**
  String homeNewCourseLessons(int n);

  /// No description provided for @homeNewCourseMinutes.
  ///
  /// In ru, this message translates to:
  /// **'~{n} мин'**
  String homeNewCourseMinutes(int n);

  /// No description provided for @homeNewQuestSection.
  ///
  /// In ru, this message translates to:
  /// **'Квест для старта'**
  String get homeNewQuestSection;

  /// No description provided for @homeNewQuestGoal.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Продайте {n} упаковку} few{Продайте {n} упаковки} many{Продайте {n} упаковок} other{Продайте {n} упаковки}}'**
  String homeNewQuestGoal(int n);

  /// No description provided for @homeNewQuestIqc.
  ///
  /// In ru, this message translates to:
  /// **'IQC на баланс'**
  String get homeNewQuestIqc;

  /// No description provided for @homeNewQuestVoucher.
  ///
  /// In ru, this message translates to:
  /// **'ваучер за выполнение'**
  String get homeNewQuestVoucher;

  /// No description provided for @homeNewHint.
  ///
  /// In ru, this message translates to:
  /// **'Баланс, ваучеры и мини-приложения появятся после первых IQC'**
  String get homeNewHint;

  /// No description provided for @newsBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get newsBack;

  /// No description provided for @newsBackToList.
  ///
  /// In ru, this message translates to:
  /// **'Назад к новостям'**
  String get newsBackToList;

  /// No description provided for @newsReadTime.
  ///
  /// In ru, this message translates to:
  /// **'{n} мин чтения'**
  String newsReadTime(int n);

  /// No description provided for @newsEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Здесь появятся новости программы и полезные материалы'**
  String get newsEmptyText;

  /// No description provided for @surveyYourAnswer.
  ///
  /// In ru, this message translates to:
  /// **'Ваш ответ'**
  String get surveyYourAnswer;

  /// No description provided for @surveySubmitReward.
  ///
  /// In ru, this message translates to:
  /// **'Ответить и получить {n} IQC'**
  String surveySubmitReward(int n);

  /// No description provided for @surveyWriteHint.
  ///
  /// In ru, this message translates to:
  /// **'Напишите ответ, чтобы отправить'**
  String get surveyWriteHint;

  /// No description provided for @surveyRatingLabel.
  ///
  /// In ru, this message translates to:
  /// **'Оценка'**
  String get surveyRatingLabel;

  /// No description provided for @surveyRatingOf.
  ///
  /// In ru, this message translates to:
  /// **'{n} из {max}'**
  String surveyRatingOf(int n, int max);

  /// No description provided for @surveyRatingWords.
  ///
  /// In ru, this message translates to:
  /// **'Плохо,Так себе,Нормально,Хорошо,Отлично'**
  String get surveyRatingWords;

  /// No description provided for @surveyReward.
  ///
  /// In ru, this message translates to:
  /// **'+{n} IQC'**
  String surveyReward(int n);

  /// No description provided for @surveyOnBalance.
  ///
  /// In ru, this message translates to:
  /// **'уже на вашем балансе'**
  String get surveyOnBalance;

  /// No description provided for @surveySendFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось отправить ответ. Попробуйте ещё раз'**
  String get surveySendFailed;

  /// No description provided for @medrepHelloName.
  ///
  /// In ru, this message translates to:
  /// **'Привет, {name}!'**
  String medrepHelloName(String name);

  /// No description provided for @medrepAttrShared.
  ///
  /// In ru, this message translates to:
  /// **'общая атрибуция'**
  String get medrepAttrShared;

  /// No description provided for @medrepAttrPrimary.
  ///
  /// In ru, this message translates to:
  /// **'первичная атрибуция'**
  String get medrepAttrPrimary;

  /// No description provided for @medrepPeriodAll.
  ///
  /// In ru, this message translates to:
  /// **'Всё время'**
  String get medrepPeriodAll;

  /// No description provided for @medrepPeriod30.
  ///
  /// In ru, this message translates to:
  /// **'30 дней'**
  String get medrepPeriod30;

  /// No description provided for @medrepPeriod7.
  ///
  /// In ru, this message translates to:
  /// **'7 дней'**
  String get medrepPeriod7;

  /// No description provided for @medrepUnitPharm.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{фармацевт} few{фармацевта} many{фармацевтов} other{фармацевта}}'**
  String medrepUnitPharm(int n);

  /// No description provided for @medrepUnitChecks.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{чек} few{чека} many{чеков} other{чека}}'**
  String medrepUnitChecks(int n);

  /// No description provided for @medrepUnitPacks.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{упаковка} few{упаковки} many{упаковок} other{упаковки}}'**
  String medrepUnitPacks(int n);

  /// No description provided for @medrepUnitQuestsDone.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{квест выполнен} few{квеста выполнено} many{квестов выполнено} other{квеста выполнено}}'**
  String medrepUnitQuestsDone(int n);

  /// No description provided for @medrepUnitQuests.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{квест} few{квеста} many{квестов} other{квеста}}'**
  String medrepUnitQuests(int n);

  /// No description provided for @medrepUnitPharmacies.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{аптека} few{аптеки} many{аптек} other{аптеки}}'**
  String medrepUnitPharmacies(int n);

  /// No description provided for @medrepUnitPharmacists.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{провизор} few{провизора} many{провизоров} other{провизора}}'**
  String medrepUnitPharmacists(int n);

  /// No description provided for @medrepUnitChecksAllTime.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{чек за всё время} few{чека за всё время} many{чеков за всё время} other{чека за всё время}}'**
  String medrepUnitChecksAllTime(int n);

  /// No description provided for @medrepCountChecks.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} чек} few{{n} чека} many{{n} чеков} other{{n} чека}}'**
  String medrepCountChecks(int n);

  /// No description provided for @medrepCountPacks.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} упаковка} few{{n} упаковки} many{{n} упаковок} other{{n} упаковки}}'**
  String medrepCountPacks(int n);

  /// No description provided for @medrepCountQuests.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} квест} few{{n} квеста} many{{n} квестов} other{{n} квеста}}'**
  String medrepCountQuests(int n);

  /// No description provided for @medrepCountMedreps.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} медпред} few{{n} медпреда} many{{n} медпредов} other{{n} медпреда}}'**
  String medrepCountMedreps(int n);

  /// No description provided for @medrepCountPharmacists.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} провизор} few{{n} провизора} many{{n} провизоров} other{{n} провизора}}'**
  String medrepCountPharmacists(int n);

  /// No description provided for @medrepCountChains.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} сеть} few{{n} сети} many{{n} сетей} other{{n} сети}}'**
  String medrepCountChains(int n);

  /// No description provided for @medrepPharmaciesInPortfolio.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} аптека в портфеле} few{{n} аптеки в портфеле} many{{n} аптек в портфеле} other{{n} аптеки в портфеле}}'**
  String medrepPharmaciesInPortfolio(int n);

  /// No description provided for @medrepRatingByChecks.
  ///
  /// In ru, this message translates to:
  /// **'Рейтинг по чекам'**
  String get medrepRatingByChecks;

  /// No description provided for @medrepRatingAll.
  ///
  /// In ru, this message translates to:
  /// **'Весь рейтинг'**
  String get medrepRatingAll;

  /// No description provided for @medrepPlace.
  ///
  /// In ru, this message translates to:
  /// **'{n} место'**
  String medrepPlace(int n);

  /// No description provided for @medrepOutOf.
  ///
  /// In ru, this message translates to:
  /// **'из {n}'**
  String medrepOutOf(int n);

  /// No description provided for @medrepGapTo.
  ///
  /// In ru, this message translates to:
  /// **'До {place} места — ещё'**
  String medrepGapTo(int place);

  /// No description provided for @medrepLeader.
  ///
  /// In ru, this message translates to:
  /// **'Вы лидер рейтинга'**
  String get medrepLeader;

  /// No description provided for @medrepMostActive.
  ///
  /// In ru, this message translates to:
  /// **'Самые активные'**
  String get medrepMostActive;

  /// No description provided for @medrepAllN.
  ///
  /// In ru, this message translates to:
  /// **'Все {n}'**
  String medrepAllN(int n);

  /// No description provided for @medrepInviteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пригласить провизора'**
  String get medrepInviteTitle;

  /// No description provided for @medrepInviteText.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте ссылку — после регистрации провизор попадёт в ваш портфель'**
  String get medrepInviteText;

  /// No description provided for @medrepCopyLink.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать ссылку'**
  String get medrepCopyLink;

  /// No description provided for @medrepPendingSub.
  ///
  /// In ru, this message translates to:
  /// **'Провизоры, которые перешли по ссылке'**
  String get medrepPendingSub;

  /// No description provided for @medrepCompaniesSub.
  ///
  /// In ru, this message translates to:
  /// **'Аптечные сети в портфеле'**
  String get medrepCompaniesSub;

  /// No description provided for @medrepDoctorsSub.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс по квесту на бланки'**
  String get medrepDoctorsSub;

  /// No description provided for @medrepEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Портфель пока пуст'**
  String get medrepEmptyTitle;

  /// No description provided for @medrepEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Пригласите провизоров по ссылке — их чеки и статистика появятся здесь'**
  String get medrepEmptyText;

  /// No description provided for @medrepStep1Title.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте ссылку'**
  String get medrepStep1Title;

  /// No description provided for @medrepStep1Text.
  ///
  /// In ru, this message translates to:
  /// **'В Telegram или по SMS'**
  String get medrepStep1Text;

  /// No description provided for @medrepStep2Title.
  ///
  /// In ru, this message translates to:
  /// **'Провизор регистрируется'**
  String get medrepStep2Title;

  /// No description provided for @medrepStep2Text.
  ///
  /// In ru, this message translates to:
  /// **'Он сразу попадает в ваш портфель'**
  String get medrepStep2Text;

  /// No description provided for @medrepStep3Title.
  ///
  /// In ru, this message translates to:
  /// **'Следите за чеками'**
  String get medrepStep3Title;

  /// No description provided for @medrepStep3Text.
  ///
  /// In ru, this message translates to:
  /// **'Статистика появится здесь'**
  String get medrepStep3Text;

  /// No description provided for @medrepUpdatedNow.
  ///
  /// In ru, this message translates to:
  /// **'Обновлено сейчас'**
  String get medrepUpdatedNow;

  /// No description provided for @medrepSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Имя, аптека или город'**
  String get medrepSearchHint;

  /// No description provided for @medrepFilterAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get medrepFilterAll;

  /// No description provided for @medrepFilterActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get medrepFilterActive;

  /// No description provided for @medrepFilterPassive.
  ///
  /// In ru, this message translates to:
  /// **'Пассивные'**
  String get medrepFilterPassive;

  /// No description provided for @medrepFilterFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершённые'**
  String get medrepFilterFinished;

  /// No description provided for @medrepFilterApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрены'**
  String get medrepFilterApproved;

  /// No description provided for @medrepFilterRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонены'**
  String get medrepFilterRejected;

  /// No description provided for @medrepClear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get medrepClear;

  /// No description provided for @medrepNotFoundTitle.
  ///
  /// In ru, this message translates to:
  /// **'Никого не нашли'**
  String get medrepNotFoundTitle;

  /// No description provided for @medrepNotFoundText.
  ///
  /// In ru, this message translates to:
  /// **'По запросу «{query}» провизоров нет. Проверьте написание или поищите по названию аптеки'**
  String medrepNotFoundText(String query);

  /// No description provided for @medrepNotFoundShort.
  ///
  /// In ru, this message translates to:
  /// **'По запросу «{query}» ничего нет. Проверьте написание'**
  String medrepNotFoundShort(String query);

  /// No description provided for @medrepResetSearch.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить поиск'**
  String get medrepResetSearch;

  /// No description provided for @medrepChecksAllTime.
  ///
  /// In ru, this message translates to:
  /// **'Чеков за всё время'**
  String get medrepChecksAllTime;

  /// No description provided for @medrepLastActivity.
  ///
  /// In ru, this message translates to:
  /// **'активность'**
  String get medrepLastActivity;

  /// No description provided for @medrepAllChecks.
  ///
  /// In ru, this message translates to:
  /// **'Все чеки'**
  String get medrepAllChecks;

  /// No description provided for @medrepCheckNo.
  ///
  /// In ru, this message translates to:
  /// **'Чек №{id}'**
  String medrepCheckNo(int id);

  /// No description provided for @medrepPacksShort.
  ///
  /// In ru, this message translates to:
  /// **'{n} уп.'**
  String medrepPacksShort(int n);

  /// No description provided for @medrepPacksUnit.
  ///
  /// In ru, this message translates to:
  /// **'уп.'**
  String get medrepPacksUnit;

  /// No description provided for @medrepLast7Days.
  ///
  /// In ru, this message translates to:
  /// **'Последние 7 дней'**
  String get medrepLast7Days;

  /// No description provided for @medrepMonthYear.
  ///
  /// In ru, this message translates to:
  /// **'{month, select, m1{Январь} m2{Февраль} m3{Март} m4{Апрель} m5{Май} m6{Июнь} m7{Июль} m8{Август} m9{Сентябрь} m10{Октябрь} m11{Ноябрь} m12{Декабрь} other{}} {year}'**
  String medrepMonthYear(String month, String year);

  /// No description provided for @medrepTabChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеки'**
  String get medrepTabChecks;

  /// No description provided for @medrepTabPharm.
  ///
  /// In ru, this message translates to:
  /// **'Фармацевты'**
  String get medrepTabPharm;

  /// No description provided for @medrepTabQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квесты'**
  String get medrepTabQuests;

  /// No description provided for @medrepYouName.
  ///
  /// In ru, this message translates to:
  /// **'Вы · {name}'**
  String medrepYouName(String name);

  /// No description provided for @medrepYouShort.
  ///
  /// In ru, this message translates to:
  /// **'ВЫ'**
  String get medrepYouShort;

  /// No description provided for @medrepGapText.
  ///
  /// In ru, this message translates to:
  /// **'До {place} места — ещё {value}'**
  String medrepGapText(int place, String value);

  /// No description provided for @medrepNotRankedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Вас пока нет в рейтинге'**
  String get medrepNotRankedTitle;

  /// No description provided for @medrepNotRankedText.
  ///
  /// In ru, this message translates to:
  /// **'Место считается по чекам ваших провизоров. Пригласите первого — и вы появитесь в списке'**
  String get medrepNotRankedText;

  /// No description provided for @medrepRatingEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Рейтинг пока пуст'**
  String get medrepRatingEmpty;

  /// No description provided for @medrepQuestsSub.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс ваших провизоров'**
  String get medrepQuestsSub;

  /// No description provided for @medrepQuestRunning.
  ///
  /// In ru, this message translates to:
  /// **'Идёт'**
  String get medrepQuestRunning;

  /// No description provided for @medrepQuestRunningUntil.
  ///
  /// In ru, this message translates to:
  /// **'Идёт · до {date}'**
  String medrepQuestRunningUntil(String date);

  /// No description provided for @medrepQuestFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершён'**
  String get medrepQuestFinished;

  /// No description provided for @medrepQuestFinishedOn.
  ///
  /// In ru, this message translates to:
  /// **'Завершён {date}'**
  String medrepQuestFinishedOn(String date);

  /// No description provided for @medrepOfN.
  ///
  /// In ru, this message translates to:
  /// **'{a} из {b}'**
  String medrepOfN(int a, int b);

  /// No description provided for @medrepParticipating.
  ///
  /// In ru, this message translates to:
  /// **'провизоров участвуют'**
  String get medrepParticipating;

  /// No description provided for @medrepSoldOf.
  ///
  /// In ru, this message translates to:
  /// **'продано из {n}'**
  String medrepSoldOf(int n);

  /// No description provided for @medrepOfPacks.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{из {n} упаковки} few{из {n} упаковок} many{из {n} упаковок} other{из {n} упаковок}}'**
  String medrepOfPacks(int n);

  /// No description provided for @medrepGoalPercent.
  ///
  /// In ru, this message translates to:
  /// **'{p}% цели'**
  String medrepGoalPercent(int p);

  /// No description provided for @medrepPacksLeft.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{осталось {n} упаковка} few{осталось {n} упаковки} many{осталось {n} упаковок} other{осталось {n} упаковки}}'**
  String medrepPacksLeft(int n);

  /// No description provided for @medrepGoalDone.
  ///
  /// In ru, this message translates to:
  /// **'Цель выполнена'**
  String get medrepGoalDone;

  /// No description provided for @medrepStatParticipating.
  ///
  /// In ru, this message translates to:
  /// **'участвуют'**
  String get medrepStatParticipating;

  /// No description provided for @medrepStatCompleted.
  ///
  /// In ru, this message translates to:
  /// **'выполнили'**
  String get medrepStatCompleted;

  /// No description provided for @medrepStatIdle.
  ///
  /// In ru, this message translates to:
  /// **'не начали'**
  String get medrepStatIdle;

  /// No description provided for @medrepPharmacistsSection.
  ///
  /// In ru, this message translates to:
  /// **'Провизоры'**
  String get medrepPharmacistsSection;

  /// No description provided for @medrepDoneOf.
  ///
  /// In ru, this message translates to:
  /// **'Выполнил · {a} из {b}'**
  String medrepDoneOf(int a, int b);

  /// No description provided for @medrepMoreRows.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Ещё {n} провизор · {packs} уп.} few{Ещё {n} провизора · {packs} уп.} many{Ещё {n} провизоров · {packs} уп.} other{Ещё {n} провизора · {packs} уп.}}'**
  String medrepMoreRows(int n, int packs);

  /// No description provided for @medrepShow.
  ///
  /// In ru, this message translates to:
  /// **'Показать'**
  String get medrepShow;

  /// No description provided for @medrepHide.
  ///
  /// In ru, this message translates to:
  /// **'Свернуть'**
  String get medrepHide;

  /// No description provided for @medrepPendingText.
  ///
  /// In ru, this message translates to:
  /// **'Перешли по вашей ссылке и ждут, когда вы добавите их в портфель'**
  String get medrepPendingText;

  /// No description provided for @medrepFollowedLink.
  ///
  /// In ru, this message translates to:
  /// **'Перешёл по ссылке · {ago}'**
  String medrepFollowedLink(String ago);

  /// No description provided for @medrepAgoNow.
  ///
  /// In ru, this message translates to:
  /// **'только что'**
  String get medrepAgoNow;

  /// No description provided for @medrepAgoMinutes.
  ///
  /// In ru, this message translates to:
  /// **'{n} мин назад'**
  String medrepAgoMinutes(int n);

  /// No description provided for @medrepAgoHours.
  ///
  /// In ru, this message translates to:
  /// **'{n} ч назад'**
  String medrepAgoHours(int n);

  /// No description provided for @medrepAgoYesterday.
  ///
  /// In ru, this message translates to:
  /// **'вчера'**
  String get medrepAgoYesterday;

  /// No description provided for @medrepAgoDays.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} день назад} few{{n} дня назад} many{{n} дней назад} other{{n} дня назад}}'**
  String medrepAgoDays(int n);

  /// No description provided for @medrepChainsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Аптечные сети'**
  String get medrepChainsTitle;

  /// No description provided for @medrepChainSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Название сети'**
  String get medrepChainSearchHint;

  /// No description provided for @medrepChainMeta.
  ///
  /// In ru, this message translates to:
  /// **'{city} · {a} апт. · {p} пров.'**
  String medrepChainMeta(String city, int a, int p);

  /// No description provided for @medrepChainKind.
  ///
  /// In ru, this message translates to:
  /// **'аптечная сеть'**
  String get medrepChainKind;

  /// No description provided for @medrepPharmaciesSection.
  ///
  /// In ru, this message translates to:
  /// **'Аптеки'**
  String get medrepPharmaciesSection;

  /// No description provided for @medrepMakers.
  ///
  /// In ru, this message translates to:
  /// **'Компании-производители'**
  String get medrepMakers;

  /// No description provided for @medrepRewardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Поощрить: {name}'**
  String medrepRewardTitle(String name);

  /// No description provided for @medrepRewardRating.
  ///
  /// In ru, this message translates to:
  /// **'Оценка'**
  String get medrepRewardRating;

  /// No description provided for @medrepRewardMessage.
  ///
  /// In ru, this message translates to:
  /// **'Сообщение'**
  String get medrepRewardMessage;

  /// No description provided for @medrepOptional.
  ///
  /// In ru, this message translates to:
  /// **'· необязательно'**
  String get medrepOptional;

  /// No description provided for @medrepRewardHint.
  ///
  /// In ru, this message translates to:
  /// **'Например: спасибо за отличные продажи!'**
  String get medrepRewardHint;

  /// No description provided for @medrepRewardNotice.
  ///
  /// In ru, this message translates to:
  /// **'Провизор получит уведомление с вашим сообщением'**
  String get medrepRewardNotice;

  /// No description provided for @medrepRewardSend.
  ///
  /// In ru, this message translates to:
  /// **'Отправить оценку {n}'**
  String medrepRewardSend(int n);

  /// No description provided for @medrepRewardStars.
  ///
  /// In ru, this message translates to:
  /// **'Оценка {n} из 5'**
  String medrepRewardStars(int n);

  /// No description provided for @authVersion.
  ///
  /// In ru, this message translates to:
  /// **'версия {version}'**
  String authVersion(String version);

  /// No description provided for @authLoading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка'**
  String get authLoading;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в PharmIQ'**
  String get authWelcomeTitle;

  /// No description provided for @authWelcomeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Обучение, квесты и награды для фармацевтов и врачей — в одном приложении'**
  String get authWelcomeSubtitle;

  /// No description provided for @authAppLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Язык приложения'**
  String get authAppLanguage;

  /// No description provided for @authStart.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get authStart;

  /// No description provided for @authHaveAccount.
  ///
  /// In ru, this message translates to:
  /// **'Уже есть аккаунт?'**
  String get authHaveAccount;

  /// No description provided for @authLanguageLabel.
  ///
  /// In ru, this message translates to:
  /// **'Язык: {language}'**
  String authLanguageLabel(String language);

  /// No description provided for @authLoginSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Обучение и награды для фармацевтов и врачей'**
  String get authLoginSubtitle;

  /// No description provided for @authSmsHint.
  ///
  /// In ru, this message translates to:
  /// **'Отправим код в SMS'**
  String get authSmsHint;

  /// No description provided for @authPhoneNotRegistered.
  ///
  /// In ru, this message translates to:
  /// **'Этот номер не зарегистрирован. Создайте аккаунт — это займёт минуту'**
  String get authPhoneNotRegistered;

  /// No description provided for @authOtherNumber.
  ///
  /// In ru, this message translates to:
  /// **'Ввести другой номер'**
  String get authOtherNumber;

  /// No description provided for @authCodeSentTo.
  ///
  /// In ru, this message translates to:
  /// **'Отправили на {phone}'**
  String authCodeSentTo(String phone);

  /// No description provided for @authChange.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get authChange;

  /// No description provided for @authCodeGroup.
  ///
  /// In ru, this message translates to:
  /// **'Код из 6 цифр'**
  String get authCodeGroup;

  /// No description provided for @authCodeAuto.
  ///
  /// In ru, this message translates to:
  /// **'Войдём автоматически, как только введёте код'**
  String get authCodeAuto;

  /// No description provided for @authResendIn.
  ///
  /// In ru, this message translates to:
  /// **'Отправить снова через {time}'**
  String authResendIn(String time);

  /// No description provided for @authRoleSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'У вас несколько ролей — выберите, под какой войти'**
  String get authRoleSubtitle;

  /// No description provided for @authRoleSubDoctor.
  ///
  /// In ru, this message translates to:
  /// **'Рецепты, квесты, обучение и кошелёк'**
  String get authRoleSubDoctor;

  /// No description provided for @authRoleHint.
  ///
  /// In ru, this message translates to:
  /// **'Сменить роль можно в любой момент в профиле'**
  String get authRoleHint;

  /// No description provided for @authRegWhoTitle.
  ///
  /// In ru, this message translates to:
  /// **'Кто вы?'**
  String get authRegWhoTitle;

  /// No description provided for @authRegWhoSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Покажем квесты и курсы для вашей профессии'**
  String get authRegWhoSubtitle;

  /// No description provided for @authRegPharmacistSub.
  ///
  /// In ru, this message translates to:
  /// **'Провизор, работник аптеки'**
  String get authRegPharmacistSub;

  /// No description provided for @authRegDoctorSub.
  ///
  /// In ru, this message translates to:
  /// **'Специалист здравоохранения'**
  String get authRegDoctorSub;

  /// No description provided for @authContinue.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get authContinue;

  /// No description provided for @authBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get authBack;

  /// No description provided for @authChooseField.
  ///
  /// In ru, this message translates to:
  /// **'Выберите {label}'**
  String authChooseField(String label);

  /// No description provided for @authMultiHint.
  ///
  /// In ru, this message translates to:
  /// **'Можно выбрать несколько · выбрано {n}'**
  String authMultiHint(int n);

  /// No description provided for @authMultiHintEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Можно выбрать несколько'**
  String get authMultiHintEmpty;

  /// No description provided for @authConsent.
  ///
  /// In ru, this message translates to:
  /// **'Согласен на обработку персональных данных — '**
  String get authConsent;

  /// No description provided for @authFillRequired.
  ///
  /// In ru, this message translates to:
  /// **'Заполните поля со звёздочкой и дайте согласие'**
  String get authFillRequired;

  /// No description provided for @authRegWelcome.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в PharmIQ, {name}!'**
  String authRegWelcome(String name);

  /// No description provided for @authGoHome.
  ///
  /// In ru, this message translates to:
  /// **'На главную'**
  String get authGoHome;

  /// No description provided for @authCityTitle.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get authCityTitle;

  /// No description provided for @authCitySearch.
  ///
  /// In ru, this message translates to:
  /// **'Найти город'**
  String get authCitySearch;

  /// No description provided for @authSearch.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get authSearch;

  /// No description provided for @authNothingFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get authNothingFound;

  /// No description provided for @authMapTitle.
  ///
  /// In ru, this message translates to:
  /// **'Аптека на карте'**
  String get authMapTitle;

  /// No description provided for @authMapStubTitle.
  ///
  /// In ru, this message translates to:
  /// **'Карта скоро появится'**
  String get authMapStubTitle;

  /// No description provided for @authMapStubBody.
  ///
  /// In ru, this message translates to:
  /// **'Пока впишите название аптеки в поле «Аптека / место работы» — отметить её на карте можно будет в следующем обновлении'**
  String get authMapStubBody;

  /// No description provided for @authUpdateTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нужно обновить приложение'**
  String get authUpdateTitle;

  /// No description provided for @authUpdateBody.
  ///
  /// In ru, this message translates to:
  /// **'Эта версия больше не поддерживается. Обновите PharmIQ, чтобы продолжить — баланс и прогресс сохранятся'**
  String get authUpdateBody;

  /// No description provided for @authUpdateButton.
  ///
  /// In ru, this message translates to:
  /// **'Обновить приложение'**
  String get authUpdateButton;

  /// No description provided for @authUpdateVersions.
  ///
  /// In ru, this message translates to:
  /// **'Ваша версия {current} · нужна {required} или новее'**
  String authUpdateVersions(String current, String required);

  /// No description provided for @authUpdateRequired.
  ///
  /// In ru, this message translates to:
  /// **'Нужна версия {required} или новее'**
  String authUpdateRequired(String required);

  /// No description provided for @authPushTitle.
  ///
  /// In ru, this message translates to:
  /// **'Не пропускайте начисления'**
  String get authPushTitle;

  /// No description provided for @authPushBody.
  ///
  /// In ru, this message translates to:
  /// **'Сообщим, когда чек проверят, IQC придут на баланс или появится новый квест'**
  String get authPushBody;

  /// No description provided for @authPushNow.
  ///
  /// In ru, this message translates to:
  /// **'сейчас'**
  String get authPushNow;

  /// No description provided for @authPushSample1Title.
  ///
  /// In ru, this message translates to:
  /// **'Начислено +144 IQC'**
  String get authPushSample1Title;

  /// No description provided for @authPushSample1Body.
  ///
  /// In ru, this message translates to:
  /// **'Чек №23156 · Цинкорот №50'**
  String get authPushSample1Body;

  /// No description provided for @authPushSample2Time.
  ///
  /// In ru, this message translates to:
  /// **'2 ч назад'**
  String get authPushSample2Time;

  /// No description provided for @authPushSample2Title.
  ///
  /// In ru, this message translates to:
  /// **'Новый квест'**
  String get authPushSample2Title;

  /// No description provided for @authPushSample2Body.
  ///
  /// In ru, this message translates to:
  /// **'Доритрицин N10 · ваучер Korzinka'**
  String get authPushSample2Body;

  /// No description provided for @authPushEnable.
  ///
  /// In ru, this message translates to:
  /// **'Включить уведомления'**
  String get authPushEnable;

  /// No description provided for @authPushLater.
  ///
  /// In ru, this message translates to:
  /// **'Не сейчас'**
  String get authPushLater;

  /// No description provided for @checksSentCount.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} чек отправлен} few{{n} чека отправлено} many{{n} чеков отправлено} other{{n} чека отправлено}}'**
  String checksSentCount(int n);

  /// No description provided for @checksSectionRetake.
  ///
  /// In ru, this message translates to:
  /// **'Нужно переснять'**
  String get checksSectionRetake;

  /// No description provided for @checksSectionHistory.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get checksSectionHistory;

  /// No description provided for @checksRetake.
  ///
  /// In ru, this message translates to:
  /// **'Переснять'**
  String get checksRetake;

  /// No description provided for @checksRetakeA11y.
  ///
  /// In ru, this message translates to:
  /// **'Переснять чек №{id}'**
  String checksRetakeA11y(int id);

  /// No description provided for @checksRetakeTipBold.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы чек приняли с первого раза:'**
  String get checksRetakeTipBold;

  /// No description provided for @checksRetakeTip.
  ///
  /// In ru, this message translates to:
  /// **'весь чек в кадре, ровно, без бликов и при хорошем свете.'**
  String get checksRetakeTip;

  /// No description provided for @checksNumberDate.
  ///
  /// In ru, this message translates to:
  /// **'№{id} · {date}'**
  String checksNumberDate(int id, String date);

  /// No description provided for @checksDatePhotos.
  ///
  /// In ru, this message translates to:
  /// **'{date} · {n} фото'**
  String checksDatePhotos(String date, int n);

  /// No description provided for @checksPhotoCount.
  ///
  /// In ru, this message translates to:
  /// **'{n} фото'**
  String checksPhotoCount(int n);

  /// No description provided for @checksWaitValue.
  ///
  /// In ru, this message translates to:
  /// **'~24 ч'**
  String get checksWaitValue;

  /// No description provided for @checksWaitCaption.
  ///
  /// In ru, this message translates to:
  /// **'обычно'**
  String get checksWaitCaption;

  /// No description provided for @checksShowAll.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{Показать все {n} чек} few{Показать все {n} чека} many{Показать все {n} чеков} other{Показать все {n} чека}}'**
  String checksShowAll(int n);

  /// No description provided for @checksSendCheck.
  ///
  /// In ru, this message translates to:
  /// **'Отправить чек'**
  String get checksSendCheck;

  /// No description provided for @checksMonth.
  ///
  /// In ru, this message translates to:
  /// **'{m, select, m1{Январь} m2{Февраль} m3{Март} m4{Апрель} m5{Май} m6{Июнь} m7{Июль} m8{Август} m9{Сентябрь} m10{Октябрь} m11{Ноябрь} m12{Декабрь} other{}}'**
  String checksMonth(String m);

  /// No description provided for @checksUploadingRow.
  ///
  /// In ru, this message translates to:
  /// **'Отправляем чек…'**
  String get checksUploadingRow;

  /// No description provided for @checksUploadQueued.
  ///
  /// In ru, this message translates to:
  /// **'Ждёт отправки'**
  String get checksUploadQueued;

  /// No description provided for @checksUploadAuto.
  ///
  /// In ru, this message translates to:
  /// **'Отправим автоматически, когда появится связь'**
  String get checksUploadAuto;

  /// No description provided for @checksEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Здесь появятся ваши чеки'**
  String get checksEmptyTitle;

  /// No description provided for @checksEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте чек из аптеки — ИИ распознает препараты, и вы получите IQC'**
  String get checksEmptyText;

  /// No description provided for @checksHowToTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как сфотографировать'**
  String get checksHowToTitle;

  /// No description provided for @checksHow1Title.
  ///
  /// In ru, this message translates to:
  /// **'Весь чек в кадре'**
  String get checksHow1Title;

  /// No description provided for @checksHow1Text.
  ///
  /// In ru, this message translates to:
  /// **'Все четыре угла видны'**
  String get checksHow1Text;

  /// No description provided for @checksHow2Title.
  ///
  /// In ru, this message translates to:
  /// **'Ровно, без складок'**
  String get checksHow2Title;

  /// No description provided for @checksHow2Text.
  ///
  /// In ru, this message translates to:
  /// **'Положите чек на стол'**
  String get checksHow2Text;

  /// No description provided for @checksHow3Title.
  ///
  /// In ru, this message translates to:
  /// **'Хороший свет'**
  String get checksHow3Title;

  /// No description provided for @checksHow3Text.
  ///
  /// In ru, this message translates to:
  /// **'Без бликов и тени от телефона'**
  String get checksHow3Text;

  /// No description provided for @checksSendFirst.
  ///
  /// In ru, this message translates to:
  /// **'Отправить первый чек'**
  String get checksSendFirst;

  /// No description provided for @checksPickSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'ИИ распознает препараты по фото'**
  String get checksPickSubtitle;

  /// No description provided for @checksPhotosOf.
  ///
  /// In ru, this message translates to:
  /// **'Фото: {n} из {max}'**
  String checksPhotosOf(int n, int max);

  /// No description provided for @checksClose.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get checksClose;

  /// No description provided for @checksTipWhole.
  ///
  /// In ru, this message translates to:
  /// **'Весь чек'**
  String get checksTipWhole;

  /// No description provided for @checksTipFlat.
  ///
  /// In ru, this message translates to:
  /// **'Ровно'**
  String get checksTipFlat;

  /// No description provided for @checksTipGlare.
  ///
  /// In ru, this message translates to:
  /// **'Без бликов'**
  String get checksTipGlare;

  /// No description provided for @checksTakePhotoCta.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографировать чек'**
  String get checksTakePhotoCta;

  /// No description provided for @checksPickGallery.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из галереи'**
  String get checksPickGallery;

  /// No description provided for @checksRemovePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Удалить фото'**
  String get checksRemovePhoto;

  /// No description provided for @checksAddMore.
  ///
  /// In ru, this message translates to:
  /// **'Ещё фото'**
  String get checksAddMore;

  /// No description provided for @checksAddMoreA11y.
  ///
  /// In ru, this message translates to:
  /// **'Добавить ещё фото'**
  String get checksAddMoreA11y;

  /// No description provided for @checksPhotoWaiting.
  ///
  /// In ru, this message translates to:
  /// **'Ждёт'**
  String get checksPhotoWaiting;

  /// No description provided for @checksPhotosHint.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте: номер чека, дата и препараты хорошо видны'**
  String get checksPhotosHint;

  /// No description provided for @checksSending.
  ///
  /// In ru, this message translates to:
  /// **'Отправляем…'**
  String get checksSending;

  /// No description provided for @checksSentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чек отправлен'**
  String get checksSentTitle;

  /// No description provided for @checksSentText.
  ///
  /// In ru, this message translates to:
  /// **'Проверка обычно занимает до 24 часов. Сообщим, когда начислим IQC'**
  String get checksSentText;

  /// No description provided for @checksDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get checksDone;

  /// No description provided for @checksSendAnother.
  ///
  /// In ru, this message translates to:
  /// **'Отправить ещё чек'**
  String get checksSendAnother;

  /// No description provided for @checksSendFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось сохранить фото. Попробуйте ещё раз'**
  String get checksSendFailed;

  /// No description provided for @checksCamTitle.
  ///
  /// In ru, this message translates to:
  /// **'Разрешите доступ к камере'**
  String get checksCamTitle;

  /// No description provided for @checksCamText.
  ///
  /// In ru, this message translates to:
  /// **'Камера нужна, чтобы фотографировать чеки и рецепты'**
  String get checksCamText;

  /// No description provided for @checksCamPoint1.
  ///
  /// In ru, this message translates to:
  /// **'Снимаем только когда вы нажмёте кнопку'**
  String get checksCamPoint1;

  /// No description provided for @checksCamPoint2.
  ///
  /// In ru, this message translates to:
  /// **'Не смотрим и не сохраняем другие фото'**
  String get checksCamPoint2;

  /// No description provided for @checksCamPoint3.
  ///
  /// In ru, this message translates to:
  /// **'Доступ можно отключить в настройках телефона'**
  String get checksCamPoint3;

  /// No description provided for @checksCamAllow.
  ///
  /// In ru, this message translates to:
  /// **'Разрешить доступ'**
  String get checksCamAllow;

  /// No description provided for @checksCamLater.
  ///
  /// In ru, this message translates to:
  /// **'Не сейчас'**
  String get checksCamLater;

  /// No description provided for @checksCamDeniedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нет доступа к камере'**
  String get checksCamDeniedTitle;

  /// No description provided for @checksCamDeniedText.
  ///
  /// In ru, this message translates to:
  /// **'Без камеры не получится сфотографировать чек. Включите доступ в настройках телефона — это займёт 10 секунд'**
  String get checksCamDeniedText;

  /// No description provided for @checksCamDeniedStep1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте «Настройки» → PharmIQ'**
  String get checksCamDeniedStep1;

  /// No description provided for @checksCamDeniedStep2.
  ///
  /// In ru, this message translates to:
  /// **'Включите переключатель «Камера»'**
  String get checksCamDeniedStep2;

  /// No description provided for @checksCamDeniedStep3.
  ///
  /// In ru, this message translates to:
  /// **'Вернитесь в приложение'**
  String get checksCamDeniedStep3;

  /// No description provided for @checksCamOpenSettings.
  ///
  /// In ru, this message translates to:
  /// **'Открыть настройки'**
  String get checksCamOpenSettings;

  /// No description provided for @checksCamPickGallery.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать фото из галереи'**
  String get checksCamPickGallery;

  /// No description provided for @checksCamSettingsManual.
  ///
  /// In ru, this message translates to:
  /// **'Откройте настройки телефона → Приложения → PharmIQ → Разрешения'**
  String get checksCamSettingsManual;

  /// No description provided for @checksHeroPendingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чек на проверке'**
  String get checksHeroPendingTitle;

  /// No description provided for @checksHeroPendingText.
  ///
  /// In ru, this message translates to:
  /// **'Специалист проверяет чек. Обычно это занимает до 24 часов'**
  String get checksHeroPendingText;

  /// No description provided for @checksHeroApprovedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чек одобрен'**
  String get checksHeroApprovedTitle;

  /// No description provided for @checksHeroApprovedText.
  ///
  /// In ru, this message translates to:
  /// **'Всё в порядке. IQC поступят на баланс в ближайшее время'**
  String get checksHeroApprovedText;

  /// No description provided for @checksHeroCreditedTitle.
  ///
  /// In ru, this message translates to:
  /// **'IQC начислены'**
  String get checksHeroCreditedTitle;

  /// No description provided for @checksHeroCreditedText.
  ///
  /// In ru, this message translates to:
  /// **'Баллы зачислены на ваш баланс'**
  String get checksHeroCreditedText;

  /// No description provided for @checksHeroRejectedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чек отклонён'**
  String get checksHeroRejectedTitle;

  /// No description provided for @checksHeroRejectedText.
  ///
  /// In ru, this message translates to:
  /// **'Сделайте чёткое фото — баллы ещё можно получить'**
  String get checksHeroRejectedText;

  /// No description provided for @checksStepSent.
  ///
  /// In ru, this message translates to:
  /// **'Отправлен'**
  String get checksStepSent;

  /// No description provided for @checksStepReview.
  ///
  /// In ru, this message translates to:
  /// **'Проверка'**
  String get checksStepReview;

  /// No description provided for @checksStepApproved.
  ///
  /// In ru, this message translates to:
  /// **'Одобрен'**
  String get checksStepApproved;

  /// No description provided for @checksStepCredited.
  ///
  /// In ru, this message translates to:
  /// **'Начислено'**
  String get checksStepCredited;

  /// No description provided for @checksPhotosTitle.
  ///
  /// In ru, this message translates to:
  /// **'Фото чека'**
  String get checksPhotosTitle;

  /// No description provided for @checksOpenPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Открыть фото {n}'**
  String checksOpenPhoto(int n);

  /// No description provided for @checksAiPending.
  ///
  /// In ru, this message translates to:
  /// **'Список препаратов появится после проверки'**
  String get checksAiPending;

  /// No description provided for @checksAccrualTitle.
  ///
  /// In ru, this message translates to:
  /// **'Начисление'**
  String get checksAccrualTitle;

  /// No description provided for @checksAccrualPendingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Начислим после одобрения'**
  String get checksAccrualPendingTitle;

  /// No description provided for @checksAccrualPendingText.
  ///
  /// In ru, this message translates to:
  /// **'После одобрения чека'**
  String get checksAccrualPendingText;

  /// No description provided for @checksAccrualApprovedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ожидает начисления'**
  String get checksAccrualApprovedTitle;

  /// No description provided for @checksAccrualSoon.
  ///
  /// In ru, this message translates to:
  /// **'Скоро'**
  String get checksAccrualSoon;

  /// No description provided for @checksAccrualCreditedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Зачислено на баланс'**
  String get checksAccrualCreditedTitle;

  /// No description provided for @checksQuestDone.
  ///
  /// In ru, this message translates to:
  /// **'Квест выполнен ✓'**
  String get checksQuestDone;

  /// No description provided for @checksSupport.
  ///
  /// In ru, this message translates to:
  /// **'Вопрос по чеку? Напишите нам'**
  String get checksSupport;

  /// No description provided for @checksRetakeCheck.
  ///
  /// In ru, this message translates to:
  /// **'Переснять чек'**
  String get checksRetakeCheck;

  /// No description provided for @checksViewerPhotoOf.
  ///
  /// In ru, this message translates to:
  /// **'Фото {i} из {n}'**
  String checksViewerPhotoOf(int i, int n);

  /// No description provided for @checksViewerSave.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить фото'**
  String get checksViewerSave;

  /// No description provided for @checksViewerZoomHint.
  ///
  /// In ru, this message translates to:
  /// **'Разведите пальцами, чтобы приблизить'**
  String get checksViewerZoomHint;

  /// No description provided for @profileSectionContact.
  ///
  /// In ru, this message translates to:
  /// **'Связь'**
  String get profileSectionContact;

  /// No description provided for @profilePersonalDataRow.
  ///
  /// In ru, this message translates to:
  /// **'Личные данные'**
  String get profilePersonalDataRow;

  /// No description provided for @profileTgNotLinked.
  ///
  /// In ru, this message translates to:
  /// **'Не привязан'**
  String get profileTgNotLinked;

  /// No description provided for @profileTgLink.
  ///
  /// In ru, this message translates to:
  /// **'Привязать'**
  String get profileTgLink;

  /// No description provided for @profileTgLinkedToast.
  ///
  /// In ru, this message translates to:
  /// **'Telegram привязан'**
  String get profileTgLinkedToast;

  /// No description provided for @profileTgNotYet.
  ///
  /// In ru, this message translates to:
  /// **'Telegram пока не привязан — завершите привязку в боте'**
  String get profileTgNotYet;

  /// No description provided for @profileAppearanceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Оформление'**
  String get profileAppearanceTitle;

  /// No description provided for @profileNotifOn.
  ///
  /// In ru, this message translates to:
  /// **'Включены'**
  String get profileNotifOn;

  /// No description provided for @profileNotifOff.
  ///
  /// In ru, this message translates to:
  /// **'Выключены'**
  String get profileNotifOff;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт'**
  String get profileDeleteAccount;

  /// No description provided for @profileVersion.
  ///
  /// In ru, this message translates to:
  /// **'PharmIQ · версия {version}'**
  String profileVersion(String version);

  /// No description provided for @profileEditAria.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать профиль'**
  String get profileEditAria;

  /// No description provided for @profileNewUser.
  ///
  /// In ru, this message translates to:
  /// **'Новый пользователь'**
  String get profileNewUser;

  /// No description provided for @profilePharmacy.
  ///
  /// In ru, this message translates to:
  /// **'Аптека'**
  String get profilePharmacy;

  /// No description provided for @profileClinic.
  ///
  /// In ru, this message translates to:
  /// **'Клиника'**
  String get profileClinic;

  /// No description provided for @profileCompany.
  ///
  /// In ru, this message translates to:
  /// **'Компания'**
  String get profileCompany;

  /// No description provided for @profileNoPharmacy.
  ///
  /// In ru, this message translates to:
  /// **'Аптека не указана'**
  String get profileNoPharmacy;

  /// No description provided for @profileNoClinic.
  ///
  /// In ru, this message translates to:
  /// **'Клиника не указана'**
  String get profileNoClinic;

  /// No description provided for @profileNoCompany.
  ///
  /// In ru, this message translates to:
  /// **'Компания не указана'**
  String get profileNoCompany;

  /// No description provided for @profileNotSpecified.
  ///
  /// In ru, this message translates to:
  /// **'Не указана'**
  String get profileNotSpecified;

  /// No description provided for @profileNameNotSet.
  ///
  /// In ru, this message translates to:
  /// **'Имя не указано'**
  String get profileNameNotSet;

  /// No description provided for @profileActivateTitle.
  ///
  /// In ru, this message translates to:
  /// **'Активируйте профиль'**
  String get profileActivateTitle;

  /// No description provided for @profileActivateProgress.
  ///
  /// In ru, this message translates to:
  /// **'{done} из {total}'**
  String profileActivateProgress(int done, int total);

  /// No description provided for @profileActivateBody.
  ///
  /// In ru, this message translates to:
  /// **'После активации откроются квесты и начисление IQC'**
  String get profileActivateBody;

  /// No description provided for @profileStepPhone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон подтверждён'**
  String get profileStepPhone;

  /// No description provided for @profileStepPharmacy.
  ///
  /// In ru, this message translates to:
  /// **'Укажите аптеку'**
  String get profileStepPharmacy;

  /// No description provided for @profileStepClinic.
  ///
  /// In ru, this message translates to:
  /// **'Укажите клинику'**
  String get profileStepClinic;

  /// No description provided for @profileStepProfile.
  ///
  /// In ru, this message translates to:
  /// **'Заполните профиль'**
  String get profileStepProfile;

  /// No description provided for @profileStepWorkHint.
  ///
  /// In ru, this message translates to:
  /// **'Нужна для квестов вашего региона'**
  String get profileStepWorkHint;

  /// No description provided for @profileStepProfileHint.
  ///
  /// In ru, this message translates to:
  /// **'Имя и место работы'**
  String get profileStepProfileHint;

  /// No description provided for @profileStepSpecify.
  ///
  /// In ru, this message translates to:
  /// **'Указать'**
  String get profileStepSpecify;

  /// No description provided for @profileStepTelegram.
  ///
  /// In ru, this message translates to:
  /// **'Привяжите Telegram'**
  String get profileStepTelegram;

  /// No description provided for @profileStepTelegramHint.
  ///
  /// In ru, this message translates to:
  /// **'Будем присылать уведомления'**
  String get profileStepTelegramHint;

  /// No description provided for @profileStepAdmin.
  ///
  /// In ru, this message translates to:
  /// **'Активация администратором'**
  String get profileStepAdmin;

  /// No description provided for @profileStepAdminHint.
  ///
  /// In ru, this message translates to:
  /// **'Обычно в течение дня после заполнения'**
  String get profileStepAdminHint;

  /// No description provided for @profileActivateHelp.
  ///
  /// In ru, this message translates to:
  /// **'Вопросы по активации? Напишите нам'**
  String get profileActivateHelp;

  /// No description provided for @profileRoleSheetTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сменить роль'**
  String get profileRoleSheetTitle;

  /// No description provided for @profileRoleSheetSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Роли, подтверждённые для вашего аккаунта'**
  String get profileRoleSheetSubtitle;

  /// No description provided for @profileRoleCurrent.
  ///
  /// In ru, this message translates to:
  /// **'Текущая'**
  String get profileRoleCurrent;

  /// No description provided for @profileRoleDescPharmacist.
  ///
  /// In ru, this message translates to:
  /// **'Чеки, квесты, обучение и кошелёк'**
  String get profileRoleDescPharmacist;

  /// No description provided for @profileRoleDescDoctor.
  ///
  /// In ru, this message translates to:
  /// **'Рецепты, квесты, обучение и кошелёк'**
  String get profileRoleDescDoctor;

  /// No description provided for @profileRoleDescMedrep.
  ///
  /// In ru, this message translates to:
  /// **'Портфель провизоров и рейтинг'**
  String get profileRoleDescMedrep;

  /// No description provided for @profileRoleDescBrand.
  ///
  /// In ru, this message translates to:
  /// **'Квесты бренда, продукты и продажи'**
  String get profileRoleDescBrand;

  /// No description provided for @profileRoleNote.
  ///
  /// In ru, this message translates to:
  /// **'Приложение откроется с разделами для выбранной роли. Баланс IQC и ваучеры сохранятся'**
  String get profileRoleNote;

  /// No description provided for @profileRoleSwitch.
  ///
  /// In ru, this message translates to:
  /// **'Переключиться на «{role}»'**
  String profileRoleSwitch(String role);

  /// No description provided for @profileClose.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get profileClose;

  /// No description provided for @profileFieldName.
  ///
  /// In ru, this message translates to:
  /// **'ФИО'**
  String get profileFieldName;

  /// No description provided for @profilePhoneLockedHint.
  ///
  /// In ru, this message translates to:
  /// **'Номер нужен для входа — меняется с подтверждением по SMS'**
  String get profilePhoneLockedHint;

  /// No description provided for @profileFieldCity.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get profileFieldCity;

  /// No description provided for @profileCityHint.
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get profileCityHint;

  /// No description provided for @profileWorkplaceHint.
  ///
  /// In ru, this message translates to:
  /// **'Название или номер'**
  String get profileWorkplaceHint;

  /// No description provided for @profileMapButton.
  ///
  /// In ru, this message translates to:
  /// **'Уточнить аптеку на карте'**
  String get profileMapButton;

  /// No description provided for @profileMapSoon.
  ///
  /// In ru, this message translates to:
  /// **'Выбор аптеки на карте скоро появится'**
  String get profileMapSoon;

  /// No description provided for @profileSave.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить изменения'**
  String get profileSave;

  /// No description provided for @profileFieldRequired.
  ///
  /// In ru, this message translates to:
  /// **'Заполните это поле'**
  String get profileFieldRequired;

  /// No description provided for @profileEditSent.
  ///
  /// In ru, this message translates to:
  /// **'Заявка отправлена в поддержку'**
  String get profileEditSent;

  /// No description provided for @profileEditSentHint.
  ///
  /// In ru, this message translates to:
  /// **'Обновим данные после проверки'**
  String get profileEditSentHint;

  /// No description provided for @profileEditRequest.
  ///
  /// In ru, this message translates to:
  /// **'Прошу обновить данные профиля:'**
  String get profileEditRequest;

  /// No description provided for @profileEditNoChanges.
  ///
  /// In ru, this message translates to:
  /// **'Изменений нет'**
  String get profileEditNoChanges;

  /// No description provided for @profilePrivacyShort.
  ///
  /// In ru, this message translates to:
  /// **'Конфиденциальность'**
  String get profilePrivacyShort;

  /// No description provided for @profilePrivacyHeadline.
  ///
  /// In ru, this message translates to:
  /// **'Как мы обращаемся с вашими данными'**
  String get profilePrivacyHeadline;

  /// No description provided for @profilePrivacyCollectTitle.
  ///
  /// In ru, this message translates to:
  /// **'Какие данные мы собираем'**
  String get profilePrivacyCollectTitle;

  /// No description provided for @profilePrivacyCollectBody.
  ///
  /// In ru, this message translates to:
  /// **'Имя, номер телефона, город и аптеку или клинику. Фото чеков и рецептов, которые вы отправляете. Результаты курсов и тестов.'**
  String get profilePrivacyCollectBody;

  /// No description provided for @profilePrivacyWhyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Зачем они нужны'**
  String get profilePrivacyWhyTitle;

  /// No description provided for @profilePrivacyWhyBody.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы начислять IQC за чеки и рецепты, засчитывать квесты, выдавать ваучеры и показывать вашу статистику.'**
  String get profilePrivacyWhyBody;

  /// No description provided for @profilePrivacyWhoTitle.
  ///
  /// In ru, this message translates to:
  /// **'Кто их видит'**
  String get profilePrivacyWhoTitle;

  /// No description provided for @profilePrivacyWhoBody.
  ///
  /// In ru, this message translates to:
  /// **'Ваш медпредставитель видит число ваших чеков и квестов. Данные пациентов из рецептов скрыты — видны только инициалы.'**
  String get profilePrivacyWhoBody;

  /// No description provided for @profilePrivacyStoreTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как мы их храним'**
  String get profilePrivacyStoreTitle;

  /// No description provided for @profilePrivacyStoreBody.
  ///
  /// In ru, this message translates to:
  /// **'Данные передаются по защищённому соединению и хранятся на серверах компании.'**
  String get profilePrivacyStoreBody;

  /// No description provided for @profilePrivacyDeleteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как удалить данные'**
  String get profilePrivacyDeleteTitle;

  /// No description provided for @profilePrivacyDeleteBody.
  ///
  /// In ru, this message translates to:
  /// **'В профиле → «Удалить аккаунт». Данные удаляются вместе с балансом и ваучерами.'**
  String get profilePrivacyDeleteBody;

  /// No description provided for @profilePrivacyFullLink.
  ///
  /// In ru, this message translates to:
  /// **'Полный текст политики'**
  String get profilePrivacyFullLink;

  /// No description provided for @profilePrivacyContents.
  ///
  /// In ru, this message translates to:
  /// **'Содержание'**
  String get profilePrivacyContents;

  /// No description provided for @profilePrivacyReadTime.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} минута чтения} few{{n} минуты чтения} many{{n} минут чтения} other{{n} минуты чтения}}'**
  String profilePrivacyReadTime(int n);

  /// No description provided for @profilePrivacyRuOnly.
  ///
  /// In ru, this message translates to:
  /// **'Документ доступен только на русском языке'**
  String get profilePrivacyRuOnly;

  /// No description provided for @profileDeleteLose.
  ///
  /// In ru, this message translates to:
  /// **'Это действие нельзя отменить. Вы потеряете:'**
  String get profileDeleteLose;

  /// No description provided for @profileDeleteLoseIqc.
  ///
  /// In ru, this message translates to:
  /// **'{amount} IQC на балансе'**
  String profileDeleteLoseIqc(String amount);

  /// No description provided for @profileDeleteLoseIqcHint.
  ///
  /// In ru, this message translates to:
  /// **'сгорят без возможности обмена'**
  String get profileDeleteLoseIqcHint;

  /// No description provided for @profileDeleteLoseVouchers.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} активный ваучер} few{{n} активных ваучера} many{{n} активных ваучеров} other{{n} активного ваучера}}'**
  String profileDeleteLoseVouchers(int n);

  /// No description provided for @profileDeleteLoseVouchersHint.
  ///
  /// In ru, this message translates to:
  /// **'перестанут работать'**
  String get profileDeleteLoseVouchersHint;

  /// No description provided for @profileDeleteLoseProgress.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс в квестах и курсах'**
  String get profileDeleteLoseProgress;

  /// No description provided for @profileDeleteLoseProgressHint.
  ///
  /// In ru, this message translates to:
  /// **'будет удалён'**
  String get profileDeleteLoseProgressHint;

  /// No description provided for @profileDeleteTypePrompt.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы подтвердить, введите'**
  String get profileDeleteTypePrompt;

  /// No description provided for @profileDeleteWord.
  ///
  /// In ru, this message translates to:
  /// **'УДАЛИТЬ'**
  String get profileDeleteWord;

  /// No description provided for @profileDeleteForever.
  ///
  /// In ru, this message translates to:
  /// **'Удалить навсегда'**
  String get profileDeleteForever;

  /// No description provided for @profileDeleteKeep.
  ///
  /// In ru, this message translates to:
  /// **'Оставить аккаунт'**
  String get profileDeleteKeep;

  /// No description provided for @profileDeleting.
  ///
  /// In ru, this message translates to:
  /// **'Удаляем…'**
  String get profileDeleting;

  /// No description provided for @profileDeleteFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось удалить аккаунт. Попробуйте ещё раз'**
  String get profileDeleteFailed;

  /// No description provided for @profileDeletedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Аккаунт удалён'**
  String get profileDeletedTitle;

  /// No description provided for @profileDeletedBody.
  ///
  /// In ru, this message translates to:
  /// **'Мы удалили ваш профиль, баланс IQC, ваучеры и историю. Спасибо, что были с нами'**
  String get profileDeletedBody;

  /// No description provided for @profileDeletedCardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Передумали?'**
  String get profileDeletedCardTitle;

  /// No description provided for @profileDeletedCardBody.
  ///
  /// In ru, this message translates to:
  /// **'Можно зарегистрироваться заново с тем же номером — но прежний баланс не вернуть'**
  String get profileDeletedCardBody;

  /// No description provided for @profileDeletedNew.
  ///
  /// In ru, this message translates to:
  /// **'Создать новый аккаунт'**
  String get profileDeletedNew;

  /// No description provided for @profileErrorGeneric.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так. Попробуйте ещё раз'**
  String get profileErrorGeneric;

  /// No description provided for @notifNewCount.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{{n} новое} few{{n} новых} many{{n} новых} other{{n} новых}}'**
  String notifNewCount(int n);

  /// No description provided for @notifAllRead.
  ///
  /// In ru, this message translates to:
  /// **'Всё прочитано'**
  String get notifAllRead;

  /// No description provided for @notifReadAll.
  ///
  /// In ru, this message translates to:
  /// **'Прочитать все'**
  String get notifReadAll;

  /// No description provided for @notifFilterAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get notifFilterAll;

  /// No description provided for @notifFilterChecks.
  ///
  /// In ru, this message translates to:
  /// **'Чеки'**
  String get notifFilterChecks;

  /// No description provided for @notifFilterRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Бланки'**
  String get notifFilterRecipes;

  /// No description provided for @notifFilterQuests.
  ///
  /// In ru, this message translates to:
  /// **'Квесты'**
  String get notifFilterQuests;

  /// No description provided for @notifFilterLearning.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get notifFilterLearning;

  /// No description provided for @notifCategoryEmpty.
  ///
  /// In ru, this message translates to:
  /// **'В этой категории пока ничего нет'**
  String get notifCategoryEmpty;

  /// No description provided for @notifNewAria.
  ///
  /// In ru, this message translates to:
  /// **'Новое'**
  String get notifNewAria;

  /// No description provided for @notifMarkedRead.
  ///
  /// In ru, this message translates to:
  /// **'Прочитано'**
  String get notifMarkedRead;

  /// No description provided for @notifEmptySubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Пока ничего нового'**
  String get notifEmptySubtitle;

  /// No description provided for @notifEmptyQuietTitle.
  ///
  /// In ru, this message translates to:
  /// **'Здесь пока тихо'**
  String get notifEmptyQuietTitle;

  /// No description provided for @notifEmptyQuietText.
  ///
  /// In ru, this message translates to:
  /// **'Сообщим, когда проверим чек, начислим IQC или выдадим ваучер'**
  String get notifEmptyQuietText;

  /// No description provided for @notifConfigure.
  ///
  /// In ru, this message translates to:
  /// **'Настроить уведомления'**
  String get notifConfigure;

  /// No description provided for @notifSettingsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Что присылать на телефон'**
  String get notifSettingsSubtitle;

  /// No description provided for @notifSettingsChecksHint.
  ///
  /// In ru, this message translates to:
  /// **'Одобрение, отказ, начисление IQC'**
  String get notifSettingsChecksHint;

  /// No description provided for @notifSettingsQuestsHint.
  ///
  /// In ru, this message translates to:
  /// **'Новые квесты, выполнение, ваучеры'**
  String get notifSettingsQuestsHint;

  /// No description provided for @notifSettingsLearningHint.
  ///
  /// In ru, this message translates to:
  /// **'Новые курсы и напоминания'**
  String get notifSettingsLearningHint;

  /// No description provided for @notifSettingsMarketingHint.
  ///
  /// In ru, this message translates to:
  /// **'Новости рынка и спецпредложения'**
  String get notifSettingsMarketingHint;

  /// No description provided for @notifSettingsFootnote.
  ///
  /// In ru, this message translates to:
  /// **'Важные сообщения об аккаунте и безопасности приходят всегда'**
  String get notifSettingsFootnote;

  /// No description provided for @notifSaveFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось сохранить настройки'**
  String get notifSaveFailed;

  /// No description provided for @supportHeaderTitle.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка PharmIQ'**
  String get supportHeaderTitle;

  /// No description provided for @supportHeaderSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Обычно отвечаем в течение часа'**
  String get supportHeaderSubtitle;

  /// No description provided for @supportBackAria.
  ///
  /// In ru, this message translates to:
  /// **'Назад в профиль'**
  String get supportBackAria;

  /// No description provided for @supportToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get supportToday;

  /// No description provided for @supportYesterday.
  ///
  /// In ru, this message translates to:
  /// **'Вчера'**
  String get supportYesterday;

  /// No description provided for @supportGreeting.
  ///
  /// In ru, this message translates to:
  /// **'Здравствуйте! Чем можем помочь?'**
  String get supportGreeting;

  /// No description provided for @supportFaqTitle.
  ///
  /// In ru, this message translates to:
  /// **'Частые вопросы'**
  String get supportFaqTitle;

  /// No description provided for @supportFaq1.
  ///
  /// In ru, this message translates to:
  /// **'Не начислили IQC за чек'**
  String get supportFaq1;

  /// No description provided for @supportFaq2.
  ///
  /// In ru, this message translates to:
  /// **'Чек отклонён — почему?'**
  String get supportFaq2;

  /// No description provided for @supportFaq3.
  ///
  /// In ru, this message translates to:
  /// **'Как получить ваучер'**
  String get supportFaq3;

  /// No description provided for @supportFaq4.
  ///
  /// In ru, this message translates to:
  /// **'Проблема с курсом или тестом'**
  String get supportFaq4;

  /// No description provided for @supportMessageHint.
  ///
  /// In ru, this message translates to:
  /// **'Сообщение'**
  String get supportMessageHint;

  /// No description provided for @supportAttachAria.
  ///
  /// In ru, this message translates to:
  /// **'Прикрепить фото или чек'**
  String get supportAttachAria;

  /// No description provided for @supportSendAria.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get supportSendAria;

  /// No description provided for @supportTypingAria.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка печатает'**
  String get supportTypingAria;

  /// No description provided for @supportAttachCheckTitle.
  ///
  /// In ru, this message translates to:
  /// **'Прикрепить чек'**
  String get supportAttachCheckTitle;

  /// No description provided for @supportAttachRecipeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Прикрепить бланк'**
  String get supportAttachRecipeTitle;

  /// No description provided for @supportAttachEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пока нечего прикрепить'**
  String get supportAttachEmpty;

  /// No description provided for @supportAttachRemove.
  ///
  /// In ru, this message translates to:
  /// **'Убрать вложение'**
  String get supportAttachRemove;

  /// No description provided for @supportAttachUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Вложения доступны для чеков и бланков'**
  String get supportAttachUnavailable;

  /// No description provided for @supportSendFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось отправить сообщение'**
  String get supportSendFailed;

  /// No description provided for @walletFaceValue.
  ///
  /// In ru, this message translates to:
  /// **'Номинал'**
  String get walletFaceValue;

  /// No description provided for @profileBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get profileBack;

  /// No description provided for @homeNewCourseVideo.
  ///
  /// In ru, this message translates to:
  /// **'Видео ~{n} мин'**
  String homeNewCourseVideo(int n);

  /// No description provided for @homeNewCourseQuiz.
  ///
  /// In ru, this message translates to:
  /// **'тест'**
  String get homeNewCourseQuiz;

  /// No description provided for @authHintFullName.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия Имя Отчество'**
  String get authHintFullName;

  /// No description provided for @authHintPharmacy.
  ///
  /// In ru, this message translates to:
  /// **'Например, Аптека №12'**
  String get authHintPharmacy;

  /// No description provided for @authHintClinic.
  ///
  /// In ru, this message translates to:
  /// **'Название медицинского учреждения'**
  String get authHintClinic;

  /// No description provided for @authMapCardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отметить аптеку на карте'**
  String get authMapCardTitle;

  /// No description provided for @authMapCardSub.
  ///
  /// In ru, this message translates to:
  /// **'Нужно для квестов вашего района'**
  String get authMapCardSub;

  /// No description provided for @authMapCardButton.
  ///
  /// In ru, this message translates to:
  /// **'Отметить'**
  String get authMapCardButton;

  /// No description provided for @rxStateCreditedTitle.
  ///
  /// In ru, this message translates to:
  /// **'IQC начислены'**
  String get rxStateCreditedTitle;

  /// No description provided for @rxStateCreditedText.
  ///
  /// In ru, this message translates to:
  /// **'Баллы зачислены на ваш баланс'**
  String get rxStateCreditedText;

  /// No description provided for @rxAccrualCreditedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Зачислено на баланс'**
  String get rxAccrualCreditedTitle;

  /// No description provided for @rxCreditedCaption.
  ///
  /// In ru, this message translates to:
  /// **'начислено'**
  String get rxCreditedCaption;

  /// No description provided for @rxListCountEarned.
  ///
  /// In ru, this message translates to:
  /// **'{count} · получено {n} IQC'**
  String rxListCountEarned(String count, int n);

  /// No description provided for @questsRewardPoints.
  ///
  /// In ru, this message translates to:
  /// **'Баллы на баланс'**
  String get questsRewardPoints;

  /// No description provided for @walletMonthsIn.
  ///
  /// In ru, this message translates to:
  /// **'январе,феврале,марте,апреле,мае,июне,июле,августе,сентябре,октябре,ноябре,декабре'**
  String get walletMonthsIn;

  /// No description provided for @walletEarnedIn.
  ///
  /// In ru, this message translates to:
  /// **'Начислено в {month}'**
  String walletEarnedIn(String month);

  /// No description provided for @walletSpentIn.
  ///
  /// In ru, this message translates to:
  /// **'Потрачено в {month}'**
  String walletSpentIn(String month);

  /// No description provided for @profileRoleShortMedrep.
  ///
  /// In ru, this message translates to:
  /// **'Медпред'**
  String get profileRoleShortMedrep;

  /// No description provided for @notifActionQr.
  ///
  /// In ru, this message translates to:
  /// **'Показать QR'**
  String get notifActionQr;

  /// No description provided for @notifActionRetake.
  ///
  /// In ru, this message translates to:
  /// **'Переснять'**
  String get notifActionRetake;

  /// No description provided for @homeNewCourseQuizQuestions.
  ///
  /// In ru, this message translates to:
  /// **'{n, plural, one{тест {n} вопрос} few{тест {n} вопроса} many{тест {n} вопросов} other{тест {n} вопроса}}'**
  String homeNewCourseQuizQuestions(int n);

  /// No description provided for @profilePrivacyDraft.
  ///
  /// In ru, this message translates to:
  /// **'Черновик. Окончательный текст утвердит юрист'**
  String get profilePrivacyDraft;

  /// No description provided for @notifSettingsChecksOnly.
  ///
  /// In ru, this message translates to:
  /// **'Статусы чеков'**
  String get notifSettingsChecksOnly;

  /// No description provided for @notifSettingsRecipesOnly.
  ///
  /// In ru, this message translates to:
  /// **'Статусы бланков'**
  String get notifSettingsRecipesOnly;

  /// No description provided for @tourWelcomeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в PharmIQ Academy!'**
  String get tourWelcomeTitle;

  /// No description provided for @tourWelcomeText.
  ///
  /// In ru, this message translates to:
  /// **'Покажем, где что находится и как зарабатывать IQC. Это займёт меньше минуты.'**
  String get tourWelcomeText;

  /// No description provided for @tourWelcomeTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Покажем, где что находится и как получать IQC за бланки. Это займёт меньше минуты.'**
  String get tourWelcomeTextDoc;

  /// No description provided for @tourStart.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get tourStart;

  /// No description provided for @tourSkipAll.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить обучение'**
  String get tourSkipAll;

  /// No description provided for @tourStepOf.
  ///
  /// In ru, this message translates to:
  /// **'Шаг {n} из {total}'**
  String tourStepOf(int n, int total);

  /// No description provided for @tourSkip.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get tourSkip;

  /// No description provided for @tourNext.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get tourNext;

  /// No description provided for @tourDoneStep.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get tourDoneStep;

  /// No description provided for @tourBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get tourBack;

  /// No description provided for @tourBalanceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Баланс IQC'**
  String get tourBalanceTitle;

  /// No description provided for @tourBalanceText.
  ///
  /// In ru, this message translates to:
  /// **'Здесь ваши IQC — баллы за одобренные чеки, квесты и опросы. Кнопка «Кошелёк» откроет историю и обмен на ваучеры.'**
  String get tourBalanceText;

  /// No description provided for @tourBalanceTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Здесь ваши IQC — баллы за одобренные бланки, квесты и опросы. Кнопка «Кошелёк» откроет историю и обмен на ваучеры.'**
  String get tourBalanceTextDoc;

  /// No description provided for @tourSendTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте чек'**
  String get tourSendTitle;

  /// No description provided for @tourSendText.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте чек — ИИ распознает препараты. После проверки на баланс придут IQC.'**
  String get tourSendText;

  /// No description provided for @tourSendTitleDoc.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте бланк'**
  String get tourSendTitleDoc;

  /// No description provided for @tourSendTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте бланк — ИИ распознает препараты. После проверки на баланс придут IQC.'**
  String get tourSendTextDoc;

  /// No description provided for @tourQuestsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Активные квесты'**
  String get tourQuestsTitle;

  /// No description provided for @tourQuestsText.
  ///
  /// In ru, this message translates to:
  /// **'Задания от производителей: продайте нужное количество упаковок и получите бонус. Прогресс виден на карточке.'**
  String get tourQuestsText;

  /// No description provided for @tourQuestsTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Задания от производителей: выпишите нужное количество бланков и получите бонус. Прогресс виден на карточке.'**
  String get tourQuestsTextDoc;

  /// No description provided for @tourChecksTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваши чеки'**
  String get tourChecksTitle;

  /// No description provided for @tourChecksText.
  ///
  /// In ru, this message translates to:
  /// **'Все отправленные чеки и их статусы: на проверке, одобрен, начислено или нужно переснять.'**
  String get tourChecksText;

  /// No description provided for @tourChecksTitleDoc.
  ///
  /// In ru, this message translates to:
  /// **'Ваши бланки'**
  String get tourChecksTitleDoc;

  /// No description provided for @tourChecksTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Все отправленные бланки и их статусы: на проверке, одобрен, начислено или нужно переснять.'**
  String get tourChecksTextDoc;

  /// No description provided for @tourLearnTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get tourLearnTitle;

  /// No description provided for @tourLearnText.
  ///
  /// In ru, this message translates to:
  /// **'Курсы и тесты от экспертов фармрынка. За пройденные курсы начисляются баллы.'**
  String get tourLearnText;

  /// No description provided for @tourProfileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get tourProfileTitle;

  /// No description provided for @tourProfileText.
  ///
  /// In ru, this message translates to:
  /// **'Личные данные, аптека, тема и язык. Здесь же можно пройти это обучение заново.'**
  String get tourProfileText;

  /// No description provided for @tourProfileTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Личные данные, место работы, тема и язык. Здесь же можно пройти это обучение заново.'**
  String get tourProfileTextDoc;

  /// No description provided for @tourDoneTitle.
  ///
  /// In ru, this message translates to:
  /// **'Всё готово!'**
  String get tourDoneTitle;

  /// No description provided for @tourDoneText.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте первый чек или начните курс, чтобы получить первые IQC.'**
  String get tourDoneText;

  /// No description provided for @tourDoneTextDoc.
  ///
  /// In ru, this message translates to:
  /// **'Отправьте первый бланк или начните курс, чтобы получить первые IQC.'**
  String get tourDoneTextDoc;

  /// No description provided for @tourDoneNote.
  ///
  /// In ru, this message translates to:
  /// **'Повторить обучение можно в Профиле.'**
  String get tourDoneNote;

  /// No description provided for @tourFinish.
  ///
  /// In ru, this message translates to:
  /// **'Начать работу'**
  String get tourFinish;

  /// No description provided for @profileTourAgain.
  ///
  /// In ru, this message translates to:
  /// **'Пройти обучение заново'**
  String get profileTourAgain;
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
      <String>['kk', 'ky', 'ru', 'tg', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'kk':
      return AppLocalizationsKk();
    case 'ky':
      return AppLocalizationsKy();
    case 'ru':
      return AppLocalizationsRu();
    case 'tg':
      return AppLocalizationsTg();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

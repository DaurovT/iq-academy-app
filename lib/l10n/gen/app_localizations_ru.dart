// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'IQ Academy';

  @override
  String get apiNetworkError => 'Ошибка сети';

  @override
  String get apiNoAccess => 'Нет доступа';

  @override
  String get checkModelStatusPending => 'На проверке';

  @override
  String get checkModelStatusAiDetected => 'Распознан ИИ';

  @override
  String get checkModelStatusAiWrong => 'ИИ не распознал';

  @override
  String get checkModelStatusApproved => 'Одобрен';

  @override
  String get checkModelStatusRejected => 'Отклонён';

  @override
  String get commonRolePharmacist => 'Фармацевт';

  @override
  String get commonRoleDoctor => 'Врач';

  @override
  String get commonRoleMedrep => 'Мед. представитель';

  @override
  String get commonRoleProductOwner => 'Бренд / Продукт-оунер';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get navHome => 'Главная';

  @override
  String get navChecks => 'Чеки';

  @override
  String get navQuests => 'Квесты';

  @override
  String get navLearn => 'Обучение';

  @override
  String get navWallet => 'Кошелёк';

  @override
  String get navRecipes => 'Бланки';

  @override
  String get navPortfolio => 'Портфель';

  @override
  String get navPharm => 'Фарм.';

  @override
  String get navTop => 'Топ';

  @override
  String get navDashboard => 'Дашборд';

  @override
  String get navProducts => 'Продукты';

  @override
  String get navBrands => 'Бренды';

  @override
  String get navProfile => 'Профиль';

  @override
  String get miniAppsTitle => 'Мини-приложения';

  @override
  String get miniAppsSubtitle => 'Акции для участников программы';

  @override
  String get miniAppsSoon => 'Скоро';

  @override
  String get sapperCountdownSoon => 'скоро';

  @override
  String sapperCountdownDaysHours(Object days, Object hours) {
    return '$daysд $hoursч';
  }

  @override
  String sapperCountdownHoursMinutes(Object hours, Object minutes) {
    return '$hoursч $minutesм';
  }

  @override
  String sapperCountdownMinutesSeconds(Object minutes, Object seconds) {
    return '$minutesм $secondsс';
  }

  @override
  String get sapperTitle => 'Супер Сапёр';

  @override
  String get sapperSubtitle =>
      'Выбирайте клетки за IQC — при подведении итогов узнаете, что под ними';

  @override
  String get sapperNoDraws => 'Нет активных акций';

  @override
  String get sapperRevealed => 'Завершена';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 призов: $prizeCount  💎 $priceIqc IQC/клетка  ';
  }

  @override
  String sapperMyCells(Object count) {
    return 'твоих клеток: $count';
  }

  @override
  String sapperOccupancy(Object occupied, Object total, Object percent) {
    return 'занято $occupied из $total ($percent%)';
  }

  @override
  String get sapperGoToGame => 'Открыть поле';

  @override
  String sapperReserveTitle(Object number) {
    return 'Занять клетку №$number?';
  }

  @override
  String sapperReserveBody(Object price) {
    return 'Будет использовано $price IQC. Отменить нельзя — клетка закрепится за вами до подведения итогов.';
  }

  @override
  String sapperReserveConfirm(Object price) {
    return 'Занять за $price IQC';
  }

  @override
  String sapperCellReserved(Object number) {
    return 'Клетка №$number занята';
  }

  @override
  String get sapperNoIqcTitle => 'Недостаточно IQC';

  @override
  String sapperNoIqcBody(Object price, Object have) {
    return 'Для участия нужно $price IQC, у вас $have. Заработайте IQC — пройдите обучение, квест или опрос.';
  }

  @override
  String get sapperDraws => 'Акции';

  @override
  String get sapperAcceptClosed => 'Выбор клеток закрыт — подводим итоги';

  @override
  String get sapperHiddenTitle => 'ПРИЗЫ НА ПОЛЕ';

  @override
  String sapperFieldTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клеток',
      many: '$count клеток',
      few: '$count клетки',
      one: '$count клетка',
    );
    return 'НА ПОЛЕ $_temp0';
  }

  @override
  String sapperRevealIn(Object time) {
    return 'итоги через $time';
  }

  @override
  String get sapperNoPrizes => 'призы не указаны';

  @override
  String sapperPrizeChip(Object count, Object label) {
    return '🎁 $count× $label';
  }

  @override
  String sapperBalance(Object balance) {
    return 'Баланс: $balance IQC';
  }

  @override
  String sapperCellPrice(Object price) {
    return 'клетка — $price IQC';
  }

  @override
  String get sapperYourBalance => 'Ваш баланс';

  @override
  String get sapperCellPriceLabel => 'за клетку';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Вы получили $count $word!';
  }

  @override
  String get sapperNoWin => 'В этот раз без приза';

  @override
  String get sapperPrizeOne => 'приз';

  @override
  String get sapperPrizeFew => 'приза';

  @override
  String get sapperPrizeMany => 'призов';

  @override
  String get sapperLegendMine => 'Мои';

  @override
  String get sapperLegendTheirs => 'Чужие';

  @override
  String get sapperLegendEmpty => 'Пусто';

  @override
  String get sapperLegendVoucher => 'Ваучер';

  @override
  String get sapperLegendSelected => 'Выбрано';

  @override
  String get sapperLegendOccupied => 'Заняты другими';

  @override
  String get sapperLegendFree => 'Свободно';

  @override
  String get sapperWinners => 'Получили призы';

  @override
  String get newsTitle => 'Новости';

  @override
  String get newsAll => 'Все новости';

  @override
  String get newsMore => 'Подробнее →';

  @override
  String get newsDateMonths =>
      'янв,фев,мар,апр,мая,июн,июл,авг,сен,окт,ноя,дек';

  @override
  String get newsEmpty => 'Пока нет новостей';

  @override
  String get newsPinned => 'ВАЖНОЕ';

  @override
  String get newsDetailTitle => 'Новость';

  @override
  String surveyRewardCredited(Object amount) {
    return '+$amount IQC зачислено';
  }

  @override
  String get surveyThanks => 'Спасибо за ответ!';

  @override
  String surveySubmitError(Object error) {
    return 'Не удалось отправить: $error';
  }

  @override
  String get surveyTitle => 'Опрос';

  @override
  String surveyRewardBadge(Object amount) {
    return '+ $amount IQC';
  }

  @override
  String get surveyChooseOption => 'Выберите вариант ответа';

  @override
  String get surveyEnterAnswer => 'Введите ответ вручную';

  @override
  String get surveySubmit => 'Ответить';

  @override
  String get loginTagline => 'Обучайся.\nПрименяй.\nДостигай.';

  @override
  String get loginTitle => 'Вход';

  @override
  String get loginByPhone => 'Войдите по номеру телефона';

  @override
  String get loginChooseMethod => 'Выберите удобный способ входа';

  @override
  String loginCodeSent(Object phone) {
    return 'Код из SMS на $phone';
  }

  @override
  String get loginPhoneLabel => 'Номер телефона';

  @override
  String get loginPhoneNotFound => 'Номер не найден в системе';

  @override
  String get loginConfirm => 'Подтвердить';

  @override
  String get loginGoRegister => 'Пройти регистрацию';

  @override
  String get loginRegister => 'Зарегистрироваться';

  @override
  String get loginNoAccount => 'Нет аккаунта?';

  @override
  String get loginEnter => 'Войти';

  @override
  String loginResendIn(Object seconds) {
    return 'Повтор через $seconds с';
  }

  @override
  String get loginResendAgain => 'Отправить снова';

  @override
  String get loginChangeNumber => '‹ Изменить номер';

  @override
  String get loginOr => 'или';

  @override
  String get tgLoginExpired => 'Время входа истекло';

  @override
  String tgLoginParseError(Object error) {
    return 'Не удалось обработать ответ входа: $error';
  }

  @override
  String get tgWaitingConfirm => 'Ожидание подтверждения…';

  @override
  String get tgLoginButton => 'Войти через Telegram';

  @override
  String get notifTitle => 'Уведомления';

  @override
  String notifUnreadOne(Object count) {
    return '$count непрочитанное';
  }

  @override
  String notifUnreadMany(Object count) {
    return '$count непрочитанных';
  }

  @override
  String get notifMarkAllRead => 'Отметить все прочитанными';

  @override
  String get notifRead => '✓ Прочитано';

  @override
  String get notifMarkRead => 'Отметить прочитанным';

  @override
  String get notifOpen => 'Открыть';

  @override
  String get notifEmptyTitle => 'Уведомлений нет';

  @override
  String get notifEmptyBody =>
      'Здесь появятся статусы чеков, награды за квесты и новости обучения.';

  @override
  String get placeholderComingSoon => 'Раздел появится в следующих фазах.';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileSettings => 'Настройки';

  @override
  String get profileLanguage => 'ЯЗЫК';

  @override
  String get profileAppearance => 'ОФОРМЛЕНИЕ';

  @override
  String get profileThemeLight => 'Светлая';

  @override
  String get profileThemeDark => 'Тёмная';

  @override
  String get profileThemeSystem => 'Система';

  @override
  String get profileAccount => 'Аккаунт';

  @override
  String get profilePersonalData => 'ЛИЧНЫЕ ДАННЫЕ';

  @override
  String get profileRole => 'Роль';

  @override
  String get profileChange => 'Сменить';

  @override
  String get profileLinkedServices => 'ПРИВЯЗАННЫЕ СЕРВИСЫ';

  @override
  String get profilePhone => 'Телефон';

  @override
  String get profileTgConnected => 'Подключён';

  @override
  String get profileTgLinked => 'Привязан';

  @override
  String get profileSupport => 'Поддержка';

  @override
  String get profileSupportSubtitle =>
      'Отвечаем в Telegram, по телефону и в чате поддержки';

  @override
  String get profileLogout => 'Выйти из аккаунта';

  @override
  String get profileDeleteTitle => 'Удалить аккаунт и данные';

  @override
  String get profileDeleteIrreversible => 'Действие необратимо';

  @override
  String get profileDelete => 'Удалить';

  @override
  String get profileLanguageUpdated => 'Язык обновлён';

  @override
  String get profileNewPhoneTitle => 'Новый номер';

  @override
  String get profileCancel => 'Отмена';

  @override
  String get profileNext => 'Далее';

  @override
  String get profileSmsCodeTitle => 'Код из SMS';

  @override
  String get profileCodeLabel => 'Код';

  @override
  String get profileConfirm => 'Подтвердить';

  @override
  String get profilePhoneChanged => 'Телефон изменён';

  @override
  String get profileLogoutConfirmTitle => 'Выйти из аккаунта?';

  @override
  String get profileLogoutConfirmBody =>
      'Чтобы снова пользоваться приложением, нужно будет войти ещё раз.';

  @override
  String get profileLogoutAction => 'Выйти';

  @override
  String get profileDeleteConfirmTitle => 'Удалить аккаунт?';

  @override
  String get profileDeleteConfirmBody =>
      'Удалим профиль, номер телефона, привязки входа, уведомления и переписку с поддержкой. Записи о начислениях и выданных ваучерах сохранятся без ваших персональных данных — они нужны для учёта. Действие необратимо.';

  @override
  String get profileStatQuests => 'КВЕСТОВ';

  @override
  String get profileStatLevel => 'УРОВЕНЬ';

  @override
  String get questHistoryTitle => 'История участия';

  @override
  String get questHistoryEmpty => 'История пуста';

  @override
  String get questHistoryVoucher => 'Ваучер';

  @override
  String get questHistoryActive => 'Активен';

  @override
  String get questHistoryDone => 'Выполнен';

  @override
  String get registerStep1Of2 => 'ШАГ 1 ИЗ 2';

  @override
  String registerStep2Of2(Object role) {
    return 'ШАГ 2 ИЗ 2 · $role';
  }

  @override
  String get registerTitle => 'Регистрация';

  @override
  String get registerChooseRole => 'Выберите роль для входа';

  @override
  String get registerBack => '‹ Назад';

  @override
  String registerConfirmField(Object label) {
    return 'Подтвердите: $label';
  }

  @override
  String registerFillField(Object label) {
    return 'Заполните: $label';
  }

  @override
  String get registerFinish => 'Завершить регистрацию';

  @override
  String get registerSuccessTitle => 'Регистрация завершена!';

  @override
  String registerWelcome(Object name) {
    return 'Добро пожаловать в PharmIQ ACADEMY, $name!';
  }

  @override
  String get registerStartLearning => 'Начать обучение';

  @override
  String get registerGoHome => 'Перейти на главную';

  @override
  String registerEnterField(Object label) {
    return 'Введите $label';
  }

  @override
  String get registerRequiredField => 'Обязательное поле';

  @override
  String get registerSelectPlaceholder => '— выберите —';

  @override
  String registerMultiSelectHintRequired(Object label) {
    return '$label * · Можно выбрать несколько';
  }

  @override
  String registerMultiSelectHint(Object label) {
    return '$label · Можно выбрать несколько';
  }

  @override
  String get registerConsentText =>
      'Я согласен на обработку персональных данных ';

  @override
  String get registerConsentMore => 'подробнее';

  @override
  String get roleSelectTagline => 'Обучайся.\nПрименяй.\nДостигай.';

  @override
  String get roleSelectGreeting => 'Здравствуйте';

  @override
  String roleSelectGreetingName(Object name) {
    return 'Здравствуйте, $name';
  }

  @override
  String get roleSelectChooseRole => 'Выберите роль для входа';

  @override
  String get roleSelectSubChecksQuests => 'Чеки, квесты, обучение и кошелёк';

  @override
  String get roleSelectSubMedrep => 'Портфель провизоров и рейтинг';

  @override
  String get roleSelectSubProductOwner => 'Дашборд, продукты и бренды';

  @override
  String get roleSelectSheetTitle => 'Выберите роль';

  @override
  String get roleSelectEnter => 'Войти';

  @override
  String get notifSettingsTitle => 'Настройки уведомлений';

  @override
  String get notifSettingsChecks => 'Статусы чеков и бланков';

  @override
  String get notifSettingsQuests => 'Квесты и награды';

  @override
  String get notifSettingsLearning => 'Обучение';

  @override
  String get notifSettingsMarketing => 'Новости и акции';

  @override
  String get supportBackProfile => 'Профиль';

  @override
  String get supportTitle => 'Поддержка';

  @override
  String get supportEmptyHint => 'Напишите нам — ответим здесь';

  @override
  String get supportInputHint => 'Напишите сообщение...';

  @override
  String get supportYou => 'Вы';

  @override
  String get supportTeam => 'Поддержка';

  @override
  String get appBarSwitchRole => 'Сменить роль';

  @override
  String get asyncRetry => 'Повторить';

  @override
  String get brandProductsTitle => 'Продукты';

  @override
  String get brandProductsEmpty => 'Продуктов нет';

  @override
  String brandProductsQuestCount(Object p1) {
    return '$p1 квест.';
  }

  @override
  String get brandProductsDetailTitle => 'Продукт';

  @override
  String get brandQuestsTitle => 'Квесты бренда';

  @override
  String get brandQuestsEmpty => 'Квестов нет';

  @override
  String brandQuestsSubtitle(Object p1, Object p2, Object p3) {
    return '$p1 · $p2/$p3 вып.';
  }

  @override
  String get brandQuestsStatusActive => 'Активен';

  @override
  String get brandQuestsStatusOff => 'Выкл';

  @override
  String get brandQuestsDetailTitle => 'Квест бренда';

  @override
  String brandQuestsSponsor(Object p1) {
    return 'Спонсор: $p1';
  }

  @override
  String get brandQuestsParticipants => 'Участников';

  @override
  String get brandQuestsCompletions => 'Выполнений';

  @override
  String get brandQuestsBudget => 'Бюджет';

  @override
  String get brandQuestsSpent => 'Потрачено';

  @override
  String get brandQuestsProducts => 'Продукты';

  @override
  String get brandQuestsMxik => 'МХИК';

  @override
  String get brandQuestsReward => 'Награда';

  @override
  String get brandQuestsPeriod => 'Период';

  @override
  String get brandsTitle => 'Бренды';

  @override
  String get brandsEmpty => 'Брендов нет';

  @override
  String brandsQuestCount(Object p1) {
    return '$p1 квест.';
  }

  @override
  String get brandsDetailTitle => 'Бренд';

  @override
  String get brandsSubBrands => 'Суббренды';

  @override
  String get brandDashTitle => 'Дашборд';

  @override
  String get brandDashChecks => 'Чеков';

  @override
  String get brandDashPacks => 'Упаковок';

  @override
  String get brandDashActiveQuests => 'Активных квестов';

  @override
  String get brandDashParticipants => 'Участников';

  @override
  String get brandDashSegmentation => 'Сегментация';

  @override
  String get brandDashRetail => 'Розница';

  @override
  String get brandDashChain => 'Сети';

  @override
  String get brandDashTopProducts => 'Топ продуктов';

  @override
  String get brandDashTopSellers => 'Топ продавцов';

  @override
  String get brandDashRegions => 'Регионы';

  @override
  String get brandDashSalesLogs => 'Логи продаж';

  @override
  String get salesLogTitle => 'Логи продаж';

  @override
  String get salesLogEmpty => 'Записей нет';

  @override
  String get docHomeActiveQuests => 'Активные квесты';

  @override
  String get docHomeAllQuests => 'Все квесты';

  @override
  String get docHomeNoActiveQuests => 'Нет активных квестов';

  @override
  String get docHomeRecommendedCourses => 'Рекомендуемые курсы';

  @override
  String get docHomeAllCourses => 'Все курсы';

  @override
  String get docHomeNoCourses => 'Пока нет курсов';

  @override
  String get docHomeGreetingNoName => 'Привет!';

  @override
  String docHomeGreeting(Object name) {
    return 'Привет, $name';
  }

  @override
  String get docHomeSubtitle => 'Отправляйте бланки и получайте вознаграждение';

  @override
  String get docHomeWalletBalance => 'БАЛАНС КОШЕЛЬКА';

  @override
  String get docHomeWallet => 'Кошелёк';

  @override
  String get docHomeSendRecipe => 'Отправить бланк';

  @override
  String get docHomeSendRecipeHint =>
      'Сфотографируйте бланк — ИИ распознает препараты';

  @override
  String get docHomeStatRecipes => 'всего бланков';

  @override
  String get docHomeStatApproved => 'одобрено';

  @override
  String get docHomeStatIqc => 'баллов IQC';

  @override
  String get docHomeVoucher => 'ВАУЧЕР';

  @override
  String get docHomeProgress => 'Прогресс';

  @override
  String docHomeProgressDone(Object pct) {
    return '$pct% выполнено';
  }

  @override
  String get recipeDetailMyRecipes => 'Мои бланки';

  @override
  String recipeDetailTitle(Object id) {
    return 'Бланк №$id';
  }

  @override
  String recipeDetailPhotoCount(Object p1) {
    return 'Фото $p1';
  }

  @override
  String get recipeDetailStatusApproved => 'Одобрен';

  @override
  String get recipeDetailStatusRejected => 'Отклонён';

  @override
  String get recipeDetailStatusPending => 'На проверке';

  @override
  String get recipeDetailAiRecognized => 'Распознано ИИ';

  @override
  String get recipeDetailNoDrugs => 'Препараты не распознаны';

  @override
  String get recipesTitle => 'Мои бланки';

  @override
  String recipesTotal(Object p1) {
    return '$p1 всего';
  }

  @override
  String get recipesTabAll => 'Все';

  @override
  String get recipesTabActive => 'Активные';

  @override
  String get recipesTabDone => 'Завершенные';

  @override
  String get recipesEmpty => 'Бланков пока нет';

  @override
  String get recipesTakePhoto => 'Сделать фото';

  @override
  String get recipesFromGallery => 'Выбрать из галереи';

  @override
  String get recipesUploading => 'Бланк добавлен — загружается';

  @override
  String get recipesDoctorInfoTitle => 'Данные врача (по желанию)';

  @override
  String get recipesDoctorName => 'ФИО';

  @override
  String get recipesDoctorWorkplace => 'Место работы';

  @override
  String get recipesDoctorCity => 'Город';

  @override
  String get recipesDoctorPhone => 'Телефон';

  @override
  String get recipesSkip => 'Пропустить';

  @override
  String get recipesSend => 'Отправить';

  @override
  String get recipesSubmitButton => 'Отправить бланк';

  @override
  String recipesPhotoCount(Object p1) {
    return 'фото: $p1';
  }

  @override
  String get recipesStatusApproved => 'Одобрен';

  @override
  String get recipesStatusRejected => 'Отклонён';

  @override
  String get recipesStatusPending => 'На проверке';

  @override
  String recipesUploadingBanner(Object count) {
    return 'Загружается: $count';
  }

  @override
  String get recipesRetry => 'Повторить';

  @override
  String get companiesTitle => 'Компании';

  @override
  String get companiesEmpty => 'Компаний нет';

  @override
  String companiesCode(Object p1) {
    return 'Код: $p1';
  }

  @override
  String get medrepHomeAttributionPrimary => 'Первичная';

  @override
  String get medrepHomeAttributionTotal => 'Общая';

  @override
  String get medrepHomeMenuPharmacists => 'Фармацевты';

  @override
  String get medrepHomeMenuPending => 'Ожидают подтверждения';

  @override
  String get medrepHomeMenuCompanies => 'Компании';

  @override
  String get medrepHomeMenuLeaderboard => 'Рейтинг';

  @override
  String get medrepHomeGreetingNoName => 'Привет!';

  @override
  String medrepHomeGreeting(Object name) {
    return 'Привет, $name';
  }

  @override
  String medrepHomeAttribution(Object attribution) {
    return 'Атрибуция: $attribution';
  }

  @override
  String get medrepHomeStatPharmacists => 'Фармацевтов';

  @override
  String get medrepHomeStatChecks => 'Чеков';

  @override
  String get medrepHomeStatPacks => 'Упаковок';

  @override
  String get medrepHomeStatQuests => 'Квестов';

  @override
  String get medrepHomeLinkCopied => 'Ссылка скопирована';

  @override
  String get medrepHomeReferralTitle => 'Реферальная ссылка';

  @override
  String get medrepHomeReferralHint =>
      'Отправьте ссылку провизору — он привяжется к вам при регистрации';

  @override
  String get medrepHomeCopy => 'Копировать';

  @override
  String get medrepHomeShare => 'Поделиться';

  @override
  String get medrepHomeRetry => 'Повторить';

  @override
  String get leaderboardUnitPharm => 'аптек';

  @override
  String get leaderboardUnitQuests => 'квестов';

  @override
  String get leaderboardUnitChecks => 'чеков';

  @override
  String get leaderboardTitle => 'Рейтинг';

  @override
  String get leaderboardAttributionPrimary => 'Первичная';

  @override
  String get leaderboardAttributionTotal => 'Общая';

  @override
  String get leaderboardCompanyFallback => 'Компания';

  @override
  String get leaderboardRetry => 'Повторить';

  @override
  String get pharmDetailIncentivizeTitle => 'Поощрить фармацевта';

  @override
  String pharmDetailRating(Object p1) {
    return 'Оценка: $p1';
  }

  @override
  String get pharmDetailComment => 'Комментарий';

  @override
  String get pharmDetailCancel => 'Отмена';

  @override
  String get pharmDetailSend => 'Отправить';

  @override
  String get pharmDetailSent => 'Отправлено';

  @override
  String get pharmDetailBack => 'Фармацевты';

  @override
  String get pharmDetailChecks => 'Чеков';

  @override
  String get pharmDetailPacks => 'Упаковок';

  @override
  String get pharmDetailQuests => 'Квестов';

  @override
  String get pharmDetailIqcPoints => 'IQC Очков';

  @override
  String get pharmDetailRecentChecks => 'Последние чеки';

  @override
  String get pharmDetailNoChecks => 'Чеков пока нет';

  @override
  String get pharmDetailActive => 'Активный';

  @override
  String get pharmDetailPassive => 'Пассивный';

  @override
  String get pharmDetailIncentivize => 'Поощрить';

  @override
  String get pharmDetailRetry => 'Повторить';

  @override
  String get portfolioTitle => 'Фармацевты';

  @override
  String get portfolioUpdated => 'Обновлено';

  @override
  String portfolioInPortfolio(Object total) {
    return '$total в портфеле';
  }

  @override
  String get portfolioSearchHint => 'Поиск фармацевта…';

  @override
  String portfolioTabAll(Object all) {
    return 'Все ($all)';
  }

  @override
  String portfolioTabActive(Object active) {
    return 'Активные ($active)';
  }

  @override
  String portfolioTabPassive(Object passive) {
    return 'Пассивные ($passive)';
  }

  @override
  String get portfolioNotFound => 'Фармацевтов не найдено';

  @override
  String get portfolioRetry => 'Повторить';

  @override
  String get medrepQuestsTitle => 'Квесты компании';

  @override
  String get medrepQuestsEmpty => 'Квестов нет';

  @override
  String medrepQuestsSubtitle(Object p1, Object p2) {
    return 'Цель: $p1 · участников: $p2';
  }

  @override
  String get medrepQuestsNoParticipants => 'Пока нет участников';

  @override
  String get referralsAccepted => 'Заявка принята';

  @override
  String get referralsRejected => 'Заявка отклонена';

  @override
  String get referralsTitle => 'Заявки рефералов';

  @override
  String get referralsEmpty => 'Нет новых заявок';

  @override
  String get referralsDecline => 'Отклонить';

  @override
  String get referralsAccept => 'Принять';

  @override
  String get checkDetailBackMyChecks => 'Мои чеки';

  @override
  String checkDetailTitle(Object id) {
    return 'Чек №$id';
  }

  @override
  String get checkDetailRejectedFallback => 'Чек отклонён';

  @override
  String checkDetailQuestDone(Object p1) {
    return '$p1 · Квест выполнен ✓';
  }

  @override
  String get checkDetailQuestAfterApproval => 'Появится после одобрения чека';

  @override
  String get checkDetailQuestNone => 'Пока не зачтён ни в один квест';

  @override
  String get checkDetailChipApproved => 'Одобрен';

  @override
  String get checkDetailChipRejected => 'Отклонён';

  @override
  String get checkDetailChipPending => 'На проверке';

  @override
  String get checkDetailOpenPhoto => 'Открыть';

  @override
  String checkDetailPhotoCount(Object p1) {
    return 'фото: $p1';
  }

  @override
  String get checkDetailRejectReasonTitle => 'Причина отклонения';

  @override
  String get checkDetailResubmit => 'Отправить повторно';

  @override
  String get checkDetailPendingTitle => 'На проверке';

  @override
  String get checkDetailPendingBody =>
      'Ваш чек на проверке у специалиста. Обычно это занимает до 24 часов.';

  @override
  String checkDetailSentAt(Object sentAt) {
    return 'Отправлен: $sentAt';
  }

  @override
  String get checkDetailAiWaitingTitle => 'Ожидание распознавания ИИ';

  @override
  String get checkDetailAiWaitingBody => 'Результат появится после проверки';

  @override
  String get checkDetailAiTitle => 'Распознано ИИ';

  @override
  String checkDetailPacks(Object p1) {
    return '$p1 уп.';
  }

  @override
  String get checkDetailQuestCardTitle => 'Зачёт в квесты';

  @override
  String get checksEmpty => 'Чеков пока нет';

  @override
  String get checksAddedUploading => 'Чек добавлен — загружается';

  @override
  String get checksNewCheckTitle => 'Новый чек';

  @override
  String get checksTapToAddPhoto => 'Нажмите чтобы добавить фото';

  @override
  String get checksTakePhoto => 'Сделать фото';

  @override
  String get checksSubmitForReview => 'Отправить на проверку';

  @override
  String get checksTitle => 'Мои чеки';

  @override
  String checksTotalCount(Object p1) {
    return '$p1 всего';
  }

  @override
  String get checksSendPhoto => 'Отправить фото';

  @override
  String checksCardMeta(Object p1, Object p2) {
    return '$p1 · фото: $p2';
  }

  @override
  String get checksAwaitUsually24h => 'Ожидайте — обычно 24 часа';

  @override
  String get checksUploadingTitle => 'Загрузка фото';

  @override
  String get checksPhotoFallback => 'Фото чека';

  @override
  String get checksRetry => 'Повторить';

  @override
  String get courseDetailTabDescription => 'ОПИСАНИЕ';

  @override
  String get courseDetailTabContent => 'СОДЕРЖАНИЕ';

  @override
  String courseDetailMinutes(Object totalMin) {
    return '~$totalMin минут';
  }

  @override
  String get courseDetailContinueLearning => 'ПРОДОЛЖИТЬ ОБУЧЕНИЕ';

  @override
  String get courseDetailStartLearning => 'НАЧАТЬ ОБУЧЕНИЕ';

  @override
  String get courseDetailVideoLessonOne => 'видеоурок';

  @override
  String get courseDetailVideoLessonFew => 'видеоурока';

  @override
  String get courseDetailVideoLessonMany => 'видеоуроков';

  @override
  String courseDetailQuizAfterLesson(Object videosBefore) {
    return 'Тест после урока $videosBefore';
  }

  @override
  String get courseDetailQuizForCourse => 'Тест по курсу';

  @override
  String courseDetailLessonMin(Object p1) {
    return '$p1 мин';
  }

  @override
  String get courseDetailQuizBadge => 'ТЕСТ';

  @override
  String get homePhActiveQuests => 'Активные квесты';

  @override
  String get homePhAllQuests => 'Все квесты';

  @override
  String get homePhNoActiveQuests => 'Нет активных квестов';

  @override
  String get homePhRecentChecks => 'Последние чеки';

  @override
  String get homePhAllChecks => 'Все чеки';

  @override
  String get homePhNoChecks => 'Пока нет чеков';

  @override
  String get homePhGreeting => 'Привет!';

  @override
  String homePhGreetingName(Object name) {
    return 'Привет, $name!';
  }

  @override
  String get homePhGreetingSub => 'Готовы к новым знаниям?';

  @override
  String get homePhWalletBalanceLabel => 'БАЛАНС КОШЕЛЬКА';

  @override
  String get homePhWalletButton => 'Кошелёк';

  @override
  String get homePhSendCheck => 'Отправить чек';

  @override
  String get homePhSendCheckSub =>
      'Сфотографируйте чек — ИИ распознает препараты';

  @override
  String get homePhStatActiveQuests => 'активных квестов';

  @override
  String get homePhStatApprovedChecks => 'одобренных чеков';

  @override
  String get homePhStatIqcPoints => 'баллов IQC';

  @override
  String get homePhVoucherBadge => 'ВАУЧЕР';

  @override
  String get homePhProgress => 'Прогресс';

  @override
  String homePhPctDone(Object pct) {
    return '$pct% выполнено';
  }

  @override
  String homePhCheckNumber(Object p1) {
    return 'Чек №$p1';
  }

  @override
  String get learnLessonOne => 'урок';

  @override
  String get learnLessonFew => 'урока';

  @override
  String get learnLessonMany => 'уроков';

  @override
  String get learnTitle => 'Обучение';

  @override
  String get learnSearchHint => 'Поиск по курсам...';

  @override
  String get learnTabAll => 'Все';

  @override
  String get learnTabMine => 'Мои курсы';

  @override
  String get learnTabDone => 'Пройденные';

  @override
  String get learnNewBadge => 'НОВЫЙ';

  @override
  String get learnRepeatCourse => 'ПОВТОРИТЬ КУРС';

  @override
  String get learnContinueLearning => 'ПРОДОЛЖИТЬ ОБУЧЕНИЕ';

  @override
  String get learnStartCourse => 'ПРОЙТИ КУРС';

  @override
  String get learnCompleted => 'Пройден';

  @override
  String get learnNotFoundTitle => 'Курсы не найдены';

  @override
  String get learnTryChangeFilters => 'Попробуйте изменить фильтры';

  @override
  String learnNothingForQuery(Object query) {
    return 'По запросу «$query» ничего не нашлось.\\nПопробуйте изменить запрос или сбросить фильтры.';
  }

  @override
  String get learnResetFilters => 'Сбросить фильтры';

  @override
  String lessonCompletedReward(Object p1) {
    return 'Урок завершён · +$p1 IQC';
  }

  @override
  String get lessonNotFound => 'Урок не найден';

  @override
  String get lessonTabText => 'ТЕКСТ УРОКА';

  @override
  String get lessonTabMaterials => 'МАТЕРИАЛЫ УРОКА';

  @override
  String get lessonNoMaterials => 'Материалов пока нет';

  @override
  String get lessonStartQuiz => 'НАЧАТЬ ТЕСТИРОВАНИЕ';

  @override
  String get lessonComplete => 'ЗАВЕРШИТЬ УРОК';

  @override
  String get questDetailBackQuests => 'Квесты';

  @override
  String get questDetailPillVoucher => 'Ваучер';

  @override
  String get questDetailLeftLabel => 'осталось';

  @override
  String get questDetailDoneLabel => 'выполнено';

  @override
  String get questDetailRewardLabel => 'НАГРАДА';

  @override
  String get questDetailVoucherManual =>
      'Ваучер выдаётся вручную после проверки';

  @override
  String questDetailIqcToBalance(Object p1) {
    return '+$p1 IQC на баланс';
  }

  @override
  String get questDetailHowTitle => 'Как засчитываются чеки';

  @override
  String get questDetailHowBody =>
      'Отправляйте фото чеков с нужным препаратом. Проверка упаковки — автоматически.';

  @override
  String get questDetailTodoTitle => 'Что нужно сделать';

  @override
  String get questDetailDrugLabel => 'Препарат';

  @override
  String get questDetailLimitsLabel => 'Лимиты';

  @override
  String get questDetailPeriodLabel => 'Период';

  @override
  String get questDetailParticipantsLabel => 'Участников';

  @override
  String get questDetailPurchases => 'покупок';

  @override
  String questsPeriodUntil(Object p1) {
    return 'до $p1';
  }

  @override
  String questsPeriodFrom(Object p1) {
    return 'с $p1';
  }

  @override
  String get questsPeriodNone => 'Без срока';

  @override
  String get questsTitle => 'Квесты';

  @override
  String get questsTabActive => 'Активные';

  @override
  String get questsTabArchive => 'Архив';

  @override
  String get questsTabAll => 'Все';

  @override
  String get questsCountWordActive => 'активных';

  @override
  String get questsCountWordArchive => 'архивных';

  @override
  String get questsCountQuestOne => 'квест';

  @override
  String get questsCountQuestFew => 'квеста';

  @override
  String get questsHistoryChip => 'История участия';

  @override
  String get questsSearchHint => 'Поиск';

  @override
  String questsPacksItem(Object p1, Object p2) {
    return '$p1 × $p2 уп.';
  }

  @override
  String questsIqcNoLimit(Object p1) {
    return '+$p1 IQC · без лимита';
  }

  @override
  String get questsPillVoucher => 'Ваучер';

  @override
  String get questsActive => 'Активен';

  @override
  String get questsFinished => 'Завершён';

  @override
  String get questsEmptyArchiveTitle => 'Нет архивных квестов';

  @override
  String get questsEmptyArchiveSub => 'Завершённые квесты появятся здесь';

  @override
  String get questsEmptyActiveTitle => 'Нет активных квестов';

  @override
  String get questsEmptyActiveSub => 'Новые квесты появятся здесь';

  @override
  String get questsEmptyAllTitle => 'Квестов нет';

  @override
  String get questsEmptyAllSub => 'Загляните позже';

  @override
  String get questsViewActive => 'Смотреть активные';

  @override
  String get quizTitle => 'Тестирование';

  @override
  String quizQuestionOf(Object p1, Object n) {
    return 'Вопрос $p1 из $n';
  }

  @override
  String get quizFinish => 'ЗАВЕРШИТЬ ТЕСТ';

  @override
  String get quizNext => 'СЛЕДУЮЩИЙ ВОПРОС →';

  @override
  String get quizAnswerLabel => 'Ответ';

  @override
  String get quizCongrats => 'Поздравляем!';

  @override
  String get quizPassed => 'Тест успешно пройден!';

  @override
  String get quizYouEarned => 'Вы заработали';

  @override
  String get quizCorrectLabel => 'ПРАВИЛЬНЫХ';

  @override
  String get quizResultLabel => 'РЕЗУЛЬТАТ';

  @override
  String get quizToHome => 'НА ГЛАВНЫЙ ЭКРАН';

  @override
  String get quizViewCertificate => 'Посмотреть сертификат →';

  @override
  String get quizTryAgainTitle => 'Попробуйте ещё раз';

  @override
  String get quizFailed => 'Тест не пройден';

  @override
  String get quizYourResult => 'Ваш результат';

  @override
  String get quizCorrectLower => 'правильных';

  @override
  String quizPassMinimum(Object passScore, Object total, Object passPct) {
    return 'Минимум для прохождения: $passScore/$total ($passPct%)';
  }

  @override
  String get quizRetry => '↺ ПРОЙТИ ЗАНОВО';

  @override
  String get quizBackToLesson => 'Вернуться к уроку →';

  @override
  String get voucherNotFound => 'Ваучер не найден';

  @override
  String get voucherTitle => 'Мой ваучер';

  @override
  String get voucherCodeCopied => 'Код скопирован';

  @override
  String get voucherUsed => 'Использован';

  @override
  String get voucherActive => 'Активен';

  @override
  String voucherIssuedAt(Object p1) {
    return 'Выпущен $p1';
  }

  @override
  String get voucherGiftCardLabel => 'UZS · ПОДАРОЧНАЯ КАРТА';

  @override
  String get voucherShowQr => 'Покажите QR-код кассиру или назовите код';

  @override
  String get voucherStores => 'Магазины Korzinka.uz';

  @override
  String get voucherSupport => 'Служба поддержки';

  @override
  String get walletPendingVouchers => 'Ваучеры в очереди';

  @override
  String get walletUseIqc => 'Использовать IQC';

  @override
  String get walletMyVouchers => 'Мои ваучеры';

  @override
  String get walletNoVouchers => 'Пока нет ваучеров';

  @override
  String get walletRedeemTitle => 'Оформить ваучер?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 за $p2 IQC';
  }

  @override
  String get walletCancel => 'Отмена';

  @override
  String get walletRedeem => 'Оформить';

  @override
  String get walletVoucherIssued => 'Ваучер оформлен';

  @override
  String get walletTitle => 'Кошелёк';

  @override
  String get walletBalanceLabel => 'БАЛАНС';

  @override
  String walletTotalAccrued(Object p1) {
    return 'Всего начислено: $p1 IQC';
  }

  @override
  String get walletHistoryArrow => 'История →';

  @override
  String get walletQuestDoneAwaiting => 'Квест выполнен — ваучер ждёт выдачи';

  @override
  String walletForIqc(Object p1) {
    return 'за $p1 IQC';
  }

  @override
  String get walletGetVoucher => 'Получить ваучер';

  @override
  String get walletNotEnoughIqc => 'Недостаточно IQC';

  @override
  String walletCodeMeta(Object p1, Object p2) {
    return 'Код: $p1 · $p2';
  }

  @override
  String get walletVoucherUsed => 'Использован';

  @override
  String get walletVoucherActive => 'Активен';

  @override
  String get walletHistoryTitle => 'История';

  @override
  String get walletNoTransactions => 'Операций пока нет';

  @override
  String get brandProductsBrand => 'Бренд';

  @override
  String get brandProductsFormat => 'Формат';

  @override
  String get brandProductsMxik => 'МХИК';

  @override
  String get brandProductsDivisible => 'Делимый';

  @override
  String get brandProductsYes => 'Да';

  @override
  String get brandProductsNo => 'Нет';

  @override
  String get brandProductsQuests => 'Квестов';

  @override
  String get medrepHomePeriodAll => 'Все';

  @override
  String get medrepHomePeriod30d => '30 дн';

  @override
  String get medrepHomePeriod7d => '7 дн';

  @override
  String get leaderboardTabChecks => 'Чеков';

  @override
  String get leaderboardTabPharm => 'Фармацевтов';

  @override
  String get leaderboardTabQuests => 'Квесты';

  @override
  String leaderboardMyRankLabel(Object company) {
    return '$company | Мой ранг: ';
  }

  @override
  String leaderboardMyRank(Object rank, Object total) {
    return '#$rank из $total';
  }

  @override
  String portfolioChecksChip(Object count) {
    return 'Чеков: $count';
  }

  @override
  String portfolioQuestsChip(Object count) {
    return 'Квестов: $count';
  }

  @override
  String referralsDate(Object date) {
    return 'Заявка: $date';
  }

  @override
  String get checksStatusApproved => 'Одобрен';

  @override
  String get checksStatusRejected => 'Отклонён';

  @override
  String get checksStatusPending => 'На проверке';

  @override
  String questDetailRewardVoucherLine(Object amount) {
    return 'Ваучер Korzinka · $amount IQC';
  }

  @override
  String get questDetailRewardIqcLine => 'Все аптеки · без лимита';

  @override
  String questDetailActiveUntil(Object date) {
    return 'Активен до $date';
  }

  @override
  String get questDetailFinished => 'Завершён';

  @override
  String questsPurchasesOfGoal(Object completed, Object goal) {
    return '$completed / $goal покупок';
  }

  @override
  String questsPurchases(Object completed) {
    return '$completed покупок';
  }

  @override
  String get profileLanguageTitle => 'Язык';

  @override
  String get profileChooseLanguage => 'Выберите язык';

  @override
  String get navDoctors => 'Врачи';

  @override
  String get doctorsTitle => 'Врачи';

  @override
  String get doctorsHint =>
      'Врачи вашей компании и их прогресс по квесту на бланки';

  @override
  String get doctorsSearchHint => 'Поиск по врачу, клинике, городу';

  @override
  String get doctorsCompleted => 'Выполнили';

  @override
  String get doctorsInProgress => 'В процессе';

  @override
  String get doctorsIdle => 'Не начали';

  @override
  String get doctorsNoQuest => 'Нет активного квеста на бланки';

  @override
  String get doctorsUnavailable =>
      'У вашей компании нет проекта с бланками, поэтому врачи не подключены';

  @override
  String get doctorsEmpty => 'Врачей пока нет';

  @override
  String get doctorsNotFound => 'Ничего не найдено';

  @override
  String get doctorsRegionUnknown => 'Регион не указан';

  @override
  String doctorsRecipesCount(Object count) {
    return 'Бланков за всё время: $count';
  }

  @override
  String doctorsQuestGoal(Object goal) {
    return 'Норма: $goal';
  }

  @override
  String doctorsDoneTimes(Object count) {
    return 'Выполнен ×$count';
  }

  @override
  String doctorsRegionSummary(Object doctors, Object completed) {
    return '$doctors врач. · $completed вып.';
  }

  @override
  String get doctorsAll => 'Все';

  @override
  String get loginWithGoogle => 'Войти через Google';

  @override
  String get loginWithApple => 'Войти через Apple';

  @override
  String get oauthLinkTitle => 'Подтвердите номер телефона';

  @override
  String get oauthLinkBody =>
      'Один раз подтвердите номер — так мы найдём ваш аккаунт и баллы. В следующий раз вход будет в одно касание.';

  @override
  String get oauthLinkPhoneLabel => 'Номер телефона';

  @override
  String get oauthLinkSendCode => 'Получить код';

  @override
  String oauthLinkCodeSent(String phone) {
    return 'Код отправлен на $phone';
  }

  @override
  String get oauthLinkCodeLabel => 'Код из SMS';

  @override
  String get oauthLinkConfirm => 'Подтвердить';

  @override
  String get oauthLinkChangePhone => 'Изменить номер';

  @override
  String get profilePrivacy => 'Политика конфиденциальности';

  @override
  String get profilePrivacySubtitle => 'Какие данные мы собираем и как храним';

  @override
  String get sapperRulesButton => 'Правила акции';

  @override
  String get sapperRulesTitle => 'Правила акции «Супер Сапёр»';

  @override
  String get sapperRulesFull => 'Полные официальные правила';

  @override
  String get sapperRulesAccept =>
      'Занимая клетку, вы принимаете правила акции.';

  @override
  String get sapperRule1 =>
      'Организатор — ООО «PHARMIQ ACADEMY». Apple и Google не являются спонсорами акции и никак в ней не участвуют.';

  @override
  String get sapperRule2 =>
      'Деньги в акции не используются: участвовать можно только за баллы IQC.';

  @override
  String get sapperRule3 =>
      'Баллы IQC начисляются за обучение, опросы и подтверждённые квесты. Их нельзя купить, передать другому пользователю или обменять на деньги.';

  @override
  String get sapperRule4 =>
      'Сроки, цена клетки и полный список призов показаны на странице акции до участия.';

  @override
  String get sapperRule5 =>
      'Баллы списываются при занятии клетки, отменить это нельзя. Одну клетку занимает один участник; приём закрывается за 1 минуту до итогов.';

  @override
  String get sapperRule6 =>
      'Призы размещаются в клетках до начала акции и после старта не меняются. В назначенное время все клетки открываются одновременно, приз из клетки автоматически получает участник, который её занял. Итоги видны всем.';

  @override
  String get sapperRule7 =>
      'Призы — подарочные ваучеры партнёров и бонусные баллы; на деньги они не обмениваются. Призы из незанятых клеток повторно не распределяются.';

  @override
  String get sapperRule8 =>
      'Если акция отменена, все потраченные баллы возвращаются. Участвовать могут пользователи старше 18 лет, участие добровольное.';

  @override
  String get stateServerErrorTitle => 'Что-то пошло не так';

  @override
  String get stateServerErrorText =>
      'Мы уже знаем о проблеме и чиним её. Попробуйте ещё раз через минуту';

  @override
  String get stateWriteSupport => 'Написать в поддержку';

  @override
  String stateErrorCode(String code) {
    return 'Код ошибки: $code';
  }

  @override
  String get stateOfflineTitle => 'Нет подключения к интернету';

  @override
  String get stateOfflineText =>
      'Проверьте Wi‑Fi или мобильный интернет. Экран обновится сам, как только связь появится';

  @override
  String stateOfflineBanner(String time) {
    return 'Нет соединения · данные от $time';
  }

  @override
  String get stateOfflineBannerShort => 'Нет соединения';

  @override
  String get stateOfflineSendHint =>
      'Отправка станет доступна, когда появится интернет';

  @override
  String get stateRefreshing => 'Обновляем…';

  @override
  String get miniAppsNewGamesTitle => 'Новые мини-приложения';

  @override
  String get miniAppsNewGamesText =>
      'Уже в разработке — сообщим, когда появятся';

  @override
  String sapperBackTo(String label) {
    return 'Назад: $label';
  }

  @override
  String sapperPrizesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n приза',
      many: '$n призов',
      few: '$n приза',
      one: '$n приз',
    );
    return '$_temp0';
  }

  @override
  String sapperMyCellsCount(int n) {
    return 'Ваших клеток: $n';
  }

  @override
  String sapperResultsIn(String time) {
    return 'Итоги через $time';
  }

  @override
  String get sapperCellPriceTitle => 'Цена клетки';

  @override
  String get sapperMyCellsTitle => 'Ваших клеток';

  @override
  String get sapperOccupiedTitle => 'Занято клеток';

  @override
  String sapperOccupiedOf(int occupied, int total) {
    return '$occupied из $total';
  }

  @override
  String sapperOfTotal(int total) {
    return 'из $total';
  }

  @override
  String get sapperHiddenLabel => 'На поле спрятано';

  @override
  String get sapperHowTitle => 'Как участвовать';

  @override
  String get sapperStep1Title => 'Выберите клетки';

  @override
  String sapperStep1Text(int price) {
    return 'Каждая стоит $price IQC. Можно занять сразу несколько';
  }

  @override
  String get sapperStep2Title => 'Дождитесь подведения итогов';

  @override
  String get sapperStep2Text => 'Раз в неделю поле открывается для всех';

  @override
  String get sapperStep3Title => 'Получите приз';

  @override
  String get sapperStep3Text =>
      'IQC зачислим на баланс, ваучер появится в кошельке';

  @override
  String get sapperSelectHint => 'Нажмите на свободные клетки, чтобы выбрать';

  @override
  String sapperSelectedHint(int n, int price) {
    return 'Выбрано: $n · спишем $price IQC';
  }

  @override
  String sapperTakeCta(int n, int price) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Занять $n клетки',
      many: 'Занять $n клеток',
      few: 'Занять $n клетки',
      one: 'Занять $n клетку',
    );
    return '$_temp0 · $price IQC';
  }

  @override
  String sapperTakenToast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n клетки',
      many: '+$n клеток',
      few: '+$n клетки',
      one: '+$n клетку',
    );
    return '$_temp0 — ждём итогов';
  }

  @override
  String sapperReserveManyTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Занять $n клетки?',
      many: 'Занять $n клеток?',
      few: 'Занять $n клетки?',
      one: 'Занять $n клетку?',
    );
    return '$_temp0';
  }

  @override
  String get sapperCellFree => 'Свободная клетка';

  @override
  String get sapperCellTheirs => 'Занята другим участником';

  @override
  String get sapperCellMine => 'Ваша клетка';

  @override
  String get sapperCellSelected => 'Выбрана, нажмите чтобы снять';

  @override
  String get sapperCellEmpty => 'Пусто';

  @override
  String sapperCellPrize(String label) {
    return 'Приз: $label';
  }

  @override
  String sapperGridLabel(int cols, int rows) {
    return 'Поле $cols на $rows';
  }

  @override
  String get sapperGridRevealed => 'Открытое поле';

  @override
  String sapperWonTitle(String prize) {
    return 'Вы получили $prize';
  }

  @override
  String sapperWonText(int wins, int total) {
    return 'Уже на балансе · призовых клеток: $wins из $total';
  }

  @override
  String get sapperNotParticipated => 'Вы не участвовали в этой акции';

  @override
  String sapperRevealedOn(String date) {
    return 'Итоги подведены · $date';
  }

  @override
  String get sapperWinnerYou => 'вы';

  @override
  String sapperWinnerCell(int n) {
    return 'Клетка №$n';
  }

  @override
  String get sapperPlayNew => 'Участвовать в новой акции';

  @override
  String get sapperViewResults => 'Посмотреть итоги';

  @override
  String get questsSubtitle => 'Продавайте и получайте награды';

  @override
  String get questsSubtitleDoctor => 'Выписывайте бланки и получайте награды';

  @override
  String get questsSearchLabel => 'Поиск квестов';

  @override
  String get questsTabDone => 'Завершённые';

  @override
  String get questsSortHint => 'Сначала — ближе всего к награде';

  @override
  String get questsAlmostDone => 'Почти готово';

  @override
  String get questsCompleted => 'Выполнено';

  @override
  String questsOfGoalSales(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: 'из $goal продаж',
      many: 'из $goal продаж',
      few: 'из $goal продаж',
      one: 'из $goal продажи',
    );
    return '$_temp0';
  }

  @override
  String questsOfGoalRecipes(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: 'из $goal бланков',
      many: 'из $goal бланков',
      few: 'из $goal бланков',
      one: 'из $goal бланка',
    );
    return '$_temp0';
  }

  @override
  String questsLeftShort(int n) {
    return 'Ещё $n';
  }

  @override
  String get questsMore => 'Подробнее';

  @override
  String get questsHowTitle => 'Как работают квесты';

  @override
  String get questsStepSellTitle => 'Продайте';

  @override
  String get questsStepSellSub => 'препарат';

  @override
  String get questsStepPrescribeTitle => 'Выпишите';

  @override
  String get questsStepPrescribeSub => 'бланк';

  @override
  String get questsStepSendTitle => 'Отправьте';

  @override
  String get questsStepSendCheckSub => 'фото чека';

  @override
  String get questsStepSendRecipeSub => 'фото бланка';

  @override
  String get questsStepGetTitle => 'Получите';

  @override
  String get questsStepGetSub => 'награду';

  @override
  String get questsDoneFooter =>
      'Здесь хранятся выполненные и завершённые квесты — с датой и полученной наградой';

  @override
  String questsDoneOn(String date) {
    return 'Выполнен · $date';
  }

  @override
  String questsEndedOn(String date) {
    return 'Завершён · $date';
  }

  @override
  String get questsEmptyDoneTitle => 'Пока нет завершённых квестов';

  @override
  String questsMonthName(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Январь',
      'm2': 'Февраль',
      'm3': 'Март',
      'm4': 'Апрель',
      'm5': 'Май',
      'm6': 'Июнь',
      'm7': 'Июль',
      'm8': 'Август',
      'm9': 'Сентябрь',
      'm10': 'Октябрь',
      'm11': 'Ноябрь',
      'm12': 'Декабрь',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get questsSalesLeftPrefix => 'Осталось продать';

  @override
  String get questsRecipesLeftPrefix => 'Осталось выписать';

  @override
  String questsPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n упаковки',
      many: '$n упаковок',
      few: '$n упаковки',
      one: '$n упаковку',
    );
    return '$_temp0';
  }

  @override
  String questsRecipesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n бланка',
      many: '$n бланков',
      few: '$n бланка',
      one: '$n бланк',
    );
    return '$_temp0';
  }

  @override
  String get questsGoalReached =>
      'Цель достигнута — награда будет начислена после проверки';

  @override
  String get questsRewardLabel => 'Награда';

  @override
  String questsVoucherTitle(String shop) {
    return 'Ваучер $shop';
  }

  @override
  String get questsRewardManual => 'Выдаётся вручную после проверки';

  @override
  String get questsRewardIqcSub => 'Баллы придут на баланс после проверки';

  @override
  String get questsRewardReceived => 'Награда получена';

  @override
  String questsStepSellDrug(String drug) {
    return 'Продайте $drug';
  }

  @override
  String questsStepPrescribeDrug(String drug) {
    return 'Выпишите $drug';
  }

  @override
  String questsNeedSell(String packs) {
    return 'Нужно продать $packs';
  }

  @override
  String questsNeedPrescribe(String recipes) {
    return 'Нужно выписать $recipes';
  }

  @override
  String get questsStepPhotoCheck => 'Сфотографируйте чек';

  @override
  String get questsStepPhotoCheckSub => 'ИИ проверит упаковку автоматически';

  @override
  String get questsStepPhotoRecipe => 'Сфотографируйте бланк';

  @override
  String get questsStepPhotoRecipeSub => 'ИИ проверит бланк автоматически';

  @override
  String get questsStepGetVoucher => 'Получите ваучер';

  @override
  String questsStepGetIqc(int n) {
    return 'Получите $n IQC';
  }

  @override
  String get questsConditionsTitle => 'Условия';

  @override
  String get questsSalesLimit => 'Лимит продаж';

  @override
  String get questsRecipesLimit => 'Лимит бланков';

  @override
  String get questsNoLimit => 'Без ограничений';

  @override
  String questsPacksShort(int n) {
    return '$n уп.';
  }

  @override
  String get questsCountedTitle => 'Засчитанные чеки';

  @override
  String get questsCountedRecipesTitle => 'Засчитанные бланки';

  @override
  String get questsCountedEmpty => 'Пока ни одного чека';

  @override
  String get questsCountedEmptyRecipes => 'Пока ни одного бланка';

  @override
  String get questsCountedEmptySub =>
      'Чеки по квесту появятся здесь после проверки';

  @override
  String get questsCountedEmptySubRecipes =>
      'Бланки по квесту появятся здесь после проверки';

  @override
  String questsCountedSales(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Засчитано $n продажи',
      many: 'Засчитано $n продаж',
      few: 'Засчитано $n продажи',
      one: 'Засчитана $n продажа',
    );
    return '$_temp0';
  }

  @override
  String questsCountedRecipes(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Засчитано $n бланка',
      many: 'Засчитано $n бланков',
      few: 'Засчитано $n бланка',
      one: 'Засчитан $n бланк',
    );
    return '$_temp0';
  }

  @override
  String get questsAllChecks => 'Все чеки';

  @override
  String get questsAllRecipes => 'Все бланки';

  @override
  String get questsSendCheck => 'Отправить чек по квесту';

  @override
  String get questsSendRecipe => 'Отправить бланк по квесту';

  @override
  String get questsSearchPlaceholder => 'Название или препарат';

  @override
  String get questsSearchClear => 'Очистить';

  @override
  String questsFound(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Найдено $n квеста',
      many: 'Найдено $n квестов',
      few: 'Найдено $n квеста',
      one: 'Найден $n квест',
    );
    return '$_temp0';
  }

  @override
  String get questsPopular => 'Часто ищут';

  @override
  String get questsNothingFound => 'Ничего не найдено';

  @override
  String get questsNothingFoundSub =>
      'Проверьте название препарата или попробуйте другой запрос';

  @override
  String get questsReceived => 'получено';

  @override
  String get questsPending => 'ожидает';

  @override
  String get walletAccruedAllTime => 'начислено за всё время';

  @override
  String walletAwaitingStat(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ваучера ждут выдачи',
      many: 'ваучеров ждут выдачи',
      few: 'ваучера ждут выдачи',
      one: 'ваучер ждёт выдачи',
    );
    return '$_temp0';
  }

  @override
  String get walletArchive => 'Архив';

  @override
  String get walletArchiveTitle => 'Архив ваучеров';

  @override
  String get walletTapCardHint => 'Нажмите на карту — покажем QR-код';

  @override
  String get walletAllArchivedTitle => 'Все ваучеры в архиве';

  @override
  String get walletAllArchivedText => 'Новые появятся после выполнения квестов';

  @override
  String get walletGiftCard => 'Подарочная карта';

  @override
  String get walletGiftCardBoth => 'ПОДАРОЧНАЯ КАРТА · SOVG\'A KARTASI';

  @override
  String get walletGiftCardKorzinka => 'Подарочная карта Korzinka';

  @override
  String get walletReceived => 'Получен';

  @override
  String get walletCode => 'Код';

  @override
  String get walletShowQr => 'Показать';

  @override
  String get walletStatusLabel => 'Статус';

  @override
  String get walletWhere => 'Где';

  @override
  String get walletStatusArchived => 'В архиве';

  @override
  String get walletAwaitingTitle => 'Ждут выдачи';

  @override
  String walletQuestDoneOn(String date) {
    return 'Квест выполнен · $date';
  }

  @override
  String walletPcs(int n) {
    return '$n шт.';
  }

  @override
  String walletVouchersCaption(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ваучера',
      many: 'ваучеров',
      few: 'ваучера',
      one: 'ваучер',
    );
    return '$_temp0';
  }

  @override
  String get walletManualHint =>
      'Ваучеры выдаются вручную после проверки — обычно в течение нескольких дней';

  @override
  String walletShowAll(int n) {
    return 'Показать все $n';
  }

  @override
  String get walletExchangeTitle => 'Обменять IQC';

  @override
  String get walletShopTitle => 'Обмен IQC';

  @override
  String walletProgressOf(String have, String need) {
    return '$have из $need IQC';
  }

  @override
  String walletMore(String n) {
    return 'Ещё $n';
  }

  @override
  String get walletSaveUp => 'Копите IQC, чтобы обменять';

  @override
  String walletExchangeFor(String amount) {
    return 'Обменять за $amount IQC';
  }

  @override
  String walletOpenVoucher(String sum) {
    return 'Открыть ваучер $sum';
  }

  @override
  String get walletClose => 'Закрыть';

  @override
  String get walletVoucherDialog => 'Ваучер Korzinka';

  @override
  String get walletArchiveUsed => 'В архив — ваучер использован';

  @override
  String walletArchivedToast(String code) {
    return 'Ваучер ••$code в архиве';
  }

  @override
  String get walletUndo => 'Отменить';

  @override
  String get walletBack => 'Назад';

  @override
  String get walletBackToWallet => 'Назад в кошелёк';

  @override
  String walletArchiveSummary(int n, String sum) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучера',
      many: '$n ваучеров',
      few: '$n ваучера',
      one: '$n ваучер',
    );
    return '$_temp0 · $sum';
  }

  @override
  String get walletRestore => 'Вернуть';

  @override
  String walletRestoreA11y(String code) {
    return 'Вернуть ваучер ••$code';
  }

  @override
  String get walletRestoreHint =>
      'Нажмите «Вернуть», если убрали ваучер по ошибке — он снова появится в кошельке';

  @override
  String get walletArchiveEmptyTitle => 'Архив пуст';

  @override
  String get walletArchiveEmptyText =>
      'Использовали ваучер? Уберите его сюда — в кошельке останутся только действующие';

  @override
  String walletReceivedMeta(String date, String code) {
    return 'Получен $date · код ••$code';
  }

  @override
  String get walletHistoryAll => 'Все';

  @override
  String get walletHistoryEarned => 'Начисления';

  @override
  String get walletHistorySpent => 'Списания';

  @override
  String get walletEarnedMonth => 'Начислено в этом месяце';

  @override
  String get walletSpentMonth => 'Потрачено в этом месяце';

  @override
  String get walletMonths =>
      'Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,Сентябрь,Октябрь,Ноябрь,Декабрь';

  @override
  String get walletAccrued => 'начислено';

  @override
  String get walletDebited => 'списано';

  @override
  String get walletTxnCheck => 'Чек';

  @override
  String get walletTxnRecipe => 'Бланк';

  @override
  String get walletTxnSurvey => 'Опрос';

  @override
  String get walletTxnQuest => 'Квест выполнен';

  @override
  String get walletTxnCourse => 'Курс пройден';

  @override
  String get walletTxnRedeem => 'Обмен на ваучер';

  @override
  String get walletTxnReversal => 'Возврат';

  @override
  String get walletTxnAdjust => 'Корректировка';

  @override
  String get walletTxnOther => 'Начисление';

  @override
  String walletQueueQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n квеста',
      many: '$n квестов',
      few: '$n квеста',
      one: '$n квест',
    );
    return '$_temp0';
  }

  @override
  String walletQueueVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучера ждут выдачи',
      many: '$n ваучеров ждут выдачи',
      few: '$n ваучера ждут выдачи',
      one: '$n ваучер ждёт выдачи',
    );
    return '$_temp0';
  }

  @override
  String get walletStepDone => 'Квест выполнен';

  @override
  String get walletStepReview => 'Проверка';

  @override
  String get walletStepIssue => 'Выдача';

  @override
  String get walletQueueHint =>
      'Ваучеры выдаются вручную после проверки — обычно в течение нескольких дней. Пришлём уведомление, когда ваучер появится в кошельке';

  @override
  String get walletQueueEmptyTitle => 'Очередь пуста';

  @override
  String get walletQueueEmptyText =>
      'Выполните квест с наградой-ваучером — он появится здесь до выдачи';

  @override
  String get walletYourBalance => 'Ваш баланс';

  @override
  String walletEnoughFor(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Хватает на $n ваучера',
      many: 'Хватает на $n ваучеров',
      few: 'Хватает на $n ваучера',
      one: 'Хватает на $n ваучер',
      zero: 'Пока не хватает на ваучер',
    );
    return '$_temp0';
  }

  @override
  String get walletShopNote =>
      'Ваучер появится в кошельке после подтверждения обмена';

  @override
  String walletConfirmTitle(String amount) {
    return 'Обменять $amount IQC?';
  }

  @override
  String walletConfirmText(String sum) {
    return 'Получите подарочную карту Korzinka на $sum';
  }

  @override
  String get walletWillDebit => 'Спишем';

  @override
  String get walletWillRemain => 'Останется';

  @override
  String get walletWhereTo => 'Куда придёт';

  @override
  String get walletToWallet => 'В кошелёк';

  @override
  String get walletExchange => 'Обменять';

  @override
  String get walletExchangeFailed => 'Не удалось обменять IQC';

  @override
  String get walletShare => 'Поделиться ваучером';

  @override
  String get walletCopyCode => 'Скопировать код';

  @override
  String get walletQrLabel => 'QR-код ваучера';

  @override
  String get walletShowQrCashier =>
      'Покажите QR-код кассиру или продиктуйте код';

  @override
  String get walletStores => 'Магазины Korzinka';

  @override
  String get walletToArchive => 'В архив';

  @override
  String get walletToArchiveHint =>
      'Использовали ваучер? Уберите его в архив — он останется в истории';

  @override
  String get walletRestoreFromArchive => 'Вернуть из архива';

  @override
  String get learnSubtitle => 'Проходите курсы — получайте IQC';

  @override
  String get learnSearchA11y => 'Поиск курсов';

  @override
  String get learnSearchPlaceholder => 'Название курса или бренда';

  @override
  String get learnSearchClear => 'Очистить';

  @override
  String get learnSegNew => 'Новые';

  @override
  String get learnSegProgress => 'В процессе';

  @override
  String get learnSegDone => 'Пройденные';

  @override
  String learnTileVideo(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n видеоурока',
      many: '$n видеоуроков',
      few: '$n видеоурока',
      one: '$n видеоурок',
    );
    return '$_temp0';
  }

  @override
  String learnTileQuiz(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n теста',
      many: '$n тестов',
      few: '$n теста',
      one: '$n тест',
    );
    return '$_temp0';
  }

  @override
  String get learnTileReward => 'Награда';

  @override
  String learnMinutesShort(int n) {
    return '~$n мин';
  }

  @override
  String get learnQuizStatusLocked => 'Закрыт';

  @override
  String get learnQuizStatusOpen => 'Доступен';

  @override
  String learnIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get learnCtaStart => 'Начать курс';

  @override
  String get learnCtaContinue => 'Продолжить';

  @override
  String get learnCtaRepeat => 'Пройти повторно';

  @override
  String learnProgressLabel(int pct) {
    return 'Пройдено $pct%';
  }

  @override
  String get learnEmptyTitle => 'Пока нет курсов';

  @override
  String get learnEmptyText =>
      'Курсы для вашей аптеки ещё не добавлены. Как только появится новый курс, пришлём уведомление';

  @override
  String get learnEnableNotifications => 'Включить уведомления';

  @override
  String get learnNoResultsTitle => 'Ничего не нашлось';

  @override
  String learnNoResultsInTab(String query, String tab) {
    return 'По запросу «$query» во вкладке «$tab» курсов нет. Проверьте написание или поищите во всех курсах';
  }

  @override
  String learnNoResultsAll(String query) {
    return 'По запросу «$query» курсов нет. Проверьте написание или попробуйте другое название';
  }

  @override
  String get learnSearchEverywhere => 'Искать во всех курсах';

  @override
  String get learnTabEmptyTitle => 'Здесь пока пусто';

  @override
  String get learnTabEmptyNew =>
      'Все курсы уже начаты — продолжайте обучение во вкладке «В процессе»';

  @override
  String get learnTabEmptyProgress =>
      'Начните любой курс из вкладки «Новые» — он появится здесь';

  @override
  String get learnTabEmptyDone =>
      'Пройденные курсы появятся здесь после успешного теста';

  @override
  String get learnBack => 'Назад';

  @override
  String get learnCourseTitle => 'Курс';

  @override
  String learnMetaVideos(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n видеоурока',
      many: '$n видеоуроков',
      few: '$n видеоурока',
      one: '$n видеоурок',
    );
    return '$_temp0';
  }

  @override
  String learnMetaMinutes(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n минуты',
      many: '$n минут',
      few: '$n минуты',
      one: '$n минута',
    );
    return '~$_temp0';
  }

  @override
  String get learnProgram => 'Программа курса';

  @override
  String get learnRowVideo => 'Видеоурок';

  @override
  String get learnRowQuiz => 'Тест';

  @override
  String get learnRowQuizLocked => 'Откроется после видео';

  @override
  String get learnRowRewardPending => 'Начислим после теста';

  @override
  String get learnRowRewardDone => 'Начислено';

  @override
  String learnLessonOf(int i, int n) {
    return 'Урок $i из $n';
  }

  @override
  String get learnLessonTabText => 'Текст урока';

  @override
  String get learnLessonTabMaterials => 'Материалы';

  @override
  String get learnWatchVideo => 'Смотреть видео';

  @override
  String get learnVideoUnavailable => 'Видео недоступно';

  @override
  String get learnLessonHintLocked => 'Досмотрите видео — затем откроется тест';

  @override
  String get learnLessonHintFinish =>
      'Посмотрели видео? Завершите урок, чтобы перейти дальше';

  @override
  String get learnStartTest => 'Начать тест';

  @override
  String get learnNextLesson => 'Следующий урок';

  @override
  String get learnFinishLesson => 'Завершить урок';

  @override
  String get learnFinishingLesson => 'Сохраняем…';

  @override
  String get learnBackToCourse => 'К курсу';

  @override
  String learnTestTopBar(String name) {
    return 'Тест · $name';
  }

  @override
  String learnQuestionOf(String i, int n) {
    return 'Вопрос $i из $n';
  }

  @override
  String get learnNext => 'Далее';

  @override
  String get learnFinishTest => 'Завершить тест';

  @override
  String get learnSubmitting => 'Проверяем…';

  @override
  String get learnCoursePassed => 'Курс пройден!';

  @override
  String get learnTestPassed => 'Тест пройден!';

  @override
  String get learnPassedText => 'Отличная работа. Баллы уже на вашем балансе.';

  @override
  String get learnPassedTextNoReward => 'Отличная работа!';

  @override
  String learnScoreOf(int score, int total) {
    return '$score из $total';
  }

  @override
  String get learnCorrectAnswers => 'правильных ответов';

  @override
  String get learnOpenWallet => 'Открыть кошелёк';

  @override
  String get learnToOtherCourses => 'К другим курсам';

  @override
  String get learnContinueCourse => 'Продолжить курс';

  @override
  String get learnFailedTitle => 'Почти получилось';

  @override
  String get learnFailedText =>
      'Недостаточно правильных ответов. Пересмотрите урок — и попробуйте ещё раз, баллы ждут вас.';

  @override
  String learnRewardStillAvailable(int n) {
    return '+$n IQC всё ещё доступны';
  }

  @override
  String get learnCanRetry => 'Можно пройти тест повторно';

  @override
  String get learnRewatchLesson => 'Пересмотреть урок';

  @override
  String get learnRetryTest => 'Пройти тест снова';

  @override
  String rxHomeGreeting(String name) {
    return 'Привет, $name!';
  }

  @override
  String get rxHomeSubtitle => 'Отправляйте бланки и получайте награды';

  @override
  String get rxHomeBellLabel => 'Уведомления';

  @override
  String get rxHomeBellUnread => 'Уведомления, есть новые';

  @override
  String rxHomeStatQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'активного квеста',
      many: 'активных квестов',
      few: 'активных квеста',
      one: 'активный квест',
    );
    return '$_temp0';
  }

  @override
  String get rxHomeStatApproved => 'одобрено бланков';

  @override
  String get rxHomeStatPending => 'на проверке';

  @override
  String get rxHomeRecent => 'Последние бланки';

  @override
  String get rxHomeAllRecipes => 'Все бланки';

  @override
  String rxQuestProgress(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal бланков',
      one: '$goal бланка',
    );
    return '$done из $_temp0';
  }

  @override
  String rxQuestLeft(int n) {
    return 'Ещё $n';
  }

  @override
  String rxQuestDone(int pct) {
    return 'Выполнено $pct%';
  }

  @override
  String rxRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get rxRewardVoucher => 'Ваучер';

  @override
  String get rxWaitValue => '~24 ч';

  @override
  String get rxWaitCaption => 'ожидание';

  @override
  String get rxSoon => 'Скоро';

  @override
  String get rxSoonCaption => 'начисление';

  @override
  String get rxRetake => 'Переснять';

  @override
  String get rxRetakeRecipe => 'Переснять бланк';

  @override
  String rxMeta(String date, int n) {
    return '$date · $n фото';
  }

  @override
  String rxListCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n бланка',
      many: '$n бланков',
      few: '$n бланка',
      one: '$n бланк',
    );
    return '$_temp0';
  }

  @override
  String get rxTabPending => 'На проверке';

  @override
  String get rxTabDone => 'Завершённые';

  @override
  String get rxFilterEmpty => 'В этом разделе пока нет бланков';

  @override
  String get rxPendingHint => 'Проверим до 24 часов';

  @override
  String get rxRejectedDefault => 'Бланк не прошёл проверку';

  @override
  String get rxEmptyTitle => 'Здесь появятся ваши бланки';

  @override
  String get rxEmptyText =>
      'Сфотографируйте выписанный бланк — ИИ распознает препараты, а после проверки вы получите IQC';

  @override
  String get rxHowTo => 'Как сфотографировать';

  @override
  String get rxTipWholeTitle => 'Бланк целиком';

  @override
  String get rxTipWholeText => 'Все края листа в кадре';

  @override
  String get rxTipStampTitle => 'Печать и подпись';

  @override
  String get rxTipStampText => 'Без них бланк не примут';

  @override
  String get rxTipLightTitle => 'Хороший свет';

  @override
  String get rxTipLightText => 'Без бликов и тени от телефона';

  @override
  String get rxSendFirst => 'Отправить первый бланк';

  @override
  String get rxStatePendingTitle => 'Бланк на проверке';

  @override
  String get rxStatePendingText =>
      'Специалист проверяет бланк. Обычно это занимает до 24 часов';

  @override
  String get rxStateApprovedTitle => 'Бланк одобрен';

  @override
  String get rxStateApprovedText =>
      'Всё в порядке. IQC поступят на баланс в ближайшее время';

  @override
  String get rxStateRejectedTitle => 'Бланк отклонён';

  @override
  String get rxStateRejectedHint =>
      'Сфотографируйте бланк целиком при хорошем свете — баллы ещё можно получить';

  @override
  String get rxStepSent => 'Отправлен';

  @override
  String get rxStepReview => 'Проверка';

  @override
  String get rxStepApproved => 'Одобрен';

  @override
  String get rxStepCredited => 'Начислено';

  @override
  String get rxStepRejected => 'Отклонён';

  @override
  String get rxPhotos => 'Фото бланка';

  @override
  String rxOpenPhoto(int n) {
    return 'Открыть фото бланка $n';
  }

  @override
  String get rxAiLater => 'Список препаратов появится после проверки';

  @override
  String get rxAccrual => 'Начисление';

  @override
  String get rxAccrualPendingTitle => 'Начислим после одобрения';

  @override
  String get rxAccrualPendingText => 'После одобрения бланка';

  @override
  String get rxAccrualApprovedTitle => 'Ожидает начисления';

  @override
  String get rxQuests => 'Зачёт в квесты';

  @override
  String get rxQuestsPending => 'Появится после одобрения бланка';

  @override
  String get rxQuestsNone => 'Пока не зачтён ни в один квест';

  @override
  String get rxData => 'Данные бланка';

  @override
  String get rxShowText => 'Показать распознанный текст';

  @override
  String get rxSupport => 'Вопрос по бланку? Напишите нам';

  @override
  String get rxCameraClose => 'Закрыть';

  @override
  String get rxCameraLabel => 'Бланк';

  @override
  String get rxCameraTip => 'Печать и подпись должны быть видны';

  @override
  String get rxCameraHold => 'Держите телефон ровно над бланком';

  @override
  String get rxCameraShoot => 'Сделать снимок';

  @override
  String get rxCameraDenied =>
      'Нет доступа к камере. Разрешите его в настройках';

  @override
  String get rxOcrTitle => 'Распознанный текст';

  @override
  String get rxOcrSubtitle => 'Так ИИ прочитал фото бланка';

  @override
  String get rxOcrNote =>
      'ФИО пациента скрыто. Текст распознан автоматически — возможны ошибки';

  @override
  String get rxOcrEmpty => 'Текст ещё не распознан';

  @override
  String get rxOcrEmptyText => 'Он появится здесь после обработки фото';

  @override
  String get rxCopy => 'Копировать';

  @override
  String get rxCopied => 'Текст скопирован';

  @override
  String get rxReportError => 'Ошибка в тексте';

  @override
  String get rxBack => 'Назад';

  @override
  String get homeBellUnread => 'Уведомления, есть новые';

  @override
  String homeStatActiveQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'активного квеста',
      many: 'активных квестов',
      few: 'активных квеста',
      one: 'активный квест',
    );
    return '$_temp0';
  }

  @override
  String get homeStatApproved => 'одобрено чеков';

  @override
  String get homeStatPending => 'на проверке';

  @override
  String homeQuestSales(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$done из $goal продаж',
      one: '$done из $goal продажи',
    );
    return '$_temp0';
  }

  @override
  String homeQuestLeft(int n) {
    return 'Ещё $n';
  }

  @override
  String get homeQuestDone => 'Выполнено';

  @override
  String homeRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String homeCheckMeta(int id, String date) {
    return '№$id · $date';
  }

  @override
  String get homeCheckWait => '~24 ч';

  @override
  String get homeCheckWaitCaption => 'ожидание';

  @override
  String get homeCheckRetake => 'Переснять';

  @override
  String get homeMiniAppsSub => 'Сапёр и другие акции';

  @override
  String get homeNewTitle => 'Добро пожаловать!';

  @override
  String get homeNewSubtitle => 'Три шага — и вы в программе';

  @override
  String get homeNewStepsLabel => 'Первые шаги';

  @override
  String homeNewStepsCount(int done, int total) {
    return '$done из $total';
  }

  @override
  String get homeNewHeadline => 'Отправьте первый чек и получите IQC';

  @override
  String get homeNewStepRegister => 'Регистрация';

  @override
  String get homeNewStepDone => 'Готово';

  @override
  String get homeNewStepCheck => 'Отправьте первый чек';

  @override
  String get homeNewStepCheckSub => 'Сфотографируйте чек из аптеки';

  @override
  String get homeNewStepCourse => 'Пройдите первый курс';

  @override
  String homeNewStepCourseReward(int iqc, String title) {
    return '+$iqc IQC за «$title»';
  }

  @override
  String homeNewStepCourseSub(String title) {
    return 'Курс «$title»';
  }

  @override
  String get homeNewStepCourseAny => 'Курсы — в разделе «Обучение»';

  @override
  String get homeNewSendFirst => 'Отправить первый чек';

  @override
  String get homeNewCourseSection => 'Начните с курса';

  @override
  String get homeNewAllCourses => 'Все курсы';

  @override
  String homeNewCourseLessons(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n урока',
      many: '$n уроков',
      few: '$n урока',
      one: '$n урок',
    );
    return '$_temp0';
  }

  @override
  String homeNewCourseMinutes(int n) {
    return '~$n мин';
  }

  @override
  String get homeNewQuestSection => 'Квест для старта';

  @override
  String homeNewQuestGoal(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Продайте $n упаковки',
      many: 'Продайте $n упаковок',
      few: 'Продайте $n упаковки',
      one: 'Продайте $n упаковку',
    );
    return '$_temp0';
  }

  @override
  String get homeNewQuestIqc => 'IQC на баланс';

  @override
  String get homeNewQuestVoucher => 'ваучер за выполнение';

  @override
  String get homeNewHint =>
      'Баланс, ваучеры и мини-приложения появятся после первых IQC';

  @override
  String get newsBack => 'Назад';

  @override
  String get newsBackToList => 'Назад к новостям';

  @override
  String newsReadTime(int n) {
    return '$n мин чтения';
  }

  @override
  String get newsEmptyText =>
      'Здесь появятся новости программы и полезные материалы';

  @override
  String get surveyYourAnswer => 'Ваш ответ';

  @override
  String surveySubmitReward(int n) {
    return 'Ответить и получить $n IQC';
  }

  @override
  String get surveyWriteHint => 'Напишите ответ, чтобы отправить';

  @override
  String get surveyRatingLabel => 'Оценка';

  @override
  String surveyRatingOf(int n, int max) {
    return '$n из $max';
  }

  @override
  String get surveyRatingWords => 'Плохо,Так себе,Нормально,Хорошо,Отлично';

  @override
  String surveyReward(int n) {
    return '+$n IQC';
  }

  @override
  String get surveyOnBalance => 'уже на вашем балансе';

  @override
  String get surveySendFailed =>
      'Не удалось отправить ответ. Попробуйте ещё раз';

  @override
  String medrepHelloName(String name) {
    return 'Привет, $name!';
  }

  @override
  String get medrepAttrShared => 'общая атрибуция';

  @override
  String get medrepAttrPrimary => 'первичная атрибуция';

  @override
  String get medrepPeriodAll => 'Всё время';

  @override
  String get medrepPeriod30 => '30 дней';

  @override
  String get medrepPeriod7 => '7 дней';

  @override
  String medrepUnitPharm(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'фармацевта',
      many: 'фармацевтов',
      few: 'фармацевта',
      one: 'фармацевт',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitChecks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'чека',
      many: 'чеков',
      few: 'чека',
      one: 'чек',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'упаковки',
      many: 'упаковок',
      few: 'упаковки',
      one: 'упаковка',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuestsDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квеста выполнено',
      many: 'квестов выполнено',
      few: 'квеста выполнено',
      one: 'квест выполнен',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квеста',
      many: 'квестов',
      few: 'квеста',
      one: 'квест',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPharmacies(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'аптеки',
      many: 'аптек',
      few: 'аптеки',
      one: 'аптека',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPharmacists(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'провизора',
      many: 'провизоров',
      few: 'провизора',
      one: 'провизор',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitChecksAllTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'чека за всё время',
      many: 'чеков за всё время',
      few: 'чека за всё время',
      one: 'чек за всё время',
    );
    return '$_temp0';
  }

  @override
  String medrepCountChecks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n чека',
      many: '$n чеков',
      few: '$n чека',
      one: '$n чек',
    );
    return '$_temp0';
  }

  @override
  String medrepCountPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n упаковки',
      many: '$n упаковок',
      few: '$n упаковки',
      one: '$n упаковка',
    );
    return '$_temp0';
  }

  @override
  String medrepCountQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n квеста',
      many: '$n квестов',
      few: '$n квеста',
      one: '$n квест',
    );
    return '$_temp0';
  }

  @override
  String medrepCountMedreps(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n медпреда',
      many: '$n медпредов',
      few: '$n медпреда',
      one: '$n медпред',
    );
    return '$_temp0';
  }

  @override
  String medrepCountPharmacists(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n провизора',
      many: '$n провизоров',
      few: '$n провизора',
      one: '$n провизор',
    );
    return '$_temp0';
  }

  @override
  String medrepCountChains(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n сети',
      many: '$n сетей',
      few: '$n сети',
      one: '$n сеть',
    );
    return '$_temp0';
  }

  @override
  String medrepPharmaciesInPortfolio(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n аптеки в портфеле',
      many: '$n аптек в портфеле',
      few: '$n аптеки в портфеле',
      one: '$n аптека в портфеле',
    );
    return '$_temp0';
  }

  @override
  String get medrepRatingByChecks => 'Рейтинг по чекам';

  @override
  String get medrepRatingAll => 'Весь рейтинг';

  @override
  String medrepPlace(int n) {
    return '$n место';
  }

  @override
  String medrepOutOf(int n) {
    return 'из $n';
  }

  @override
  String medrepGapTo(int place) {
    return 'До $place места — ещё';
  }

  @override
  String get medrepLeader => 'Вы лидер рейтинга';

  @override
  String get medrepMostActive => 'Самые активные';

  @override
  String medrepAllN(int n) {
    return 'Все $n';
  }

  @override
  String get medrepInviteTitle => 'Пригласить провизора';

  @override
  String get medrepInviteText =>
      'Отправьте ссылку — после регистрации провизор попадёт в ваш портфель';

  @override
  String get medrepCopyLink => 'Скопировать ссылку';

  @override
  String get medrepPendingSub => 'Провизоры, которые перешли по ссылке';

  @override
  String get medrepCompaniesSub => 'Аптечные сети в портфеле';

  @override
  String get medrepDoctorsSub => 'Прогресс по квесту на бланки';

  @override
  String get medrepEmptyTitle => 'Портфель пока пуст';

  @override
  String get medrepEmptyText =>
      'Пригласите провизоров по ссылке — их чеки и статистика появятся здесь';

  @override
  String get medrepStep1Title => 'Отправьте ссылку';

  @override
  String get medrepStep1Text => 'В Telegram или по SMS';

  @override
  String get medrepStep2Title => 'Провизор регистрируется';

  @override
  String get medrepStep2Text => 'Он сразу попадает в ваш портфель';

  @override
  String get medrepStep3Title => 'Следите за чеками';

  @override
  String get medrepStep3Text => 'Статистика появится здесь';

  @override
  String get medrepUpdatedNow => 'Обновлено сейчас';

  @override
  String get medrepSearchHint => 'Имя, аптека или город';

  @override
  String get medrepFilterAll => 'Все';

  @override
  String get medrepFilterActive => 'Активные';

  @override
  String get medrepFilterPassive => 'Пассивные';

  @override
  String get medrepFilterFinished => 'Завершённые';

  @override
  String get medrepFilterApproved => 'Одобрены';

  @override
  String get medrepFilterRejected => 'Отклонены';

  @override
  String get medrepClear => 'Очистить';

  @override
  String get medrepNotFoundTitle => 'Никого не нашли';

  @override
  String medrepNotFoundText(String query) {
    return 'По запросу «$query» провизоров нет. Проверьте написание или поищите по названию аптеки';
  }

  @override
  String medrepNotFoundShort(String query) {
    return 'По запросу «$query» ничего нет. Проверьте написание';
  }

  @override
  String get medrepResetSearch => 'Сбросить поиск';

  @override
  String get medrepChecksAllTime => 'Чеков за всё время';

  @override
  String get medrepLastActivity => 'активность';

  @override
  String get medrepAllChecks => 'Все чеки';

  @override
  String medrepCheckNo(int id) {
    return 'Чек №$id';
  }

  @override
  String medrepPacksShort(int n) {
    return '$n уп.';
  }

  @override
  String get medrepPacksUnit => 'уп.';

  @override
  String get medrepLast7Days => 'Последние 7 дней';

  @override
  String medrepMonthYear(String month, String year) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'm1': 'Январь',
      'm2': 'Февраль',
      'm3': 'Март',
      'm4': 'Апрель',
      'm5': 'Май',
      'm6': 'Июнь',
      'm7': 'Июль',
      'm8': 'Август',
      'm9': 'Сентябрь',
      'm10': 'Октябрь',
      'm11': 'Ноябрь',
      'm12': 'Декабрь',
      'other': '',
    });
    return '$_temp0 $year';
  }

  @override
  String get medrepTabChecks => 'Чеки';

  @override
  String get medrepTabPharm => 'Фармацевты';

  @override
  String get medrepTabQuests => 'Квесты';

  @override
  String medrepYouName(String name) {
    return 'Вы · $name';
  }

  @override
  String get medrepYouShort => 'ВЫ';

  @override
  String medrepGapText(int place, String value) {
    return 'До $place места — ещё $value';
  }

  @override
  String get medrepNotRankedTitle => 'Вас пока нет в рейтинге';

  @override
  String get medrepNotRankedText =>
      'Место считается по чекам ваших провизоров. Пригласите первого — и вы появитесь в списке';

  @override
  String get medrepRatingEmpty => 'Рейтинг пока пуст';

  @override
  String get medrepQuestsSub => 'Прогресс ваших провизоров';

  @override
  String get medrepQuestRunning => 'Идёт';

  @override
  String medrepQuestRunningUntil(String date) {
    return 'Идёт · до $date';
  }

  @override
  String get medrepQuestFinished => 'Завершён';

  @override
  String medrepQuestFinishedOn(String date) {
    return 'Завершён $date';
  }

  @override
  String medrepOfN(int a, int b) {
    return '$a из $b';
  }

  @override
  String get medrepParticipating => 'провизоров участвуют';

  @override
  String medrepSoldOf(int n) {
    return 'продано из $n';
  }

  @override
  String medrepOfPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'из $n упаковок',
      many: 'из $n упаковок',
      few: 'из $n упаковок',
      one: 'из $n упаковки',
    );
    return '$_temp0';
  }

  @override
  String medrepGoalPercent(int p) {
    return '$p% цели';
  }

  @override
  String medrepPacksLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'осталось $n упаковки',
      many: 'осталось $n упаковок',
      few: 'осталось $n упаковки',
      one: 'осталось $n упаковка',
    );
    return '$_temp0';
  }

  @override
  String get medrepGoalDone => 'Цель выполнена';

  @override
  String get medrepStatParticipating => 'участвуют';

  @override
  String get medrepStatCompleted => 'выполнили';

  @override
  String get medrepStatIdle => 'не начали';

  @override
  String get medrepPharmacistsSection => 'Провизоры';

  @override
  String medrepDoneOf(int a, int b) {
    return 'Выполнил · $a из $b';
  }

  @override
  String medrepMoreRows(int n, int packs) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ещё $n провизора · $packs уп.',
      many: 'Ещё $n провизоров · $packs уп.',
      few: 'Ещё $n провизора · $packs уп.',
      one: 'Ещё $n провизор · $packs уп.',
    );
    return '$_temp0';
  }

  @override
  String get medrepShow => 'Показать';

  @override
  String get medrepHide => 'Свернуть';

  @override
  String get medrepPendingText =>
      'Перешли по вашей ссылке и ждут, когда вы добавите их в портфель';

  @override
  String medrepFollowedLink(String ago) {
    return 'Перешёл по ссылке · $ago';
  }

  @override
  String get medrepAgoNow => 'только что';

  @override
  String medrepAgoMinutes(int n) {
    return '$n мин назад';
  }

  @override
  String medrepAgoHours(int n) {
    return '$n ч назад';
  }

  @override
  String get medrepAgoYesterday => 'вчера';

  @override
  String medrepAgoDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n дня назад',
      many: '$n дней назад',
      few: '$n дня назад',
      one: '$n день назад',
    );
    return '$_temp0';
  }

  @override
  String get medrepChainsTitle => 'Аптечные сети';

  @override
  String get medrepChainSearchHint => 'Название сети';

  @override
  String medrepChainMeta(String city, int a, int p) {
    return '$city · $a апт. · $p пров.';
  }

  @override
  String get medrepChainKind => 'аптечная сеть';

  @override
  String get medrepPharmaciesSection => 'Аптеки';

  @override
  String get medrepMakers => 'Компании-производители';

  @override
  String medrepRewardTitle(String name) {
    return 'Поощрить: $name';
  }

  @override
  String get medrepRewardRating => 'Оценка';

  @override
  String get medrepRewardMessage => 'Сообщение';

  @override
  String get medrepOptional => '· необязательно';

  @override
  String get medrepRewardHint => 'Например: спасибо за отличные продажи!';

  @override
  String get medrepRewardNotice =>
      'Провизор получит уведомление с вашим сообщением';

  @override
  String medrepRewardSend(int n) {
    return 'Отправить оценку $n';
  }

  @override
  String medrepRewardStars(int n) {
    return 'Оценка $n из 5';
  }

  @override
  String authVersion(String version) {
    return 'версия $version';
  }

  @override
  String get authLoading => 'Загрузка';

  @override
  String get authWelcomeTitle => 'Добро пожаловать в PharmIQ';

  @override
  String get authWelcomeSubtitle =>
      'Обучение, квесты и награды для фармацевтов и врачей — в одном приложении';

  @override
  String get authAppLanguage => 'Язык приложения';

  @override
  String get authStart => 'Начать';

  @override
  String get authHaveAccount => 'Уже есть аккаунт?';

  @override
  String authLanguageLabel(String language) {
    return 'Язык: $language';
  }

  @override
  String get authLoginSubtitle => 'Обучение и награды для фармацевтов и врачей';

  @override
  String get authSmsHint => 'Отправим код в SMS';

  @override
  String get authPhoneNotRegistered =>
      'Этот номер не зарегистрирован. Создайте аккаунт — это займёт минуту';

  @override
  String get authOtherNumber => 'Ввести другой номер';

  @override
  String authCodeSentTo(String phone) {
    return 'Отправили на $phone';
  }

  @override
  String get authChange => 'Изменить';

  @override
  String get authCodeGroup => 'Код из 6 цифр';

  @override
  String get authCodeAuto => 'Войдём автоматически, как только введёте код';

  @override
  String authResendIn(String time) {
    return 'Отправить снова через $time';
  }

  @override
  String get authRoleSubtitle =>
      'У вас несколько ролей — выберите, под какой войти';

  @override
  String get authRoleSubDoctor => 'Бланки, квесты, обучение и кошелёк';

  @override
  String get authRoleHint => 'Сменить роль можно в любой момент в профиле';

  @override
  String get authRegWhoTitle => 'Кто вы?';

  @override
  String get authRegWhoSubtitle => 'Покажем квесты и курсы для вашей профессии';

  @override
  String get authRegPharmacistSub => 'Провизор, работник аптеки';

  @override
  String get authRegDoctorSub => 'Специалист здравоохранения';

  @override
  String get authContinue => 'Продолжить';

  @override
  String get authBack => 'Назад';

  @override
  String authChooseField(String label) {
    return 'Выберите $label';
  }

  @override
  String authMultiHint(int n) {
    return 'Можно выбрать несколько · выбрано $n';
  }

  @override
  String get authMultiHintEmpty => 'Можно выбрать несколько';

  @override
  String get authConsent => 'Согласен на обработку персональных данных — ';

  @override
  String get authFillRequired =>
      'Заполните поля со звёздочкой и дайте согласие';

  @override
  String authRegWelcome(String name) {
    return 'Добро пожаловать в PharmIQ, $name!';
  }

  @override
  String get authGoHome => 'На главную';

  @override
  String get authCityTitle => 'Город';

  @override
  String get authCitySearch => 'Найти город';

  @override
  String get authSearch => 'Поиск';

  @override
  String get authNothingFound => 'Ничего не найдено';

  @override
  String get authMapTitle => 'Аптека на карте';

  @override
  String get authMapStubTitle => 'Карта скоро появится';

  @override
  String get authMapStubBody =>
      'Пока впишите название аптеки в поле «Аптека / место работы» — отметить её на карте можно будет в следующем обновлении';

  @override
  String get authUpdateTitle => 'Нужно обновить приложение';

  @override
  String get authUpdateBody =>
      'Эта версия больше не поддерживается. Обновите PharmIQ, чтобы продолжить — баланс и прогресс сохранятся';

  @override
  String get authUpdateButton => 'Обновить приложение';

  @override
  String authUpdateVersions(String current, String required) {
    return 'Ваша версия $current · нужна $required или новее';
  }

  @override
  String authUpdateRequired(String required) {
    return 'Нужна версия $required или новее';
  }

  @override
  String get authPushTitle => 'Не пропускайте начисления';

  @override
  String get authPushBody =>
      'Сообщим, когда чек проверят, IQC придут на баланс или появится новый квест';

  @override
  String get authPushNow => 'сейчас';

  @override
  String get authPushSample1Title => 'Начислено +144 IQC';

  @override
  String get authPushSample1Body => 'Чек №23156 · Цинкорот №50';

  @override
  String get authPushSample2Time => '2 ч назад';

  @override
  String get authPushSample2Title => 'Новый квест';

  @override
  String get authPushSample2Body => 'Доритрицин N10 · ваучер Korzinka';

  @override
  String get authPushEnable => 'Включить уведомления';

  @override
  String get authPushLater => 'Не сейчас';

  @override
  String checksSentCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n чека отправлено',
      many: '$n чеков отправлено',
      few: '$n чека отправлено',
      one: '$n чек отправлен',
    );
    return '$_temp0';
  }

  @override
  String get checksSectionRetake => 'Нужно переснять';

  @override
  String get checksSectionHistory => 'История';

  @override
  String get checksRetake => 'Переснять';

  @override
  String checksRetakeA11y(int id) {
    return 'Переснять чек №$id';
  }

  @override
  String get checksRetakeTipBold => 'Чтобы чек приняли с первого раза:';

  @override
  String get checksRetakeTip =>
      'весь чек в кадре, ровно, без бликов и при хорошем свете.';

  @override
  String checksNumberDate(int id, String date) {
    return '№$id · $date';
  }

  @override
  String checksDatePhotos(String date, int n) {
    return '$date · $n фото';
  }

  @override
  String checksPhotoCount(int n) {
    return '$n фото';
  }

  @override
  String get checksWaitValue => '~24 ч';

  @override
  String get checksWaitCaption => 'обычно';

  @override
  String checksShowAll(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Показать все $n чека',
      many: 'Показать все $n чеков',
      few: 'Показать все $n чека',
      one: 'Показать все $n чек',
    );
    return '$_temp0';
  }

  @override
  String get checksSendCheck => 'Отправить чек';

  @override
  String checksMonth(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Январь',
      'm2': 'Февраль',
      'm3': 'Март',
      'm4': 'Апрель',
      'm5': 'Май',
      'm6': 'Июнь',
      'm7': 'Июль',
      'm8': 'Август',
      'm9': 'Сентябрь',
      'm10': 'Октябрь',
      'm11': 'Ноябрь',
      'm12': 'Декабрь',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get checksUploadingRow => 'Отправляем чек…';

  @override
  String get checksUploadQueued => 'Ждёт отправки';

  @override
  String get checksUploadAuto => 'Отправим автоматически, когда появится связь';

  @override
  String get checksEmptyTitle => 'Здесь появятся ваши чеки';

  @override
  String get checksEmptyText =>
      'Сфотографируйте чек из аптеки — ИИ распознает препараты, и вы получите IQC';

  @override
  String get checksHowToTitle => 'Как сфотографировать';

  @override
  String get checksHow1Title => 'Весь чек в кадре';

  @override
  String get checksHow1Text => 'Все четыре угла видны';

  @override
  String get checksHow2Title => 'Ровно, без складок';

  @override
  String get checksHow2Text => 'Положите чек на стол';

  @override
  String get checksHow3Title => 'Хороший свет';

  @override
  String get checksHow3Text => 'Без бликов и тени от телефона';

  @override
  String get checksSendFirst => 'Отправить первый чек';

  @override
  String get checksPickSubtitle => 'ИИ распознает препараты по фото';

  @override
  String checksPhotosOf(int n, int max) {
    return 'Фото: $n из $max';
  }

  @override
  String get checksClose => 'Закрыть';

  @override
  String get checksTipWhole => 'Весь чек';

  @override
  String get checksTipFlat => 'Ровно';

  @override
  String get checksTipGlare => 'Без бликов';

  @override
  String get checksTakePhotoCta => 'Сфотографировать чек';

  @override
  String get checksPickGallery => 'Выбрать из галереи';

  @override
  String get checksRemovePhoto => 'Удалить фото';

  @override
  String get checksAddMore => 'Ещё фото';

  @override
  String get checksAddMoreA11y => 'Добавить ещё фото';

  @override
  String get checksPhotoWaiting => 'Ждёт';

  @override
  String get checksPhotosHint =>
      'Проверьте: номер чека, дата и препараты хорошо видны';

  @override
  String get checksSending => 'Отправляем…';

  @override
  String get checksSentTitle => 'Чек отправлен';

  @override
  String get checksSentText =>
      'Проверка обычно занимает до 24 часов. Сообщим, когда начислим IQC';

  @override
  String get checksDone => 'Готово';

  @override
  String get checksSendAnother => 'Отправить ещё чек';

  @override
  String get checksSendFailed =>
      'Не удалось сохранить фото. Попробуйте ещё раз';

  @override
  String get checksCamTitle => 'Разрешите доступ к камере';

  @override
  String get checksCamText =>
      'Камера нужна, чтобы фотографировать чеки и бланки';

  @override
  String get checksCamPoint1 => 'Снимаем только когда вы нажмёте кнопку';

  @override
  String get checksCamPoint2 => 'Не смотрим и не сохраняем другие фото';

  @override
  String get checksCamPoint3 => 'Доступ можно отключить в настройках телефона';

  @override
  String get checksCamAllow => 'Разрешить доступ';

  @override
  String get checksCamLater => 'Не сейчас';

  @override
  String get checksCamDeniedTitle => 'Нет доступа к камере';

  @override
  String get checksCamDeniedText =>
      'Без камеры не получится сфотографировать чек. Включите доступ в настройках телефона — это займёт 10 секунд';

  @override
  String get checksCamDeniedStep1 => 'Откройте «Настройки» → PharmIQ';

  @override
  String get checksCamDeniedStep2 => 'Включите переключатель «Камера»';

  @override
  String get checksCamDeniedStep3 => 'Вернитесь в приложение';

  @override
  String get checksCamOpenSettings => 'Открыть настройки';

  @override
  String get checksCamPickGallery => 'Выбрать фото из галереи';

  @override
  String get checksCamSettingsManual =>
      'Откройте настройки телефона → Приложения → PharmIQ → Разрешения';

  @override
  String get checksHeroPendingTitle => 'Чек на проверке';

  @override
  String get checksHeroPendingText =>
      'Специалист проверяет чек. Обычно это занимает до 24 часов';

  @override
  String get checksHeroApprovedTitle => 'Чек одобрен';

  @override
  String get checksHeroApprovedText =>
      'Всё в порядке. IQC поступят на баланс в ближайшее время';

  @override
  String get checksHeroCreditedTitle => 'IQC начислены';

  @override
  String get checksHeroCreditedText => 'Баллы зачислены на ваш баланс';

  @override
  String get checksHeroRejectedTitle => 'Чек отклонён';

  @override
  String get checksHeroRejectedText =>
      'Сделайте чёткое фото — баллы ещё можно получить';

  @override
  String get checksStepSent => 'Отправлен';

  @override
  String get checksStepReview => 'Проверка';

  @override
  String get checksStepApproved => 'Одобрен';

  @override
  String get checksStepCredited => 'Начислено';

  @override
  String get checksPhotosTitle => 'Фото чека';

  @override
  String checksOpenPhoto(int n) {
    return 'Открыть фото $n';
  }

  @override
  String get checksAiPending => 'Список препаратов появится после проверки';

  @override
  String get checksAccrualTitle => 'Начисление';

  @override
  String get checksAccrualPendingTitle => 'Начислим после одобрения';

  @override
  String get checksAccrualPendingText => 'После одобрения чека';

  @override
  String get checksAccrualApprovedTitle => 'Ожидает начисления';

  @override
  String get checksAccrualSoon => 'Скоро';

  @override
  String get checksAccrualCreditedTitle => 'Зачислено на баланс';

  @override
  String get checksQuestDone => 'Квест выполнен ✓';

  @override
  String get checksSupport => 'Вопрос по чеку? Напишите нам';

  @override
  String get checksRetakeCheck => 'Переснять чек';

  @override
  String checksViewerPhotoOf(int i, int n) {
    return 'Фото $i из $n';
  }

  @override
  String get checksViewerSave => 'Сохранить фото';

  @override
  String get checksViewerZoomHint => 'Разведите пальцами, чтобы приблизить';

  @override
  String get profileSectionContact => 'Связь';

  @override
  String get profilePersonalDataRow => 'Личные данные';

  @override
  String get profileTgNotLinked => 'Не привязан';

  @override
  String get profileTgLink => 'Привязать';

  @override
  String get profileTgLinkedToast => 'Telegram привязан';

  @override
  String get profileTgNotYet =>
      'Telegram пока не привязан — завершите привязку в боте';

  @override
  String get profileAppearanceTitle => 'Оформление';

  @override
  String get profileNotifOn => 'Включены';

  @override
  String get profileNotifOff => 'Выключены';

  @override
  String get profileDeleteAccount => 'Удалить аккаунт';

  @override
  String profileVersion(String version) {
    return 'PharmIQ · версия $version';
  }

  @override
  String get profileEditAria => 'Редактировать профиль';

  @override
  String get profileNewUser => 'Новый пользователь';

  @override
  String get profilePharmacy => 'Аптека';

  @override
  String get profileClinic => 'Клиника';

  @override
  String get profileCompany => 'Компания';

  @override
  String get profileNoPharmacy => 'Аптека не указана';

  @override
  String get profileNoClinic => 'Клиника не указана';

  @override
  String get profileNoCompany => 'Компания не указана';

  @override
  String get profileNotSpecified => 'Не указана';

  @override
  String get profileNameNotSet => 'Имя не указано';

  @override
  String get profileActivateTitle => 'Активируйте профиль';

  @override
  String profileActivateProgress(int done, int total) {
    return '$done из $total';
  }

  @override
  String get profileActivateBody =>
      'После активации откроются квесты и начисление IQC';

  @override
  String get profileStepPhone => 'Телефон подтверждён';

  @override
  String get profileStepPharmacy => 'Укажите аптеку';

  @override
  String get profileStepClinic => 'Укажите клинику';

  @override
  String get profileStepProfile => 'Заполните профиль';

  @override
  String get profileStepWorkHint => 'Нужна для квестов вашего региона';

  @override
  String get profileStepProfileHint => 'Имя и место работы';

  @override
  String get profileStepSpecify => 'Указать';

  @override
  String get profileStepTelegram => 'Привяжите Telegram';

  @override
  String get profileStepTelegramHint => 'Будем присылать уведомления';

  @override
  String get profileStepAdmin => 'Активация администратором';

  @override
  String get profileStepAdminHint => 'Обычно в течение дня после заполнения';

  @override
  String get profileActivateHelp => 'Вопросы по активации? Напишите нам';

  @override
  String get profileRoleSheetTitle => 'Сменить роль';

  @override
  String get profileRoleSheetSubtitle =>
      'Роли, подтверждённые для вашего аккаунта';

  @override
  String get profileRoleCurrent => 'Текущая';

  @override
  String get profileRoleDescPharmacist => 'Чеки, квесты, обучение и кошелёк';

  @override
  String get profileRoleDescDoctor => 'Бланки, квесты, обучение и кошелёк';

  @override
  String get profileRoleDescMedrep => 'Портфель провизоров и рейтинг';

  @override
  String get profileRoleDescBrand => 'Квесты бренда, продукты и продажи';

  @override
  String get profileRoleNote =>
      'Приложение откроется с разделами для выбранной роли. Баланс IQC и ваучеры сохранятся';

  @override
  String profileRoleSwitch(String role) {
    return 'Переключиться на «$role»';
  }

  @override
  String get profileClose => 'Закрыть';

  @override
  String get profileFieldName => 'ФИО';

  @override
  String get profilePhoneLockedHint =>
      'Номер нужен для входа — меняется с подтверждением по SMS';

  @override
  String get profileFieldCity => 'Город';

  @override
  String get profileCityHint => 'Выберите город';

  @override
  String get profileWorkplaceHint => 'Название или номер';

  @override
  String get profileMapButton => 'Уточнить аптеку на карте';

  @override
  String get profileMapSoon => 'Выбор аптеки на карте скоро появится';

  @override
  String get profileSave => 'Сохранить изменения';

  @override
  String get profileFieldRequired => 'Заполните это поле';

  @override
  String get profileEditSent => 'Заявка отправлена в поддержку';

  @override
  String get profileEditSentHint => 'Обновим данные после проверки';

  @override
  String get profileEditRequest => 'Прошу обновить данные профиля:';

  @override
  String get profileEditNoChanges => 'Изменений нет';

  @override
  String get profilePrivacyShort => 'Конфиденциальность';

  @override
  String get profilePrivacyHeadline => 'Как мы обращаемся с вашими данными';

  @override
  String get profilePrivacyCollectTitle => 'Какие данные мы собираем';

  @override
  String get profilePrivacyCollectBody =>
      'Имя, номер телефона, город и аптеку или клинику. Фото чеков и бланков, которые вы отправляете. Результаты курсов и тестов.';

  @override
  String get profilePrivacyWhyTitle => 'Зачем они нужны';

  @override
  String get profilePrivacyWhyBody =>
      'Чтобы начислять IQC за чеки и бланки, засчитывать квесты, выдавать ваучеры и показывать вашу статистику.';

  @override
  String get profilePrivacyWhoTitle => 'Кто их видит';

  @override
  String get profilePrivacyWhoBody =>
      'Ваш медпредставитель видит число ваших чеков и квестов. Данные пациентов из бланков скрыты — видны только инициалы.';

  @override
  String get profilePrivacyStoreTitle => 'Как мы их храним';

  @override
  String get profilePrivacyStoreBody =>
      'Данные передаются по защищённому соединению и хранятся на серверах компании.';

  @override
  String get profilePrivacyDeleteTitle => 'Как удалить данные';

  @override
  String get profilePrivacyDeleteBody =>
      'В профиле → «Удалить аккаунт». Данные удаляются вместе с балансом и ваучерами.';

  @override
  String get profilePrivacyFullLink => 'Полный текст политики';

  @override
  String get profilePrivacyContents => 'Содержание';

  @override
  String profilePrivacyReadTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n минуты чтения',
      many: '$n минут чтения',
      few: '$n минуты чтения',
      one: '$n минута чтения',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyRuOnly =>
      'Документ доступен только на русском языке';

  @override
  String get profileDeleteLose => 'Это действие нельзя отменить. Вы потеряете:';

  @override
  String profileDeleteLoseIqc(String amount) {
    return '$amount IQC на балансе';
  }

  @override
  String get profileDeleteLoseIqcHint => 'сгорят без возможности обмена';

  @override
  String profileDeleteLoseVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n активного ваучера',
      many: '$n активных ваучеров',
      few: '$n активных ваучера',
      one: '$n активный ваучер',
    );
    return '$_temp0';
  }

  @override
  String get profileDeleteLoseVouchersHint => 'перестанут работать';

  @override
  String get profileDeleteLoseProgress => 'Прогресс в квестах и курсах';

  @override
  String get profileDeleteLoseProgressHint => 'будет удалён';

  @override
  String get profileDeleteTypePrompt => 'Чтобы подтвердить, введите';

  @override
  String get profileDeleteWord => 'УДАЛИТЬ';

  @override
  String get profileDeleteForever => 'Удалить навсегда';

  @override
  String get profileDeleteKeep => 'Оставить аккаунт';

  @override
  String get profileDeleting => 'Удаляем…';

  @override
  String get profileDeleteFailed =>
      'Не удалось удалить аккаунт. Попробуйте ещё раз';

  @override
  String get profileDeletedTitle => 'Аккаунт удалён';

  @override
  String get profileDeletedBody =>
      'Мы удалили ваш профиль, баланс IQC, ваучеры и историю. Спасибо, что были с нами';

  @override
  String get profileDeletedCardTitle => 'Передумали?';

  @override
  String get profileDeletedCardBody =>
      'Можно зарегистрироваться заново с тем же номером — но прежний баланс не вернуть';

  @override
  String get profileDeletedNew => 'Создать новый аккаунт';

  @override
  String get profileErrorGeneric => 'Что-то пошло не так. Попробуйте ещё раз';

  @override
  String notifNewCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n новых',
      many: '$n новых',
      few: '$n новых',
      one: '$n новое',
    );
    return '$_temp0';
  }

  @override
  String get notifAllRead => 'Всё прочитано';

  @override
  String get notifReadAll => 'Прочитать все';

  @override
  String get notifFilterAll => 'Все';

  @override
  String get notifFilterChecks => 'Чеки';

  @override
  String get notifFilterRecipes => 'Бланки';

  @override
  String get notifFilterQuests => 'Квесты';

  @override
  String get notifFilterLearning => 'Обучение';

  @override
  String get notifCategoryEmpty => 'В этой категории пока ничего нет';

  @override
  String get notifNewAria => 'Новое';

  @override
  String get notifMarkedRead => 'Прочитано';

  @override
  String get notifEmptySubtitle => 'Пока ничего нового';

  @override
  String get notifEmptyQuietTitle => 'Здесь пока тихо';

  @override
  String get notifEmptyQuietText =>
      'Сообщим, когда проверим чек, начислим IQC или выдадим ваучер';

  @override
  String get notifConfigure => 'Настроить уведомления';

  @override
  String get notifSettingsSubtitle => 'Что присылать на телефон';

  @override
  String get notifSettingsChecksHint => 'Одобрение, отказ, начисление IQC';

  @override
  String get notifSettingsQuestsHint => 'Новые квесты, выполнение, ваучеры';

  @override
  String get notifSettingsLearningHint => 'Новые курсы и напоминания';

  @override
  String get notifSettingsMarketingHint => 'Новости рынка и спецпредложения';

  @override
  String get notifSettingsFootnote =>
      'Важные сообщения об аккаунте и безопасности приходят всегда';

  @override
  String get notifSaveFailed => 'Не удалось сохранить настройки';

  @override
  String get supportHeaderTitle => 'Поддержка PharmIQ';

  @override
  String get supportHeaderSubtitle => 'Обычно отвечаем в течение часа';

  @override
  String get supportBackAria => 'Назад в профиль';

  @override
  String get supportToday => 'Сегодня';

  @override
  String get supportYesterday => 'Вчера';

  @override
  String get supportGreeting => 'Здравствуйте! Чем можем помочь?';

  @override
  String get supportFaqTitle => 'Частые вопросы';

  @override
  String get supportFaq1 => 'Не начислили IQC за чек';

  @override
  String get supportFaq2 => 'Чек отклонён — почему?';

  @override
  String get supportFaq3 => 'Как получить ваучер';

  @override
  String get supportFaq4 => 'Проблема с курсом или тестом';

  @override
  String get supportMessageHint => 'Сообщение';

  @override
  String get supportAttachAria => 'Прикрепить фото или чек';

  @override
  String get supportSendAria => 'Отправить';

  @override
  String get supportTypingAria => 'Поддержка печатает';

  @override
  String get supportAttachCheckTitle => 'Прикрепить чек';

  @override
  String get supportAttachRecipeTitle => 'Прикрепить бланк';

  @override
  String get supportAttachEmpty => 'Пока нечего прикрепить';

  @override
  String get supportAttachRemove => 'Убрать вложение';

  @override
  String get supportAttachUnavailable =>
      'Вложения доступны для чеков и бланков';

  @override
  String get supportSendFailed => 'Не удалось отправить сообщение';

  @override
  String get walletFaceValue => 'Номинал';

  @override
  String get profileBack => 'Назад';

  @override
  String homeNewCourseVideo(int n) {
    return 'Видео ~$n мин';
  }

  @override
  String get homeNewCourseQuiz => 'тест';

  @override
  String get authHintFullName => 'Фамилия Имя Отчество';

  @override
  String get authHintPharmacy => 'Например, Аптека №12';

  @override
  String get authHintClinic => 'Название медицинского учреждения';

  @override
  String get authMapCardTitle => 'Отметить аптеку на карте';

  @override
  String get authMapCardSub => 'Нужно для квестов вашего района';

  @override
  String get authMapCardButton => 'Отметить';

  @override
  String get rxStateCreditedTitle => 'IQC начислены';

  @override
  String get rxStateCreditedText => 'Баллы зачислены на ваш баланс';

  @override
  String get rxAccrualCreditedTitle => 'Зачислено на баланс';

  @override
  String get rxCreditedCaption => 'начислено';

  @override
  String rxListCountEarned(String count, int n) {
    return '$count · получено $n IQC';
  }

  @override
  String get questsRewardPoints => 'Баллы на баланс';

  @override
  String get walletMonthsIn =>
      'январе,феврале,марте,апреле,мае,июне,июле,августе,сентябре,октябре,ноябре,декабре';

  @override
  String walletEarnedIn(String month) {
    return 'Начислено в $month';
  }

  @override
  String walletSpentIn(String month) {
    return 'Потрачено в $month';
  }

  @override
  String get profileRoleShortMedrep => 'Медпред';

  @override
  String get notifActionQr => 'Показать QR';

  @override
  String get notifActionRetake => 'Переснять';

  @override
  String homeNewCourseQuizQuestions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'тест $n вопроса',
      many: 'тест $n вопросов',
      few: 'тест $n вопроса',
      one: 'тест $n вопрос',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyDraft =>
      'Черновик. Окончательный текст утвердит юрист';

  @override
  String get notifSettingsChecksOnly => 'Статусы чеков';

  @override
  String get notifSettingsRecipesOnly => 'Статусы бланков';

  @override
  String get tourWelcomeTitle => 'Добро пожаловать в PharmIQ Academy!';

  @override
  String get tourWelcomeText =>
      'Покажем, где что находится и как зарабатывать IQC. Это займёт меньше минуты.';

  @override
  String get tourWelcomeTextDoc =>
      'Покажем, где что находится и как получать IQC за бланки. Это займёт меньше минуты.';

  @override
  String get tourStart => 'Начать';

  @override
  String get tourSkipAll => 'Пропустить обучение';

  @override
  String tourStepOf(int n, int total) {
    return 'Шаг $n из $total';
  }

  @override
  String get tourSkip => 'Пропустить';

  @override
  String get tourNext => 'Далее';

  @override
  String get tourDoneStep => 'Готово';

  @override
  String get tourBack => 'Назад';

  @override
  String get tourBalanceTitle => 'Баланс IQC';

  @override
  String get tourBalanceText =>
      'Здесь ваши IQC — баллы за одобренные чеки, квесты и опросы. Кнопка «Кошелёк» откроет историю и обмен на ваучеры.';

  @override
  String get tourBalanceTextDoc =>
      'Здесь ваши IQC — баллы за одобренные бланки, квесты и опросы. Кнопка «Кошелёк» откроет историю и обмен на ваучеры.';

  @override
  String get tourSendTitle => 'Отправьте чек';

  @override
  String get tourSendText =>
      'Сфотографируйте чек — ИИ распознает препараты. После проверки на баланс придут IQC.';

  @override
  String get tourSendTitleDoc => 'Отправьте бланк';

  @override
  String get tourSendTextDoc =>
      'Сфотографируйте бланк — ИИ распознает препараты. После проверки на баланс придут IQC.';

  @override
  String get tourQuestsTitle => 'Активные квесты';

  @override
  String get tourQuestsText =>
      'Задания от производителей: продайте нужное количество упаковок и получите награду. Прогресс виден на карточке.';

  @override
  String get tourQuestsTextDoc =>
      'Задания от производителей: выпишите нужное количество бланков и получите награду. Прогресс виден на карточке.';

  @override
  String get tourChecksTitle => 'Ваши чеки';

  @override
  String get tourChecksText =>
      'Все отправленные чеки и их статусы: на проверке, одобрен, начислено или нужно переснять.';

  @override
  String get tourChecksTitleDoc => 'Ваши бланки';

  @override
  String get tourChecksTextDoc =>
      'Все отправленные бланки и их статусы: на проверке, одобрен, начислено или нужно переснять.';

  @override
  String get tourLearnTitle => 'Обучение';

  @override
  String get tourLearnText =>
      'Курсы и тесты от экспертов фармрынка. За пройденные курсы начисляются баллы.';

  @override
  String get tourProfileTitle => 'Профиль';

  @override
  String get tourProfileText =>
      'Личные данные, аптека, тема и язык. Здесь же можно пройти это обучение заново.';

  @override
  String get tourProfileTextDoc =>
      'Личные данные, место работы, тема и язык. Здесь же можно пройти это обучение заново.';

  @override
  String get tourDoneTitle => 'Всё готово!';

  @override
  String get tourDoneText =>
      'Отправьте первый чек или начните курс, чтобы получить первые IQC.';

  @override
  String get tourDoneTextDoc =>
      'Отправьте первый бланк или начните курс, чтобы получить первые IQC.';

  @override
  String get tourDoneNote => 'Повторить обучение можно в Профиле.';

  @override
  String get tourFinish => 'Начать работу';

  @override
  String get profileTourAgain => 'Пройти обучение заново';

  @override
  String get walletConfirmTextPlain => 'Получите подарочную карту Korzinka';

  @override
  String walletArchiveCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучера',
      many: '$n ваучеров',
      few: '$n ваучера',
      one: '$n ваучер',
    );
    return '$_temp0';
  }
}

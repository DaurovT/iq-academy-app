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
  String get navRecipes => 'Рецепты';

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
  String get miniAppsSubtitle => 'Играй и выигрывай призы за IQC';

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
      'Занимай клетки за IQC — в час вскрытия узнаешь, что под ними';

  @override
  String get sapperNoDraws => 'Нет розыгрышей';

  @override
  String get sapperRevealed => 'Вскрыт';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 $prizeCount призов  💎 $priceIqc IQC/клетка  ';
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
  String get sapperGoToGame => 'Перейти к игре';

  @override
  String sapperReserveTitle(Object number) {
    return 'Занять клетку №$number?';
  }

  @override
  String sapperReserveBody(Object price) {
    return 'Спишется $price IQC. Отменить нельзя — клетка закрепится за вами до вскрытия.';
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
  String get sapperDraws => 'Розыгрыши';

  @override
  String get sapperAcceptClosed =>
      'Приём клеток закрыт — идёт подготовка к вскрытию';

  @override
  String get sapperHiddenTitle => 'НА ПОЛЕ СПРЯТАНО';

  @override
  String sapperRevealIn(Object time) {
    return 'вскрытие через $time';
  }

  @override
  String get sapperNoPrizes => 'призы не заявлены';

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
    return 'цена клетки $price IQC';
  }

  @override
  String get sapperYourBalance => 'Ваш баланс';

  @override
  String get sapperCellPriceLabel => 'цена клетки';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Вы выиграли $count $word!';
  }

  @override
  String get sapperNoWin => 'В этот раз без выигрыша';

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
  String get sapperLegendEmpty => 'Пустые';

  @override
  String get sapperLegendVoucher => 'Ваучер';

  @override
  String get sapperLegendSelected => 'Выбрано';

  @override
  String get sapperLegendOccupied => 'Занято';

  @override
  String get sapperLegendFree => 'Свободно';

  @override
  String get sapperWinners => 'Победители';

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
  String get profileSupportSubtitle => 'Мы всегда на связи';

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
  String get profileLogoutAction => 'Выйти';

  @override
  String get profileDeleteConfirmTitle => 'Удалить аккаунт?';

  @override
  String get profileDeleteConfirmBody =>
      'Действие необратимо. Все данные будут удалены.';

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
  String get notifSettingsChecks => 'Статусы чеков и рецептов';

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
  String get docHomeSubtitle =>
      'Отправляйте рецепты и получайте вознаграждение';

  @override
  String get docHomeWalletBalance => 'БАЛАНС КОШЕЛЬКА';

  @override
  String get docHomeWallet => 'Кошелёк';

  @override
  String get docHomeSendRecipe => 'Отправить рецепт';

  @override
  String get docHomeSendRecipeHint =>
      'Сфотографируйте рецепт — ИИ распознает препараты';

  @override
  String get docHomeStatRecipes => 'всего рецептов';

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
  String get recipeDetailMyRecipes => 'Мои рецепты';

  @override
  String recipeDetailTitle(Object id) {
    return 'Рецепт №$id';
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
  String get recipesTitle => 'Мои рецепты';

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
  String get recipesEmpty => 'Рецептов пока нет';

  @override
  String get recipesTakePhoto => 'Сделать фото';

  @override
  String get recipesFromGallery => 'Выбрать из галереи';

  @override
  String get recipesUploading => 'Рецепт добавлен — загружается';

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
  String get recipesSubmitButton => 'Отправить рецепт';

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
  String get walletRedeemTitle => 'Обменять баллы?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 за $p2 IQC';
  }

  @override
  String get walletCancel => 'Отмена';

  @override
  String get walletRedeem => 'Обменять';

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
    return 'Korzinka · $amount сум';
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
}

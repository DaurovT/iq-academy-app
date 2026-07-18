// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tajik (`tg`).
class AppLocalizationsTg extends AppLocalizations {
  AppLocalizationsTg([String locale = 'tg']) : super(locale);

  @override
  String get appTitle => 'IQ Academy';

  @override
  String get apiNetworkError => 'Хатои шабака';

  @override
  String get apiNoAccess => 'Дастрасӣ нест';

  @override
  String get checkModelStatusPending => 'Дар баррасӣ';

  @override
  String get checkModelStatusAiDetected => 'AI шинохт';

  @override
  String get checkModelStatusAiWrong => 'AI нашинохт';

  @override
  String get checkModelStatusApproved => 'Тасдиқ шуд';

  @override
  String get checkModelStatusRejected => 'Рад шуд';

  @override
  String get commonRolePharmacist => 'Фармасевт';

  @override
  String get commonRoleDoctor => 'Духтур';

  @override
  String get commonRoleMedrep => 'Намояндаи тиббӣ';

  @override
  String get commonRoleProductOwner => 'Бренд / Соҳиби маҳсулот';

  @override
  String get commonCancel => 'Бекор кардан';

  @override
  String get navHome => 'Асосӣ';

  @override
  String get navChecks => 'Чекҳо';

  @override
  String get navQuests => 'Квестҳо';

  @override
  String get navLearn => 'Таълим';

  @override
  String get navWallet => 'Ҳамён';

  @override
  String get navRecipes => 'Дорунома';

  @override
  String get navPortfolio => 'Портфел';

  @override
  String get navPharm => 'Фарм.';

  @override
  String get navTop => 'Топ';

  @override
  String get navDashboard => 'Дашборд';

  @override
  String get navProducts => 'Маҳсулот';

  @override
  String get navBrands => 'Брендҳо';

  @override
  String get navProfile => 'Профил';

  @override
  String get miniAppsTitle => 'Мини-барномаҳо';

  @override
  String get miniAppsSubtitle => 'Бозӣ кунед ва бо IQC тӯҳфаҳо баред';

  @override
  String get miniAppsSoon => 'Ба зудӣ';

  @override
  String get sapperCountdownSoon => 'ба зудӣ';

  @override
  String sapperCountdownDaysHours(Object days, Object hours) {
    return '$daysр $hoursс';
  }

  @override
  String sapperCountdownHoursMinutes(Object hours, Object minutes) {
    return '$hoursс $minutesд';
  }

  @override
  String sapperCountdownMinutesSeconds(Object minutes, Object seconds) {
    return '$minutesд $secondsс';
  }

  @override
  String get sapperTitle => 'Супер Сапёр';

  @override
  String get sapperSubtitle =>
      'Бо IQC катакҳоро гиред — дар соати кушодан мефаҳмед, ки зери онҳо чист';

  @override
  String get sapperNoDraws => 'Бозиҳо нестанд';

  @override
  String get sapperRevealed => 'Кушода шуд';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 $prizeCount тӯҳфа  💎 $priceIqc IQC/катак  ';
  }

  @override
  String sapperMyCells(Object count) {
    return 'катакҳои шумо: $count';
  }

  @override
  String sapperOccupancy(Object occupied, Object total, Object percent) {
    return 'банд $occupied аз $total ($percent%)';
  }

  @override
  String get sapperGoToGame => 'Гузаштан ба бозӣ';

  @override
  String sapperReserveTitle(Object number) {
    return 'Катаки №$number-ро мегиред?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC гирифта мешавад. Бекор кардан мумкин нест — катак то кушодан аз они шумо мешавад.';
  }

  @override
  String sapperReserveConfirm(Object price) {
    return 'Гирифтан бо $price IQC';
  }

  @override
  String sapperCellReserved(Object number) {
    return 'Катаки №$number гирифта шуд';
  }

  @override
  String get sapperDraws => 'Бозиҳои тӯҳфаӣ';

  @override
  String get sapperAcceptClosed =>
      'Қабули катакҳо пӯшида шуд — омодагӣ ба кушодан рафта истодааст';

  @override
  String get sapperHiddenTitle => 'ДАР МАЙДОН ПИНҲОН АСТ';

  @override
  String sapperRevealIn(Object time) {
    return 'кушодан баъд аз $time';
  }

  @override
  String get sapperNoPrizes => 'тӯҳфаҳо эълон нашудаанд';

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
    return 'нархи катак $price IQC';
  }

  @override
  String get sapperYourBalance => 'Баланси шумо';

  @override
  String get sapperCellPriceLabel => 'нархи катак';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Шумо $count $word бурдед!';
  }

  @override
  String get sapperNoWin => 'Ин дафъа бе бурд';

  @override
  String get sapperPrizeOne => 'тӯҳфа';

  @override
  String get sapperPrizeFew => 'тӯҳфа';

  @override
  String get sapperPrizeMany => 'тӯҳфа';

  @override
  String get sapperLegendMine => 'Аз они ман';

  @override
  String get sapperLegendTheirs => 'Аз они дигарон';

  @override
  String get sapperLegendEmpty => 'Холӣ';

  @override
  String get sapperLegendVoucher => 'Ваучер';

  @override
  String get sapperLegendSelected => 'Интихобшуда';

  @override
  String get sapperLegendOccupied => 'Банд';

  @override
  String get sapperLegendFree => 'Озод';

  @override
  String get sapperWinners => 'Ғолибон';

  @override
  String get newsTitle => 'Хабарҳо';

  @override
  String get newsAll => 'Ҳамаи хабарҳо';

  @override
  String get newsMore => 'Муфассал →';

  @override
  String get newsDateMonths =>
      'янв,фев,мар,апр,май,июн,июл,авг,сен,окт,ноя,дек';

  @override
  String get newsEmpty => 'Ҳоло хабарҳо нестанд';

  @override
  String get newsPinned => 'МУҲИМ';

  @override
  String get newsDetailTitle => 'Хабар';

  @override
  String surveyRewardCredited(Object amount) {
    return '+$amount IQC ба ҳисоб гузашт';
  }

  @override
  String get surveyThanks => 'Барои ҷавобатон ташаккур!';

  @override
  String surveySubmitError(Object error) {
    return 'Фиристодан нашуд: $error';
  }

  @override
  String get surveyTitle => 'Пурсиш';

  @override
  String surveyRewardBadge(Object amount) {
    return '+ $amount IQC';
  }

  @override
  String get surveyChooseOption => 'Варианти ҷавобро интихоб кунед';

  @override
  String get surveyEnterAnswer => 'Ҷавобро дастӣ ворид кунед';

  @override
  String get surveySubmit => 'Ҷавоб додан';

  @override
  String get loginTagline => 'Омӯз.\nТатбиқ кун.\nБирас.';

  @override
  String get loginTitle => 'Воридшавӣ';

  @override
  String get loginByPhone => 'Бо рақами телефон ворид шавед';

  @override
  String loginCodeSent(Object phone) {
    return 'Рамз аз SMS ба $phone';
  }

  @override
  String get loginPhoneLabel => 'Рақами телефон';

  @override
  String get loginPhoneNotFound => 'Рақам дар система ёфт нашуд';

  @override
  String get loginConfirm => 'Тасдиқ кардан';

  @override
  String get loginGoRegister => 'Аз қайд гузаштан';

  @override
  String get loginRegister => 'Қайд шудан';

  @override
  String get loginEnter => 'Ворид шудан';

  @override
  String loginResendIn(Object seconds) {
    return 'Такрор баъд аз $seconds сония';
  }

  @override
  String get loginResendAgain => 'Аз нав фиристодан';

  @override
  String get loginChangeNumber => '‹ Тағйири рақам';

  @override
  String get loginOr => 'ё';

  @override
  String get tgLoginExpired => 'Вақти воридшавӣ гузашт';

  @override
  String tgLoginParseError(Object error) {
    return 'Ҷавоби воридшавӣ коркард нашуд: $error';
  }

  @override
  String get tgWaitingConfirm => 'Интизори тасдиқ…';

  @override
  String get tgLoginButton => 'Воридшавӣ тавассути Telegram';

  @override
  String get notifTitle => 'Огоҳиномаҳо';

  @override
  String notifUnreadOne(Object count) {
    return '$count хонданашуда';
  }

  @override
  String notifUnreadMany(Object count) {
    return '$count хонданашуда';
  }

  @override
  String get notifMarkAllRead => 'Ҳамаро хондашуда қайд кардан';

  @override
  String get notifRead => '✓ Хонда шуд';

  @override
  String get notifMarkRead => 'Хондашуда қайд кардан';

  @override
  String get notifOpen => 'Кушодан';

  @override
  String get notifEmptyTitle => 'Огоҳиномаҳо нестанд';

  @override
  String get notifEmptyBody =>
      'Дар ин ҷо ҳолати чекҳо, мукофоти квестҳо ва хабарҳои таълим пайдо мешаванд.';

  @override
  String get placeholderComingSoon =>
      'Бахш дар марҳилаҳои оянда пайдо мешавад.';

  @override
  String get profileTitle => 'Профил';

  @override
  String get profileSettings => 'Танзимот';

  @override
  String get profileLanguage => 'ЗАБОН';

  @override
  String get profileAppearance => 'НАМУД';

  @override
  String get profileThemeLight => 'Равшан';

  @override
  String get profileThemeDark => 'Торик';

  @override
  String get profileThemeSystem => 'Система';

  @override
  String get profileAccount => 'Ҳисоб';

  @override
  String get profilePersonalData => 'МАЪЛУМОТИ ШАХСӢ';

  @override
  String get profileRole => 'Нақш';

  @override
  String get profileChange => 'Иваз кардан';

  @override
  String get profileLinkedServices => 'ХИЗМАТҲОИ ПАЙВАСТ';

  @override
  String get profilePhone => 'Телефон';

  @override
  String get profileTgConnected => 'Пайваст аст';

  @override
  String get profileTgLinked => 'Баста шуд';

  @override
  String get profileSupport => 'Дастгирӣ';

  @override
  String get profileSupportSubtitle => 'Мо ҳамеша дар алоқаем';

  @override
  String get profileLogout => 'Баромадан аз ҳисоб';

  @override
  String get profileDeleteTitle => 'Нест кардани ҳисоб ва маълумот';

  @override
  String get profileDeleteIrreversible => 'Ин амал бебозгашт аст';

  @override
  String get profileDelete => 'Нест кардан';

  @override
  String get profileLanguageUpdated => 'Забон нав шуд';

  @override
  String get profileNewPhoneTitle => 'Рақами нав';

  @override
  String get profileCancel => 'Бекор кардан';

  @override
  String get profileNext => 'Идома';

  @override
  String get profileSmsCodeTitle => 'Рамз аз SMS';

  @override
  String get profileCodeLabel => 'Рамз';

  @override
  String get profileConfirm => 'Тасдиқ кардан';

  @override
  String get profilePhoneChanged => 'Телефон иваз шуд';

  @override
  String get profileLogoutConfirmTitle => 'Аз ҳисоб мебароед?';

  @override
  String get profileLogoutAction => 'Баромадан';

  @override
  String get profileDeleteConfirmTitle => 'Ҳисоб нест карда шавад?';

  @override
  String get profileDeleteConfirmBody =>
      'Ин амал бебозгашт аст. Ҳамаи маълумот нест мешавад.';

  @override
  String get profileStatQuests => 'КВЕСТҲО';

  @override
  String get profileStatLevel => 'САТҲ';

  @override
  String get questHistoryTitle => 'Таърихи иштирок';

  @override
  String get questHistoryEmpty => 'Таърих холӣ аст';

  @override
  String get questHistoryVoucher => 'Ваучер';

  @override
  String get questHistoryActive => 'Фаъол';

  @override
  String get questHistoryDone => 'Иҷро шуд';

  @override
  String get registerStep1Of2 => 'ҚАДАМИ 1 АЗ 2';

  @override
  String registerStep2Of2(Object role) {
    return 'ҚАДАМИ 2 АЗ 2 · $role';
  }

  @override
  String get registerTitle => 'Қайдкунӣ';

  @override
  String get registerChooseRole => 'Барои воридшавӣ нақшро интихоб кунед';

  @override
  String get registerBack => '‹ Бозгашт';

  @override
  String registerConfirmField(Object label) {
    return 'Тасдиқ кунед: $label';
  }

  @override
  String registerFillField(Object label) {
    return 'Пур кунед: $label';
  }

  @override
  String get registerFinish => 'Анҷоми қайдкунӣ';

  @override
  String get registerSuccessTitle => 'Қайдкунӣ анҷом ёфт!';

  @override
  String registerWelcome(Object name) {
    return 'Хуш омадед ба PharmIQ ACADEMY, $name!';
  }

  @override
  String get registerStartLearning => 'Оғози таълим';

  @override
  String get registerGoHome => 'Гузаштан ба саҳифаи асосӣ';

  @override
  String registerEnterField(Object label) {
    return '$label-ро ворид кунед';
  }

  @override
  String get registerRequiredField => 'Майдони ҳатмӣ';

  @override
  String get registerSelectPlaceholder => '— интихоб кунед —';

  @override
  String registerMultiSelectHintRequired(Object label) {
    return '$label * · Якчандторо интихоб кардан мумкин';
  }

  @override
  String registerMultiSelectHint(Object label) {
    return '$label · Якчандторо интихоб кардан мумкин';
  }

  @override
  String get registerConsentText =>
      'Ман ба коркарди маълумоти шахсӣ розӣ ҳастам ';

  @override
  String get registerConsentMore => 'муфассал';

  @override
  String get roleSelectTagline => 'Омӯз.\nТатбиқ кун.\nБирас.';

  @override
  String get roleSelectGreeting => 'Ассалому алайкум';

  @override
  String roleSelectGreetingName(Object name) {
    return 'Ассалому алайкум, $name';
  }

  @override
  String get roleSelectChooseRole => 'Барои воридшавӣ нақшро интихоб кунед';

  @override
  String get roleSelectSubChecksQuests => 'Чекҳо, квестҳо, таълим ва ҳамён';

  @override
  String get roleSelectSubMedrep => 'Портфели провизорҳо ва рейтинг';

  @override
  String get roleSelectSubProductOwner => 'Дашборд, маҳсулот ва брендҳо';

  @override
  String get roleSelectSheetTitle => 'Нақшро интихоб кунед';

  @override
  String get roleSelectEnter => 'Ворид шудан';

  @override
  String get notifSettingsTitle => 'Танзимоти огоҳиномаҳо';

  @override
  String get notifSettingsChecks => 'Ҳолати чекҳо ва доруномаҳо';

  @override
  String get notifSettingsQuests => 'Квестҳо ва мукофотҳо';

  @override
  String get notifSettingsLearning => 'Таълим';

  @override
  String get notifSettingsMarketing => 'Хабарҳо ва аксияҳо';

  @override
  String get supportBackProfile => 'Профил';

  @override
  String get supportTitle => 'Дастгирӣ';

  @override
  String get supportEmptyHint => 'Ба мо нависед — дар ин ҷо ҷавоб медиҳем';

  @override
  String get supportInputHint => 'Паём нависед...';

  @override
  String get supportYou => 'Шумо';

  @override
  String get supportTeam => 'Дастгирӣ';

  @override
  String get appBarSwitchRole => 'Иваз кардани нақш';

  @override
  String get asyncRetry => 'Такрор кардан';

  @override
  String get brandProductsTitle => 'Маҳсулот';

  @override
  String get brandProductsEmpty => 'Маҳсулот нест';

  @override
  String brandProductsQuestCount(Object p1) {
    return '$p1 квест';
  }

  @override
  String get brandProductsDetailTitle => 'Маҳсулот';

  @override
  String get brandQuestsTitle => 'Квестҳои бренд';

  @override
  String get brandQuestsEmpty => 'Квестҳо нестанд';

  @override
  String brandQuestsSubtitle(Object p1, Object p2, Object p3) {
    return '$p1 · $p2/$p3 иҷро';
  }

  @override
  String get brandQuestsStatusActive => 'Фаъол';

  @override
  String get brandQuestsStatusOff => 'Хомӯш';

  @override
  String get brandQuestsDetailTitle => 'Квести бренд';

  @override
  String brandQuestsSponsor(Object p1) {
    return 'Сарпараст: $p1';
  }

  @override
  String get brandQuestsParticipants => 'Иштирокчиён';

  @override
  String get brandQuestsCompletions => 'Иҷроҳо';

  @override
  String get brandQuestsBudget => 'Буҷет';

  @override
  String get brandQuestsSpent => 'Сарф шуд';

  @override
  String get brandQuestsProducts => 'Маҳсулот';

  @override
  String get brandQuestsMxik => 'МХИК';

  @override
  String get brandQuestsReward => 'Мукофот';

  @override
  String get brandQuestsPeriod => 'Давра';

  @override
  String get brandsTitle => 'Брендҳо';

  @override
  String get brandsEmpty => 'Брендҳо нестанд';

  @override
  String brandsQuestCount(Object p1) {
    return '$p1 квест';
  }

  @override
  String get brandsDetailTitle => 'Бренд';

  @override
  String get brandsSubBrands => 'Суббрендҳо';

  @override
  String get brandDashTitle => 'Дашборд';

  @override
  String get brandDashChecks => 'Чекҳо';

  @override
  String get brandDashPacks => 'Бастаҳо';

  @override
  String get brandDashActiveQuests => 'Квестҳои фаъол';

  @override
  String get brandDashParticipants => 'Иштирокчиён';

  @override
  String get brandDashSegmentation => 'Сегментатсия';

  @override
  String get brandDashRetail => 'Чакана';

  @override
  String get brandDashChain => 'Шабакаҳо';

  @override
  String get brandDashTopProducts => 'Беҳтарин маҳсулот';

  @override
  String get brandDashTopSellers => 'Беҳтарин фурӯшандагон';

  @override
  String get brandDashRegions => 'Минтақаҳо';

  @override
  String get brandDashSalesLogs => 'Сабтҳои фурӯш';

  @override
  String get salesLogTitle => 'Сабтҳои фурӯш';

  @override
  String get salesLogEmpty => 'Сабтҳо нестанд';

  @override
  String get docHomeActiveQuests => 'Квестҳои фаъол';

  @override
  String get docHomeAllQuests => 'Ҳамаи квестҳо';

  @override
  String get docHomeNoActiveQuests => 'Квестҳои фаъол нестанд';

  @override
  String get docHomeRecommendedCourses => 'Курсҳои тавсияшуда';

  @override
  String get docHomeAllCourses => 'Ҳамаи курсҳо';

  @override
  String get docHomeNoCourses => 'Ҳоло курсҳо нестанд';

  @override
  String get docHomeGreetingNoName => 'Салом!';

  @override
  String docHomeGreeting(Object name) {
    return 'Салом, $name';
  }

  @override
  String get docHomeSubtitle => 'Доруномаҳоро фиристед ва мукофот гиред';

  @override
  String get docHomeWalletBalance => 'БАЛАНСИ ҲАМЁН';

  @override
  String get docHomeWallet => 'Ҳамён';

  @override
  String get docHomeSendRecipe => 'Фиристодани дорунома';

  @override
  String get docHomeSendRecipeHint =>
      'Доруномаро акс гиред — AI доруҳоро мешиносад';

  @override
  String get docHomeStatRecipes => 'ҳамаи доруномаҳо';

  @override
  String get docHomeStatApproved => 'тасдиқшуда';

  @override
  String get docHomeStatIqc => 'холи IQC';

  @override
  String get docHomeVoucher => 'ВАУЧЕР';

  @override
  String get docHomeProgress => 'Пешрафт';

  @override
  String docHomeProgressDone(Object pct) {
    return '$pct% иҷро шуд';
  }

  @override
  String get recipeDetailMyRecipes => 'Доруномаҳои ман';

  @override
  String recipeDetailTitle(Object id) {
    return 'Доруномаи №$id';
  }

  @override
  String recipeDetailPhotoCount(Object p1) {
    return 'Акс $p1';
  }

  @override
  String get recipeDetailStatusApproved => 'Тасдиқ шуд';

  @override
  String get recipeDetailStatusRejected => 'Рад шуд';

  @override
  String get recipeDetailStatusPending => 'Дар баррасӣ';

  @override
  String get recipeDetailAiRecognized => 'AI шинохт';

  @override
  String get recipeDetailNoDrugs => 'Доруҳо шинохта нашуданд';

  @override
  String get recipesTitle => 'Доруномаҳои ман';

  @override
  String recipesTotal(Object p1) {
    return 'ҳамагӣ $p1';
  }

  @override
  String get recipesTabAll => 'Ҳама';

  @override
  String get recipesTabActive => 'Фаъол';

  @override
  String get recipesTabDone => 'Анҷомёфта';

  @override
  String get recipesEmpty => 'Ҳоло доруномаҳо нестанд';

  @override
  String get recipesTakePhoto => 'Акс гирифтан';

  @override
  String get recipesFromGallery => 'Интихоб аз галерея';

  @override
  String get recipesUploading => 'Дорунома илова шуд — бор мешавад';

  @override
  String get recipesDoctorInfoTitle => 'Маълумоти духтур (ихтиёрӣ)';

  @override
  String get recipesDoctorName => 'Н.Н.П.';

  @override
  String get recipesDoctorWorkplace => 'Ҷои кор';

  @override
  String get recipesDoctorCity => 'Шаҳр';

  @override
  String get recipesDoctorPhone => 'Телефон';

  @override
  String get recipesSkip => 'Гузарондан';

  @override
  String get recipesSend => 'Фиристодан';

  @override
  String get recipesSubmitButton => 'Фиристодани дорунома';

  @override
  String recipesPhotoCount(Object p1) {
    return 'акс: $p1';
  }

  @override
  String get recipesStatusApproved => 'Тасдиқ шуд';

  @override
  String get recipesStatusRejected => 'Рад шуд';

  @override
  String get recipesStatusPending => 'Дар баррасӣ';

  @override
  String recipesUploadingBanner(Object count) {
    return 'Бор мешавад: $count';
  }

  @override
  String get recipesRetry => 'Такрор кардан';

  @override
  String get companiesTitle => 'Ширкатҳо';

  @override
  String get companiesEmpty => 'Ширкатҳо нестанд';

  @override
  String companiesCode(Object p1) {
    return 'Рамз: $p1';
  }

  @override
  String get medrepHomeAttributionPrimary => 'Аввалия';

  @override
  String get medrepHomeAttributionTotal => 'Умумӣ';

  @override
  String get medrepHomeMenuPharmacists => 'Фармасевтҳо';

  @override
  String get medrepHomeMenuPending => 'Интизори тасдиқ';

  @override
  String get medrepHomeMenuCompanies => 'Ширкатҳо';

  @override
  String get medrepHomeMenuLeaderboard => 'Рейтинг';

  @override
  String get medrepHomeGreetingNoName => 'Салом!';

  @override
  String medrepHomeGreeting(Object name) {
    return 'Салом, $name';
  }

  @override
  String medrepHomeAttribution(Object attribution) {
    return 'Атрибутсия: $attribution';
  }

  @override
  String get medrepHomeStatPharmacists => 'Фармасевтҳо';

  @override
  String get medrepHomeStatChecks => 'Чекҳо';

  @override
  String get medrepHomeStatPacks => 'Бастаҳо';

  @override
  String get medrepHomeStatQuests => 'Квестҳо';

  @override
  String get medrepHomeLinkCopied => 'Пайванд нусхабардорӣ шуд';

  @override
  String get medrepHomeReferralTitle => 'Пайванди реферал';

  @override
  String get medrepHomeReferralHint =>
      'Пайвандро ба провизор фиристед — ӯ ҳангоми қайдкунӣ ба шумо баста мешавад';

  @override
  String get medrepHomeCopy => 'Нусхабардорӣ';

  @override
  String get medrepHomeShare => 'Мубодила';

  @override
  String get medrepHomeRetry => 'Такрор кардан';

  @override
  String get leaderboardUnitPharm => 'дорухона';

  @override
  String get leaderboardUnitQuests => 'квест';

  @override
  String get leaderboardUnitChecks => 'чек';

  @override
  String get leaderboardTitle => 'Рейтинг';

  @override
  String get leaderboardAttributionPrimary => 'Аввалия';

  @override
  String get leaderboardAttributionTotal => 'Умумӣ';

  @override
  String get leaderboardCompanyFallback => 'Ширкат';

  @override
  String get leaderboardRetry => 'Такрор кардан';

  @override
  String get pharmDetailIncentivizeTitle => 'Ҳавасманд кардани фармасевт';

  @override
  String pharmDetailRating(Object p1) {
    return 'Баҳо: $p1';
  }

  @override
  String get pharmDetailComment => 'Шарҳ';

  @override
  String get pharmDetailCancel => 'Бекор кардан';

  @override
  String get pharmDetailSend => 'Фиристодан';

  @override
  String get pharmDetailSent => 'Фиристода шуд';

  @override
  String get pharmDetailBack => 'Фармасевтҳо';

  @override
  String get pharmDetailChecks => 'Чекҳо';

  @override
  String get pharmDetailPacks => 'Бастаҳо';

  @override
  String get pharmDetailQuests => 'Квестҳо';

  @override
  String get pharmDetailIqcPoints => 'Холҳои IQC';

  @override
  String get pharmDetailRecentChecks => 'Чекҳои охирин';

  @override
  String get pharmDetailNoChecks => 'Ҳоло чекҳо нестанд';

  @override
  String get pharmDetailActive => 'Фаъол';

  @override
  String get pharmDetailPassive => 'Ғайрифаъол';

  @override
  String get pharmDetailIncentivize => 'Ҳавасманд кардан';

  @override
  String get pharmDetailRetry => 'Такрор кардан';

  @override
  String get portfolioTitle => 'Фармасевтҳо';

  @override
  String get portfolioUpdated => 'Нав шуд';

  @override
  String portfolioInPortfolio(Object total) {
    return '$total дар портфел';
  }

  @override
  String get portfolioSearchHint => 'Ҷустуҷӯи фармасевт…';

  @override
  String portfolioTabAll(Object all) {
    return 'Ҳама ($all)';
  }

  @override
  String portfolioTabActive(Object active) {
    return 'Фаъол ($active)';
  }

  @override
  String portfolioTabPassive(Object passive) {
    return 'Ғайрифаъол ($passive)';
  }

  @override
  String get portfolioNotFound => 'Фармасевтҳо ёфт нашуданд';

  @override
  String get portfolioRetry => 'Такрор кардан';

  @override
  String get medrepQuestsTitle => 'Квестҳои ширкат';

  @override
  String get medrepQuestsEmpty => 'Квестҳо нестанд';

  @override
  String medrepQuestsSubtitle(Object p1, Object p2) {
    return 'Мақсад: $p1 · иштирокчиён: $p2';
  }

  @override
  String get medrepQuestsNoParticipants => 'Ҳоло иштирокчиён нестанд';

  @override
  String get referralsAccepted => 'Дархост қабул шуд';

  @override
  String get referralsRejected => 'Дархост рад шуд';

  @override
  String get referralsTitle => 'Дархостҳои реферал';

  @override
  String get referralsEmpty => 'Дархостҳои нав нестанд';

  @override
  String get referralsDecline => 'Рад кардан';

  @override
  String get referralsAccept => 'Қабул кардан';

  @override
  String get checkDetailBackMyChecks => 'Чекҳои ман';

  @override
  String checkDetailTitle(Object id) {
    return 'Чеки №$id';
  }

  @override
  String get checkDetailRejectedFallback => 'Чек рад шуд';

  @override
  String checkDetailQuestDone(Object p1) {
    return '$p1 · Квест иҷро шуд ✓';
  }

  @override
  String get checkDetailQuestAfterApproval =>
      'Пас аз тасдиқи чек пайдо мешавад';

  @override
  String get checkDetailQuestNone => 'Ҳоло ба ягон квест ҳисоб нашудааст';

  @override
  String get checkDetailChipApproved => 'Тасдиқ шуд';

  @override
  String get checkDetailChipRejected => 'Рад шуд';

  @override
  String get checkDetailChipPending => 'Дар баррасӣ';

  @override
  String get checkDetailOpenPhoto => 'Кушодан';

  @override
  String checkDetailPhotoCount(Object p1) {
    return 'акс: $p1';
  }

  @override
  String get checkDetailRejectReasonTitle => 'Сабаби радкунӣ';

  @override
  String get checkDetailResubmit => 'Аз нав фиристодан';

  @override
  String get checkDetailPendingTitle => 'Дар баррасӣ';

  @override
  String get checkDetailPendingBody =>
      'Чеки шумо дар баррасии мутахассис аст. Одатан ин то 24 соат мегирад.';

  @override
  String checkDetailSentAt(Object sentAt) {
    return 'Фиристода шуд: $sentAt';
  }

  @override
  String get checkDetailAiWaitingTitle => 'Интизори шинохти AI';

  @override
  String get checkDetailAiWaitingBody => 'Натиҷа пас аз баррасӣ пайдо мешавад';

  @override
  String get checkDetailAiTitle => 'AI шинохт';

  @override
  String checkDetailPacks(Object p1) {
    return '$p1 баста';
  }

  @override
  String get checkDetailQuestCardTitle => 'Ҳисоб ба квестҳо';

  @override
  String get checksEmpty => 'Ҳоло чекҳо нестанд';

  @override
  String get checksAddedUploading => 'Чек илова шуд — бор мешавад';

  @override
  String get checksNewCheckTitle => 'Чеки нав';

  @override
  String get checksTapToAddPhoto => 'Барои илова кардани акс пахш кунед';

  @override
  String get checksTakePhoto => 'Акс гирифтан';

  @override
  String get checksSubmitForReview => 'Ба баррасӣ фиристодан';

  @override
  String get checksTitle => 'Чекҳои ман';

  @override
  String checksTotalCount(Object p1) {
    return 'ҳамагӣ $p1';
  }

  @override
  String get checksSendPhoto => 'Фиристодани акс';

  @override
  String checksCardMeta(Object p1, Object p2) {
    return '$p1 · акс: $p2';
  }

  @override
  String get checksAwaitUsually24h => 'Интизор шавед — одатан 24 соат';

  @override
  String get checksUploadingTitle => 'Боркунии акс';

  @override
  String get checksPhotoFallback => 'Акси чек';

  @override
  String get checksRetry => 'Такрор кардан';

  @override
  String get courseDetailTabDescription => 'ТАВСИФ';

  @override
  String get courseDetailTabContent => 'МУНДАРИҶА';

  @override
  String courseDetailMinutes(Object totalMin) {
    return '~$totalMin дақиқа';
  }

  @override
  String get courseDetailContinueLearning => 'ИДОМАИ ТАЪЛИМ';

  @override
  String get courseDetailStartLearning => 'ОҒОЗИ ТАЪЛИМ';

  @override
  String get courseDetailVideoLessonOne => 'видеодарс';

  @override
  String get courseDetailVideoLessonFew => 'видеодарс';

  @override
  String get courseDetailVideoLessonMany => 'видеодарс';

  @override
  String courseDetailQuizAfterLesson(Object videosBefore) {
    return 'Тест пас аз дарси $videosBefore';
  }

  @override
  String get courseDetailQuizForCourse => 'Тест аз рӯи курс';

  @override
  String courseDetailLessonMin(Object p1) {
    return '$p1 дақ';
  }

  @override
  String get courseDetailQuizBadge => 'ТЕСТ';

  @override
  String get homePhActiveQuests => 'Квестҳои фаъол';

  @override
  String get homePhAllQuests => 'Ҳамаи квестҳо';

  @override
  String get homePhNoActiveQuests => 'Квестҳои фаъол нестанд';

  @override
  String get homePhRecentChecks => 'Чекҳои охирин';

  @override
  String get homePhAllChecks => 'Ҳамаи чекҳо';

  @override
  String get homePhNoChecks => 'Ҳоло чекҳо нестанд';

  @override
  String get homePhGreeting => 'Салом!';

  @override
  String homePhGreetingName(Object name) {
    return 'Салом, $name!';
  }

  @override
  String get homePhGreetingSub => 'Ба донишҳои нав омодаед?';

  @override
  String get homePhWalletBalanceLabel => 'БАЛАНСИ ҲАМЁН';

  @override
  String get homePhWalletButton => 'Ҳамён';

  @override
  String get homePhSendCheck => 'Фиристодани чек';

  @override
  String get homePhSendCheckSub => 'Чекро акс гиред — AI доруҳоро мешиносад';

  @override
  String get homePhStatActiveQuests => 'квестҳои фаъол';

  @override
  String get homePhStatApprovedChecks => 'чекҳои тасдиқшуда';

  @override
  String get homePhStatIqcPoints => 'холи IQC';

  @override
  String get homePhVoucherBadge => 'ВАУЧЕР';

  @override
  String get homePhProgress => 'Пешрафт';

  @override
  String homePhPctDone(Object pct) {
    return '$pct% иҷро шуд';
  }

  @override
  String homePhCheckNumber(Object p1) {
    return 'Чеки №$p1';
  }

  @override
  String get learnLessonOne => 'дарс';

  @override
  String get learnLessonFew => 'дарс';

  @override
  String get learnLessonMany => 'дарс';

  @override
  String get learnTitle => 'Таълим';

  @override
  String get learnSearchHint => 'Ҷустуҷӯ аз рӯи курсҳо...';

  @override
  String get learnTabAll => 'Ҳама';

  @override
  String get learnTabMine => 'Курсҳои ман';

  @override
  String get learnTabDone => 'Гузашташуда';

  @override
  String get learnNewBadge => 'НАВ';

  @override
  String get learnRepeatCourse => 'ТАКРОРИ КУРС';

  @override
  String get learnContinueLearning => 'ИДОМАИ ТАЪЛИМ';

  @override
  String get learnStartCourse => 'ГУЗАШТАНИ КУРС';

  @override
  String get learnCompleted => 'Гузашта шуд';

  @override
  String get learnNotFoundTitle => 'Курсҳо ёфт нашуданд';

  @override
  String get learnTryChangeFilters => 'Филтрҳоро иваз карда бинед';

  @override
  String learnNothingForQuery(Object query) {
    return 'Аз рӯи дархости «$query» чизе ёфт нашуд.\nДархостро иваз кунед ё филтрҳоро бекор кунед.';
  }

  @override
  String get learnResetFilters => 'Бекор кардани филтрҳо';

  @override
  String lessonCompletedReward(Object p1) {
    return 'Дарс анҷом ёфт · +$p1 IQC';
  }

  @override
  String get lessonNotFound => 'Дарс ёфт нашуд';

  @override
  String get lessonTabText => 'МАТНИ ДАРС';

  @override
  String get lessonTabMaterials => 'МАВОДИ ДАРС';

  @override
  String get lessonNoMaterials => 'Ҳоло мавод нест';

  @override
  String get lessonStartQuiz => 'ОҒОЗИ ТЕСТ';

  @override
  String get lessonComplete => 'АНҶОМИ ДАРС';

  @override
  String get questDetailBackQuests => 'Квестҳо';

  @override
  String get questDetailPillVoucher => 'Ваучер';

  @override
  String get questDetailLeftLabel => 'боқӣ монд';

  @override
  String get questDetailDoneLabel => 'иҷро шуд';

  @override
  String get questDetailRewardLabel => 'МУКОФОТ';

  @override
  String get questDetailVoucherManual =>
      'Ваучер пас аз баррасӣ дастӣ дода мешавад';

  @override
  String questDetailIqcToBalance(Object p1) {
    return '+$p1 IQC ба баланс';
  }

  @override
  String get questDetailHowTitle => 'Чекҳо чӣ тавр ҳисоб мешаванд';

  @override
  String get questDetailHowBody =>
      'Акси чекҳоро бо доруи лозимӣ фиристед. Санҷиши баста — худкор.';

  @override
  String get questDetailTodoTitle => 'Чӣ бояд кард';

  @override
  String get questDetailDrugLabel => 'Дору';

  @override
  String get questDetailLimitsLabel => 'Лимитҳо';

  @override
  String get questDetailPeriodLabel => 'Давра';

  @override
  String get questDetailParticipantsLabel => 'Иштирокчиён';

  @override
  String get questDetailPurchases => 'харид';

  @override
  String questsPeriodUntil(Object p1) {
    return 'то $p1';
  }

  @override
  String questsPeriodFrom(Object p1) {
    return 'аз $p1';
  }

  @override
  String get questsPeriodNone => 'Бе мӯҳлат';

  @override
  String get questsTitle => 'Квестҳо';

  @override
  String get questsTabActive => 'Фаъол';

  @override
  String get questsTabArchive => 'Бойгонӣ';

  @override
  String get questsTabAll => 'Ҳама';

  @override
  String get questsCountWordActive => 'фаъол';

  @override
  String get questsCountWordArchive => 'бойгонӣ';

  @override
  String get questsCountQuestOne => 'квест';

  @override
  String get questsCountQuestFew => 'квест';

  @override
  String get questsHistoryChip => 'Таърихи иштирок';

  @override
  String get questsSearchHint => 'Ҷустуҷӯ';

  @override
  String questsPacksItem(Object p1, Object p2) {
    return '$p1 × $p2 баста';
  }

  @override
  String questsIqcNoLimit(Object p1) {
    return '+$p1 IQC · бе лимит';
  }

  @override
  String get questsPillVoucher => 'Ваучер';

  @override
  String get questsActive => 'Фаъол';

  @override
  String get questsFinished => 'Анҷом ёфт';

  @override
  String get questsEmptyArchiveTitle => 'Квестҳои бойгонӣ нестанд';

  @override
  String get questsEmptyArchiveSub =>
      'Квестҳои анҷомёфта дар ин ҷо пайдо мешаванд';

  @override
  String get questsEmptyActiveTitle => 'Квестҳои фаъол нестанд';

  @override
  String get questsEmptyActiveSub => 'Квестҳои нав дар ин ҷо пайдо мешаванд';

  @override
  String get questsEmptyAllTitle => 'Квестҳо нестанд';

  @override
  String get questsEmptyAllSub => 'Дертар нигаред';

  @override
  String get questsViewActive => 'Дидани фаъолҳо';

  @override
  String get quizTitle => 'Тестгузаронӣ';

  @override
  String quizQuestionOf(Object p1, Object n) {
    return 'Саволи $p1 аз $n';
  }

  @override
  String get quizFinish => 'АНҶОМИ ТЕСТ';

  @override
  String get quizNext => 'САВОЛИ НАВБАТӢ →';

  @override
  String get quizAnswerLabel => 'Ҷавоб';

  @override
  String get quizCongrats => 'Табрик!';

  @override
  String get quizPassed => 'Тест бомуваффақият супорида шуд!';

  @override
  String get quizYouEarned => 'Шумо ба даст овардед';

  @override
  String get quizCorrectLabel => 'ҶАВОБҲОИ ДУРУСТ';

  @override
  String get quizResultLabel => 'НАТИҶА';

  @override
  String get quizToHome => 'БА ЭКРАНИ АСОСӢ';

  @override
  String get quizViewCertificate => 'Дидани сертификат →';

  @override
  String get quizTryAgainTitle => 'Боз як бор кӯшиш кунед';

  @override
  String get quizFailed => 'Тест супорида нашуд';

  @override
  String get quizYourResult => 'Натиҷаи шумо';

  @override
  String get quizCorrectLower => 'дуруст';

  @override
  String quizPassMinimum(Object passScore, Object total, Object passPct) {
    return 'Ҳадди ақал барои гузаштан: $passScore/$total ($passPct%)';
  }

  @override
  String get quizRetry => '↺ АЗ НАВ СУПОРИДАН';

  @override
  String get quizBackToLesson => 'Бозгашт ба дарс →';

  @override
  String get voucherNotFound => 'Ваучер ёфт нашуд';

  @override
  String get voucherTitle => 'Ваучери ман';

  @override
  String get voucherCodeCopied => 'Рамз нусхабардорӣ шуд';

  @override
  String get voucherUsed => 'Истифода шуд';

  @override
  String get voucherActive => 'Фаъол';

  @override
  String voucherIssuedAt(Object p1) {
    return 'Дода шуд: $p1';
  }

  @override
  String get voucherGiftCardLabel => 'UZS · КОРТИ ТӮҲФА';

  @override
  String get voucherShowQr => 'QR-рамзро ба кассир нишон диҳед ё рамзро гӯед';

  @override
  String get voucherStores => 'Мағозаҳои Korzinka.uz';

  @override
  String get voucherSupport => 'Хадамоти дастгирӣ';

  @override
  String get walletPendingVouchers => 'Ваучерҳо дар навбат';

  @override
  String get walletUseIqc => 'Истифодаи IQC';

  @override
  String get walletMyVouchers => 'Ваучерҳои ман';

  @override
  String get walletNoVouchers => 'Ҳоло ваучерҳо нестанд';

  @override
  String get walletRedeemTitle => 'Холҳо иваз карда шаванд?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 бар ивази $p2 IQC';
  }

  @override
  String get walletCancel => 'Бекор кардан';

  @override
  String get walletRedeem => 'Иваз кардан';

  @override
  String get walletVoucherIssued => 'Ваучер дода шуд';

  @override
  String get walletTitle => 'Ҳамён';

  @override
  String get walletBalanceLabel => 'БАЛАНС';

  @override
  String walletTotalAccrued(Object p1) {
    return 'Ҳамагӣ ҳисоб шуд: $p1 IQC';
  }

  @override
  String get walletHistoryArrow => 'Таърих →';

  @override
  String get walletQuestDoneAwaiting =>
      'Квест иҷро шуд — ваучер интизори додан аст';

  @override
  String walletForIqc(Object p1) {
    return 'бар ивази $p1 IQC';
  }

  @override
  String get walletGetVoucher => 'Гирифтани ваучер';

  @override
  String get walletNotEnoughIqc => 'IQC кофӣ нест';

  @override
  String walletCodeMeta(Object p1, Object p2) {
    return 'Рамз: $p1 · $p2';
  }

  @override
  String get walletVoucherUsed => 'Истифода шуд';

  @override
  String get walletVoucherActive => 'Фаъол';

  @override
  String get walletHistoryTitle => 'Таърих';

  @override
  String get walletNoTransactions => 'Ҳоло амалиёт нест';

  @override
  String get brandProductsBrand => 'Бренд';

  @override
  String get brandProductsFormat => 'Формат';

  @override
  String get brandProductsMxik => 'МХИК';

  @override
  String get brandProductsDivisible => 'Тақсимшаванда';

  @override
  String get brandProductsYes => 'Ҳа';

  @override
  String get brandProductsNo => 'Не';

  @override
  String get brandProductsQuests => 'Квестҳо';

  @override
  String get medrepHomePeriodAll => 'Ҳама';

  @override
  String get medrepHomePeriod30d => '30 рӯз';

  @override
  String get medrepHomePeriod7d => '7 рӯз';

  @override
  String get leaderboardTabChecks => 'Чекҳо';

  @override
  String get leaderboardTabPharm => 'Фармасевтҳо';

  @override
  String get leaderboardTabQuests => 'Квестҳо';

  @override
  String leaderboardMyRankLabel(Object company) {
    return '$company | Ҷои ман: ';
  }

  @override
  String leaderboardMyRank(Object rank, Object total) {
    return '#$rank аз $total';
  }

  @override
  String portfolioChecksChip(Object count) {
    return 'Чекҳо: $count';
  }

  @override
  String portfolioQuestsChip(Object count) {
    return 'Квестҳо: $count';
  }

  @override
  String referralsDate(Object date) {
    return 'Дархост: $date';
  }

  @override
  String get checksStatusApproved => 'Тасдиқ шуд';

  @override
  String get checksStatusRejected => 'Рад шуд';

  @override
  String get checksStatusPending => 'Дар баррасӣ';

  @override
  String questDetailRewardVoucherLine(Object amount) {
    return 'Korzinka · $amount сум';
  }

  @override
  String get questDetailRewardIqcLine => 'Ҳамаи дорухонаҳо · бе лимит';

  @override
  String questDetailActiveUntil(Object date) {
    return 'То $date фаъол';
  }

  @override
  String get questDetailFinished => 'Анҷом ёфт';

  @override
  String questsPurchasesOfGoal(Object completed, Object goal) {
    return '$completed / $goal харид';
  }

  @override
  String questsPurchases(Object completed) {
    return '$completed харид';
  }
}

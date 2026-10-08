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
  String get navRecipes => 'Бланкҳо';

  @override
  String get navPortfolio => 'Портфел';

  @override
  String get navPharm => 'Даста';

  @override
  String get navTop => 'Рейтинг';

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
  String get miniAppsSubtitle => 'Аксияҳо барои иштирокчиёни барнома';

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
      'Бо IQC катакҳоро интихоб кунед — ҳангоми эълони натиҷаҳо мефаҳмед, ки зери онҳо чист';

  @override
  String get sapperNoDraws => 'Аксияҳои фаъол нестанд';

  @override
  String get sapperRevealed => 'Анҷом ёфт';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 ҷоизаҳо: $prizeCount  💎 $priceIqc IQC/катак  ';
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
  String get sapperGoToGame => 'Кушодани майдон';

  @override
  String sapperReserveTitle(Object number) {
    return 'Катаки №$number-ро мегиред?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC истифода мешавад. Бекор кардан мумкин нест — катак то эълони натиҷаҳо аз они шумо мешавад.';
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
  String get sapperNoIqcTitle => 'IQC кофӣ нест';

  @override
  String sapperNoIqcBody(Object price, Object have) {
    return 'Барои иштирок $price IQC лозим аст, шумо $have доред. IQC ҷамъ кунед — таълим, квест ё пурсишро гузаред.';
  }

  @override
  String get sapperDraws => 'Аксияҳо';

  @override
  String get sapperAcceptClosed =>
      'Интихоби катакҳо пӯшида шуд — натиҷаҳо омода мешаванд';

  @override
  String get sapperHiddenTitle => 'ҶОИЗАҲО ДАР МАЙДОН';

  @override
  String sapperFieldTotal(int count) {
    return 'Дар майдон $count катак';
  }

  @override
  String sapperRevealIn(Object time) {
    return 'натиҷаҳо баъд аз $time';
  }

  @override
  String get sapperNoPrizes => 'ҷоизаҳо нишон дода нашудаанд';

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
    return 'катак — $price IQC';
  }

  @override
  String get sapperYourBalance => 'Баланси шумо';

  @override
  String get sapperCellPriceLabel => 'барои як катак';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Шумо $count $word гирифтед!';
  }

  @override
  String get sapperNoWin => 'Ин дафъа бе ҷоиза';

  @override
  String get sapperPrizeOne => 'ҷоиза';

  @override
  String get sapperPrizeFew => 'ҷоиза';

  @override
  String get sapperPrizeMany => 'ҷоиза';

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
  String get sapperLegendOccupied => 'Дигарон банд кардаанд';

  @override
  String get sapperLegendFree => 'Озод';

  @override
  String get sapperWinners => 'Ҷоиза гирифтагон';

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
  String get loginChooseMethod => 'Усули қулайи воридшавиро интихоб кунед';

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
  String get loginNoAccount => 'Аккаунт надоред?';

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
  String get profileSupportSubtitle =>
      'Тавассути Telegram, телефон ва чати дастгирӣ ҷавоб медиҳем';

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
  String get profileLogoutConfirmBody =>
      'Барои боз истифода бурдани барнома бояд аз нав ворид шавед.';

  @override
  String get profileLogoutAction => 'Баромадан';

  @override
  String get profileDeleteConfirmTitle => 'Ҳисоб нест карда шавад?';

  @override
  String get profileDeleteConfirmBody =>
      'Профил, рақами телефон, пайвандҳои воридшавӣ, огоҳиномаҳо ва мукотиба бо дастгирӣ нест карда мешаванд. Сабтҳои ҳисобҳо ва ваучерҳои додашуда бе маълумоти шахсии шумо нигоҳ дошта мешаванд — онҳо барои баҳисобгирӣ лозиманд. Ин амал бебозгашт аст.';

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
  String get notifSettingsChecks => 'Ҳолати чекҳо ва бланкҳо';

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
  String get docHomeSubtitle => 'Бланкҳоро фиристед ва мукофот гиред';

  @override
  String get docHomeWalletBalance => 'БАЛАНСИ ҲАМЁН';

  @override
  String get docHomeWallet => 'Ҳамён';

  @override
  String get docHomeSendRecipe => 'Фиристодани бланк';

  @override
  String get docHomeSendRecipeHint =>
      'Бланкро акс гиред — AI доруҳоро мешиносад';

  @override
  String get docHomeStatRecipes => 'ҳамаи бланкҳо';

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
  String get recipeDetailMyRecipes => 'Бланкҳои ман';

  @override
  String recipeDetailTitle(Object id) {
    return 'Бланки №$id';
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
  String get recipesTitle => 'Бланкҳои ман';

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
  String get recipesEmpty => 'Ҳоло бланкҳо нестанд';

  @override
  String get recipesTakePhoto => 'Акс гирифтан';

  @override
  String get recipesFromGallery => 'Интихоб аз галерея';

  @override
  String get recipesUploading => 'Бланк илова шуд — бор мешавад';

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
  String get recipesSubmitButton => 'Фиристодани бланк';

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
  String get walletRedeemTitle => 'Ваучер гиред?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 бар ивази $p2 IQC';
  }

  @override
  String get walletCancel => 'Бекор кардан';

  @override
  String get walletRedeem => 'Гирифтан';

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
    return 'Ваучери Korzinka · $amount IQC';
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

  @override
  String get profileLanguageTitle => 'Забон';

  @override
  String get profileChooseLanguage => 'Забонро интихоб кунед';

  @override
  String get navDoctors => 'Табибон';

  @override
  String get doctorsTitle => 'Табибон';

  @override
  String get doctorsHint =>
      'Табибони ширкати шумо ва пешрафти онҳо аз рӯи квести бланк';

  @override
  String get doctorsSearchHint => 'Ҷустуҷӯ аз рӯи табиб, клиника, шаҳр';

  @override
  String get doctorsCompleted => 'Иҷро карданд';

  @override
  String get doctorsInProgress => 'Дар ҷараён';

  @override
  String get doctorsIdle => 'Оғоз накарданд';

  @override
  String get doctorsNoQuest => 'Квести фаъоли бланк нест';

  @override
  String get doctorsUnavailable =>
      'Ширкати шумо лоиҳаи бланк надорад, бинобар ин табибон пайваст нашудаанд';

  @override
  String get doctorsEmpty => 'Ҳоло табибон нестанд';

  @override
  String get doctorsNotFound => 'Чизе ёфт нашуд';

  @override
  String get doctorsRegionUnknown => 'Минтақа нишон дода нашудааст';

  @override
  String doctorsRecipesCount(Object count) {
    return 'Бланкҳо дар тамоми давра: $count';
  }

  @override
  String doctorsQuestGoal(Object goal) {
    return 'Меъёр: $goal';
  }

  @override
  String doctorsDoneTimes(Object count) {
    return 'Иҷрошуда ×$count';
  }

  @override
  String doctorsRegionSummary(Object doctors, Object completed) {
    return '$doctors табиб · $completed иҷро';
  }

  @override
  String get doctorsAll => 'Ҳама';

  @override
  String get loginWithGoogle => 'Ворид шудан тавассути Google';

  @override
  String get loginWithApple => 'Ворид шудан тавассути Apple';

  @override
  String get oauthLinkTitle => 'Рақами телефонро тасдиқ кунед';

  @override
  String get oauthLinkBody =>
      'Рақамро як бор тасдиқ кунед — ҳамин тавр ҳисоб ва холҳои шуморо меёбем. Дафъаи оянда бо як ламс ворид мешавед.';

  @override
  String get oauthLinkPhoneLabel => 'Рақами телефон';

  @override
  String get oauthLinkSendCode => 'Гирифтани рамз';

  @override
  String oauthLinkCodeSent(String phone) {
    return 'Рамз ба $phone фиристода шуд';
  }

  @override
  String get oauthLinkCodeLabel => 'Рамзи SMS';

  @override
  String get oauthLinkConfirm => 'Тасдиқ кардан';

  @override
  String get oauthLinkChangePhone => 'Иваз кардани рақам';

  @override
  String get profilePrivacy => 'Сиёсати махфият';

  @override
  String get profilePrivacySubtitle =>
      'Кадом маълумотро ҷамъ мекунем ва чӣ тавр нигоҳ медорем';

  @override
  String get sapperRulesButton => 'Қоидаҳои аксия';

  @override
  String get sapperRulesTitle => 'Қоидаҳои аксияи «Супер Сапёр»';

  @override
  String get sapperRulesFull => 'Қоидаҳои пурраи расмӣ';

  @override
  String get sapperRulesAccept =>
      'Бо ишғол кардани катак шумо қоидаҳои аксияро қабул мекунед.';

  @override
  String get sapperRule1 =>
      'Ташкилотчӣ — ҶДММ «PHARMIQ ACADEMY». Apple ва Google сарпарасти аксия нестанд ва дар он иштирок намекунанд.';

  @override
  String get sapperRule2 =>
      'Дар аксия пул истифода намешавад: танҳо бо холҳои IQC иштирок кардан мумкин аст.';

  @override
  String get sapperRule3 =>
      'Холҳои IQC барои таълим, пурсишҳо ва квестҳои тасдиқшуда дода мешаванд. Онҳоро харидан, ба корбари дигар додан ё ба пул иваз кардан мумкин нест.';

  @override
  String get sapperRule4 =>
      'Мӯҳлатҳо, нархи катак ва рӯйхати пурраи ҷоизаҳо то иштирок дар саҳифаи аксия нишон дода мешаванд.';

  @override
  String get sapperRule5 =>
      'Холҳо ҳангоми ишғоли катак хориҷ мешаванд, бекор кардан мумкин нест. Як катакро як иштирокчӣ ишғол мекунад; қабул 1 дақиқа пеш аз натиҷаҳо баста мешавад.';

  @override
  String get sapperRule6 =>
      'Ҷоизаҳо то оғози аксия дар катакҳо ҷойгир карда мешаванд ва баъд тағйир намеёбанд. Дар вақти муайяншуда ҳамаи катакҳо якбора кушода мешаванд, ҷоизаи катакро иштирокчие, ки онро ишғол кардааст, худкор мегирад. Натиҷаҳо ба ҳама намоёнанд.';

  @override
  String get sapperRule7 =>
      'Ҷоизаҳо — ваучерҳои тӯҳфавии шарикон ва холҳои бонусӣ; ба пул иваз намешаванд. Ҷоизаҳои катакҳои ишғолнашуда дубора тақсим намешаванд.';

  @override
  String get sapperRule8 =>
      'Агар аксия бекор шавад, ҳамаи холҳои сарфшуда баргардонида мешаванд. Корбарони аз 18 сола боло иштирок карда метавонанд, иштирок ихтиёрӣ аст.';

  @override
  String get stateServerErrorTitle => 'Чизе нодуруст шуд';

  @override
  String get stateServerErrorText =>
      'Мо аз мушкилот огоҳем ва онро ислоҳ карда истодаем. Пас аз як дақиқа боз кӯшиш кунед';

  @override
  String get stateWriteSupport => 'Ба дастгирӣ навиштан';

  @override
  String stateErrorCode(String code) {
    return 'Рамзи хато: $code';
  }

  @override
  String get stateOfflineTitle => 'Пайвастшавӣ ба интернет нест';

  @override
  String get stateOfflineText =>
      'Wi‑Fi ё интернети мобилиро санҷед. Ҳамин ки алоқа пайдо шавад, экран худ нав мешавад';

  @override
  String stateOfflineBanner(String time) {
    return 'Алоқа нест · маълумот аз $time';
  }

  @override
  String get stateOfflineBannerShort => 'Алоқа нест';

  @override
  String get stateOfflineSendHint =>
      'Ҳангоми пайдо шудани интернет фиристодан дастрас мешавад';

  @override
  String get stateRefreshing => 'Нав карда истодаем…';

  @override
  String get miniAppsNewGamesTitle => 'Мини-барномаҳои нав';

  @override
  String get miniAppsNewGamesText =>
      'Дар ҳоли таҳия — ҳангоми пайдо шудан хабар медиҳем';

  @override
  String sapperBackTo(String label) {
    return 'Бозгашт: $label';
  }

  @override
  String sapperPrizesCount(int n) {
    return '$n ҷоиза';
  }

  @override
  String sapperMyCellsCount(int n) {
    return 'Катакҳои шумо: $n';
  }

  @override
  String sapperResultsIn(String time) {
    return 'Натиҷаҳо пас аз $time';
  }

  @override
  String get sapperCellPriceTitle => 'Нархи катак';

  @override
  String get sapperMyCellsTitle => 'Катакҳои шумо';

  @override
  String get sapperOccupiedTitle => 'Катакҳои банд';

  @override
  String sapperOccupiedOf(int occupied, int total) {
    return '$occupied аз $total';
  }

  @override
  String sapperOfTotal(int total) {
    return 'аз $total';
  }

  @override
  String get sapperHiddenLabel => 'Дар майдон пинҳон шудааст';

  @override
  String get sapperHowTitle => 'Чӣ тавр иштирок кардан мумкин';

  @override
  String get sapperStep1Title => 'Катакҳоро интихоб кунед';

  @override
  String sapperStep1Text(int price) {
    return 'Ҳар кадоме $price IQC арзиш дорад. Метавонед якбора якчандторо банд кунед';
  }

  @override
  String get sapperStep2Title => 'Интизори натиҷаҳо шавед';

  @override
  String get sapperStep2Text =>
      'Ҳафтае як маротиба майдон барои ҳама кушода мешавад';

  @override
  String get sapperStep3Title => 'Натиҷаро гиред';

  @override
  String get sapperStep3Text =>
      'IQC ба баланс гузаронида мешавад, ваучер дар ҳамён пайдо мешавад';

  @override
  String get sapperSelectHint => 'Барои интихоб ба катакҳои холӣ пахш кунед';

  @override
  String sapperSelectedHint(int n, int price) {
    return 'Интихоб шуд: $n · $price IQC хориҷ мешавад';
  }

  @override
  String sapperTakeCta(int n, int price) {
    return 'Банд кардани $n катак · $price IQC';
  }

  @override
  String sapperTakenToast(int n) {
    return '+$n хона — интизори натиҷаҳо';
  }

  @override
  String sapperReserveManyTitle(int n) {
    return '$n катакро банд мекунед?';
  }

  @override
  String get sapperCellFree => 'Катаки холӣ';

  @override
  String get sapperCellTheirs => 'Иштирокчии дигар банд кардааст';

  @override
  String get sapperCellMine => 'Катаки шумо';

  @override
  String get sapperCellSelected => 'Интихоб шуд, барои бекор кардан пахш кунед';

  @override
  String get sapperCellEmpty => 'Холӣ';

  @override
  String sapperCellPrize(String label) {
    return 'Ҷоиза: $label';
  }

  @override
  String sapperGridLabel(int cols, int rows) {
    return 'Майдони $cols × $rows';
  }

  @override
  String get sapperGridRevealed => 'Майдони кушодашуда';

  @override
  String sapperWonTitle(String prize) {
    return 'Шумо $prize гирифтед';
  }

  @override
  String sapperWonText(int wins, int total) {
    return 'Дар баланс · хонаҳои тӯҳфадор: $wins аз $total';
  }

  @override
  String get sapperNotParticipated => 'Шумо дар ин аксия иштирок накардед';

  @override
  String sapperRevealedOn(String date) {
    return 'Натиҷаҳо эълон шуданд · $date';
  }

  @override
  String get sapperWinnerYou => 'шумо';

  @override
  String sapperWinnerCell(int n) {
    return 'Катаки №$n';
  }

  @override
  String get sapperPlayNew => 'Иштирок дар аксияи нав';

  @override
  String get sapperViewResults => 'Дидани натиҷаҳо';

  @override
  String get questsSubtitle => 'Фурӯшҳои худро сабт кунед';

  @override
  String get questsSubtitleDoctor => 'Ҳолатҳои таъинотро сабт кунед';

  @override
  String get questsSearchLabel => 'Ҷустуҷӯи квестҳо';

  @override
  String get questsTabDone => 'Анҷомёфта';

  @override
  String get questsSortHint => 'Аввал — наздиктарин ба мукофот';

  @override
  String get questsAlmostDone => 'Қариб тайёр';

  @override
  String get questsCompleted => 'Иҷро шуд';

  @override
  String questsOfGoalSales(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: 'аз $goal фурӯш',
    );
    return '$_temp0';
  }

  @override
  String questsOfGoalRecipes(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: 'аз $goal бланк',
    );
    return '$_temp0';
  }

  @override
  String questsLeftShort(int n) {
    return 'Боз $n';
  }

  @override
  String get questsMore => 'Муфассал';

  @override
  String get questsHowTitle => 'Квестҳо чӣ тавр кор мекунанд';

  @override
  String get questsStepSellTitle => 'Фурӯшед';

  @override
  String get questsStepSellSub => 'доруро';

  @override
  String get questsStepPrescribeTitle => 'Нависед';

  @override
  String get questsStepPrescribeSub => 'бланкро';

  @override
  String get questsStepSendTitle => 'Фиристед';

  @override
  String get questsStepSendCheckSub => 'акси чекро';

  @override
  String get questsStepSendRecipeSub => 'акси бланкро';

  @override
  String get questsDoneFooter =>
      'Дар ин ҷо квестҳои иҷрошуда ва анҷомёфта бо сана ва натиҷа нигоҳ дошта мешаванд';

  @override
  String questsDoneOn(String date) {
    return 'Иҷро шуд · $date';
  }

  @override
  String questsEndedOn(String date) {
    return 'Анҷом ёфт · $date';
  }

  @override
  String get questsEmptyDoneTitle => 'Ҳоло квестҳои анҷомёфта нестанд';

  @override
  String questsMonthName(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Январ',
      'm2': 'Феврал',
      'm3': 'Март',
      'm4': 'Апрел',
      'm5': 'Май',
      'm6': 'Июн',
      'm7': 'Июл',
      'm8': 'Август',
      'm9': 'Сентябр',
      'm10': 'Октябр',
      'm11': 'Ноябр',
      'm12': 'Декабр',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get questsSalesLeftPrefix => 'Фурӯхтан лозим:';

  @override
  String get questsRecipesLeftPrefix => 'Навиштан лозим:';

  @override
  String questsPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қуттӣ',
    );
    return '$_temp0';
  }

  @override
  String questsRecipesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n бланк',
    );
    return '$_temp0';
  }

  @override
  String get questsGoalReached =>
      'Ҳадаф иҷро шуд — мукофот пас аз санҷиш дода мешавад';

  @override
  String get questsRewardLabel => 'Мукофот';

  @override
  String questsVoucherTitle(String shop) {
    return 'Ваучери $shop';
  }

  @override
  String get questsRewardManual => 'Пас аз санҷиш дода мешавад';

  @override
  String get questsRewardIqcSub => 'Холҳо пас аз санҷиш ба баланс мегузаранд';

  @override
  String get questsRewardReceived => 'Мукофот гирифта шуд';

  @override
  String questsStepSellDrug(String drug) {
    return '$drug-ро фурӯшед';
  }

  @override
  String questsStepPrescribeDrug(String drug) {
    return '$drug-ро нависед';
  }

  @override
  String questsNeedSell(String packs) {
    return 'Бояд $packs фурӯхт';
  }

  @override
  String questsNeedPrescribe(String recipes) {
    return 'Бояд $recipes навишт';
  }

  @override
  String get questsStepPhotoCheck => 'Аз чек акс гиред';

  @override
  String get questsStepPhotoCheckSub =>
      'Чеки шумо барои санҷиш фиристода мешавад';

  @override
  String get questsStepPhotoRecipe => 'Аз бланк акс гиред';

  @override
  String get questsStepPhotoRecipeSub =>
      'Бланки шумо барои санҷиш фиристода мешавад';

  @override
  String get questsConditionsTitle => 'Шартҳо';

  @override
  String get questsSalesLimit => 'Ҳадди фурӯш';

  @override
  String get questsRecipesLimit => 'Ҳадди бланкҳо';

  @override
  String get questsNoLimit => 'Бе маҳдудият';

  @override
  String questsPacksShort(int n) {
    return '$n қут.';
  }

  @override
  String get questsCountedTitle => 'Чекҳои ба ҳисоб гирифташуда';

  @override
  String get questsCountedRecipesTitle => 'Бланкҳои ба ҳисоб гирифташуда';

  @override
  String get questsCountedEmpty => 'Ҳоло ягон чек нест';

  @override
  String get questsCountedEmptyRecipes => 'Ҳоло ягон бланк нест';

  @override
  String get questsCountedEmptySub =>
      'Чекҳо аз рӯи квест пас аз санҷиш дар ин ҷо пайдо мешаванд';

  @override
  String get questsCountedEmptySubRecipes =>
      'Бланкҳо аз рӯи квест пас аз санҷиш дар ин ҷо пайдо мешаванд';

  @override
  String questsCountedSales(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n фурӯш ба ҳисоб гирифта шуд',
    );
    return '$_temp0';
  }

  @override
  String questsCountedRecipes(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n бланк ба ҳисоб гирифта шуд',
    );
    return '$_temp0';
  }

  @override
  String get questsAllChecks => 'Ҳамаи чекҳо';

  @override
  String get questsAllRecipes => 'Ҳамаи бланкҳо';

  @override
  String get questsSendCheck => 'Фиристодани чек аз рӯи квест';

  @override
  String get questsSendRecipe => 'Фиристодани бланк аз рӯи квест';

  @override
  String get questsSearchPlaceholder => 'Ном ё дору';

  @override
  String get questsSearchClear => 'Тоза кардан';

  @override
  String questsFound(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n квест ёфт шуд',
    );
    return '$_temp0';
  }

  @override
  String get questsPopular => 'Бисёр ҷустуҷӯ мекунанд';

  @override
  String get questsNothingFound => 'Ҳеҷ чиз ёфт нашуд';

  @override
  String get questsNothingFoundSub =>
      'Номи доруро санҷед ё дархости дигар кунед';

  @override
  String get questsReceived => 'гирифта шуд';

  @override
  String get questsPending => 'дар интизор';

  @override
  String get walletAccruedAllTime => 'дар тамоми вақт ҳисоб шуд';

  @override
  String walletAwaitingStat(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ваучер интизори додан аст',
      one: 'ваучер интизори додан аст',
    );
    return '$_temp0';
  }

  @override
  String get walletArchive => 'Бойгонӣ';

  @override
  String get walletArchiveTitle => 'Бойгонии ваучерҳо';

  @override
  String get walletTapCardHint => 'Ба корт пахш кунед — QR-кодро нишон медиҳем';

  @override
  String get walletAllArchivedTitle => 'Ҳамаи ваучерҳо дар бойгонӣ';

  @override
  String get walletAllArchivedText =>
      'Ваучерҳои нав пас аз иҷрои квестҳо пайдо мешаванд';

  @override
  String get walletGiftCard => 'Корти тӯҳфавӣ';

  @override
  String get walletGiftCardBoth => 'КОРТИ ТӮҲФАВӢ · SOVG\'A KARTASI';

  @override
  String get walletGiftCardKorzinka => 'Корти тӯҳфавии Korzinka';

  @override
  String get walletReceived => 'Гирифта шуд';

  @override
  String get walletCode => 'Код';

  @override
  String get walletShowQr => 'Нишон додан';

  @override
  String get walletStatusLabel => 'Ҳолат';

  @override
  String get walletWhere => 'Дар куҷо';

  @override
  String get walletStatusArchived => 'Дар бойгонӣ';

  @override
  String get walletAwaitingTitle => 'Интизори додан';

  @override
  String walletQuestDoneOn(String date) {
    return 'Квест иҷро шуд · $date';
  }

  @override
  String walletPcs(int n) {
    return '$n адад';
  }

  @override
  String walletVouchersCaption(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ваучер',
      one: 'ваучер',
    );
    return '$_temp0';
  }

  @override
  String get walletManualHint =>
      'Ваучерҳо пас аз санҷиш дастӣ дода мешаванд — одатан дар давоми чанд рӯз';

  @override
  String walletShowAll(int n) {
    return 'Ҳамаро нишон додан ($n)';
  }

  @override
  String get walletExchangeTitle => 'Иваз кардани IQC';

  @override
  String get walletShopTitle => 'Мубодилаи IQC';

  @override
  String walletProgressOf(String have, String need) {
    return '$have аз $need IQC';
  }

  @override
  String walletMore(String n) {
    return 'Боз $n';
  }

  @override
  String get walletSaveUp => 'Барои иваз IQC ҷамъ кунед';

  @override
  String walletExchangeFor(String amount) {
    return 'Иваз ба $amount IQC';
  }

  @override
  String walletOpenVoucher(String sum) {
    return 'Кушодани ваучери $sum';
  }

  @override
  String get walletClose => 'Пӯшидан';

  @override
  String get walletVoucherDialog => 'Ваучери Korzinka';

  @override
  String get walletArchiveUsed => 'Ба бойгонӣ — ваучер истифода шуд';

  @override
  String walletArchivedToast(String code) {
    return 'Ваучери ••$code дар бойгонӣ';
  }

  @override
  String get walletUndo => 'Бекор кардан';

  @override
  String get walletBack => 'Ба қафо';

  @override
  String get walletBackToWallet => 'Бозгашт ба ҳамён';

  @override
  String walletArchiveSummary(int n, String sum) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучер',
      one: '$n ваучер',
    );
    return '$_temp0 · $sum';
  }

  @override
  String get walletRestore => 'Баргардондан';

  @override
  String walletRestoreA11y(String code) {
    return 'Баргардондани ваучери ••$code';
  }

  @override
  String get walletRestoreHint =>
      'Агар ваучерро хато гирифта бошед, «Баргардондан»-ро пахш кунед — он боз дар ҳамён пайдо мешавад';

  @override
  String get walletArchiveEmptyTitle => 'Бойгонӣ холӣ аст';

  @override
  String get walletArchiveEmptyText =>
      'Ваучерро истифода бурдед? Онро ба ин ҷо гузоред — дар ҳамён танҳо ваучерҳои амалкунанда мемонанд';

  @override
  String walletReceivedMeta(String date, String code) {
    return 'Гирифта шуд $date · код ••$code';
  }

  @override
  String get walletHistoryAll => 'Ҳама';

  @override
  String get walletHistoryEarned => 'Ҳисобшавиҳо';

  @override
  String get walletHistorySpent => 'Хароҷотҳо';

  @override
  String get walletEarnedMonth => 'Дар ҳамин моҳ ҳисоб шуд';

  @override
  String get walletSpentMonth => 'Дар ҳамин моҳ сарф шуд';

  @override
  String get walletMonths =>
      'Январ,Феврал,Март,Апрел,Май,Июн,Июл,Август,Сентябр,Октябр,Ноябр,Декабр';

  @override
  String get walletAccrued => 'ҳисоб шуд';

  @override
  String get walletDebited => 'хориҷ шуд';

  @override
  String get walletTxnCheck => 'Чек';

  @override
  String get walletTxnRecipe => 'Бланк';

  @override
  String get walletTxnSurvey => 'Пурсиш';

  @override
  String get walletTxnQuest => 'Квест иҷро шуд';

  @override
  String get walletTxnCourse => 'Курс хатм шуд';

  @override
  String get walletTxnRedeem => 'Иваз ба ваучер';

  @override
  String get walletTxnReversal => 'Баргардониш';

  @override
  String get walletTxnAdjust => 'Ислоҳ';

  @override
  String get walletTxnOther => 'Ҳисобкунӣ';

  @override
  String walletQueueQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n квест',
      one: '$n квест',
    );
    return '$_temp0';
  }

  @override
  String walletQueueVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучер интизори додан аст',
      one: '$n ваучер интизори додан аст',
    );
    return '$_temp0';
  }

  @override
  String get walletStepDone => 'Квест иҷро шуд';

  @override
  String get walletStepReview => 'Санҷиш';

  @override
  String get walletStepIssue => 'Додан';

  @override
  String get walletQueueHint =>
      'Ваучерҳо пас аз санҷиш дастӣ дода мешаванд — одатан дар давоми чанд рӯз. Вақте ки ваучер дар ҳамён пайдо шавад, огоҳинома мефиристем';

  @override
  String get walletQueueEmptyTitle => 'Навбат холӣ аст';

  @override
  String get walletQueueEmptyText =>
      'Квестро бо мукофоти ваучер иҷро кунед — он то додан дар ин ҷо намоён мешавад';

  @override
  String get walletYourBalance => 'Тавозуни шумо';

  @override
  String walletEnoughFor(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Барои $n ваучер мерасад',
      one: 'Барои $n ваучер мерасад',
      zero: 'Ҳоло барои ваучер намерасад',
    );
    return '$_temp0';
  }

  @override
  String get walletShopNote =>
      'Ваучер пас аз тасдиқи мубодила дар ҳамён пайдо мешавад';

  @override
  String walletConfirmTitle(String amount) {
    return '$amount IQC иваз карда шавад?';
  }

  @override
  String walletConfirmText(String sum) {
    return 'Корти тӯҳфавии Korzinka ба маблағи $sum гиред';
  }

  @override
  String get walletWillDebit => 'Хориҷ мекунем';

  @override
  String get walletWillRemain => 'Мемонад';

  @override
  String get walletWhereTo => 'Ба куҷо меояд';

  @override
  String get walletToWallet => 'Ба ҳамён';

  @override
  String get walletExchange => 'Иваз кардан';

  @override
  String get walletExchangeFailed => 'Иваз кардани IQC муяссар нашуд';

  @override
  String get walletShare => 'Мубодилаи ваучер';

  @override
  String get walletCopyCode => 'Нусхабардории код';

  @override
  String get walletQrLabel => 'QR-коди ваучер';

  @override
  String get walletShowQrCashier =>
      'QR-кодро ба кассир нишон диҳед ё кодро гӯед';

  @override
  String get walletStores => 'Мағозаҳои Korzinka';

  @override
  String get walletToArchive => 'Ба бойгонӣ';

  @override
  String get walletToArchiveHint =>
      'Ваучерро истифода бурдед? Онро ба бойгонӣ гузоред — он дар таърих мемонад';

  @override
  String get walletRestoreFromArchive => 'Аз бойгонӣ баргардондан';

  @override
  String get learnSubtitle => 'Курсҳоро гузаред — IQC гиред';

  @override
  String get learnSearchA11y => 'Ҷустуҷӯи курсҳо';

  @override
  String get learnSearchPlaceholder => 'Номи курс ё бренд';

  @override
  String get learnSearchClear => 'Тоза кардан';

  @override
  String get learnSegNew => 'Нав';

  @override
  String get learnSegProgress => 'Дар ҷараён';

  @override
  String get learnSegDone => 'Гузашташуда';

  @override
  String learnTileVideo(int n) {
    return '$n дарси видеоӣ';
  }

  @override
  String learnTileQuiz(int n) {
    return '$n тест';
  }

  @override
  String get learnTileReward => 'Мукофот';

  @override
  String learnMinutesShort(int n) {
    return '~$n дақ';
  }

  @override
  String get learnQuizStatusLocked => 'Пӯшида';

  @override
  String get learnQuizStatusOpen => 'Дастрас';

  @override
  String learnIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get learnCtaStart => 'Оғози курс';

  @override
  String get learnCtaContinue => 'Идома додан';

  @override
  String get learnCtaRepeat => 'Аз нав гузаштан';

  @override
  String learnProgressLabel(int pct) {
    return '$pct% гузашта шуд';
  }

  @override
  String get learnEmptyTitle => 'Ҳоло курсҳо нестанд';

  @override
  String get learnEmptyText =>
      'Курсҳо барои дорухонаи шумо ҳанӯз илова нашудаанд. Ҳамин ки курси нав пайдо шавад, огоҳинома мефиристем';

  @override
  String get learnEnableNotifications => 'Фаъол кардани огоҳиномаҳо';

  @override
  String get learnNoResultsTitle => 'Чизе ёфт нашуд';

  @override
  String learnNoResultsInTab(String query, String tab) {
    return 'Дар ҷадвали «$tab» аз рӯи дархости «$query» курс нест. Имлоро санҷед ё дар ҳамаи курсҳо ҷустуҷӯ кунед';
  }

  @override
  String learnNoResultsAll(String query) {
    return 'Аз рӯи дархости «$query» курс нест. Имлоро санҷед ё номи дигарро кӯшиш кунед';
  }

  @override
  String get learnSearchEverywhere => 'Дар ҳамаи курсҳо ҷустуҷӯ';

  @override
  String get learnTabEmptyTitle => 'Ин ҷо ҳоло холӣ аст';

  @override
  String get learnTabEmptyNew =>
      'Ҳамаи курсҳо оғоз шудаанд — таҳсилро дар ҷадвали «Дар ҷараён» идома диҳед';

  @override
  String get learnTabEmptyProgress =>
      'Ягон курсро аз ҷадвали «Нав» оғоз кунед — он дар ин ҷо пайдо мешавад';

  @override
  String get learnTabEmptyDone =>
      'Курсҳои гузашта пас аз супоридани бомуваффақияти тест дар ин ҷо пайдо мешаванд';

  @override
  String get learnBack => 'Бозгашт';

  @override
  String get learnCourseTitle => 'Курс';

  @override
  String learnMetaVideos(int n) {
    return '$n дарси видеоӣ';
  }

  @override
  String learnMetaMinutes(int n) {
    return '~$n дақиқа';
  }

  @override
  String get learnProgram => 'Барномаи курс';

  @override
  String get learnRowVideo => 'Дарси видеоӣ';

  @override
  String get learnRowQuiz => 'Тест';

  @override
  String get learnRowQuizLocked => 'Пас аз видео кушода мешавад';

  @override
  String get learnRowRewardPending => 'Пас аз гузаштани тест';

  @override
  String get learnRowRewardDone => 'Ҳисоб шуд';

  @override
  String learnLessonOf(int i, int n) {
    return 'Дарси $i аз $n';
  }

  @override
  String get learnLessonTabText => 'Матни дарс';

  @override
  String get learnLessonTabMaterials => 'Маводҳо';

  @override
  String get learnWatchVideo => 'Тамошои видео';

  @override
  String get learnVideoUnavailable => 'Видео дастрас нест';

  @override
  String get learnLessonHintLocked =>
      'Видеоро то охир тамошо кунед — пас тест кушода мешавад';

  @override
  String get learnLessonHintFinish =>
      'Видеоро тамошо кардед? Барои гузаштан дарсро анҷом диҳед';

  @override
  String get learnStartTest => 'Оғози тест';

  @override
  String get learnNextLesson => 'Дарси навбатӣ';

  @override
  String get learnFinishLesson => 'Анҷоми дарс';

  @override
  String get learnFinishingLesson => 'Нигоҳ дошта истодаем…';

  @override
  String get learnBackToCourse => 'Ба курс';

  @override
  String learnTestTopBar(String name) {
    return 'Тест · $name';
  }

  @override
  String learnQuestionOf(String i, int n) {
    return 'Саволи $i аз $n';
  }

  @override
  String get learnNext => 'Минбаъд';

  @override
  String get learnFinishTest => 'Анҷоми тест';

  @override
  String get learnSubmitting => 'Санҷида истодаем…';

  @override
  String get learnCoursePassed => 'Курс гузашта шуд!';

  @override
  String get learnTestPassed => 'Тест супорида шуд!';

  @override
  String get learnPassedText => 'Кори олӣ. Холҳо аллакай дар тавозуни шумо.';

  @override
  String get learnPassedTextNoReward => 'Кори олӣ!';

  @override
  String learnScoreOf(int score, int total) {
    return '$score аз $total';
  }

  @override
  String get learnCorrectAnswers => 'ҷавоби дуруст';

  @override
  String get learnOpenWallet => 'Кушодани ҳамён';

  @override
  String get learnToOtherCourses => 'Ба курсҳои дигар';

  @override
  String get learnContinueCourse => 'Идомаи курс';

  @override
  String get learnFailedTitle => 'Қариб буд';

  @override
  String get learnFailedText =>
      'Ҷавобҳои дуруст кофӣ нестанд. Дарсро аз нав бинед ва боз кӯшиш кунед — холҳо шуморо интизоранд.';

  @override
  String learnRewardStillAvailable(int n) {
    return '+$n IQC ҳанӯз дастрас аст';
  }

  @override
  String get learnCanRetry => 'Тестро аз нав супоридан мумкин аст';

  @override
  String get learnRewatchLesson => 'Дарсро аз нав дидан';

  @override
  String get learnRetryTest => 'Тестро боз супоридан';

  @override
  String rxHomeGreeting(String name) {
    return 'Салом, $name!';
  }

  @override
  String get rxHomeSubtitle => 'Ҳолатҳои таъинотро сабт кунед';

  @override
  String get rxHomeBellLabel => 'Огоҳиномаҳо';

  @override
  String get rxHomeBellUnread => 'Огоҳиномаҳо, навҳо ҳастанд';

  @override
  String rxHomeStatQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квести фаъол',
    );
    return '$_temp0';
  }

  @override
  String get rxHomeStatApproved => 'бланки тасдиқшуда';

  @override
  String get rxHomeStatPending => 'дар санҷиш';

  @override
  String get rxHomeRecent => 'Бланкҳои охирин';

  @override
  String get rxHomeAllRecipes => 'Ҳамаи бланкҳо';

  @override
  String rxQuestProgress(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal бланк',
    );
    return '$done аз $_temp0';
  }

  @override
  String rxQuestLeft(int n) {
    return 'Боз $n';
  }

  @override
  String rxQuestDone(int pct) {
    return 'Иҷро шуд $pct%';
  }

  @override
  String rxRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get rxRewardVoucher => 'Ваучер';

  @override
  String get rxWaitValue => '~24 соат';

  @override
  String get rxWaitCaption => 'интизорӣ';

  @override
  String get rxSoon => 'Ба наздикӣ';

  @override
  String get rxSoonCaption => 'ҳисобкунӣ';

  @override
  String get rxRetake => 'Аз нав гирифтан';

  @override
  String get rxRetakeRecipe => 'Бланкро аз нав гирифтан';

  @override
  String rxMeta(String date, int n) {
    return '$date · $n акс';
  }

  @override
  String rxListCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n бланк',
    );
    return '$_temp0';
  }

  @override
  String get rxTabPending => 'Дар санҷиш';

  @override
  String get rxTabDone => 'Анҷомёфта';

  @override
  String get rxFilterEmpty => 'Дар ин бахш ҳоло бланк нест';

  @override
  String get rxPendingHint => 'То 24 соат месанҷем';

  @override
  String get rxRejectedDefault => 'Бланк аз санҷиш нагузашт';

  @override
  String get rxEmptyTitle => 'Бланкҳои шумо дар ин ҷо пайдо мешаванд';

  @override
  String get rxEmptyText =>
      'Бланки навиштаро акс гиред — AI доруҳоро мешиносад ва пас аз санҷиш шумо IQC мегиред';

  @override
  String get rxHowTo => 'Чӣ тавр акс гирифтан лозим';

  @override
  String get rxTipWholeTitle => 'Бланк пурра';

  @override
  String get rxTipWholeText => 'Ҳамаи канорҳои варақ дар кадр';

  @override
  String get rxTipStampTitle => 'Мӯҳр ва имзо';

  @override
  String get rxTipStampText => 'Бе онҳо бланк қабул намешавад';

  @override
  String get rxTipLightTitle => 'Равшании хуб';

  @override
  String get rxTipLightText => 'Бе дурахш ва сояи телефон';

  @override
  String get rxSendFirst => 'Фиристодани бланки аввал';

  @override
  String get rxStatePendingTitle => 'Бланк дар санҷиш';

  @override
  String get rxStatePendingText =>
      'Мутахассис бланкро месанҷад. Одатан ин то 24 соат вақт мегирад';

  @override
  String get rxStateApprovedTitle => 'Бланк тасдиқ шуд';

  @override
  String get rxStateApprovedText =>
      'Ҳама чиз хуб аст. IQC ба наздикӣ ба баланс мегузаранд';

  @override
  String get rxStateRejectedTitle => 'Бланк рад шуд';

  @override
  String get rxStateRejectedHint => 'Бланкро дар равшании хуб пурра акс гиред';

  @override
  String get rxStepSent => 'Фиристода шуд';

  @override
  String get rxStepReview => 'Санҷиш';

  @override
  String get rxStepApproved => 'Тасдиқ шуд';

  @override
  String get rxStepCredited => 'Ҳисоб шуд';

  @override
  String get rxStepRejected => 'Рад шуд';

  @override
  String get rxPhotos => 'Акси бланк';

  @override
  String rxOpenPhoto(int n) {
    return 'Кушодани акси $n-и бланк';
  }

  @override
  String get rxAiLater => 'Рӯйхати доруҳо пас аз санҷиш пайдо мешавад';

  @override
  String get rxAccrual => 'Ҳисобкунӣ';

  @override
  String get rxAccrualPendingTitle => 'Пас аз тасдиқ ҳисоб мекунем';

  @override
  String get rxAccrualPendingText => 'Пас аз тасдиқи бланк';

  @override
  String get rxAccrualApprovedTitle => 'Интизори ҳисобкунӣ';

  @override
  String get rxQuests => 'Ҳисоб дар квестҳо';

  @override
  String get rxQuestsPending => 'Пас аз тасдиқи бланк пайдо мешавад';

  @override
  String get rxQuestsNone => 'Ҳоло ба ягон квест ҳисоб нашудааст';

  @override
  String get rxData => 'Маълумоти бланк';

  @override
  String get rxShowText => 'Нишон додани матни шинохташуда';

  @override
  String get rxSupport => 'Дар бораи бланк савол доред? Ба мо нависед';

  @override
  String get rxCameraClose => 'Пӯшидан';

  @override
  String get rxCameraLabel => 'Бланк';

  @override
  String get rxCameraTip => 'Мӯҳр ва имзо бояд намоён бошанд';

  @override
  String get rxCameraHold => 'Телефонро болои бланк рост нигоҳ доред';

  @override
  String get rxCameraShoot => 'Акс гирифтан';

  @override
  String get rxCameraDenied =>
      'Ба камера дастрасӣ нест. Онро дар танзимот иҷозат диҳед';

  @override
  String get rxOcrTitle => 'Матни шинохташуда';

  @override
  String get rxOcrSubtitle => 'AI акси бланкро чунин хонд';

  @override
  String get rxOcrNote =>
      'Ному насаби бемор пинҳон аст. Матн худкор шинохта шуд — хатогиҳо имконпазиранд';

  @override
  String get rxOcrEmpty => 'Матн ҳанӯз шинохта нашудааст';

  @override
  String get rxOcrEmptyText => 'Он пас аз коркарди акс дар ин ҷо пайдо мешавад';

  @override
  String get rxCopy => 'Нусха бардоштан';

  @override
  String get rxCopied => 'Матн нусхабардорӣ шуд';

  @override
  String get rxReportError => 'Хато дар матн';

  @override
  String get rxBack => 'Бозгашт';

  @override
  String get homeBellUnread => 'Огоҳиномаҳо, навҳо ҳастанд';

  @override
  String homeStatActiveQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квести фаъол',
      one: 'квести фаъол',
    );
    return '$_temp0';
  }

  @override
  String get homeStatApproved => 'чекҳои тасдиқшуда';

  @override
  String get homeStatPending => 'дар санҷиш';

  @override
  String homeQuestSales(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$done аз $goal фурӯш',
      one: '$done аз $goal фурӯш',
    );
    return '$_temp0';
  }

  @override
  String homeQuestLeft(int n) {
    return 'Боз $n';
  }

  @override
  String get homeQuestDone => 'Иҷро шуд';

  @override
  String homeRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String homeCheckMeta(int id, String date) {
    return '№$id · $date';
  }

  @override
  String get homeCheckWait => '~24 соат';

  @override
  String get homeCheckWaitCaption => 'интизорӣ';

  @override
  String get homeCheckRetake => 'Аз нав аксбардорӣ';

  @override
  String get homeMiniAppsSub => 'Сапёр ва дигар аксияҳо';

  @override
  String get homeNewTitle => 'Хуш омадед!';

  @override
  String get homeNewSubtitle => 'Се қадам — ва шумо дар барнома ҳастед';

  @override
  String get homeNewStepsLabel => 'Қадамҳои аввал';

  @override
  String homeNewStepsCount(int done, int total) {
    return '$done аз $total';
  }

  @override
  String get homeNewHeadline => 'Чеки аввалро фиристед ва IQC гиред';

  @override
  String get homeNewStepRegister => 'Бақайдгирӣ';

  @override
  String get homeNewStepDone => 'Тайёр';

  @override
  String get homeNewStepCheck => 'Чеки аввалро фиристед';

  @override
  String get homeNewStepCheckSub => 'Чеки дорухонаро акс гиред';

  @override
  String get homeNewStepCourse => 'Курси аввалро гузаред';

  @override
  String homeNewStepCourseReward(int iqc, String title) {
    return '+$iqc IQC барои «$title»';
  }

  @override
  String homeNewStepCourseSub(String title) {
    return 'Курси «$title»';
  }

  @override
  String get homeNewStepCourseAny => 'Курсҳо — дар бахши «Омӯзиш»';

  @override
  String get homeNewSendFirst => 'Фиристодани чеки аввал';

  @override
  String get homeNewCourseSection => 'Аз курс оғоз кунед';

  @override
  String get homeNewAllCourses => 'Ҳамаи курсҳо';

  @override
  String homeNewCourseLessons(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n дарс',
      one: '$n дарс',
    );
    return '$_temp0';
  }

  @override
  String homeNewCourseMinutes(int n) {
    return '~$n дақ';
  }

  @override
  String get homeNewQuestSection => 'Квест барои оғоз';

  @override
  String homeNewQuestGoal(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қуттӣ фурӯшед',
      one: '$n қуттӣ фурӯшед',
    );
    return '$_temp0';
  }

  @override
  String get homeNewQuestIqc => 'IQC ба баланс';

  @override
  String get homeNewQuestVoucher => 'ваучер барои иҷро';

  @override
  String get homeNewHint =>
      'Баланс, ваучерҳо ва мини-барномаҳо пас аз аввалин IQC пайдо мешаванд';

  @override
  String get newsBack => 'Бозгашт';

  @override
  String get newsBackToList => 'Бозгашт ба хабарҳо';

  @override
  String newsReadTime(int n) {
    return '$n дақ хондан';
  }

  @override
  String get newsEmptyText =>
      'Дар ин ҷо хабарҳои барнома ва маводи муфид пайдо мешаванд';

  @override
  String get surveyYourAnswer => 'Ҷавоби шумо';

  @override
  String surveySubmitReward(int n) {
    return 'Ҷавоб додан ва $n IQC гирифтан';
  }

  @override
  String get surveyWriteHint => 'Барои фиристодан ҷавоб нависед';

  @override
  String get surveyRatingLabel => 'Баҳо';

  @override
  String surveyRatingOf(int n, int max) {
    return '$n аз $max';
  }

  @override
  String get surveyRatingWords => 'Бад,Миёна нест,Муқаррарӣ,Хуб,Аъло';

  @override
  String surveyReward(int n) {
    return '+$n IQC';
  }

  @override
  String get surveyOnBalance => 'аллакай дар баланси шумо';

  @override
  String get surveySendFailed => 'Ҷавобро фиристодан нашуд. Боз кӯшиш кунед';

  @override
  String medrepHelloName(String name) {
    return 'Салом, $name!';
  }

  @override
  String get medrepAttrShared => 'атрибутсияи умумӣ';

  @override
  String get medrepAttrPrimary => 'атрибутсияи ибтидоӣ';

  @override
  String get medrepPeriodAll => 'Тамоми вақт';

  @override
  String get medrepPeriod30 => '30 рӯз';

  @override
  String get medrepPeriod7 => '7 рӯз';

  @override
  String medrepUnitPharm(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'фармасевт',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitChecks(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: 'чек');
    return '$_temp0';
  }

  @override
  String medrepUnitPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'қуттӣ',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuestsDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квест иҷро шуд',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квест',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPharmacies(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'дорухона',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPharmacists(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'провизор',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitChecksAllTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'чек дар тамоми вақт',
    );
    return '$_temp0';
  }

  @override
  String medrepCountChecks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n чек',
    );
    return '$_temp0';
  }

  @override
  String medrepCountPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қуттӣ',
    );
    return '$_temp0';
  }

  @override
  String medrepCountQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n квест',
    );
    return '$_temp0';
  }

  @override
  String medrepCountMedreps(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n медпред',
    );
    return '$_temp0';
  }

  @override
  String medrepCountPharmacists(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n провизор',
    );
    return '$_temp0';
  }

  @override
  String medrepCountChains(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n шабака',
    );
    return '$_temp0';
  }

  @override
  String medrepPharmaciesInPortfolio(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n дорухона дар портфел',
    );
    return '$_temp0';
  }

  @override
  String get medrepRatingByChecks => 'Рейтинг аз рӯи чекҳо';

  @override
  String get medrepRatingAll => 'Рейтинги пурра';

  @override
  String medrepPlace(int n) {
    return 'Ҷойи $n';
  }

  @override
  String medrepOutOf(int n) {
    return 'аз $n';
  }

  @override
  String medrepGapTo(int place) {
    return 'То ҷойи $place боз';
  }

  @override
  String get medrepLeader => 'Шумо пешсафи рейтинг ҳастед';

  @override
  String get medrepMostActive => 'Фаъолтаринҳо';

  @override
  String medrepAllN(int n) {
    return 'Ҳама $n';
  }

  @override
  String get medrepInviteTitle => 'Даъват ба даста';

  @override
  String get medrepInviteText =>
      'Табиб ҳангоми бақайдгирӣ калимаи рамзиро ворид мекунад. Фармасевт — бо хоҳиши худ';

  @override
  String get medrepCopyLink => 'Нусхабардории пайванд';

  @override
  String get medrepPendingSub =>
      'Интизоранд, ки шумо онҳоро ба даста илова кунед';

  @override
  String get medrepCompaniesSub => 'Шабакаҳои дорухонаҳо дар портфел';

  @override
  String get medrepDoctorsSub => 'Пешрафт аз рӯи квести бланкҳо';

  @override
  String get medrepEmptyTitle => 'Даста ҳоло холӣ аст';

  @override
  String get medrepEmptyText =>
      'Табибон ва фармасевтҳоро даъват кунед — бланкҳо, чекҳо ва омори онҳо дар ин ҷо пайдо мешаванд';

  @override
  String get medrepStep1Title => 'Калимаи рамзиро мубодила кунед';

  @override
  String get medrepStep1Text => 'Онро ҳангоми бақайдгирӣ ворид мекунанд';

  @override
  String get medrepStep2Title => 'Ҳамкор бақайд гирифта мешавад';

  @override
  String get medrepStep2Text => 'Табиб бо калимаи рамзӣ — фавран дар даста';

  @override
  String get medrepStep3Title => 'Натиҷаҳоро пайгирӣ кунед';

  @override
  String get medrepStep3Text => 'Бланкҳо ва чекҳо дар ин ҷо пайдо мешаванд';

  @override
  String get medrepUpdatedNow => 'Ҳозир нав шуд';

  @override
  String get medrepSearchHint => 'Ном, дорухона, клиника ё шаҳр';

  @override
  String get medrepFilterAll => 'Ҳама';

  @override
  String get medrepFilterActive => 'Фаъолҳо';

  @override
  String get medrepFilterPassive => 'Ғайрифаъолҳо';

  @override
  String get medrepFilterFinished => 'Анҷомёфтаҳо';

  @override
  String get medrepFilterApproved => 'Тасдиқшуда';

  @override
  String get medrepFilterRejected => 'Радшуда';

  @override
  String get medrepClear => 'Тоза кардан';

  @override
  String get medrepNotFoundTitle => 'Касе ёфт нашуд';

  @override
  String medrepNotFoundText(String query) {
    return 'Аз рӯи дархости «$query» касе нест. Имлоро санҷед ё аз рӯи дорухона ё клиника ҷустуҷӯ кунед';
  }

  @override
  String medrepNotFoundShort(String query) {
    return 'Аз рӯи дархости «$query» чизе нест. Имлоро санҷед';
  }

  @override
  String get medrepResetSearch => 'Бекор кардани ҷустуҷӯ';

  @override
  String get medrepChecksAllTime => 'Чекҳо дар тамоми вақт';

  @override
  String get medrepLastActivity => 'фаъолият';

  @override
  String get medrepAllChecks => 'Ҳамаи чекҳо';

  @override
  String medrepCheckNo(int id) {
    return 'Чеки №$id';
  }

  @override
  String medrepPacksShort(int n) {
    return '$n қут.';
  }

  @override
  String get medrepPacksUnit => 'қут.';

  @override
  String get medrepLast7Days => '7 рӯзи охир';

  @override
  String medrepMonthYear(String month, String year) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'm1': 'Январ',
      'm2': 'Феврал',
      'm3': 'Март',
      'm4': 'Апрел',
      'm5': 'Май',
      'm6': 'Июн',
      'm7': 'Июл',
      'm8': 'Август',
      'm9': 'Сентябр',
      'm10': 'Октябр',
      'm11': 'Ноябр',
      'm12': 'Декабр',
      'other': '',
    });
    return '$_temp0 $year';
  }

  @override
  String get medrepTabChecks => 'Чекҳо';

  @override
  String get medrepTabPharm => 'Фармасевтҳо';

  @override
  String get medrepTabQuests => 'Квестҳо';

  @override
  String medrepYouName(String name) {
    return 'Шумо · $name';
  }

  @override
  String get medrepYouShort => 'ШУМО';

  @override
  String medrepGapText(int place, String value) {
    return 'То ҷойи $place боз $value';
  }

  @override
  String get medrepNotRankedTitle => 'Шумо ҳоло дар рейтинг нестед';

  @override
  String get medrepNotRankedText =>
      'Ҷой аз рӯи чекҳои дастаи шумо ҳисоб карда мешавад. Аввалинашро даъват кунед — ва шумо дар рӯйхат пайдо мешавед';

  @override
  String get medrepRatingEmpty => 'Рейтинг ҳоло холӣ аст';

  @override
  String get medrepQuestsSub => 'Пешрафти провизорҳои шумо';

  @override
  String get medrepQuestRunning => 'Идома дорад';

  @override
  String medrepQuestRunningUntil(String date) {
    return 'Идома дорад · то $date';
  }

  @override
  String get medrepQuestFinished => 'Анҷом ёфт';

  @override
  String medrepQuestFinishedOn(String date) {
    return '$date анҷом ёфт';
  }

  @override
  String medrepOfN(int a, int b) {
    return '$a аз $b';
  }

  @override
  String get medrepParticipating => 'провизор иштирок мекунад';

  @override
  String medrepSoldOf(int n) {
    return 'аз $n фурӯхта шуд';
  }

  @override
  String medrepOfPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'аз $n қуттӣ',
    );
    return '$_temp0';
  }

  @override
  String medrepGoalPercent(int p) {
    return '$p% мақсад';
  }

  @override
  String medrepPacksLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қуттӣ монд',
    );
    return '$_temp0';
  }

  @override
  String get medrepGoalDone => 'Мақсад иҷро шуд';

  @override
  String get medrepStatParticipating => 'иштирок мекунанд';

  @override
  String get medrepStatCompleted => 'иҷро карданд';

  @override
  String get medrepStatIdle => 'оғоз накарданд';

  @override
  String get medrepPharmacistsSection => 'Провизорҳо';

  @override
  String medrepDoneOf(int a, int b) {
    return 'Иҷро кард · $a аз $b';
  }

  @override
  String medrepMoreRows(int n, int packs) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Боз $n провизор · $packs қут.',
    );
    return '$_temp0';
  }

  @override
  String get medrepShow => 'Нишон додан';

  @override
  String get medrepHide => 'Пӯшидан';

  @override
  String get medrepPendingText =>
      'Интизоранд, ки шумо онҳоро ба даста илова кунед';

  @override
  String medrepFollowedLink(String ago) {
    return 'Тавассути пайванд гузашт · $ago';
  }

  @override
  String get medrepAgoNow => 'ҳозир';

  @override
  String medrepAgoMinutes(int n) {
    return '$n дақиқа пеш';
  }

  @override
  String medrepAgoHours(int n) {
    return '$n соат пеш';
  }

  @override
  String get medrepAgoYesterday => 'дирӯз';

  @override
  String medrepAgoDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n рӯз пеш',
    );
    return '$_temp0';
  }

  @override
  String get medrepChainsTitle => 'Шабакаҳои дорухонаҳо';

  @override
  String get medrepChainSearchHint => 'Номи шабака';

  @override
  String medrepChainMeta(String city, int a, int p) {
    return '$city · $a дор. · $p пров.';
  }

  @override
  String get medrepChainKind => 'шабакаи дорухонаҳо';

  @override
  String get medrepPharmaciesSection => 'Дорухонаҳо';

  @override
  String get medrepMakers => 'Ширкатҳои истеҳсолкунанда';

  @override
  String medrepRewardTitle(String name) {
    return 'Ҳавасмандкунӣ: $name';
  }

  @override
  String get medrepRewardRating => 'Баҳо';

  @override
  String get medrepRewardMessage => 'Паём';

  @override
  String get medrepOptional => '· ихтиёрӣ';

  @override
  String get medrepRewardHint => 'Масалан: ташаккур барои фурӯши аъло!';

  @override
  String get medrepRewardNotice => 'Провизор бо паёми шумо огоҳинома мегирад';

  @override
  String medrepRewardSend(int n) {
    return 'Фиристодани баҳои $n';
  }

  @override
  String medrepRewardStars(int n) {
    return 'Баҳои $n аз 5';
  }

  @override
  String authVersion(String version) {
    return 'версияи $version';
  }

  @override
  String get authLoading => 'Боргирӣ';

  @override
  String get authWelcomeTitle => 'Ба PharmIQ хуш омадед';

  @override
  String get authWelcomeSubtitle =>
      'Омӯзиш, квестҳо ва мукофотҳо барои фармасевтҳо ва табибон — дар як барнома';

  @override
  String get authAppLanguage => 'Забони барнома';

  @override
  String get authStart => 'Оғоз кардан';

  @override
  String get authHaveAccount => 'Аллакай аккаунт доред?';

  @override
  String authLanguageLabel(String language) {
    return 'Забон: $language';
  }

  @override
  String get authLoginSubtitle =>
      'Омӯзиш ва мукофотҳо барои фармасевтҳо ва табибон';

  @override
  String get authSmsHint => 'Рамзро тавассути SMS мефиристем';

  @override
  String get authPhoneNotRegistered =>
      'Ин рақам сабт нашудааст. Аккаунт созед — ин як дақиқа вақт мегирад';

  @override
  String get authOtherNumber => 'Рақами дигар ворид кардан';

  @override
  String authCodeSentTo(String phone) {
    return 'Ба $phone фиристодем';
  }

  @override
  String get authChange => 'Тағйир додан';

  @override
  String get authCodeGroup => 'Рамзи 6-рақама';

  @override
  String get authCodeAuto =>
      'Ҳамин ки рамзро ворид кунед, худкор ворид мешавем';

  @override
  String authResendIn(String time) {
    return 'Пас аз $time аз нав фиристодан';
  }

  @override
  String get authRoleSubtitle =>
      'Шумо якчанд нақш доред — интихоб кунед, ки бо кадомаш ворид шавед';

  @override
  String get authRoleSubDoctor => 'Бланкҳо, квестҳо, омӯзиш ва ҳамён';

  @override
  String get authRoleHint =>
      'Нақшро дар профил дар ҳар вақт иваз кардан мумкин аст';

  @override
  String get authRegWhoTitle => 'Шумо кистед?';

  @override
  String get authRegWhoSubtitle =>
      'Квестҳо ва курсҳоро барои касби шумо нишон медиҳем';

  @override
  String get authRegPharmacistSub => 'Провизор, корманди дорухона';

  @override
  String get authRegDoctorSub => 'Мутахассиси тандурустӣ';

  @override
  String get authContinue => 'Идома додан';

  @override
  String get authBack => 'Бозгашт';

  @override
  String authChooseField(String label) {
    return 'Интихоб кунед: $label';
  }

  @override
  String authMultiHint(int n) {
    return 'Якчандтоашро интихоб кардан мумкин · интихоб шуд: $n';
  }

  @override
  String get authMultiHintEmpty => 'Якчандтоашро интихоб кардан мумкин';

  @override
  String get authConsent => 'Ба коркарди маълумоти шахсӣ розӣ ҳастам — ';

  @override
  String get authFillRequired =>
      'Майдонҳои ситорачадорро пур кунед ва розигӣ диҳед';

  @override
  String authRegWelcome(String name) {
    return 'Ба PharmIQ хуш омадед, $name!';
  }

  @override
  String get authGoHome => 'Ба саҳифаи асосӣ';

  @override
  String get authCityTitle => 'Шаҳр';

  @override
  String get authCitySearch => 'Ёфтани шаҳр';

  @override
  String get authSearch => 'Ҷустуҷӯ';

  @override
  String get authNothingFound => 'Ҳеҷ чиз ёфт нашуд';

  @override
  String get authMapTitle => 'Дорухона дар харита';

  @override
  String get authMapStubTitle => 'Харита ба наздикӣ пайдо мешавад';

  @override
  String get authMapStubBody =>
      'Ҳоло номи дорухонаро дар майдони «Дорухона / ҷойи кор» нависед — қайд кардани он дар харита дар навсозии оянда дастрас мешавад';

  @override
  String get authUpdateTitle => 'Барномаро навсозӣ кардан лозим аст';

  @override
  String get authUpdateBody =>
      'Ин версия дигар дастгирӣ намешавад. Барои идома PharmIQ-ро навсозӣ кунед — тавозун ва пешрафт нигоҳ дошта мешаванд';

  @override
  String get authUpdateButton => 'Навсозии барнома';

  @override
  String authUpdateVersions(String current, String required) {
    return 'Версияи шумо $current · $required ё навтар лозим аст';
  }

  @override
  String authUpdateRequired(String required) {
    return 'Версияи $required ё навтар лозим аст';
  }

  @override
  String get authPushTitle => 'Ҳисобшавиҳоро аз даст надиҳед';

  @override
  String get authPushBody =>
      'Вақте ки чек тафтиш мешавад, IQC ба тавозун меояд ё квести нав пайдо мешавад, хабар медиҳем';

  @override
  String get authPushNow => 'ҳозир';

  @override
  String get authPushSample1Title => '+144 IQC ҳисоб шуд';

  @override
  String get authPushSample1Body => 'Чек №23156 · Цинкорот №50';

  @override
  String get authPushSample2Time => '2 соат пеш';

  @override
  String get authPushSample2Title => 'Квести нав';

  @override
  String get authPushSample2Body => 'Доритритсин N10 · ваучери Korzinka';

  @override
  String get authPushEnable => 'Фаъол кардани огоҳиномаҳо';

  @override
  String get authPushLater => 'Ҳоло не';

  @override
  String checksSentCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n чек фиристода шуд',
      one: '$n чек фиристода шуд',
    );
    return '$_temp0';
  }

  @override
  String get checksSectionRetake => 'Бояд аз нав сурат гирифт';

  @override
  String get checksSectionHistory => 'Таърих';

  @override
  String get checksRetake => 'Аз нав гирифтан';

  @override
  String checksRetakeA11y(int id) {
    return 'Чеки №$id-ро аз нав сурат гирифтан';
  }

  @override
  String get checksRetakeTipBold =>
      'Барои он ки чек аз бори аввал қабул шавад:';

  @override
  String get checksRetakeTip =>
      'тамоми чек дар кадр, рост, бе ҷило ва дар равшании хуб.';

  @override
  String checksNumberDate(int id, String date) {
    return '№$id · $date';
  }

  @override
  String checksDatePhotos(String date, int n) {
    return '$date · $n акс';
  }

  @override
  String checksPhotoCount(int n) {
    return '$n акс';
  }

  @override
  String get checksWaitValue => '~24 соат';

  @override
  String get checksWaitCaption => 'одатан';

  @override
  String checksShowAll(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ҳамаи $n чекро нишон додан',
      one: 'Ҳамаи $n чекро нишон додан',
    );
    return '$_temp0';
  }

  @override
  String get checksSendCheck => 'Фиристодани чек';

  @override
  String checksMonth(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Январ',
      'm2': 'Феврал',
      'm3': 'Март',
      'm4': 'Апрел',
      'm5': 'Май',
      'm6': 'Июн',
      'm7': 'Июл',
      'm8': 'Август',
      'm9': 'Сентябр',
      'm10': 'Октябр',
      'm11': 'Ноябр',
      'm12': 'Декабр',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get checksUploadingRow => 'Чек фиристода мешавад…';

  @override
  String get checksUploadQueued => 'Дар навбати фиристодан';

  @override
  String get checksUploadAuto => 'Ҳангоми пайдо шудани алоқа худкор мефиристем';

  @override
  String get checksEmptyTitle => 'Чекҳои шумо дар ин ҷо пайдо мешаванд';

  @override
  String get checksEmptyText =>
      'Чекро сурат гиред — пас аз санҷиш натиҷаи шумо ба ҳисоб гирифта мешавад';

  @override
  String get checksHowToTitle => 'Чӣ тавр сурат гирифтан';

  @override
  String get checksHow1Title => 'Тамоми чек дар кадр';

  @override
  String get checksHow1Text => 'Ҳар чор кунҷ намоёнанд';

  @override
  String get checksHow2Title => 'Рост, бе қат';

  @override
  String get checksHow2Text => 'Чекро ба рӯи миз гузоред';

  @override
  String get checksHow3Title => 'Равшании хуб';

  @override
  String get checksHow3Text => 'Бе ҷило ва сояи телефон';

  @override
  String get checksSendFirst => 'Фиристодани чеки аввал';

  @override
  String get checksPickSubtitle => 'ЗС доруҳоро аз рӯи акс муайян мекунад';

  @override
  String checksPhotosOf(int n, int max) {
    return 'Акс: $n аз $max';
  }

  @override
  String get checksClose => 'Пӯшидан';

  @override
  String get checksTipWhole => 'Тамоми чек';

  @override
  String get checksTipFlat => 'Рост';

  @override
  String get checksTipGlare => 'Бе ҷило';

  @override
  String get checksTakePhotoCta => 'Аз чек сурат гирифтан';

  @override
  String get checksPickGallery => 'Аз галерея интихоб кардан';

  @override
  String get checksRemovePhoto => 'Нест кардани акс';

  @override
  String get checksAddMore => 'Боз акс';

  @override
  String get checksAddMoreA11y => 'Боз акс илова кардан';

  @override
  String get checksPhotoWaiting => 'Дар интизор';

  @override
  String get checksPhotosHint =>
      'Санҷед: рақами чек, сана ва доруҳо хуб намоёнанд';

  @override
  String get checksSending => 'Фиристода мешавад…';

  @override
  String get checksSentTitle => 'Чек фиристода шуд';

  @override
  String get checksSentText =>
      'Санҷиш одатан то 24 соат давом мекунад. Ҳангоми ҳисоб шудани IQC хабар медиҳем';

  @override
  String get checksDone => 'Тайёр';

  @override
  String get checksSendAnother => 'Боз чек фиристодан';

  @override
  String get checksSendFailed => 'Аксро нигоҳ доштан нашуд. Боз кӯшиш кунед';

  @override
  String get checksCamTitle => 'Ба камера иҷозат диҳед';

  @override
  String get checksCamText =>
      'Камера барои сурат гирифтани чекҳо ва бланкҳо лозим аст';

  @override
  String get checksCamPoint1 =>
      'Танҳо вақте ки шумо тугмаро пахш мекунед, сурат мегирем';

  @override
  String get checksCamPoint2 => 'Аксҳои дигарро намебинем ва нигоҳ намедорем';

  @override
  String get checksCamPoint3 =>
      'Иҷозатро дар танзимоти телефон хомӯш кардан мумкин аст';

  @override
  String get checksCamAllow => 'Иҷозат додан';

  @override
  String get checksCamLater => 'Ҳоло не';

  @override
  String get checksCamDeniedTitle => 'Ба камера дастрасӣ нест';

  @override
  String get checksCamDeniedText =>
      'Бе камера аз чек сурат гирифтан ғайриимкон аст. Дар танзимоти телефон иҷозатро фаъол кунед — ин 10 сония вақт мегирад';

  @override
  String get checksCamDeniedStep1 => '«Танзимот» → PharmIQ-ро кушоед';

  @override
  String get checksCamDeniedStep2 => 'Калиди «Камера»-ро фаъол кунед';

  @override
  String get checksCamDeniedStep3 => 'Ба барнома баргардед';

  @override
  String get checksCamOpenSettings => 'Кушодани танзимот';

  @override
  String get checksCamPickGallery => 'Интихоби акс аз галерея';

  @override
  String get checksCamSettingsManual =>
      'Танзимоти телефон → Барномаҳо → PharmIQ → Иҷозатҳоро кушоед';

  @override
  String get checksHeroPendingTitle => 'Чек дар санҷиш аст';

  @override
  String get checksHeroPendingText =>
      'Мутахассис чекро месанҷад. Одатан ин то 24 соат вақт мегирад';

  @override
  String get checksHeroApprovedTitle => 'Чек тасдиқ шуд';

  @override
  String get checksHeroApprovedText =>
      'Ҳама чиз дуруст аст. IQC ба зудӣ ба баланс ворид мешавад';

  @override
  String get checksHeroCreditedTitle => 'IQC ҳисоб шуд';

  @override
  String get checksHeroCreditedText =>
      'Холҳо ба баланси шумо гузаронида шуданд';

  @override
  String get checksHeroRejectedTitle => 'Чек рад шуд';

  @override
  String get checksHeroRejectedText =>
      'Акси равшан гиред — холҳоро ҳанӯз гирифтан мумкин аст';

  @override
  String get checksStepSent => 'Фиристода шуд';

  @override
  String get checksStepReview => 'Санҷиш';

  @override
  String get checksStepApproved => 'Тасдиқ шуд';

  @override
  String get checksStepCredited => 'Ҳисоб шуд';

  @override
  String get checksPhotosTitle => 'Акси чек';

  @override
  String checksOpenPhoto(int n) {
    return 'Кушодани акси $n';
  }

  @override
  String get checksAiPending => 'Рӯйхати доруҳо пас аз санҷиш пайдо мешавад';

  @override
  String get checksAccrualTitle => 'Ҳисобкунӣ';

  @override
  String get checksAccrualPendingTitle => 'Пас аз тасдиқ ҳисоб мекунем';

  @override
  String get checksAccrualPendingText => 'Пас аз тасдиқи чек';

  @override
  String get checksAccrualApprovedTitle => 'Интизори ҳисобкунӣ';

  @override
  String get checksAccrualSoon => 'Ба зудӣ';

  @override
  String get checksAccrualCreditedTitle => 'Ба баланс гузаронида шуд';

  @override
  String get checksQuestDone => 'Квест иҷро шуд ✓';

  @override
  String get checksSupport => 'Дар бораи чек савол доред? Ба мо нависед';

  @override
  String get checksRetakeCheck => 'Аз чек аз нав сурат гирифтан';

  @override
  String checksViewerPhotoOf(int i, int n) {
    return 'Акси $i аз $n';
  }

  @override
  String get checksViewerSave => 'Нигоҳ доштани акс';

  @override
  String get checksViewerZoomHint =>
      'Барои калон кардан ангуштонро аз ҳам кушоед';

  @override
  String get profileSectionContact => 'Алоқа';

  @override
  String get profilePersonalDataRow => 'Маълумоти шахсӣ';

  @override
  String get profileTgNotLinked => 'Пайваст нашудааст';

  @override
  String get profileTgLink => 'Пайваст кардан';

  @override
  String get profileTgLinkedToast => 'Telegram пайваст шуд';

  @override
  String get profileTgNotYet =>
      'Telegram ҳанӯз пайваст нашудааст — дар бот анҷом диҳед';

  @override
  String get profileAppearanceTitle => 'Намуди зоҳирӣ';

  @override
  String get profileNotifOn => 'Фаъол';

  @override
  String get profileNotifOff => 'Хомӯш';

  @override
  String get profileDeleteAccount => 'Нест кардани аккаунт';

  @override
  String profileVersion(String version) {
    return 'PharmIQ · версияи $version';
  }

  @override
  String get profileEditAria => 'Таҳрири профил';

  @override
  String get profileNewUser => 'Корбари нав';

  @override
  String get profilePharmacy => 'Дорухона';

  @override
  String get profileClinic => 'Клиника';

  @override
  String get profileCompany => 'Ширкат';

  @override
  String get profileNoPharmacy => 'Дорухона нишон дода нашудааст';

  @override
  String get profileNoClinic => 'Клиника нишон дода нашудааст';

  @override
  String get profileNoCompany => 'Ширкат нишон дода нашудааст';

  @override
  String get profileNotSpecified => 'Нишон дода нашудааст';

  @override
  String get profileNameNotSet => 'Ном нишон дода нашудааст';

  @override
  String get profileActivateTitle => 'Профилро фаъол созед';

  @override
  String profileActivateProgress(int done, int total) {
    return '$done аз $total';
  }

  @override
  String get profileActivateBody =>
      'Пас аз фаъолсозӣ квестҳо ва ҳисобкунии IQC кушода мешаванд';

  @override
  String get profileStepPhone => 'Телефон тасдиқ шуд';

  @override
  String get profileStepPharmacy => 'Дорухонаро нишон диҳед';

  @override
  String get profileStepClinic => 'Клиникаро нишон диҳед';

  @override
  String get profileStepProfile => 'Профилро пур кунед';

  @override
  String get profileStepWorkHint => 'Барои квестҳои минтақаи шумо лозим аст';

  @override
  String get profileStepProfileHint => 'Ном ва ҷои кор';

  @override
  String get profileStepSpecify => 'Нишон додан';

  @override
  String get profileStepTelegram => 'Telegram-ро пайваст кунед';

  @override
  String get profileStepTelegramHint => 'Огоҳиномаҳо мефиристем';

  @override
  String get profileStepAdmin => 'Фаъолсозӣ аз ҷониби маъмур';

  @override
  String get profileStepAdminHint =>
      'Одатан дар давоми як рӯз пас аз пур кардан';

  @override
  String get profileActivateHelp =>
      'Оид ба фаъолсозӣ савол доред? Ба мо нависед';

  @override
  String get profileRoleSheetTitle => 'Иваз кардани нақш';

  @override
  String get profileRoleSheetSubtitle =>
      'Нақшҳои барои аккаунти шумо тасдиқшуда';

  @override
  String get profileRoleCurrent => 'Ҷорӣ';

  @override
  String get profileRoleDescPharmacist => 'Чекҳо, квестҳо, омӯзиш ва ҳамён';

  @override
  String get profileRoleDescDoctor => 'Бланкҳо, квестҳо, омӯзиш ва ҳамён';

  @override
  String get profileRoleDescMedrep => 'Портфели провизорҳо ва рейтинг';

  @override
  String get profileRoleDescBrand => 'Квестҳои бренд, маҳсулот ва фурӯш';

  @override
  String get profileRoleNote =>
      'Барнома бо бахшҳои нақши интихобшуда кушода мешавад. Тавозуни IQC ва ваучерҳо нигоҳ дошта мешаванд';

  @override
  String profileRoleSwitch(String role) {
    return 'Гузаштан ба «$role»';
  }

  @override
  String get profileClose => 'Пӯшидан';

  @override
  String get profileFieldName => 'Ному насаб';

  @override
  String get profilePhoneLockedHint =>
      'Рақам барои воридшавӣ лозим аст — бо тасдиқи SMS иваз карда мешавад';

  @override
  String get profileFieldCity => 'Шаҳр';

  @override
  String get profileCityHint => 'Шаҳрро интихоб кунед';

  @override
  String get profileWorkplaceHint => 'Ном ё рақам';

  @override
  String get profileMapButton => 'Дорухонаро дар харита дақиқ кардан';

  @override
  String get profileMapSoon =>
      'Интихоби дорухона дар харита ба наздикӣ пайдо мешавад';

  @override
  String get profileSave => 'Нигоҳ доштани тағйирот';

  @override
  String get profileFieldRequired => 'Ин майдонро пур кунед';

  @override
  String get profileEditSent => 'Дархост ба дастгирӣ фиристода шуд';

  @override
  String get profileEditSentHint => 'Пас аз санҷиш маълумотро навсозӣ мекунем';

  @override
  String get profileEditRequest =>
      'Хоҳиш мекунам маълумоти профилро навсозӣ кунед:';

  @override
  String get profileEditNoChanges => 'Тағйирот нест';

  @override
  String get profilePrivacyShort => 'Махфият';

  @override
  String get profilePrivacyHeadline =>
      'Мо бо маълумоти шумо чӣ гуна муносибат мекунем';

  @override
  String get profilePrivacyCollectTitle => 'Мо кадом маълумотро ҷамъ мекунем';

  @override
  String get profilePrivacyCollectBody =>
      'Ном, рақами телефон, шаҳр ва дорухона ё клиника. Суратҳои чекҳо ва бланкҳое, ки шумо мефиристед. Натиҷаҳои курсҳо ва тестҳо.';

  @override
  String get profilePrivacyWhyTitle => 'Онҳо барои чӣ лозиманд';

  @override
  String get profilePrivacyWhyBody =>
      'Барои ҳисоб кардани IQC барои чекҳо ва бланкҳо, ба ҳисоб гирифтани квестҳо, додани ваучерҳо ва нишон додани омори шумо.';

  @override
  String get profilePrivacyWhoTitle => 'Онҳоро кӣ мебинад';

  @override
  String get profilePrivacyWhoBody =>
      'Намояндаи тиббии шумо шумораи чекҳо ва квестҳои шуморо мебинад. Маълумоти беморон дар бланкҳо пинҳон аст — танҳо ҳарфҳои аввал намоёнанд.';

  @override
  String get profilePrivacyStoreTitle => 'Мо онҳоро чӣ гуна нигоҳ медорем';

  @override
  String get profilePrivacyStoreBody =>
      'Маълумот тавассути пайвасти ҳифзшуда интиқол дода мешавад ва дар серверҳои ширкат нигоҳ дошта мешавад.';

  @override
  String get profilePrivacyDeleteTitle =>
      'Чӣ тавр маълумотро нест кардан мумкин';

  @override
  String get profilePrivacyDeleteBody =>
      'Дар профил → «Нест кардани аккаунт». Маълумот якҷоя бо тавозун ва ваучерҳо нест карда мешавад.';

  @override
  String get profilePrivacyFullLink => 'Матни пурраи сиёсат';

  @override
  String get profilePrivacyContents => 'Мундариҷа';

  @override
  String profilePrivacyReadTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n дақиқа хондан',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyRuOnly => 'Ҳуҷҷат танҳо бо забони русӣ дастрас аст';

  @override
  String get profileDeleteLose =>
      'Ин амалро бекор кардан мумкин нест. Шумо аз даст медиҳед:';

  @override
  String profileDeleteLoseIqc(String amount) {
    return '$amount IQC дар тавозун';
  }

  @override
  String get profileDeleteLoseIqcHint => 'бе имкони иваз месӯзанд';

  @override
  String profileDeleteLoseVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучери фаъол',
    );
    return '$_temp0';
  }

  @override
  String get profileDeleteLoseVouchersHint => 'аз кор мемонанд';

  @override
  String get profileDeleteLoseProgress => 'Пешрафт дар квестҳо ва курсҳо';

  @override
  String get profileDeleteLoseProgressHint => 'нест карда мешавад';

  @override
  String get profileDeleteTypePrompt => 'Барои тасдиқ ворид кунед';

  @override
  String get profileDeleteWord => 'НЕСТ КАРДАН';

  @override
  String get profileDeleteForever => 'Барои ҳамеша нест кардан';

  @override
  String get profileDeleteKeep => 'Аккаунтро нигоҳ доштан';

  @override
  String get profileDeleting => 'Нест карда истодаем…';

  @override
  String get profileDeleteFailed =>
      'Аккаунтро нест кардан нашуд. Боз кӯшиш кунед';

  @override
  String get profileDeletedTitle => 'Аккаунт нест карда шуд';

  @override
  String get profileDeletedBody =>
      'Мо профил, тавозуни IQC, ваучерҳо ва таърихи шуморо нест кардем. Ташаккур, ки бо мо будед';

  @override
  String get profileDeletedCardTitle => 'Фикратонро иваз кардед?';

  @override
  String get profileDeletedCardBody =>
      'Бо ҳамон рақам аз нав сабти ном шудан мумкин аст — аммо тавозуни пешинаро баргардондан ғайриимкон аст';

  @override
  String get profileDeletedNew => 'Сохтани аккаунти нав';

  @override
  String get profileErrorGeneric => 'Хатогӣ рух дод. Боз кӯшиш кунед';

  @override
  String notifNewCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n нав',
    );
    return '$_temp0';
  }

  @override
  String get notifAllRead => 'Ҳама хонда шуд';

  @override
  String get notifReadAll => 'Ҳамаро хондан';

  @override
  String get notifFilterAll => 'Ҳама';

  @override
  String get notifFilterChecks => 'Чекҳо';

  @override
  String get notifFilterRecipes => 'Бланкаҳо';

  @override
  String get notifFilterQuests => 'Квестҳо';

  @override
  String get notifFilterLearning => 'Омӯзиш';

  @override
  String get notifCategoryEmpty => 'Дар ин категория ҳоло чизе нест';

  @override
  String get notifNewAria => 'Нав';

  @override
  String get notifMarkedRead => 'Хонда шуд';

  @override
  String get notifEmptySubtitle => 'Ҳоло чизи нав нест';

  @override
  String get notifEmptyQuietTitle => 'Ин ҷо ҳоло ором аст';

  @override
  String get notifEmptyQuietText =>
      'Вақте ки чекро санҷем, IQC ҳисоб кунем ё ваучер диҳем, хабар медиҳем';

  @override
  String get notifConfigure => 'Танзими огоҳиномаҳо';

  @override
  String get notifSettingsSubtitle => 'Ба телефон чӣ фиристодан лозим';

  @override
  String get notifSettingsChecksHint => 'Тасдиқ, радд, ҳисобкунии IQC';

  @override
  String get notifSettingsQuestsHint => 'Квестҳои нав, иҷро, ваучерҳо';

  @override
  String get notifSettingsLearningHint => 'Курсҳои нав ва ёдраскуниҳо';

  @override
  String get notifSettingsMarketingHint =>
      'Хабарҳои бозор ва пешниҳодҳои махсус';

  @override
  String get notifSettingsFootnote =>
      'Паёмҳои муҳим дар бораи аккаунт ва амният ҳамеша меоянд';

  @override
  String get notifSaveFailed => 'Танзимотро нигоҳ доштан нашуд';

  @override
  String get supportHeaderTitle => 'Дастгирии PharmIQ';

  @override
  String get supportHeaderSubtitle => 'Одатан дар давоми як соат ҷавоб медиҳем';

  @override
  String get supportBackAria => 'Бозгашт ба профил';

  @override
  String get supportToday => 'Имрӯз';

  @override
  String get supportYesterday => 'Дирӯз';

  @override
  String get supportGreeting => 'Салом! Чӣ тавр кӯмак карда метавонем?';

  @override
  String get supportFaqTitle => 'Саволҳои маъмул';

  @override
  String get supportFaq1 => 'Барои чек IQC ҳисоб нашуд';

  @override
  String get supportFaq2 => 'Чек рад шуд — чаро?';

  @override
  String get supportFaq3 => 'Чӣ тавр ваучер гирифтан мумкин';

  @override
  String get supportFaq4 => 'Мушкилот бо курс ё тест';

  @override
  String get supportMessageHint => 'Паём';

  @override
  String get supportAttachAria => 'Замима кардани сурат ё чек';

  @override
  String get supportSendAria => 'Фиристодан';

  @override
  String get supportTypingAria => 'Дастгирӣ менависад';

  @override
  String get supportAttachCheckTitle => 'Замима кардани чек';

  @override
  String get supportAttachRecipeTitle => 'Замима кардани бланк';

  @override
  String get supportAttachEmpty => 'Ҳоло чизе барои замима нест';

  @override
  String get supportAttachRemove => 'Хориҷ кардани замима';

  @override
  String get supportAttachUnavailable =>
      'Замимаҳо барои чекҳо ва бланкаҳо дастрасанд';

  @override
  String get supportSendFailed => 'Паёмро фиристодан нашуд';

  @override
  String get walletFaceValue => 'Арзиш';

  @override
  String get profileBack => 'Бозгашт';

  @override
  String homeNewCourseVideo(int n) {
    return 'Видео ~$n дақ';
  }

  @override
  String get homeNewCourseQuiz => 'тест';

  @override
  String get authHintFullName => 'Насаб Ном Номи падар';

  @override
  String get authHintPharmacy => 'Масалан, Дорухонаи №12';

  @override
  String get authHintClinic => 'Номи муассисаи тиббӣ';

  @override
  String get authMapCardTitle => 'Дорухонаро дар харита қайд кардан';

  @override
  String get authMapCardSub => 'Барои квестҳои ноҳияи шумо лозим аст';

  @override
  String get authMapCardButton => 'Қайд кардан';

  @override
  String get rxStateCreditedTitle => 'IQC ҳисоб шуданд';

  @override
  String get rxStateCreditedText => 'Холҳо ба баланси шумо гузаронида шуданд';

  @override
  String get rxAccrualCreditedTitle => 'Ба баланс гузаронида шуд';

  @override
  String get rxCreditedCaption => 'ҳисоб шуд';

  @override
  String rxListCountEarned(String count, int n) {
    return '$count · $n IQC гирифта шуд';
  }

  @override
  String get questsRewardPoints => 'Холҳо ба баланс';

  @override
  String get walletMonthsIn =>
      'январ,феврал,март,апрел,май,июн,июл,август,сентябр,октябр,ноябр,декабр';

  @override
  String walletEarnedIn(String month) {
    return 'Дар моҳи $month ҳисоб шуд';
  }

  @override
  String walletSpentIn(String month) {
    return 'Дар моҳи $month сарф шуд';
  }

  @override
  String get profileRoleShortMedrep => 'Намояндаи тиббӣ';

  @override
  String get notifActionQr => 'Нишон додани QR';

  @override
  String get notifActionRetake => 'Аз нав суратгирӣ';

  @override
  String homeNewCourseQuizQuestions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'тест $n савол',
      one: 'тест $n савол',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyDraft =>
      'Нусхаи пешакӣ. Матни ниҳоиро ҳуқуқшинос тасдиқ мекунад';

  @override
  String get notifSettingsChecksOnly => 'Ҳолати чекҳо';

  @override
  String get notifSettingsRecipesOnly => 'Ҳолати бланкаҳо';

  @override
  String get tourWelcomeTitle => 'Ба PharmIQ Academy хуш омадед!';

  @override
  String get tourWelcomeText =>
      'Нишон медиҳем, ки чӣ дар куҷост ва чӣ тавр IQC ба даст овардан мумкин аст. Ин камтар аз як дақиқа вақт мегирад.';

  @override
  String get tourWelcomeTextDoc =>
      'Нишон медиҳем, ки чӣ дар куҷост ва чӣ тавр барои бланкҳо IQC гирифтан мумкин аст. Ин камтар аз як дақиқа вақт мегирад.';

  @override
  String get tourStart => 'Оғоз кардан';

  @override
  String get tourSkipAll => 'Омӯзишро гузаронидан';

  @override
  String tourStepOf(int n, int total) {
    return 'Қадами $n аз $total';
  }

  @override
  String get tourSkip => 'Гузаронидан';

  @override
  String get tourNext => 'Минбаъд';

  @override
  String get tourDoneStep => 'Тайёр';

  @override
  String get tourBack => 'Бозгашт';

  @override
  String get tourBalanceTitle => 'Баланси IQC';

  @override
  String get tourBalanceText =>
      'Ин ҷо IQC-и шумо — холҳо барои чекҳои тасдиқшуда, квестҳо ва пурсишҳо. Тугмаи «Ҳамён» таърих ва ивази ваучерҳоро мекушояд.';

  @override
  String get tourBalanceTextDoc =>
      'Ин ҷо IQC-и шумо — холҳо барои бланкҳои тасдиқшуда, квестҳо ва пурсишҳо. Тугмаи «Ҳамён» таърих ва ивази ваучерҳоро мекушояд.';

  @override
  String get tourSendTitle => 'Чек фиристед';

  @override
  String get tourSendText =>
      'Чекро акс гиред — ЗС доруҳоро муайян мекунад. Пас аз санҷиш ба баланс IQC меояд.';

  @override
  String get tourSendTitleDoc => 'Бланк фиристед';

  @override
  String get tourSendTextDoc =>
      'Бланкро акс гиред — ЗС доруҳоро муайян мекунад. Пас аз санҷиш ба баланс IQC меояд.';

  @override
  String get tourQuestsTitle => 'Квестҳои фаъол';

  @override
  String get tourQuestsText =>
      'Супоришҳо аз истеҳсолкунандагон: миқдори лозимии бастаҳоро фурӯшед ва мукофот гиред. Пешрафт дар корт намоён аст.';

  @override
  String get tourQuestsTextDoc =>
      'Супоришҳо аз истеҳсолкунандагон: миқдори лозимии бланкҳоро нависед ва мукофот гиред. Пешрафт дар корт намоён аст.';

  @override
  String get tourChecksTitle => 'Чекҳои шумо';

  @override
  String get tourChecksText =>
      'Ҳамаи чекҳои фиристодашуда ва ҳолати онҳо: дар санҷиш, тасдиқ шуд, ҳисоб шуд ё бояд аз нав акс гирифт.';

  @override
  String get tourChecksTitleDoc => 'Бланкҳои шумо';

  @override
  String get tourChecksTextDoc =>
      'Ҳамаи бланкҳои фиристодашуда ва ҳолати онҳо: дар санҷиш, тасдиқ шуд, ҳисоб шуд ё бояд аз нав акс гирифт.';

  @override
  String get tourLearnTitle => 'Омӯзиш';

  @override
  String get tourLearnText =>
      'Курсҳо ва тестҳо аз коршиносони бозори фарм. Барои курсҳои гузаштаву холҳо дода мешаванд.';

  @override
  String get tourProfileTitle => 'Профил';

  @override
  String get tourProfileText =>
      'Маълумоти шахсӣ, дорухона, мавзӯъ ва забон. Ҳамин ҷо ин омӯзишро аз нав гузаштан мумкин аст.';

  @override
  String get tourProfileTextDoc =>
      'Маълумоти шахсӣ, ҷои кор, мавзӯъ ва забон. Ҳамин ҷо ин омӯзишро аз нав гузаштан мумкин аст.';

  @override
  String get tourDoneTitle => 'Ҳама тайёр аст!';

  @override
  String get tourDoneText =>
      'Барои гирифтани аввалин IQC чеки аввалро фиристед ё курсро оғоз кунед.';

  @override
  String get tourDoneTextDoc =>
      'Барои гирифтани аввалин IQC бланки аввалро фиристед ё курсро оғоз кунед.';

  @override
  String get tourDoneNote => 'Омӯзишро дар Профил такрор кардан мумкин аст.';

  @override
  String get tourFinish => 'Оғози кор';

  @override
  String get profileTourAgain => 'Омӯзишро аз нав гузаштан';

  @override
  String get walletConfirmTextPlain => 'Корти тӯҳфавии Korzinka гиред';

  @override
  String walletArchiveCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучер',
      one: '$n ваучер',
    );
    return '$_temp0';
  }

  @override
  String get checksStepConfirmed => 'Қабул шуд';

  @override
  String get rxStepConfirmed => 'Қабул шуд';

  @override
  String get questsStepDoTitle => 'Иҷро кунед';

  @override
  String get questsStepDoSub => 'шартҳоро';

  @override
  String get questsStepWaitTitle => 'Интизор шавед';

  @override
  String get questsStepWaitSub => 'санҷишро';

  @override
  String get questsStepWaitCheck => 'Санҷишро интизор шавед';

  @override
  String get questsStepWaitCheckSub => 'Чекро дубора фиристодан лозим нест';

  @override
  String get questsStepWaitRecipe => 'Тасдиқи бланкро интизор шавед';

  @override
  String get questsStepWaitRecipeSub =>
      'Санҷиши аввалия то 24 соат вақт мегирад';

  @override
  String get learnTileResult => 'Натиҷа';

  @override
  String get checksStatusExtraReview => 'Санҷиши иловагӣ';

  @override
  String get checksHeroExtraTitle => 'Чек дар санҷиши иловагӣ';

  @override
  String get checksHeroExtraText => 'Санҷиш аз маъмул бештар вақт мегирад';

  @override
  String get rxStateExtraTitle => 'Бланк дар санҷиши иловагӣ';

  @override
  String get rxStateExtraText =>
      'Бланк барои санҷиши иловагӣ ба мутахассис фиристода шуд. Ин вақти бештар мегирад — ҳангоми қарор огоҳинома мефиристем';

  @override
  String get checksExtraNoteTitle => 'Ҳеҷ кор кардан лозим нест';

  @override
  String get checksExtraNoteText =>
      'Баъзан чек муқоисаи иловагиро талаб мекунад — масалан, агар як қисми маълумот бад хонда шавад. Қарор дар огоҳиномаҳо меояд ва дар ин ҷо пайдо мешавад';

  @override
  String get rxExtraNoteText =>
      'Баъзан бланк муқоисаи дастиро талаб мекунад — масалан, агар як қисми маълумот бад хонда шавад. Қарор дар огоҳиномаҳо меояд ва дар ин ҷо пайдо мешавад';

  @override
  String get rxExtraHint => 'Қарор дар огоҳиномаҳо меояд';

  @override
  String get regCodeLabel => 'Калимаи рамзии намояндаи тиббӣ';

  @override
  String get regCodeOptional => '· ихтиёрӣ';

  @override
  String get regCodeExample => 'Масалан, DAUROV';

  @override
  String get regCodeNoteDoctor =>
      'Калимаи рамзиро намояндаи тиббии шумо медиҳад. Бе он бақайдгирии табиб имконнопазир аст';

  @override
  String get regCodeNotePharm =>
      'Агар шуморо намояндаи тиббӣ даъват карда бошад';

  @override
  String get regCodeNotFound =>
      'Чунин калимаи рамзӣ нест. Ҳарфҳоро санҷед ё аз намояндаи тиббии худ пурсед';

  @override
  String get regCodeMedrep => 'Намояндаи тиббӣ';

  @override
  String get regCodeJoinDoctor => 'Шумо фавран ба дастаи ӯ ҳамроҳ мешавед';

  @override
  String get regCodeJoinPharm =>
      'Намояндаи тиббӣ дархости шуморо тасдиқ мекунад';

  @override
  String get medrepTeamTitle => 'Даста';

  @override
  String medrepCountPharm(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n фармасевт',
    );
    return '$_temp0';
  }

  @override
  String medrepCountDoctors(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n табиб',
    );
    return '$_temp0';
  }

  @override
  String get medrepCodeForInvite => 'Калимаи рамзӣ барои даъват';

  @override
  String get medrepInviteShort => 'Даъват';

  @override
  String medrepUnitBlanks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'бланк',
    );
    return '$_temp0';
  }

  @override
  String get medrepUnitInTeam => 'дар даста';

  @override
  String get medrepAllTeam => 'Тамоми даста';

  @override
  String get medrepYourCode => 'Калимаи рамзии шумо';

  @override
  String get medrepCopyCode => 'Нусхабардории калимаи рамзӣ';

  @override
  String get medrepCodeCopied => 'Калимаи рамзӣ нусхабардорӣ шуд';

  @override
  String medrepEnteredCode(String ago) {
    return 'Калимаи рамзиро ворид кард · $ago';
  }

  @override
  String medrepStep1TextCode(String code) {
    return 'Калимаи шумо — $code';
  }

  @override
  String medrepCodeHintNick(String username) {
    return '6 аломат аз ники шумо @$username · регистр муҳим нест';
  }

  @override
  String get medrepCodeHint => 'Ҳангоми воридкунӣ регистр муҳим нест';

  @override
  String get medrepHowTitle => 'Ин чӣ тавр кор мекунад';

  @override
  String get medrepHowDoctor =>
      'Ҳангоми бақайдгирӣ калимаро ҳатман ворид мекунад — ва фавран ба дастаи шумо ҳамроҳ мешавад';

  @override
  String get medrepHowPharm =>
      'Калимаро бо хоҳиши худ ворид мекунад. Дар бахши «Интизори тасдиқ» пайдо мешавад';

  @override
  String medrepShareText(String code) {
    return 'Калимаи рамзии ман дар PharmIQ Academy — $code. Онро ҳангоми бақайдгирӣ дар барнома ворид кунед.';
  }

  @override
  String get medrepBlanksAllTime => 'Бланкҳо дар тамоми вақт';

  @override
  String get medrepUnitApproved => 'тасдиқшуда';

  @override
  String medrepSince(String date) {
    return 'аз $date';
  }

  @override
  String get medrepPatientsHidden =>
      'Маълумоти беморон ба намояндаи тиббӣ нишон дода намешавад';

  @override
  String get medrepProfileCode => 'Калимаи рамзӣ';

  @override
  String get medrepProfileCodeSub => 'Барои даъват ба даста';

  @override
  String get medrepTeamNobody => 'Дар ин ҷо ҳоло касе нест';
}

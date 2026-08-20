// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'IQ Academy';

  @override
  String get apiNetworkError => 'Желі қатесі';

  @override
  String get apiNoAccess => 'Қатынау жоқ';

  @override
  String get checkModelStatusPending => 'Тексерілуде';

  @override
  String get checkModelStatusAiDetected => 'AI таныды';

  @override
  String get checkModelStatusAiWrong => 'AI танымады';

  @override
  String get checkModelStatusApproved => 'Мақұлданды';

  @override
  String get checkModelStatusRejected => 'Қабылданбады';

  @override
  String get commonRolePharmacist => 'Фармацевт';

  @override
  String get commonRoleDoctor => 'Дәрігер';

  @override
  String get commonRoleMedrep => 'Медициналық өкіл';

  @override
  String get commonRoleProductOwner => 'Бренд / Өнім иесі';

  @override
  String get commonCancel => 'Болдырмау';

  @override
  String get navHome => 'Басты бет';

  @override
  String get navChecks => 'Чектер';

  @override
  String get navQuests => 'Квесттер';

  @override
  String get navLearn => 'Оқыту';

  @override
  String get navWallet => 'Әмиян';

  @override
  String get navRecipes => 'Рецепттер';

  @override
  String get navPortfolio => 'Портфель';

  @override
  String get navPharm => 'Фарм.';

  @override
  String get navTop => 'Топ';

  @override
  String get navDashboard => 'Дашборд';

  @override
  String get navProducts => 'Өнімдер';

  @override
  String get navBrands => 'Брендтер';

  @override
  String get navProfile => 'Профиль';

  @override
  String get miniAppsTitle => 'Шағын қолданбалар';

  @override
  String get miniAppsSubtitle => 'Ойнап, IQC-ға жүлделер ұтып алыңыз';

  @override
  String get miniAppsSoon => 'Жақында';

  @override
  String get sapperCountdownSoon => 'жақында';

  @override
  String sapperCountdownDaysHours(Object days, Object hours) {
    return '$daysк $hoursс';
  }

  @override
  String sapperCountdownHoursMinutes(Object hours, Object minutes) {
    return '$hoursс $minutesм';
  }

  @override
  String sapperCountdownMinutesSeconds(Object minutes, Object seconds) {
    return '$minutesм $secondsс';
  }

  @override
  String get sapperTitle => 'Супер Сапер';

  @override
  String get sapperSubtitle =>
      'IQC-ға ұяшықтарды иеленіңіз — ашылу сағатында астында не барын білесіз';

  @override
  String get sapperNoDraws => 'Ұтыс ойындары жоқ';

  @override
  String get sapperRevealed => 'Ашылды';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 $prizeCount жүлде  💎 $priceIqc IQC/ұяшық  ';
  }

  @override
  String sapperMyCells(Object count) {
    return 'сіздің ұяшықтарыңыз: $count';
  }

  @override
  String sapperOccupancy(Object occupied, Object total, Object percent) {
    return '$total ішінен $occupied бос емес ($percent%)';
  }

  @override
  String get sapperGoToGame => 'Ойынға өту';

  @override
  String sapperReserveTitle(Object number) {
    return '№$number ұяшықты иеленесіз бе?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC шегеріледі. Болдырмауға болмайды — ұяшық ашылғанға дейін сізге бекітіледі.';
  }

  @override
  String sapperReserveConfirm(Object price) {
    return '$price IQC-ға иелену';
  }

  @override
  String sapperCellReserved(Object number) {
    return '№$number ұяшық иеленді';
  }

  @override
  String get sapperNoIqcTitle => 'IQC жеткіліксіз';

  @override
  String sapperNoIqcBody(Object price, Object have) {
    return 'Қатысу үшін $price IQC қажет, сізде $have. IQC жинаңыз — оқу, квест немесе сауалнамадан өтіңіз.';
  }

  @override
  String get sapperDraws => 'Ұтыс ойындары';

  @override
  String get sapperAcceptClosed =>
      'Ұяшық қабылдау жабылды — ашылуға дайындық жүріп жатыр';

  @override
  String get sapperHiddenTitle => 'АЛАҢДА ЖАСЫРЫЛҒАН';

  @override
  String sapperRevealIn(Object time) {
    return 'ашылуға $time қалды';
  }

  @override
  String get sapperNoPrizes => 'жүлделер жарияланбаған';

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
    return 'ұяшық бағасы $price IQC';
  }

  @override
  String get sapperYourBalance => 'Сіздің балансыңыз';

  @override
  String get sapperCellPriceLabel => 'ұяшық бағасы';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Сіз $count $word ұттыңыз!';
  }

  @override
  String get sapperNoWin => 'Бұл жолы ұтыссыз';

  @override
  String get sapperPrizeOne => 'жүлде';

  @override
  String get sapperPrizeFew => 'жүлде';

  @override
  String get sapperPrizeMany => 'жүлде';

  @override
  String get sapperLegendMine => 'Менікі';

  @override
  String get sapperLegendTheirs => 'Басқалардікі';

  @override
  String get sapperLegendEmpty => 'Бос';

  @override
  String get sapperLegendVoucher => 'Ваучер';

  @override
  String get sapperLegendSelected => 'Таңдалды';

  @override
  String get sapperLegendOccupied => 'Бос емес';

  @override
  String get sapperLegendFree => 'Бос';

  @override
  String get sapperWinners => 'Жеңімпаздар';

  @override
  String get newsTitle => 'Жаңалықтар';

  @override
  String get newsAll => 'Барлық жаңалықтар';

  @override
  String get newsMore => 'Толығырақ →';

  @override
  String get newsDateMonths =>
      'қаң,ақп,нау,сәу,мам,мау,шіл,там,қыр,қаз,қар,жел';

  @override
  String get newsEmpty => 'Әзірге жаңалықтар жоқ';

  @override
  String get newsPinned => 'МАҢЫЗДЫ';

  @override
  String get newsDetailTitle => 'Жаңалық';

  @override
  String surveyRewardCredited(Object amount) {
    return '+$amount IQC есепке қосылды';
  }

  @override
  String get surveyThanks => 'Жауабыңызға рахмет!';

  @override
  String surveySubmitError(Object error) {
    return 'Жіберілмеді: $error';
  }

  @override
  String get surveyTitle => 'Сауалнама';

  @override
  String surveyRewardBadge(Object amount) {
    return '+ $amount IQC';
  }

  @override
  String get surveyChooseOption => 'Жауап нұсқасын таңдаңыз';

  @override
  String get surveyEnterAnswer => 'Жауапты қолмен енгізіңіз';

  @override
  String get surveySubmit => 'Жауап беру';

  @override
  String get loginTagline => 'Үйрен.\nҚолдан.\nЖет.';

  @override
  String get loginTitle => 'Кіру';

  @override
  String get loginByPhone => 'Телефон нөмірі арқылы кіріңіз';

  @override
  String loginCodeSent(Object phone) {
    return '$phone нөміріне SMS-код жіберілді';
  }

  @override
  String get loginPhoneLabel => 'Телефон нөмірі';

  @override
  String get loginPhoneNotFound => 'Нөмір жүйеде табылмады';

  @override
  String get loginConfirm => 'Растау';

  @override
  String get loginGoRegister => 'Тіркелуден өту';

  @override
  String get loginRegister => 'Тіркелу';

  @override
  String get loginEnter => 'Кіру';

  @override
  String loginResendIn(Object seconds) {
    return '$seconds секундтан кейін қайталау';
  }

  @override
  String get loginResendAgain => 'Қайта жіберу';

  @override
  String get loginChangeNumber => '‹ Нөмірді өзгерту';

  @override
  String get loginOr => 'немесе';

  @override
  String get tgLoginExpired => 'Кіру уақыты өтіп кетті';

  @override
  String tgLoginParseError(Object error) {
    return 'Кіру жауабын өңдеу мүмкін болмады: $error';
  }

  @override
  String get tgWaitingConfirm => 'Растау күтілуде…';

  @override
  String get tgLoginButton => 'Telegram арқылы кіру';

  @override
  String get notifTitle => 'Хабарламалар';

  @override
  String notifUnreadOne(Object count) {
    return '$count оқылмаған';
  }

  @override
  String notifUnreadMany(Object count) {
    return '$count оқылмаған';
  }

  @override
  String get notifMarkAllRead => 'Барлығын оқылды деп белгілеу';

  @override
  String get notifRead => '✓ Оқылды';

  @override
  String get notifMarkRead => 'Оқылды деп белгілеу';

  @override
  String get notifOpen => 'Ашу';

  @override
  String get notifEmptyTitle => 'Хабарламалар жоқ';

  @override
  String get notifEmptyBody =>
      'Мұнда чек мәртебелері, квест сыйақылары және оқыту жаңалықтары пайда болады.';

  @override
  String get placeholderComingSoon => 'Бөлім келесі кезеңдерде пайда болады.';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileSettings => 'Баптаулар';

  @override
  String get profileLanguage => 'ТІЛ';

  @override
  String get profileAppearance => 'БЕЗЕНДІРУ';

  @override
  String get profileThemeLight => 'Жарық';

  @override
  String get profileThemeDark => 'Қараңғы';

  @override
  String get profileThemeSystem => 'Жүйе';

  @override
  String get profileAccount => 'Аккаунт';

  @override
  String get profilePersonalData => 'ЖЕКЕ ДЕРЕКТЕР';

  @override
  String get profileRole => 'Рөл';

  @override
  String get profileChange => 'Ауыстыру';

  @override
  String get profileLinkedServices => 'БАЙЛАНЫСҚАН ҚЫЗМЕТТЕР';

  @override
  String get profilePhone => 'Телефон';

  @override
  String get profileTgConnected => 'Қосылған';

  @override
  String get profileTgLinked => 'Байланысқан';

  @override
  String get profileSupport => 'Қолдау қызметі';

  @override
  String get profileSupportSubtitle => 'Біз әрқашан байланыстамыз';

  @override
  String get profileLogout => 'Аккаунттан шығу';

  @override
  String get profileDeleteTitle => 'Аккаунт пен деректерді жою';

  @override
  String get profileDeleteIrreversible => 'Бұл әрекетті қайтару мүмкін емес';

  @override
  String get profileDelete => 'Жою';

  @override
  String get profileLanguageUpdated => 'Тіл жаңартылды';

  @override
  String get profileNewPhoneTitle => 'Жаңа нөмір';

  @override
  String get profileCancel => 'Болдырмау';

  @override
  String get profileNext => 'Әрі қарай';

  @override
  String get profileSmsCodeTitle => 'SMS-код';

  @override
  String get profileCodeLabel => 'Код';

  @override
  String get profileConfirm => 'Растау';

  @override
  String get profilePhoneChanged => 'Телефон өзгертілді';

  @override
  String get profileLogoutConfirmTitle => 'Аккаунттан шығасыз ба?';

  @override
  String get profileLogoutAction => 'Шығу';

  @override
  String get profileDeleteConfirmTitle => 'Аккаунт жойылсын ба?';

  @override
  String get profileDeleteConfirmBody =>
      'Бұл әрекетті қайтару мүмкін емес. Барлық деректер жойылады.';

  @override
  String get profileStatQuests => 'КВЕСТТЕР';

  @override
  String get profileStatLevel => 'ДЕҢГЕЙ';

  @override
  String get questHistoryTitle => 'Қатысу тарихы';

  @override
  String get questHistoryEmpty => 'Тарих бос';

  @override
  String get questHistoryVoucher => 'Ваучер';

  @override
  String get questHistoryActive => 'Белсенді';

  @override
  String get questHistoryDone => 'Орындалды';

  @override
  String get registerStep1Of2 => '1-ҚАДАМ / 2';

  @override
  String registerStep2Of2(Object role) {
    return '2-ҚАДАМ / 2 · $role';
  }

  @override
  String get registerTitle => 'Тіркелу';

  @override
  String get registerChooseRole => 'Кіру үшін рөлді таңдаңыз';

  @override
  String get registerBack => '‹ Артқа';

  @override
  String registerConfirmField(Object label) {
    return 'Растаңыз: $label';
  }

  @override
  String registerFillField(Object label) {
    return 'Толтырыңыз: $label';
  }

  @override
  String get registerFinish => 'Тіркелуді аяқтау';

  @override
  String get registerSuccessTitle => 'Тіркелу аяқталды!';

  @override
  String registerWelcome(Object name) {
    return 'PharmIQ ACADEMY-ге қош келдіңіз, $name!';
  }

  @override
  String get registerStartLearning => 'Оқуды бастау';

  @override
  String get registerGoHome => 'Басты бетке өту';

  @override
  String registerEnterField(Object label) {
    return '$label енгізіңіз';
  }

  @override
  String get registerRequiredField => 'Міндетті өріс';

  @override
  String get registerSelectPlaceholder => '— таңдаңыз —';

  @override
  String registerMultiSelectHintRequired(Object label) {
    return '$label * · Бірнешеуін таңдауға болады';
  }

  @override
  String registerMultiSelectHint(Object label) {
    return '$label · Бірнешеуін таңдауға болады';
  }

  @override
  String get registerConsentText => 'Жеке деректерді өңдеуге келісемін ';

  @override
  String get registerConsentMore => 'толығырақ';

  @override
  String get roleSelectTagline => 'Үйрен.\nҚолдан.\nЖет.';

  @override
  String get roleSelectGreeting => 'Сәлеметсіз бе';

  @override
  String roleSelectGreetingName(Object name) {
    return 'Сәлеметсіз бе, $name';
  }

  @override
  String get roleSelectChooseRole => 'Кіру үшін рөлді таңдаңыз';

  @override
  String get roleSelectSubChecksQuests => 'Чектер, квесттер, оқыту және әмиян';

  @override
  String get roleSelectSubMedrep => 'Провизорлар портфелі және рейтинг';

  @override
  String get roleSelectSubProductOwner => 'Дашборд, өнімдер және брендтер';

  @override
  String get roleSelectSheetTitle => 'Рөлді таңдаңыз';

  @override
  String get roleSelectEnter => 'Кіру';

  @override
  String get notifSettingsTitle => 'Хабарлама баптаулары';

  @override
  String get notifSettingsChecks => 'Чек және рецепт мәртебелері';

  @override
  String get notifSettingsQuests => 'Квесттер мен сыйақылар';

  @override
  String get notifSettingsLearning => 'Оқыту';

  @override
  String get notifSettingsMarketing => 'Жаңалықтар мен акциялар';

  @override
  String get supportBackProfile => 'Профиль';

  @override
  String get supportTitle => 'Қолдау қызметі';

  @override
  String get supportEmptyHint => 'Бізге жазыңыз — осы жерде жауап береміз';

  @override
  String get supportInputHint => 'Хабарлама жазыңыз...';

  @override
  String get supportYou => 'Сіз';

  @override
  String get supportTeam => 'Қолдау қызметі';

  @override
  String get appBarSwitchRole => 'Рөлді ауыстыру';

  @override
  String get asyncRetry => 'Қайталау';

  @override
  String get brandProductsTitle => 'Өнімдер';

  @override
  String get brandProductsEmpty => 'Өнімдер жоқ';

  @override
  String brandProductsQuestCount(Object p1) {
    return '$p1 квест';
  }

  @override
  String get brandProductsDetailTitle => 'Өнім';

  @override
  String get brandQuestsTitle => 'Бренд квесттері';

  @override
  String get brandQuestsEmpty => 'Квесттер жоқ';

  @override
  String brandQuestsSubtitle(Object p1, Object p2, Object p3) {
    return '$p1 · $p2/$p3 орынд.';
  }

  @override
  String get brandQuestsStatusActive => 'Белсенді';

  @override
  String get brandQuestsStatusOff => 'Өшірулі';

  @override
  String get brandQuestsDetailTitle => 'Бренд квесті';

  @override
  String brandQuestsSponsor(Object p1) {
    return 'Демеуші: $p1';
  }

  @override
  String get brandQuestsParticipants => 'Қатысушылар';

  @override
  String get brandQuestsCompletions => 'Орындаулар';

  @override
  String get brandQuestsBudget => 'Бюджет';

  @override
  String get brandQuestsSpent => 'Жұмсалды';

  @override
  String get brandQuestsProducts => 'Өнімдер';

  @override
  String get brandQuestsMxik => 'МХИК';

  @override
  String get brandQuestsReward => 'Сыйақы';

  @override
  String get brandQuestsPeriod => 'Кезең';

  @override
  String get brandsTitle => 'Брендтер';

  @override
  String get brandsEmpty => 'Брендтер жоқ';

  @override
  String brandsQuestCount(Object p1) {
    return '$p1 квест';
  }

  @override
  String get brandsDetailTitle => 'Бренд';

  @override
  String get brandsSubBrands => 'Суббрендтер';

  @override
  String get brandDashTitle => 'Дашборд';

  @override
  String get brandDashChecks => 'Чектер';

  @override
  String get brandDashPacks => 'Қаптамалар';

  @override
  String get brandDashActiveQuests => 'Белсенді квесттер';

  @override
  String get brandDashParticipants => 'Қатысушылар';

  @override
  String get brandDashSegmentation => 'Сегменттеу';

  @override
  String get brandDashRetail => 'Бөлшек сауда';

  @override
  String get brandDashChain => 'Желілер';

  @override
  String get brandDashTopProducts => 'Топ өнімдер';

  @override
  String get brandDashTopSellers => 'Топ сатушылар';

  @override
  String get brandDashRegions => 'Аймақтар';

  @override
  String get brandDashSalesLogs => 'Сату журналдары';

  @override
  String get salesLogTitle => 'Сату журналдары';

  @override
  String get salesLogEmpty => 'Жазбалар жоқ';

  @override
  String get docHomeActiveQuests => 'Белсенді квесттер';

  @override
  String get docHomeAllQuests => 'Барлық квесттер';

  @override
  String get docHomeNoActiveQuests => 'Белсенді квесттер жоқ';

  @override
  String get docHomeRecommendedCourses => 'Ұсынылатын курстар';

  @override
  String get docHomeAllCourses => 'Барлық курстар';

  @override
  String get docHomeNoCourses => 'Әзірге курстар жоқ';

  @override
  String get docHomeGreetingNoName => 'Сәлем!';

  @override
  String docHomeGreeting(Object name) {
    return 'Сәлем, $name';
  }

  @override
  String get docHomeSubtitle => 'Рецепттерді жіберіп, сыйақы алыңыз';

  @override
  String get docHomeWalletBalance => 'ӘМИЯН БАЛАНСЫ';

  @override
  String get docHomeWallet => 'Әмиян';

  @override
  String get docHomeSendRecipe => 'Рецепт жіберу';

  @override
  String get docHomeSendRecipeHint =>
      'Рецептті суретке түсіріңіз — AI дәрілерді таниды';

  @override
  String get docHomeStatRecipes => 'барлық рецепттер';

  @override
  String get docHomeStatApproved => 'мақұлданды';

  @override
  String get docHomeStatIqc => 'IQC ұпайы';

  @override
  String get docHomeVoucher => 'ВАУЧЕР';

  @override
  String get docHomeProgress => 'Барыс';

  @override
  String docHomeProgressDone(Object pct) {
    return '$pct% орындалды';
  }

  @override
  String get recipeDetailMyRecipes => 'Менің рецепттерім';

  @override
  String recipeDetailTitle(Object id) {
    return 'Рецепт №$id';
  }

  @override
  String recipeDetailPhotoCount(Object p1) {
    return 'Сурет $p1';
  }

  @override
  String get recipeDetailStatusApproved => 'Мақұлданды';

  @override
  String get recipeDetailStatusRejected => 'Қабылданбады';

  @override
  String get recipeDetailStatusPending => 'Тексерілуде';

  @override
  String get recipeDetailAiRecognized => 'AI таныды';

  @override
  String get recipeDetailNoDrugs => 'Дәрілер танылмады';

  @override
  String get recipesTitle => 'Менің рецепттерім';

  @override
  String recipesTotal(Object p1) {
    return 'барлығы $p1';
  }

  @override
  String get recipesTabAll => 'Барлығы';

  @override
  String get recipesTabActive => 'Белсенді';

  @override
  String get recipesTabDone => 'Аяқталған';

  @override
  String get recipesEmpty => 'Әзірге рецепттер жоқ';

  @override
  String get recipesTakePhoto => 'Суретке түсіру';

  @override
  String get recipesFromGallery => 'Галереядан таңдау';

  @override
  String get recipesUploading => 'Рецепт қосылды — жүктелуде';

  @override
  String get recipesDoctorInfoTitle => 'Дәрігер деректері (қалауыңызша)';

  @override
  String get recipesDoctorName => 'Т.А.Ә.';

  @override
  String get recipesDoctorWorkplace => 'Жұмыс орны';

  @override
  String get recipesDoctorCity => 'Қала';

  @override
  String get recipesDoctorPhone => 'Телефон';

  @override
  String get recipesSkip => 'Өткізіп жіберу';

  @override
  String get recipesSend => 'Жіберу';

  @override
  String get recipesSubmitButton => 'Рецепт жіберу';

  @override
  String recipesPhotoCount(Object p1) {
    return 'сурет: $p1';
  }

  @override
  String get recipesStatusApproved => 'Мақұлданды';

  @override
  String get recipesStatusRejected => 'Қабылданбады';

  @override
  String get recipesStatusPending => 'Тексерілуде';

  @override
  String recipesUploadingBanner(Object count) {
    return 'Жүктелуде: $count';
  }

  @override
  String get recipesRetry => 'Қайталау';

  @override
  String get companiesTitle => 'Компаниялар';

  @override
  String get companiesEmpty => 'Компаниялар жоқ';

  @override
  String companiesCode(Object p1) {
    return 'Код: $p1';
  }

  @override
  String get medrepHomeAttributionPrimary => 'Бастапқы';

  @override
  String get medrepHomeAttributionTotal => 'Жалпы';

  @override
  String get medrepHomeMenuPharmacists => 'Фармацевттер';

  @override
  String get medrepHomeMenuPending => 'Растауды күтуде';

  @override
  String get medrepHomeMenuCompanies => 'Компаниялар';

  @override
  String get medrepHomeMenuLeaderboard => 'Рейтинг';

  @override
  String get medrepHomeGreetingNoName => 'Сәлем!';

  @override
  String medrepHomeGreeting(Object name) {
    return 'Сәлем, $name';
  }

  @override
  String medrepHomeAttribution(Object attribution) {
    return 'Атрибуция: $attribution';
  }

  @override
  String get medrepHomeStatPharmacists => 'Фармацевттер';

  @override
  String get medrepHomeStatChecks => 'Чектер';

  @override
  String get medrepHomeStatPacks => 'Қаптамалар';

  @override
  String get medrepHomeStatQuests => 'Квесттер';

  @override
  String get medrepHomeLinkCopied => 'Сілтеме көшірілді';

  @override
  String get medrepHomeReferralTitle => 'Реферал сілтемесі';

  @override
  String get medrepHomeReferralHint =>
      'Сілтемені провизорға жіберіңіз — ол тіркелген кезде сізге байланады';

  @override
  String get medrepHomeCopy => 'Көшіру';

  @override
  String get medrepHomeShare => 'Бөлісу';

  @override
  String get medrepHomeRetry => 'Қайталау';

  @override
  String get leaderboardUnitPharm => 'дәріхана';

  @override
  String get leaderboardUnitQuests => 'квест';

  @override
  String get leaderboardUnitChecks => 'чек';

  @override
  String get leaderboardTitle => 'Рейтинг';

  @override
  String get leaderboardAttributionPrimary => 'Бастапқы';

  @override
  String get leaderboardAttributionTotal => 'Жалпы';

  @override
  String get leaderboardCompanyFallback => 'Компания';

  @override
  String get leaderboardRetry => 'Қайталау';

  @override
  String get pharmDetailIncentivizeTitle => 'Фармацевтті ынталандыру';

  @override
  String pharmDetailRating(Object p1) {
    return 'Баға: $p1';
  }

  @override
  String get pharmDetailComment => 'Пікір';

  @override
  String get pharmDetailCancel => 'Болдырмау';

  @override
  String get pharmDetailSend => 'Жіберу';

  @override
  String get pharmDetailSent => 'Жіберілді';

  @override
  String get pharmDetailBack => 'Фармацевттер';

  @override
  String get pharmDetailChecks => 'Чектер';

  @override
  String get pharmDetailPacks => 'Қаптамалар';

  @override
  String get pharmDetailQuests => 'Квесттер';

  @override
  String get pharmDetailIqcPoints => 'IQC ұпайы';

  @override
  String get pharmDetailRecentChecks => 'Соңғы чектер';

  @override
  String get pharmDetailNoChecks => 'Әзірге чектер жоқ';

  @override
  String get pharmDetailActive => 'Белсенді';

  @override
  String get pharmDetailPassive => 'Пассив';

  @override
  String get pharmDetailIncentivize => 'Ынталандыру';

  @override
  String get pharmDetailRetry => 'Қайталау';

  @override
  String get portfolioTitle => 'Фармацевттер';

  @override
  String get portfolioUpdated => 'Жаңартылды';

  @override
  String portfolioInPortfolio(Object total) {
    return 'портфельде $total';
  }

  @override
  String get portfolioSearchHint => 'Фармацевт іздеу…';

  @override
  String portfolioTabAll(Object all) {
    return 'Барлығы ($all)';
  }

  @override
  String portfolioTabActive(Object active) {
    return 'Белсенді ($active)';
  }

  @override
  String portfolioTabPassive(Object passive) {
    return 'Пассив ($passive)';
  }

  @override
  String get portfolioNotFound => 'Фармацевттер табылмады';

  @override
  String get portfolioRetry => 'Қайталау';

  @override
  String get medrepQuestsTitle => 'Компания квесттері';

  @override
  String get medrepQuestsEmpty => 'Квесттер жоқ';

  @override
  String medrepQuestsSubtitle(Object p1, Object p2) {
    return 'Мақсат: $p1 · қатысушылар: $p2';
  }

  @override
  String get medrepQuestsNoParticipants => 'Әзірге қатысушылар жоқ';

  @override
  String get referralsAccepted => 'Өтінім қабылданды';

  @override
  String get referralsRejected => 'Өтінім қабылданбады';

  @override
  String get referralsTitle => 'Реферал өтінімдері';

  @override
  String get referralsEmpty => 'Жаңа өтінімдер жоқ';

  @override
  String get referralsDecline => 'Қабылдамау';

  @override
  String get referralsAccept => 'Қабылдау';

  @override
  String get checkDetailBackMyChecks => 'Менің чектерім';

  @override
  String checkDetailTitle(Object id) {
    return 'Чек №$id';
  }

  @override
  String get checkDetailRejectedFallback => 'Чек қабылданбады';

  @override
  String checkDetailQuestDone(Object p1) {
    return '$p1 · Квест орындалды ✓';
  }

  @override
  String get checkDetailQuestAfterApproval =>
      'Чек мақұлданғаннан кейін пайда болады';

  @override
  String get checkDetailQuestNone => 'Әзірге бірде-бір квестке есептелмеген';

  @override
  String get checkDetailChipApproved => 'Мақұлданды';

  @override
  String get checkDetailChipRejected => 'Қабылданбады';

  @override
  String get checkDetailChipPending => 'Тексерілуде';

  @override
  String get checkDetailOpenPhoto => 'Ашу';

  @override
  String checkDetailPhotoCount(Object p1) {
    return 'сурет: $p1';
  }

  @override
  String get checkDetailRejectReasonTitle => 'Қабылданбау себебі';

  @override
  String get checkDetailResubmit => 'Қайта жіберу';

  @override
  String get checkDetailPendingTitle => 'Тексерілуде';

  @override
  String get checkDetailPendingBody =>
      'Сіздің чегіңіз маман тексеруінде. Әдетте бұл 24 сағатқа дейін созылады.';

  @override
  String checkDetailSentAt(Object sentAt) {
    return 'Жіберілді: $sentAt';
  }

  @override
  String get checkDetailAiWaitingTitle => 'AI тануы күтілуде';

  @override
  String get checkDetailAiWaitingBody => 'Нәтиже тексеруден кейін пайда болады';

  @override
  String get checkDetailAiTitle => 'AI таныды';

  @override
  String checkDetailPacks(Object p1) {
    return '$p1 қапт.';
  }

  @override
  String get checkDetailQuestCardTitle => 'Квесттерге есептеу';

  @override
  String get checksEmpty => 'Әзірге чектер жоқ';

  @override
  String get checksAddedUploading => 'Чек қосылды — жүктелуде';

  @override
  String get checksNewCheckTitle => 'Жаңа чек';

  @override
  String get checksTapToAddPhoto => 'Сурет қосу үшін басыңыз';

  @override
  String get checksTakePhoto => 'Суретке түсіру';

  @override
  String get checksSubmitForReview => 'Тексеруге жіберу';

  @override
  String get checksTitle => 'Менің чектерім';

  @override
  String checksTotalCount(Object p1) {
    return 'барлығы $p1';
  }

  @override
  String get checksSendPhoto => 'Сурет жіберу';

  @override
  String checksCardMeta(Object p1, Object p2) {
    return '$p1 · сурет: $p2';
  }

  @override
  String get checksAwaitUsually24h => 'Күтіңіз — әдетте 24 сағат';

  @override
  String get checksUploadingTitle => 'Сурет жүктелуде';

  @override
  String get checksPhotoFallback => 'Чек суреті';

  @override
  String get checksRetry => 'Қайталау';

  @override
  String get courseDetailTabDescription => 'СИПАТТАМА';

  @override
  String get courseDetailTabContent => 'МАЗМҰНЫ';

  @override
  String courseDetailMinutes(Object totalMin) {
    return '~$totalMin минут';
  }

  @override
  String get courseDetailContinueLearning => 'ОҚУДЫ ЖАЛҒАСТЫРУ';

  @override
  String get courseDetailStartLearning => 'ОҚУДЫ БАСТАУ';

  @override
  String get courseDetailVideoLessonOne => 'видеосабақ';

  @override
  String get courseDetailVideoLessonFew => 'видеосабақ';

  @override
  String get courseDetailVideoLessonMany => 'видеосабақ';

  @override
  String courseDetailQuizAfterLesson(Object videosBefore) {
    return '$videosBefore-сабақтан кейінгі тест';
  }

  @override
  String get courseDetailQuizForCourse => 'Курс бойынша тест';

  @override
  String courseDetailLessonMin(Object p1) {
    return '$p1 мин';
  }

  @override
  String get courseDetailQuizBadge => 'ТЕСТ';

  @override
  String get homePhActiveQuests => 'Белсенді квесттер';

  @override
  String get homePhAllQuests => 'Барлық квесттер';

  @override
  String get homePhNoActiveQuests => 'Белсенді квесттер жоқ';

  @override
  String get homePhRecentChecks => 'Соңғы чектер';

  @override
  String get homePhAllChecks => 'Барлық чектер';

  @override
  String get homePhNoChecks => 'Әзірге чектер жоқ';

  @override
  String get homePhGreeting => 'Сәлем!';

  @override
  String homePhGreetingName(Object name) {
    return 'Сәлем, $name!';
  }

  @override
  String get homePhGreetingSub => 'Жаңа білімге дайынсыз ба?';

  @override
  String get homePhWalletBalanceLabel => 'ӘМИЯН БАЛАНСЫ';

  @override
  String get homePhWalletButton => 'Әмиян';

  @override
  String get homePhSendCheck => 'Чек жіберу';

  @override
  String get homePhSendCheckSub =>
      'Чекті суретке түсіріңіз — AI дәрілерді таниды';

  @override
  String get homePhStatActiveQuests => 'белсенді квест';

  @override
  String get homePhStatApprovedChecks => 'мақұлданған чек';

  @override
  String get homePhStatIqcPoints => 'IQC ұпайы';

  @override
  String get homePhVoucherBadge => 'ВАУЧЕР';

  @override
  String get homePhProgress => 'Барыс';

  @override
  String homePhPctDone(Object pct) {
    return '$pct% орындалды';
  }

  @override
  String homePhCheckNumber(Object p1) {
    return 'Чек №$p1';
  }

  @override
  String get learnLessonOne => 'сабақ';

  @override
  String get learnLessonFew => 'сабақ';

  @override
  String get learnLessonMany => 'сабақ';

  @override
  String get learnTitle => 'Оқыту';

  @override
  String get learnSearchHint => 'Курстар бойынша іздеу...';

  @override
  String get learnTabAll => 'Барлығы';

  @override
  String get learnTabMine => 'Менің курстарым';

  @override
  String get learnTabDone => 'Өтілген';

  @override
  String get learnNewBadge => 'ЖАҢА';

  @override
  String get learnRepeatCourse => 'КУРСТЫ ҚАЙТАЛАУ';

  @override
  String get learnContinueLearning => 'ОҚУДЫ ЖАЛҒАСТЫРУ';

  @override
  String get learnStartCourse => 'КУРСТАН ӨТУ';

  @override
  String get learnCompleted => 'Өтілді';

  @override
  String get learnNotFoundTitle => 'Курстар табылмады';

  @override
  String get learnTryChangeFilters => 'Сүзгілерді өзгертіп көріңіз';

  @override
  String learnNothingForQuery(Object query) {
    return '«$query» сұранысы бойынша ештеңе табылмады.\nСұранысты өзгертіңіз немесе сүзгілерді алып тастаңыз.';
  }

  @override
  String get learnResetFilters => 'Сүзгілерді тастау';

  @override
  String lessonCompletedReward(Object p1) {
    return 'Сабақ аяқталды · +$p1 IQC';
  }

  @override
  String get lessonNotFound => 'Сабақ табылмады';

  @override
  String get lessonTabText => 'САБАҚ МӘТІНІ';

  @override
  String get lessonTabMaterials => 'САБАҚ МАТЕРИАЛДАРЫ';

  @override
  String get lessonNoMaterials => 'Әзірге материалдар жоқ';

  @override
  String get lessonStartQuiz => 'ТЕСТ ТАПСЫРУДЫ БАСТАУ';

  @override
  String get lessonComplete => 'САБАҚТЫ АЯҚТАУ';

  @override
  String get questDetailBackQuests => 'Квесттер';

  @override
  String get questDetailPillVoucher => 'Ваучер';

  @override
  String get questDetailLeftLabel => 'қалды';

  @override
  String get questDetailDoneLabel => 'орындалды';

  @override
  String get questDetailRewardLabel => 'СЫЙАҚЫ';

  @override
  String get questDetailVoucherManual =>
      'Ваучер тексеруден кейін қолмен беріледі';

  @override
  String questDetailIqcToBalance(Object p1) {
    return 'Балансқа +$p1 IQC';
  }

  @override
  String get questDetailHowTitle => 'Чектер қалай есептеледі';

  @override
  String get questDetailHowBody =>
      'Қажетті дәрі бар чек суреттерін жіберіңіз. Қаптаманы тексеру — автоматты түрде.';

  @override
  String get questDetailTodoTitle => 'Не істеу керек';

  @override
  String get questDetailDrugLabel => 'Дәрі';

  @override
  String get questDetailLimitsLabel => 'Лимиттер';

  @override
  String get questDetailPeriodLabel => 'Кезең';

  @override
  String get questDetailParticipantsLabel => 'Қатысушылар';

  @override
  String get questDetailPurchases => 'сатып алу';

  @override
  String questsPeriodUntil(Object p1) {
    return '$p1 дейін';
  }

  @override
  String questsPeriodFrom(Object p1) {
    return '$p1 бастап';
  }

  @override
  String get questsPeriodNone => 'Мерзімсіз';

  @override
  String get questsTitle => 'Квесттер';

  @override
  String get questsTabActive => 'Белсенді';

  @override
  String get questsTabArchive => 'Мұрағат';

  @override
  String get questsTabAll => 'Барлығы';

  @override
  String get questsCountWordActive => 'белсенді';

  @override
  String get questsCountWordArchive => 'мұрағаттағы';

  @override
  String get questsCountQuestOne => 'квест';

  @override
  String get questsCountQuestFew => 'квест';

  @override
  String get questsHistoryChip => 'Қатысу тарихы';

  @override
  String get questsSearchHint => 'Іздеу';

  @override
  String questsPacksItem(Object p1, Object p2) {
    return '$p1 × $p2 қапт.';
  }

  @override
  String questsIqcNoLimit(Object p1) {
    return '+$p1 IQC · шектеусіз';
  }

  @override
  String get questsPillVoucher => 'Ваучер';

  @override
  String get questsActive => 'Белсенді';

  @override
  String get questsFinished => 'Аяқталды';

  @override
  String get questsEmptyArchiveTitle => 'Мұрағат квесттері жоқ';

  @override
  String get questsEmptyArchiveSub => 'Аяқталған квесттер осында пайда болады';

  @override
  String get questsEmptyActiveTitle => 'Белсенді квесттер жоқ';

  @override
  String get questsEmptyActiveSub => 'Жаңа квесттер осында пайда болады';

  @override
  String get questsEmptyAllTitle => 'Квесттер жоқ';

  @override
  String get questsEmptyAllSub => 'Кейінірек қараңыз';

  @override
  String get questsViewActive => 'Белсенділерін көру';

  @override
  String get quizTitle => 'Тестілеу';

  @override
  String quizQuestionOf(Object p1, Object n) {
    return 'Сұрақ $p1 / $n';
  }

  @override
  String get quizFinish => 'ТЕСТІ АЯҚТАУ';

  @override
  String get quizNext => 'КЕЛЕСІ СҰРАҚ →';

  @override
  String get quizAnswerLabel => 'Жауап';

  @override
  String get quizCongrats => 'Құттықтаймыз!';

  @override
  String get quizPassed => 'Тест сәтті тапсырылды!';

  @override
  String get quizYouEarned => 'Сіз таптыңыз';

  @override
  String get quizCorrectLabel => 'ДҰРЫС ЖАУАПТАР';

  @override
  String get quizResultLabel => 'НӘТИЖЕ';

  @override
  String get quizToHome => 'БАСТЫ ЭКРАНҒА';

  @override
  String get quizViewCertificate => 'Сертификатты көру →';

  @override
  String get quizTryAgainTitle => 'Тағы бір рет көріңіз';

  @override
  String get quizFailed => 'Тест тапсырылмады';

  @override
  String get quizYourResult => 'Сіздің нәтижеңіз';

  @override
  String get quizCorrectLower => 'дұрыс';

  @override
  String quizPassMinimum(Object passScore, Object total, Object passPct) {
    return 'Өту үшін минимум: $passScore/$total ($passPct%)';
  }

  @override
  String get quizRetry => '↺ ҚАЙТА ТАПСЫРУ';

  @override
  String get quizBackToLesson => 'Сабаққа оралу →';

  @override
  String get voucherNotFound => 'Ваучер табылмады';

  @override
  String get voucherTitle => 'Менің ваучерім';

  @override
  String get voucherCodeCopied => 'Код көшірілді';

  @override
  String get voucherUsed => 'Пайдаланылды';

  @override
  String get voucherActive => 'Белсенді';

  @override
  String voucherIssuedAt(Object p1) {
    return 'Берілді: $p1';
  }

  @override
  String get voucherGiftCardLabel => 'UZS · СЫЙЛЫҚ КАРТАСЫ';

  @override
  String get voucherShowQr =>
      'QR-кодты кассирге көрсетіңіз немесе кодты айтыңыз';

  @override
  String get voucherStores => 'Korzinka.uz дүкендері';

  @override
  String get voucherSupport => 'Қолдау қызметі';

  @override
  String get walletPendingVouchers => 'Кезектегі ваучерлер';

  @override
  String get walletUseIqc => 'IQC пайдалану';

  @override
  String get walletMyVouchers => 'Менің ваучерлерім';

  @override
  String get walletNoVouchers => 'Әзірге ваучерлер жоқ';

  @override
  String get walletRedeemTitle => 'Ұпайлар айырбастала ма?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 — $p2 IQC-ға';
  }

  @override
  String get walletCancel => 'Болдырмау';

  @override
  String get walletRedeem => 'Айырбастау';

  @override
  String get walletVoucherIssued => 'Ваучер рәсімделді';

  @override
  String get walletTitle => 'Әмиян';

  @override
  String get walletBalanceLabel => 'БАЛАНС';

  @override
  String walletTotalAccrued(Object p1) {
    return 'Барлығы есептелді: $p1 IQC';
  }

  @override
  String get walletHistoryArrow => 'Тарих →';

  @override
  String get walletQuestDoneAwaiting =>
      'Квест орындалды — ваучер берілуін күтуде';

  @override
  String walletForIqc(Object p1) {
    return '$p1 IQC-ға';
  }

  @override
  String get walletGetVoucher => 'Ваучер алу';

  @override
  String get walletNotEnoughIqc => 'IQC жеткіліксіз';

  @override
  String walletCodeMeta(Object p1, Object p2) {
    return 'Код: $p1 · $p2';
  }

  @override
  String get walletVoucherUsed => 'Пайдаланылды';

  @override
  String get walletVoucherActive => 'Белсенді';

  @override
  String get walletHistoryTitle => 'Тарих';

  @override
  String get walletNoTransactions => 'Әзірге операциялар жоқ';

  @override
  String get brandProductsBrand => 'Бренд';

  @override
  String get brandProductsFormat => 'Формат';

  @override
  String get brandProductsMxik => 'МХИК';

  @override
  String get brandProductsDivisible => 'Бөлінетін';

  @override
  String get brandProductsYes => 'Иә';

  @override
  String get brandProductsNo => 'Жоқ';

  @override
  String get brandProductsQuests => 'Квесттер';

  @override
  String get medrepHomePeriodAll => 'Барлығы';

  @override
  String get medrepHomePeriod30d => '30 күн';

  @override
  String get medrepHomePeriod7d => '7 күн';

  @override
  String get leaderboardTabChecks => 'Чектер';

  @override
  String get leaderboardTabPharm => 'Фармацевттер';

  @override
  String get leaderboardTabQuests => 'Квесттер';

  @override
  String leaderboardMyRankLabel(Object company) {
    return '$company | Менің орным: ';
  }

  @override
  String leaderboardMyRank(Object rank, Object total) {
    return '#$rank / $total';
  }

  @override
  String portfolioChecksChip(Object count) {
    return 'Чектер: $count';
  }

  @override
  String portfolioQuestsChip(Object count) {
    return 'Квесттер: $count';
  }

  @override
  String referralsDate(Object date) {
    return 'Өтінім: $date';
  }

  @override
  String get checksStatusApproved => 'Мақұлданды';

  @override
  String get checksStatusRejected => 'Қабылданбады';

  @override
  String get checksStatusPending => 'Тексерілуде';

  @override
  String questDetailRewardVoucherLine(Object amount) {
    return 'Korzinka · $amount сум';
  }

  @override
  String get questDetailRewardIqcLine => 'Барлық дәріханалар · шектеусіз';

  @override
  String questDetailActiveUntil(Object date) {
    return '$date дейін белсенді';
  }

  @override
  String get questDetailFinished => 'Аяқталды';

  @override
  String questsPurchasesOfGoal(Object completed, Object goal) {
    return '$completed / $goal сатып алу';
  }

  @override
  String questsPurchases(Object completed) {
    return '$completed сатып алу';
  }

  @override
  String get profileLanguageTitle => 'Тіл';

  @override
  String get profileChooseLanguage => 'Тілді таңдаңыз';
}

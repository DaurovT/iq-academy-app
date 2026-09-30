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
  String get navRecipes => 'Бланктар';

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
  String get miniAppsSubtitle => 'Бағдарлама қатысушыларына арналған акциялар';

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
      'IQC-ға ұяшықтарды таңдаңыз — қорытынды шығарылғанда астында не барын білесіз';

  @override
  String get sapperNoDraws => 'Белсенді акциялар жоқ';

  @override
  String get sapperRevealed => 'Аяқталды';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 жүлделер: $prizeCount  💎 $priceIqc IQC/ұяшық  ';
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
  String get sapperGoToGame => 'Алаңды ашу';

  @override
  String sapperReserveTitle(Object number) {
    return '№$number ұяшықты иеленесіз бе?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC пайдаланылады. Болдырмауға болмайды — ұяшық қорытынды шығарылғанға дейін сізге бекітіледі.';
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
  String get sapperDraws => 'Акциялар';

  @override
  String get sapperAcceptClosed =>
      'Ұяшық таңдау жабылды — қорытынды шығарылуда';

  @override
  String get sapperHiddenTitle => 'АЛАҢДАҒЫ ЖҮЛДЕЛЕР';

  @override
  String sapperFieldTotal(int count) {
    return 'Алаңда $count ұяшық';
  }

  @override
  String sapperRevealIn(Object time) {
    return 'қорытындыға $time қалды';
  }

  @override
  String get sapperNoPrizes => 'жүлделер көрсетілмеген';

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
    return 'ұяшық — $price IQC';
  }

  @override
  String get sapperYourBalance => 'Сіздің балансыңыз';

  @override
  String get sapperCellPriceLabel => 'бір ұяшыққа';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Сіз $count $word алдыңыз!';
  }

  @override
  String get sapperNoWin => 'Бұл жолы жүлдесіз';

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
  String get sapperLegendOccupied => 'Басқалар алған';

  @override
  String get sapperLegendFree => 'Бос';

  @override
  String get sapperWinners => 'Жүлде алғандар';

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
  String get loginChooseMethod => 'Кірудің ыңғайлы тәсілін таңдаңыз';

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
  String get loginNoAccount => 'Аккаунтыңыз жоқ па?';

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
  String get profileSupportSubtitle =>
      'Telegram және телефон арқылы жауап береміз';

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
  String get profileLogoutConfirmBody =>
      'Қолданбаны қайта пайдалану үшін қайтадан кіру қажет болады.';

  @override
  String get profileLogoutAction => 'Шығу';

  @override
  String get profileDeleteConfirmTitle => 'Аккаунт жойылсын ба?';

  @override
  String get profileDeleteConfirmBody =>
      'Профиль, телефон нөмірі, кіру байланыстары, хабарламалар және қолдау қызметімен хат алмасу жойылады. Есептеулер мен берілген ваучерлер туралы жазбалар жеке деректеріңізсіз сақталады — олар есеп үшін қажет. Бұл әрекетті қайтару мүмкін емес.';

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
  String get notifSettingsChecks => 'Чек және бланк мәртебелері';

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
  String get docHomeSubtitle => 'Бланктарды жіберіп, сыйақы алыңыз';

  @override
  String get docHomeWalletBalance => 'ӘМИЯН БАЛАНСЫ';

  @override
  String get docHomeWallet => 'Әмиян';

  @override
  String get docHomeSendRecipe => 'Бланк жіберу';

  @override
  String get docHomeSendRecipeHint =>
      'Бланкты суретке түсіріңіз — AI дәрілерді таниды';

  @override
  String get docHomeStatRecipes => 'барлық бланктар';

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
  String get recipeDetailMyRecipes => 'Менің бланктарым';

  @override
  String recipeDetailTitle(Object id) {
    return 'Бланк №$id';
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
  String get recipesTitle => 'Менің бланктарым';

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
  String get recipesEmpty => 'Әзірге бланктар жоқ';

  @override
  String get recipesTakePhoto => 'Суретке түсіру';

  @override
  String get recipesFromGallery => 'Галереядан таңдау';

  @override
  String get recipesUploading => 'Бланк қосылды — жүктелуде';

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
  String get recipesSubmitButton => 'Бланк жіберу';

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
  String get walletRedeemTitle => 'Ваучерді рәсімдейсіз бе?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 — $p2 IQC-ға';
  }

  @override
  String get walletCancel => 'Болдырмау';

  @override
  String get walletRedeem => 'Рәсімдеу';

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
    return 'Korzinka ваучері · $amount IQC';
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

  @override
  String get navDoctors => 'Дәрігерлер';

  @override
  String get doctorsTitle => 'Дәрігерлер';

  @override
  String get doctorsHint =>
      'Компанияңыздың дәрігерлері және олардың бланк квесті бойынша үлгерімі';

  @override
  String get doctorsSearchHint => 'Дәрігер, клиника, қала бойынша іздеу';

  @override
  String get doctorsCompleted => 'Орындады';

  @override
  String get doctorsInProgress => 'Орындалуда';

  @override
  String get doctorsIdle => 'Бастамаған';

  @override
  String get doctorsNoQuest => 'Белсенді бланк квесті жоқ';

  @override
  String get doctorsUnavailable =>
      'Компанияңызда бланк жобасы жоқ, сондықтан дәрігерлер қосылмаған';

  @override
  String get doctorsEmpty => 'Әзірге дәрігерлер жоқ';

  @override
  String get doctorsNotFound => 'Ештеңе табылмады';

  @override
  String get doctorsRegionUnknown => 'Аймақ көрсетілмеген';

  @override
  String doctorsRecipesCount(Object count) {
    return 'Барлық уақыттағы бланктар: $count';
  }

  @override
  String doctorsQuestGoal(Object goal) {
    return 'Норма: $goal';
  }

  @override
  String doctorsDoneTimes(Object count) {
    return 'Орындалды ×$count';
  }

  @override
  String doctorsRegionSummary(Object doctors, Object completed) {
    return '$doctors дәрігер · $completed орындады';
  }

  @override
  String get doctorsAll => 'Барлығы';

  @override
  String get loginWithGoogle => 'Google арқылы кіру';

  @override
  String get loginWithApple => 'Apple арқылы кіру';

  @override
  String get oauthLinkTitle => 'Телефон нөміріңізді растаңыз';

  @override
  String get oauthLinkBody =>
      'Нөмірді бір рет растаңыз — осылайша аккаунтыңыз бен ұпайларыңызды табамыз. Келесі жолы бір түртумен кіресіз.';

  @override
  String get oauthLinkPhoneLabel => 'Телефон нөмірі';

  @override
  String get oauthLinkSendCode => 'Кодты алу';

  @override
  String oauthLinkCodeSent(String phone) {
    return 'Код $phone нөміріне жіберілді';
  }

  @override
  String get oauthLinkCodeLabel => 'SMS коды';

  @override
  String get oauthLinkConfirm => 'Растау';

  @override
  String get oauthLinkChangePhone => 'Нөмірді өзгерту';

  @override
  String get profilePrivacy => 'Құпиялық саясаты';

  @override
  String get profilePrivacySubtitle =>
      'Қандай деректер жинаймыз және қалай сақтаймыз';

  @override
  String get sapperRulesButton => 'Акция ережелері';

  @override
  String get sapperRulesTitle => '«Супер Сапёр» акциясының ережелері';

  @override
  String get sapperRulesFull => 'Толық ресми ережелер';

  @override
  String get sapperRulesAccept =>
      'Ұяшықты алу арқылы сіз акция ережелерін қабылдайсыз.';

  @override
  String get sapperRule1 =>
      'Ұйымдастырушы — «PHARMIQ ACADEMY» ЖШС. Apple мен Google акцияның демеушісі емес және оған қатыспайды.';

  @override
  String get sapperRule2 =>
      'Акцияда ақша қолданылмайды: тек IQC ұпайларымен қатысуға болады.';

  @override
  String get sapperRule3 =>
      'IQC ұпайлары оқу, сауалнамалар және расталған квесттер үшін беріледі. Оларды сатып алуға, басқа пайдаланушыға беруге немесе ақшаға айырбастауға болмайды.';

  @override
  String get sapperRule4 =>
      'Мерзімдер, ұяшық бағасы және жүлделердің толық тізімі қатысуға дейін акция бетінде көрсетіледі.';

  @override
  String get sapperRule5 =>
      'Ұпайлар ұяшықты алғанда шегеріледі, мұны болдырмауға болмайды. Бір ұяшықты бір қатысушы алады; қабылдау қорытындыдан 1 минут бұрын жабылады.';

  @override
  String get sapperRule6 =>
      'Жүлделер ұяшықтарға акция басталғанға дейін орналастырылады және кейін өзгермейді. Белгіленген уақытта барлық ұяшықтар бір мезгілде ашылады, ұяшықтағы жүлдені оны алған қатысушы автоматты түрде алады. Қорытынды бәріне көрінеді.';

  @override
  String get sapperRule7 =>
      'Жүлделер — серіктестердің сыйлық ваучерлері мен бонус ұпайлар; ақшаға айырбасталмайды. Бос ұяшықтардағы жүлделер қайта таратылмайды.';

  @override
  String get sapperRule8 =>
      'Акция тоқтатылса, жұмсалған барлық ұпайлар қайтарылады. 18 жастан асқан пайдаланушылар қатыса алады, қатысу ерікті.';

  @override
  String get stateServerErrorTitle => 'Бірдеңе дұрыс болмады';

  @override
  String get stateServerErrorText =>
      'Мәселе туралы білеміз және оны түзетіп жатырмыз. Бір минуттан кейін қайталап көріңіз';

  @override
  String get stateWriteSupport => 'Қолдау қызметіне жазу';

  @override
  String stateErrorCode(String code) {
    return 'Қате коды: $code';
  }

  @override
  String get stateOfflineTitle => 'Интернетке қосылым жоқ';

  @override
  String get stateOfflineText =>
      'Wi‑Fi немесе мобильді интернетті тексеріңіз. Байланыс пайда болғанда экран өзі жаңарады';

  @override
  String stateOfflineBanner(String time) {
    return 'Байланыс жоқ · $time деректері';
  }

  @override
  String get stateOfflineBannerShort => 'Байланыс жоқ';

  @override
  String get stateOfflineSendHint =>
      'Интернет пайда болғанда жіберу мүмкін болады';

  @override
  String get stateRefreshing => 'Жаңартып жатырмыз…';

  @override
  String get miniAppsNewGamesTitle => 'Жаңа мини-қосымшалар';

  @override
  String get miniAppsNewGamesText =>
      'Әзірленіп жатыр — пайда болғанда хабарлаймыз';

  @override
  String sapperBackTo(String label) {
    return 'Артқа: $label';
  }

  @override
  String sapperPrizesCount(int n) {
    return '$n жүлде';
  }

  @override
  String sapperMyCellsCount(int n) {
    return 'Сіздің ұяшықтарыңыз: $n';
  }

  @override
  String sapperResultsIn(String time) {
    return 'Қорытынды $time кейін';
  }

  @override
  String get sapperCellPriceTitle => 'Ұяшық бағасы';

  @override
  String get sapperMyCellsTitle => 'Сіздің ұяшықтарыңыз';

  @override
  String get sapperOccupiedTitle => 'Алынған ұяшықтар';

  @override
  String sapperOccupiedOf(int occupied, int total) {
    return '$occupied / $total';
  }

  @override
  String sapperOfTotal(int total) {
    return '/ $total';
  }

  @override
  String get sapperHiddenLabel => 'Алаңда жасырылған';

  @override
  String get sapperHowTitle => 'Қалай қатысуға болады';

  @override
  String get sapperStep1Title => 'Ұяшықтарды таңдаңыз';

  @override
  String sapperStep1Text(int price) {
    return 'Әрқайсысы $price IQC тұрады. Бірден бірнешеуін алуға болады';
  }

  @override
  String get sapperStep2Title => 'Қорытындыны күтіңіз';

  @override
  String get sapperStep2Text => 'Аптасына бір рет алаң барлығына ашылады';

  @override
  String get sapperStep3Title => 'Сыйлықты алыңыз';

  @override
  String get sapperStep3Text =>
      'IQC балансқа түседі, ваучер әмиянда пайда болады';

  @override
  String get sapperSelectHint => 'Таңдау үшін бос ұяшықтарды басыңыз';

  @override
  String sapperSelectedHint(int n, int price) {
    return 'Таңдалды: $n · $price IQC шегеріледі';
  }

  @override
  String sapperTakeCta(int n, int price) {
    return '$n ұяшықты алу · $price IQC';
  }

  @override
  String sapperTakenToast(int n) {
    return '+$n ұяшық — қорытындыны күтеміз';
  }

  @override
  String sapperReserveManyTitle(int n) {
    return '$n ұяшықты аласыз ба?';
  }

  @override
  String get sapperCellFree => 'Бос ұяшық';

  @override
  String get sapperCellTheirs => 'Басқа қатысушы алған';

  @override
  String get sapperCellMine => 'Сіздің ұяшығыңыз';

  @override
  String get sapperCellSelected => 'Таңдалды, алып тастау үшін басыңыз';

  @override
  String get sapperCellEmpty => 'Бос';

  @override
  String sapperCellPrize(String label) {
    return 'Жүлде: $label';
  }

  @override
  String sapperGridLabel(int cols, int rows) {
    return '$cols × $rows алаң';
  }

  @override
  String get sapperGridRevealed => 'Ашылған алаң';

  @override
  String sapperWonTitle(String prize) {
    return 'Сіз $prize алдыңыз';
  }

  @override
  String sapperWonText(int wins, int total) {
    return 'Балансқа түсті · сыйлықты ұяшықтар: $wins / $total';
  }

  @override
  String get sapperNotParticipated => 'Сіз бұл акцияға қатыспадыңыз';

  @override
  String sapperRevealedOn(String date) {
    return 'Қорытынды шығарылды · $date';
  }

  @override
  String get sapperWinnerYou => 'сіз';

  @override
  String sapperWinnerCell(int n) {
    return '№$n ұяшық';
  }

  @override
  String get sapperPlayNew => 'Жаңа акцияға қатысу';

  @override
  String get sapperViewResults => 'Қорытындыны көру';

  @override
  String get questsSubtitle => 'Сатыңыз және марапат алыңыз';

  @override
  String get questsSubtitleDoctor => 'Рецепт жазыңыз және марапат алыңыз';

  @override
  String get questsSearchLabel => 'Квесттерді іздеу';

  @override
  String get questsTabDone => 'Аяқталған';

  @override
  String get questsSortHint => 'Алдымен — марапатқа ең жақындары';

  @override
  String get questsAlmostDone => 'Дайын болуға жақын';

  @override
  String get questsCompleted => 'Орындалды';

  @override
  String questsOfGoalSales(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal сатылымнан',
    );
    return '$_temp0';
  }

  @override
  String questsOfGoalRecipes(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal рецепттен',
    );
    return '$_temp0';
  }

  @override
  String questsLeftShort(int n) {
    return 'Тағы $n';
  }

  @override
  String get questsMore => 'Толығырақ';

  @override
  String get questsHowTitle => 'Квесттер қалай жұмыс істейді';

  @override
  String get questsStepSellTitle => 'Сатыңыз';

  @override
  String get questsStepSellSub => 'препаратты';

  @override
  String get questsStepPrescribeTitle => 'Жазыңыз';

  @override
  String get questsStepPrescribeSub => 'рецептті';

  @override
  String get questsStepSendTitle => 'Жіберіңіз';

  @override
  String get questsStepSendCheckSub => 'чек фотосын';

  @override
  String get questsStepSendRecipeSub => 'рецепт фотосын';

  @override
  String get questsStepGetTitle => 'Алыңыз';

  @override
  String get questsStepGetSub => 'марапатты';

  @override
  String get questsDoneFooter =>
      'Мұнда орындалған және аяқталған квесттер күнімен және алынған марапатымен сақталады';

  @override
  String questsDoneOn(String date) {
    return 'Орындалды · $date';
  }

  @override
  String questsEndedOn(String date) {
    return 'Аяқталды · $date';
  }

  @override
  String get questsEmptyDoneTitle => 'Әзірге аяқталған квесттер жоқ';

  @override
  String questsMonthName(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Қаңтар',
      'm2': 'Ақпан',
      'm3': 'Наурыз',
      'm4': 'Сәуір',
      'm5': 'Мамыр',
      'm6': 'Маусым',
      'm7': 'Шілде',
      'm8': 'Тамыз',
      'm9': 'Қыркүйек',
      'm10': 'Қазан',
      'm11': 'Қараша',
      'm12': 'Желтоқсан',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get questsSalesLeftPrefix => 'Сату қалды:';

  @override
  String get questsRecipesLeftPrefix => 'Жазу қалды:';

  @override
  String questsPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қаптама',
    );
    return '$_temp0';
  }

  @override
  String questsRecipesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n рецепт',
    );
    return '$_temp0';
  }

  @override
  String get questsGoalReached =>
      'Мақсатқа жетті — марапат тексерістен кейін беріледі';

  @override
  String get questsRewardLabel => 'Марапат';

  @override
  String questsVoucherTitle(String shop) {
    return '$shop ваучері';
  }

  @override
  String get questsRewardManual => 'Тексерістен кейін қолмен беріледі';

  @override
  String get questsRewardIqcSub => 'Ұпайлар тексерістен кейін балансқа түседі';

  @override
  String get questsRewardReceived => 'Марапат алынды';

  @override
  String questsStepSellDrug(String drug) {
    return '$drug сатыңыз';
  }

  @override
  String questsStepPrescribeDrug(String drug) {
    return '$drug жазыңыз';
  }

  @override
  String questsNeedSell(String packs) {
    return '$packs сату керек';
  }

  @override
  String questsNeedPrescribe(String recipes) {
    return '$recipes жазу керек';
  }

  @override
  String get questsStepPhotoCheck => 'Чекті суретке түсіріңіз';

  @override
  String get questsStepPhotoCheckSub =>
      'ЖИ қаптаманы автоматты түрде тексереді';

  @override
  String get questsStepPhotoRecipe => 'Рецептті суретке түсіріңіз';

  @override
  String get questsStepPhotoRecipeSub =>
      'ЖИ рецептті автоматты түрде тексереді';

  @override
  String get questsStepGetVoucher => 'Ваучер алыңыз';

  @override
  String questsStepGetIqc(int n) {
    return '$n IQC алыңыз';
  }

  @override
  String get questsConditionsTitle => 'Шарттар';

  @override
  String get questsSalesLimit => 'Сатылым лимиті';

  @override
  String get questsRecipesLimit => 'Рецепт лимиті';

  @override
  String get questsNoLimit => 'Шектеусіз';

  @override
  String questsPacksShort(int n) {
    return '$n қапт.';
  }

  @override
  String get questsCountedTitle => 'Есепке алынған чектер';

  @override
  String get questsCountedRecipesTitle => 'Есепке алынған рецепттер';

  @override
  String get questsCountedEmpty => 'Әзірге бірде-бір чек жоқ';

  @override
  String get questsCountedEmptyRecipes => 'Әзірге бірде-бір рецепт жоқ';

  @override
  String get questsCountedEmptySub =>
      'Квест бойынша чектер тексерістен кейін осында пайда болады';

  @override
  String get questsCountedEmptySubRecipes =>
      'Квест бойынша рецепттер тексерістен кейін осында пайда болады';

  @override
  String questsCountedSales(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n сатылым есепке алынды',
    );
    return '$_temp0';
  }

  @override
  String questsCountedRecipes(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n рецепт есепке алынды',
    );
    return '$_temp0';
  }

  @override
  String get questsAllChecks => 'Барлық чектер';

  @override
  String get questsAllRecipes => 'Барлық рецепттер';

  @override
  String get questsSendCheck => 'Квест бойынша чек жіберу';

  @override
  String get questsSendRecipe => 'Квест бойынша рецепт жіберу';

  @override
  String get questsSearchPlaceholder => 'Атауы немесе препарат';

  @override
  String get questsSearchClear => 'Тазалау';

  @override
  String questsFound(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n квест табылды',
    );
    return '$_temp0';
  }

  @override
  String get questsPopular => 'Жиі іздейді';

  @override
  String get questsNothingFound => 'Ештеңе табылмады';

  @override
  String get questsNothingFoundSub =>
      'Препарат атауын тексеріңіз немесе басқа сұрау енгізіңіз';

  @override
  String get questsReceived => 'алынды';

  @override
  String get questsPending => 'күтілуде';

  @override
  String get walletAccruedAllTime => 'барлық уақытта есептелді';

  @override
  String walletAwaitingStat(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ваучер берілуін күтуде',
      one: 'ваучер берілуін күтуде',
    );
    return '$_temp0';
  }

  @override
  String get walletArchive => 'Мұрағат';

  @override
  String get walletArchiveTitle => 'Ваучерлер мұрағаты';

  @override
  String get walletTapCardHint => 'Картаны басыңыз — QR-кодты көрсетеміз';

  @override
  String get walletAllArchivedTitle => 'Барлық ваучерлер мұрағатта';

  @override
  String get walletAllArchivedText =>
      'Жаңалары квесттер орындалғаннан кейін пайда болады';

  @override
  String get walletGiftCard => 'Сыйлық картасы';

  @override
  String get walletGiftCardBoth => 'СЫЙЛЫҚ КАРТАСЫ · SOVG\'A KARTASI';

  @override
  String get walletGiftCardKorzinka => 'Korzinka сыйлық картасы';

  @override
  String get walletReceived => 'Алынды';

  @override
  String get walletCode => 'Код';

  @override
  String get walletShowQr => 'Көрсету';

  @override
  String get walletStatusLabel => 'Мәртебе';

  @override
  String get walletWhere => 'Қайда';

  @override
  String get walletStatusArchived => 'Мұрағатта';

  @override
  String get walletAwaitingTitle => 'Берілуін күтуде';

  @override
  String walletQuestDoneOn(String date) {
    return 'Квест орындалды · $date';
  }

  @override
  String walletPcs(int n) {
    return '$n дана';
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
      'Ваучерлер тексерістен кейін қолмен беріледі — әдетте бірнеше күн ішінде';

  @override
  String walletShowAll(int n) {
    return 'Барлығын көрсету ($n)';
  }

  @override
  String get walletExchangeTitle => 'IQC айырбастау';

  @override
  String get walletShopTitle => 'IQC айырбасы';

  @override
  String walletProgressOf(String have, String need) {
    return '$have / $need IQC';
  }

  @override
  String walletMore(String n) {
    return 'Тағы $n';
  }

  @override
  String get walletSaveUp => 'Айырбастау үшін IQC жинаңыз';

  @override
  String walletExchangeFor(String amount) {
    return '$amount IQC-ге айырбастау';
  }

  @override
  String walletOpenVoucher(String sum) {
    return '$sum ваучерін ашу';
  }

  @override
  String get walletClose => 'Жабу';

  @override
  String get walletVoucherDialog => 'Korzinka ваучері';

  @override
  String get walletArchiveUsed => 'Мұрағатқа — ваучер пайдаланылды';

  @override
  String walletArchivedToast(String code) {
    return '••$code ваучері мұрағатта';
  }

  @override
  String get walletUndo => 'Болдырмау';

  @override
  String get walletBack => 'Артқа';

  @override
  String get walletBackToWallet => 'Әмиянға оралу';

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
  String get walletRestore => 'Қайтару';

  @override
  String walletRestoreA11y(String code) {
    return '••$code ваучерін қайтару';
  }

  @override
  String get walletRestoreHint =>
      'Ваучерді қателесіп алып тастасаңыз, «Қайтару» басыңыз — ол қайтадан әмиянда пайда болады';

  @override
  String get walletArchiveEmptyTitle => 'Мұрағат бос';

  @override
  String get walletArchiveEmptyText =>
      'Ваучерді пайдаландыңыз ба? Оны осында алып қойыңыз — әмиянда тек жарамдылары қалады';

  @override
  String walletReceivedMeta(String date, String code) {
    return 'Алынды $date · код ••$code';
  }

  @override
  String get walletHistoryAll => 'Барлығы';

  @override
  String get walletHistoryEarned => 'Есептеулер';

  @override
  String get walletHistorySpent => 'Есептен шығару';

  @override
  String get walletEarnedMonth => 'Осы айда есептелді';

  @override
  String get walletSpentMonth => 'Осы айда жұмсалды';

  @override
  String get walletMonths =>
      'Қаңтар,Ақпан,Наурыз,Сәуір,Мамыр,Маусым,Шілде,Тамыз,Қыркүйек,Қазан,Қараша,Желтоқсан';

  @override
  String get walletAccrued => 'есептелді';

  @override
  String get walletDebited => 'шегерілді';

  @override
  String get walletTxnCheck => 'Чек';

  @override
  String get walletTxnRecipe => 'Рецепт';

  @override
  String get walletTxnSurvey => 'Сауалнама';

  @override
  String get walletTxnQuest => 'Квест орындалды';

  @override
  String get walletTxnCourse => 'Курс аяқталды';

  @override
  String get walletTxnRedeem => 'Ваучерге айырбастау';

  @override
  String get walletTxnReversal => 'Қайтарым';

  @override
  String get walletTxnAdjust => 'Түзету';

  @override
  String get walletTxnOther => 'Есептеу';

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
      other: '$n ваучер берілуін күтуде',
      one: '$n ваучер берілуін күтуде',
    );
    return '$_temp0';
  }

  @override
  String get walletStepDone => 'Квест орындалды';

  @override
  String get walletStepReview => 'Тексеру';

  @override
  String get walletStepIssue => 'Беру';

  @override
  String get walletQueueHint =>
      'Ваучерлер тексерістен кейін қолмен беріледі — әдетте бірнеше күн ішінде. Ваучер әмиянда пайда болғанда хабарлама жібереміз';

  @override
  String get walletQueueEmptyTitle => 'Кезек бос';

  @override
  String get walletQueueEmptyText =>
      'Ваучер-сыйлығы бар квестті орындаңыз — ол берілгенге дейін осында көрінеді';

  @override
  String get walletYourBalance => 'Сіздің балансыңыз';

  @override
  String walletEnoughFor(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучерге жетеді',
      one: '$n ваучерге жетеді',
      zero: 'Әзірге ваучерге жетпейді',
    );
    return '$_temp0';
  }

  @override
  String get walletShopNote =>
      'Ваучер айырбас расталғаннан кейін әмиянда пайда болады';

  @override
  String walletConfirmTitle(String amount) {
    return '$amount IQC айырбасталсын ба?';
  }

  @override
  String walletConfirmText(String sum) {
    return '$sum сомасына Korzinka сыйлық картасын алыңыз';
  }

  @override
  String get walletWillDebit => 'Шегереміз';

  @override
  String get walletWillRemain => 'Қалады';

  @override
  String get walletWhereTo => 'Қайда түседі';

  @override
  String get walletToWallet => 'Әмиянға';

  @override
  String get walletExchange => 'Айырбастау';

  @override
  String get walletExchangeFailed => 'IQC айырбастау мүмкін болмады';

  @override
  String get walletShare => 'Ваучермен бөлісу';

  @override
  String get walletCopyCode => 'Кодты көшіру';

  @override
  String get walletQrLabel => 'Ваучердің QR-коды';

  @override
  String get walletShowQrCashier =>
      'QR-кодты кассирге көрсетіңіз немесе кодты айтыңыз';

  @override
  String get walletStores => 'Korzinka дүкендері';

  @override
  String get walletToArchive => 'Мұрағатқа';

  @override
  String get walletToArchiveHint =>
      'Ваучерді пайдаландыңыз ба? Оны мұрағатқа салыңыз — ол тарихта қалады';

  @override
  String get walletRestoreFromArchive => 'Мұрағаттан қайтару';

  @override
  String get learnSubtitle => 'Курстардан өтіп, IQC алыңыз';

  @override
  String get learnSearchA11y => 'Курстарды іздеу';

  @override
  String get learnSearchPlaceholder => 'Курс немесе бренд атауы';

  @override
  String get learnSearchClear => 'Тазалау';

  @override
  String get learnSegNew => 'Жаңа';

  @override
  String get learnSegProgress => 'Өтуде';

  @override
  String get learnSegDone => 'Өтілгендер';

  @override
  String learnTileVideo(int n) {
    return '$n бейнесабақ';
  }

  @override
  String learnTileQuiz(int n) {
    return '$n тест';
  }

  @override
  String get learnTileReward => 'Сыйақы';

  @override
  String learnMinutesShort(int n) {
    return '~$n мин';
  }

  @override
  String get learnQuizStatusLocked => 'Жабық';

  @override
  String get learnQuizStatusOpen => 'Қолжетімді';

  @override
  String learnIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get learnCtaStart => 'Курсты бастау';

  @override
  String get learnCtaContinue => 'Жалғастыру';

  @override
  String get learnCtaRepeat => 'Қайта өту';

  @override
  String learnProgressLabel(int pct) {
    return '$pct% өтілді';
  }

  @override
  String get learnEmptyTitle => 'Әзірге курстар жоқ';

  @override
  String get learnEmptyText =>
      'Дәріханаңызға арналған курстар әлі қосылмаған. Жаңа курс пайда болғанда хабарлама жібереміз';

  @override
  String get learnEnableNotifications => 'Хабарламаларды қосу';

  @override
  String get learnNoResultsTitle => 'Ештеңе табылмады';

  @override
  String learnNoResultsInTab(String query, String tab) {
    return '«$tab» қойындысында «$query» сұрауы бойынша курстар жоқ. Жазылуын тексеріңіз немесе барлық курстардан іздеңіз';
  }

  @override
  String learnNoResultsAll(String query) {
    return '«$query» сұрауы бойынша курстар жоқ. Жазылуын тексеріңіз немесе басқа атауды байқап көріңіз';
  }

  @override
  String get learnSearchEverywhere => 'Барлық курстардан іздеу';

  @override
  String get learnTabEmptyTitle => 'Мұнда әзірге бос';

  @override
  String get learnTabEmptyNew =>
      'Барлық курстар басталған — оқуды «Өтуде» қойындысында жалғастырыңыз';

  @override
  String get learnTabEmptyProgress =>
      '«Жаңа» қойындысынан кез келген курсты бастаңыз — ол осында пайда болады';

  @override
  String get learnTabEmptyDone =>
      'Өтілген курстар тесттен сәтті өткеннен кейін осында пайда болады';

  @override
  String get learnBack => 'Артқа';

  @override
  String get learnCourseTitle => 'Курс';

  @override
  String learnMetaVideos(int n) {
    return '$n бейнесабақ';
  }

  @override
  String learnMetaMinutes(int n) {
    return '~$n минут';
  }

  @override
  String get learnProgram => 'Курс бағдарламасы';

  @override
  String get learnRowVideo => 'Бейнесабақ';

  @override
  String get learnRowQuiz => 'Тест';

  @override
  String get learnRowQuizLocked => 'Бейнеден кейін ашылады';

  @override
  String get learnRowRewardPending => 'Тесттен кейін есептейміз';

  @override
  String get learnRowRewardDone => 'Есептелді';

  @override
  String learnLessonOf(int i, int n) {
    return '$n сабақтың $i-сі';
  }

  @override
  String get learnLessonTabText => 'Сабақ мәтіні';

  @override
  String get learnLessonTabMaterials => 'Материалдар';

  @override
  String get learnWatchVideo => 'Бейнені көру';

  @override
  String get learnVideoUnavailable => 'Бейне қолжетімсіз';

  @override
  String get learnLessonHintLocked =>
      'Бейнені соңына дейін көріңіз — содан кейін тест ашылады';

  @override
  String get learnLessonHintFinish =>
      'Бейнені көрдіңіз бе? Әрі қарай өту үшін сабақты аяқтаңыз';

  @override
  String get learnStartTest => 'Тестті бастау';

  @override
  String get learnNextLesson => 'Келесі сабақ';

  @override
  String get learnFinishLesson => 'Сабақты аяқтау';

  @override
  String get learnFinishingLesson => 'Сақталуда…';

  @override
  String get learnBackToCourse => 'Курсқа';

  @override
  String learnTestTopBar(String name) {
    return 'Тест · $name';
  }

  @override
  String learnQuestionOf(String i, int n) {
    return '$n сұрақтың $i-сі';
  }

  @override
  String get learnNext => 'Әрі қарай';

  @override
  String get learnFinishTest => 'Тестті аяқтау';

  @override
  String get learnSubmitting => 'Тексерілуде…';

  @override
  String get learnCoursePassed => 'Курс өтілді!';

  @override
  String get learnTestPassed => 'Тест тапсырылды!';

  @override
  String get learnPassedText => 'Тамаша жұмыс. Ұпайлар балансыңызға түсті.';

  @override
  String get learnPassedTextNoReward => 'Тамаша жұмыс!';

  @override
  String learnScoreOf(int score, int total) {
    return '$total-ден $score';
  }

  @override
  String get learnCorrectAnswers => 'дұрыс жауап';

  @override
  String get learnOpenWallet => 'Әмиянды ашу';

  @override
  String get learnToOtherCourses => 'Басқа курстарға';

  @override
  String get learnContinueCourse => 'Курсты жалғастыру';

  @override
  String get learnFailedTitle => 'Сәл ғана жетпеді';

  @override
  String get learnFailedText =>
      'Дұрыс жауаптар жеткіліксіз. Сабақты қайта қарап, тағы байқап көріңіз — ұпайлар сізді күтуде.';

  @override
  String learnRewardStillAvailable(int n) {
    return '+$n IQC әлі де қолжетімді';
  }

  @override
  String get learnCanRetry => 'Тестті қайта тапсыруға болады';

  @override
  String get learnRewatchLesson => 'Сабақты қайта көру';

  @override
  String get learnRetryTest => 'Тестті қайта тапсыру';

  @override
  String rxHomeGreeting(String name) {
    return 'Сәлем, $name!';
  }

  @override
  String get rxHomeSubtitle => 'Бланктарды жіберіп, марапаттар алыңыз';

  @override
  String get rxHomeBellLabel => 'Хабарландырулар';

  @override
  String get rxHomeBellUnread => 'Хабарландырулар, жаңалары бар';

  @override
  String rxHomeStatQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'белсенді квест',
    );
    return '$_temp0';
  }

  @override
  String get rxHomeStatApproved => 'мақұлданған бланк';

  @override
  String get rxHomeStatPending => 'тексеруде';

  @override
  String get rxHomeRecent => 'Соңғы бланктар';

  @override
  String get rxHomeAllRecipes => 'Барлық бланктар';

  @override
  String rxQuestProgress(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal бланк',
    );
    return '$done / $_temp0';
  }

  @override
  String rxQuestLeft(int n) {
    return 'Тағы $n';
  }

  @override
  String rxQuestDone(int pct) {
    return 'Орындалды $pct%';
  }

  @override
  String rxRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get rxRewardVoucher => 'Ваучер';

  @override
  String get rxWaitValue => '~24 сағ';

  @override
  String get rxWaitCaption => 'күту';

  @override
  String get rxSoon => 'Жақында';

  @override
  String get rxSoonCaption => 'есептеу';

  @override
  String get rxRetake => 'Қайта түсіру';

  @override
  String get rxRetakeRecipe => 'Бланкты қайта түсіру';

  @override
  String rxMeta(String date, int n) {
    return '$date · $n сурет';
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
  String get rxTabPending => 'Тексеруде';

  @override
  String get rxTabDone => 'Аяқталған';

  @override
  String get rxFilterEmpty => 'Бұл бөлімде әзірге бланктар жоқ';

  @override
  String get rxPendingHint => '24 сағатқа дейін тексереміз';

  @override
  String get rxRejectedDefault => 'Бланк тексеруден өтпеді';

  @override
  String get rxEmptyTitle => 'Бланктарыңыз осында пайда болады';

  @override
  String get rxEmptyText =>
      'Жазылған бланкты суретке түсіріңіз — AI дәрілерді таниды, тексеруден кейін IQC аласыз';

  @override
  String get rxHowTo => 'Қалай суретке түсіру керек';

  @override
  String get rxTipWholeTitle => 'Бланк толығымен';

  @override
  String get rxTipWholeText => 'Парақтың барлық шеттері кадрда';

  @override
  String get rxTipStampTitle => 'Мөр мен қолтаңба';

  @override
  String get rxTipStampText => 'Оларсыз бланк қабылданбайды';

  @override
  String get rxTipLightTitle => 'Жақсы жарық';

  @override
  String get rxTipLightText => 'Жылтырсыз және телефонның көлеңкесіз';

  @override
  String get rxSendFirst => 'Алғашқы бланкты жіберу';

  @override
  String get rxStatePendingTitle => 'Бланк тексеруде';

  @override
  String get rxStatePendingText =>
      'Маман бланкты тексеріп жатыр. Әдетте бұл 24 сағатқа дейін созылады';

  @override
  String get rxStateApprovedTitle => 'Бланк мақұлданды';

  @override
  String get rxStateApprovedText =>
      'Бәрі дұрыс. IQC жақын арада балансқа түседі';

  @override
  String get rxStateRejectedTitle => 'Бланк қабылданбады';

  @override
  String get rxStateRejectedHint =>
      'Бланкты жақсы жарықта толығымен суретке түсіріңіз — ұпайларды әлі де алуға болады';

  @override
  String get rxStepSent => 'Жіберілді';

  @override
  String get rxStepReview => 'Тексеру';

  @override
  String get rxStepApproved => 'Мақұлданды';

  @override
  String get rxStepCredited => 'Есептелді';

  @override
  String get rxStepRejected => 'Қабылданбады';

  @override
  String get rxPhotos => 'Бланк суреті';

  @override
  String rxOpenPhoto(int n) {
    return 'Бланктың $n-суретін ашу';
  }

  @override
  String get rxAiLater => 'Дәрілер тізімі тексеруден кейін пайда болады';

  @override
  String get rxAccrual => 'Есептеу';

  @override
  String get rxAccrualPendingTitle => 'Мақұлданғаннан кейін есептейміз';

  @override
  String get rxAccrualPendingText => 'Бланк мақұлданғаннан кейін';

  @override
  String get rxAccrualApprovedTitle => 'Есептеуді күтуде';

  @override
  String get rxQuests => 'Квестерге есептеу';

  @override
  String get rxQuestsPending => 'Бланк мақұлданғаннан кейін пайда болады';

  @override
  String get rxQuestsNone => 'Әзірге бірде-бір квестке есептелмеген';

  @override
  String get rxData => 'Бланк деректері';

  @override
  String get rxShowText => 'Танылған мәтінді көрсету';

  @override
  String get rxSupport => 'Бланк бойынша сұрақ бар ма? Бізге жазыңыз';

  @override
  String get rxCameraClose => 'Жабу';

  @override
  String get rxCameraLabel => 'Бланк';

  @override
  String get rxCameraTip => 'Мөр мен қолтаңба көрініп тұруы керек';

  @override
  String get rxCameraHold => 'Телефонды бланктың үстінде түзу ұстаңыз';

  @override
  String get rxCameraShoot => 'Суретке түсіру';

  @override
  String get rxCameraDenied => 'Камераға рұқсат жоқ. Оны баптауларда қосыңыз';

  @override
  String get rxOcrTitle => 'Танылған мәтін';

  @override
  String get rxOcrSubtitle => 'AI бланк суретін осылай оқыды';

  @override
  String get rxOcrNote =>
      'Науқастың аты-жөні жасырылған. Мәтін автоматты түрде танылды — қателер болуы мүмкін';

  @override
  String get rxOcrEmpty => 'Мәтін әлі танылмады';

  @override
  String get rxOcrEmptyText => 'Ол сурет өңделгеннен кейін осында пайда болады';

  @override
  String get rxCopy => 'Көшіру';

  @override
  String get rxCopied => 'Мәтін көшірілді';

  @override
  String get rxReportError => 'Мәтіндегі қате';

  @override
  String get rxBack => 'Артқа';

  @override
  String get homeBellUnread => 'Хабарламалар, жаңалары бар';

  @override
  String homeStatActiveQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'белсенді квест',
      one: 'белсенді квест',
    );
    return '$_temp0';
  }

  @override
  String get homeStatApproved => 'мақұлданған чек';

  @override
  String get homeStatPending => 'тексерілуде';

  @override
  String homeQuestSales(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal сатылымның $done',
      one: '$goal сатылымның $done',
    );
    return '$_temp0';
  }

  @override
  String homeQuestLeft(int n) {
    return 'Тағы $n';
  }

  @override
  String get homeQuestDone => 'Орындалды';

  @override
  String homeRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String homeCheckMeta(int id, String date) {
    return '№$id · $date';
  }

  @override
  String get homeCheckWait => '~24 сағ';

  @override
  String get homeCheckWaitCaption => 'күту';

  @override
  String get homeCheckRetake => 'Қайта түсіру';

  @override
  String get homeMiniAppsSub => 'Сапёр және басқа акциялар';

  @override
  String get homeNewTitle => 'Қош келдіңіз!';

  @override
  String get homeNewSubtitle => 'Үш қадам — және сіз бағдарламадасыз';

  @override
  String get homeNewStepsLabel => 'Алғашқы қадамдар';

  @override
  String homeNewStepsCount(int done, int total) {
    return '$total ішінен $done';
  }

  @override
  String get homeNewHeadline => 'Алғашқы чекті жіберіп, IQC алыңыз';

  @override
  String get homeNewStepRegister => 'Тіркелу';

  @override
  String get homeNewStepDone => 'Дайын';

  @override
  String get homeNewStepCheck => 'Алғашқы чекті жіберіңіз';

  @override
  String get homeNewStepCheckSub => 'Дәріхана чегін суретке түсіріңіз';

  @override
  String get homeNewStepCourse => 'Алғашқы курстан өтіңіз';

  @override
  String homeNewStepCourseReward(int iqc, String title) {
    return '«$title» үшін +$iqc IQC';
  }

  @override
  String homeNewStepCourseSub(String title) {
    return '«$title» курсы';
  }

  @override
  String get homeNewStepCourseAny => 'Курстар — «Оқу» бөлімінде';

  @override
  String get homeNewSendFirst => 'Алғашқы чекті жіберу';

  @override
  String get homeNewCourseSection => 'Курстан бастаңыз';

  @override
  String get homeNewAllCourses => 'Барлық курстар';

  @override
  String homeNewCourseLessons(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n сабақ',
      one: '$n сабақ',
    );
    return '$_temp0';
  }

  @override
  String homeNewCourseMinutes(int n) {
    return '~$n мин';
  }

  @override
  String get homeNewQuestSection => 'Бастауға арналған квест';

  @override
  String homeNewQuestGoal(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қаптама сатыңыз',
      one: '$n қаптама сатыңыз',
    );
    return '$_temp0';
  }

  @override
  String get homeNewQuestIqc => 'IQC балансқа';

  @override
  String get homeNewQuestVoucher => 'орындағаны үшін ваучер';

  @override
  String get homeNewHint =>
      'Баланс, ваучерлер және мини-қосымшалар алғашқы IQC-тен кейін пайда болады';

  @override
  String get newsBack => 'Артқа';

  @override
  String get newsBackToList => 'Жаңалықтарға оралу';

  @override
  String newsReadTime(int n) {
    return '$n мин оқу';
  }

  @override
  String get newsEmptyText =>
      'Мұнда бағдарлама жаңалықтары мен пайдалы материалдар пайда болады';

  @override
  String get surveyYourAnswer => 'Сіздің жауабыңыз';

  @override
  String surveySubmitReward(int n) {
    return 'Жауап беріп, $n IQC алу';
  }

  @override
  String get surveyWriteHint => 'Жіберу үшін жауап жазыңыз';

  @override
  String get surveyRatingLabel => 'Баға';

  @override
  String surveyRatingOf(int n, int max) {
    return '$max ішінен $n';
  }

  @override
  String get surveyRatingWords =>
      'Нашар,Орташадан төмен,Қалыпты,Жақсы,Өте жақсы';

  @override
  String surveyReward(int n) {
    return '+$n IQC';
  }

  @override
  String get surveyOnBalance => 'балансыңызда';

  @override
  String get surveySendFailed =>
      'Жауапты жіберу мүмкін болмады. Қайталап көріңіз';

  @override
  String medrepHelloName(String name) {
    return 'Сәлем, $name!';
  }

  @override
  String get medrepAttrShared => 'ортақ атрибуция';

  @override
  String get medrepAttrPrimary => 'бастапқы атрибуция';

  @override
  String get medrepPeriodAll => 'Барлық уақыт';

  @override
  String get medrepPeriod30 => '30 күн';

  @override
  String get medrepPeriod7 => '7 күн';

  @override
  String medrepUnitPharm(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'фармацевт',
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
      other: 'қаптама',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuestsDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квест орындалды',
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
      other: 'дәріхана',
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
      other: 'чек барлық уақытта',
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
      other: '$n қаптама',
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
      other: '$n желі',
    );
    return '$_temp0';
  }

  @override
  String medrepPharmaciesInPortfolio(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'портфельде $n дәріхана',
    );
    return '$_temp0';
  }

  @override
  String get medrepRatingByChecks => 'Чектер бойынша рейтинг';

  @override
  String get medrepRatingAll => 'Толық рейтинг';

  @override
  String medrepPlace(int n) {
    return '$n-орын';
  }

  @override
  String medrepOutOf(int n) {
    return '$n ішінен';
  }

  @override
  String medrepGapTo(int place) {
    return '$place-орынға дейін тағы';
  }

  @override
  String get medrepLeader => 'Сіз рейтинг көшбасшысысыз';

  @override
  String get medrepMostActive => 'Ең белсенділер';

  @override
  String medrepAllN(int n) {
    return 'Барлығы $n';
  }

  @override
  String get medrepInviteTitle => 'Провизорды шақыру';

  @override
  String get medrepInviteText =>
      'Сілтемені жіберіңіз — тіркелгеннен кейін провизор портфеліңізге түседі';

  @override
  String get medrepCopyLink => 'Сілтемені көшіру';

  @override
  String get medrepPendingSub => 'Сілтеме арқылы өткен провизорлар';

  @override
  String get medrepCompaniesSub => 'Портфельдегі дәріхана желілері';

  @override
  String get medrepDoctorsSub => 'Бланк квесі бойынша прогресс';

  @override
  String get medrepEmptyTitle => 'Портфель әзірге бос';

  @override
  String get medrepEmptyText =>
      'Провизорларды сілтеме арқылы шақырыңыз — олардың чектері мен статистикасы осында пайда болады';

  @override
  String get medrepStep1Title => 'Сілтемені жіберіңіз';

  @override
  String get medrepStep1Text => 'Telegram немесе SMS арқылы';

  @override
  String get medrepStep2Title => 'Провизор тіркеледі';

  @override
  String get medrepStep2Text => 'Ол бірден портфеліңізге түседі';

  @override
  String get medrepStep3Title => 'Чектерді бақылаңыз';

  @override
  String get medrepStep3Text => 'Статистика осында пайда болады';

  @override
  String get medrepUpdatedNow => 'Жаңа ғана жаңартылды';

  @override
  String get medrepSearchHint => 'Аты, дәріхана немесе қала';

  @override
  String get medrepFilterAll => 'Барлығы';

  @override
  String get medrepFilterActive => 'Белсенділер';

  @override
  String get medrepFilterPassive => 'Пассивтер';

  @override
  String get medrepFilterFinished => 'Аяқталғандар';

  @override
  String get medrepFilterApproved => 'Мақұлданған';

  @override
  String get medrepFilterRejected => 'Қабылданбаған';

  @override
  String get medrepClear => 'Тазалау';

  @override
  String get medrepNotFoundTitle => 'Ешкім табылмады';

  @override
  String medrepNotFoundText(String query) {
    return '«$query» сұранысы бойынша провизорлар жоқ. Жазылуын тексеріңіз немесе дәріхана атауы бойынша іздеңіз';
  }

  @override
  String medrepNotFoundShort(String query) {
    return '«$query» сұранысы бойынша ештеңе жоқ. Жазылуын тексеріңіз';
  }

  @override
  String get medrepResetSearch => 'Іздеуді тазалау';

  @override
  String get medrepChecksAllTime => 'Барлық уақыттағы чектер';

  @override
  String get medrepLastActivity => 'белсенділік';

  @override
  String get medrepAllChecks => 'Барлық чектер';

  @override
  String medrepCheckNo(int id) {
    return 'Чек №$id';
  }

  @override
  String medrepPacksShort(int n) {
    return '$n қапт.';
  }

  @override
  String get medrepPacksUnit => 'қапт.';

  @override
  String get medrepLast7Days => 'Соңғы 7 күн';

  @override
  String medrepMonthYear(String month, String year) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'm1': 'Қаңтар',
      'm2': 'Ақпан',
      'm3': 'Наурыз',
      'm4': 'Сәуір',
      'm5': 'Мамыр',
      'm6': 'Маусым',
      'm7': 'Шілде',
      'm8': 'Тамыз',
      'm9': 'Қыркүйек',
      'm10': 'Қазан',
      'm11': 'Қараша',
      'm12': 'Желтоқсан',
      'other': '',
    });
    return '$_temp0 $year';
  }

  @override
  String get medrepTabChecks => 'Чектер';

  @override
  String get medrepTabPharm => 'Фармацевттер';

  @override
  String get medrepTabQuests => 'Квесттер';

  @override
  String medrepYouName(String name) {
    return 'Сіз · $name';
  }

  @override
  String get medrepYouShort => 'СІЗ';

  @override
  String medrepGapText(int place, String value) {
    return '$place-орынға дейін тағы $value';
  }

  @override
  String get medrepNotRankedTitle => 'Сіз әзірге рейтингте жоқсыз';

  @override
  String get medrepNotRankedText =>
      'Орын провизорларыңыздың чектері бойынша есептеледі. Біріншісін шақырыңыз — сонда тізімде пайда боласыз';

  @override
  String get medrepRatingEmpty => 'Рейтинг әзірге бос';

  @override
  String get medrepQuestsSub => 'Провизорларыңыздың прогресі';

  @override
  String get medrepQuestRunning => 'Жүріп жатыр';

  @override
  String medrepQuestRunningUntil(String date) {
    return 'Жүріп жатыр · $date дейін';
  }

  @override
  String get medrepQuestFinished => 'Аяқталды';

  @override
  String medrepQuestFinishedOn(String date) {
    return '$date аяқталды';
  }

  @override
  String medrepOfN(int a, int b) {
    return '$b ішінен $a';
  }

  @override
  String get medrepParticipating => 'провизор қатысуда';

  @override
  String medrepSoldOf(int n) {
    return '$n ішінен сатылды';
  }

  @override
  String medrepOfPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қаптаманың ішінен',
    );
    return '$_temp0';
  }

  @override
  String medrepGoalPercent(int p) {
    return 'мақсаттың $p%';
  }

  @override
  String medrepPacksLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n қаптама қалды',
    );
    return '$_temp0';
  }

  @override
  String get medrepGoalDone => 'Мақсат орындалды';

  @override
  String get medrepStatParticipating => 'қатысуда';

  @override
  String get medrepStatCompleted => 'орындады';

  @override
  String get medrepStatIdle => 'бастамады';

  @override
  String get medrepPharmacistsSection => 'Провизорлар';

  @override
  String medrepDoneOf(int a, int b) {
    return 'Орындады · $b ішінен $a';
  }

  @override
  String medrepMoreRows(int n, int packs) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Тағы $n провизор · $packs қапт.',
    );
    return '$_temp0';
  }

  @override
  String get medrepShow => 'Көрсету';

  @override
  String get medrepHide => 'Жию';

  @override
  String get medrepPendingText =>
      'Сілтемеңіз арқылы өтіп, оларды портфельге қосуыңызды күтуде';

  @override
  String medrepFollowedLink(String ago) {
    return 'Сілтеме арқылы өтті · $ago';
  }

  @override
  String get medrepAgoNow => 'жаңа ғана';

  @override
  String medrepAgoMinutes(int n) {
    return '$n мин бұрын';
  }

  @override
  String medrepAgoHours(int n) {
    return '$n сағ бұрын';
  }

  @override
  String get medrepAgoYesterday => 'кеше';

  @override
  String medrepAgoDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n күн бұрын',
    );
    return '$_temp0';
  }

  @override
  String get medrepChainsTitle => 'Дәріхана желілері';

  @override
  String get medrepChainSearchHint => 'Желі атауы';

  @override
  String medrepChainMeta(String city, int a, int p) {
    return '$city · $a дәр. · $p пров.';
  }

  @override
  String get medrepChainKind => 'дәріхана желісі';

  @override
  String get medrepPharmaciesSection => 'Дәріханалар';

  @override
  String get medrepMakers => 'Өндіруші компаниялар';

  @override
  String medrepRewardTitle(String name) {
    return 'Марапаттау: $name';
  }

  @override
  String get medrepRewardRating => 'Баға';

  @override
  String get medrepRewardMessage => 'Хабарлама';

  @override
  String get medrepOptional => '· міндетті емес';

  @override
  String get medrepRewardHint => 'Мысалы: керемет сатылым үшін рахмет!';

  @override
  String get medrepRewardNotice =>
      'Провизор хабарламаңызбен хабарландыру алады';

  @override
  String medrepRewardSend(int n) {
    return '$n бағасын жіберу';
  }

  @override
  String medrepRewardStars(int n) {
    return '5-тен $n баға';
  }

  @override
  String authVersion(String version) {
    return 'нұсқа $version';
  }

  @override
  String get authLoading => 'Жүктелуде';

  @override
  String get authWelcomeTitle => 'PharmIQ-ке қош келдіңіз';

  @override
  String get authWelcomeSubtitle =>
      'Фармацевтер мен дәрігерлерге арналған оқыту, квестер және марапаттар — бір қосымшада';

  @override
  String get authAppLanguage => 'Қосымша тілі';

  @override
  String get authStart => 'Бастау';

  @override
  String get authHaveAccount => 'Аккаунтыңыз бар ма?';

  @override
  String authLanguageLabel(String language) {
    return 'Тіл: $language';
  }

  @override
  String get authLoginSubtitle =>
      'Фармацевтер мен дәрігерлерге арналған оқыту және марапаттар';

  @override
  String get authSmsHint => 'Кодты SMS арқылы жібереміз';

  @override
  String get authPhoneNotRegistered =>
      'Бұл нөмір тіркелмеген. Аккаунт жасаңыз — бір минут қана кетеді';

  @override
  String get authOtherNumber => 'Басқа нөмір енгізу';

  @override
  String authCodeSentTo(String phone) {
    return '$phone нөміріне жібердік';
  }

  @override
  String get authChange => 'Өзгерту';

  @override
  String get authCodeGroup => '6 саннан тұратын код';

  @override
  String get authCodeAuto => 'Кодты енгізген бойда автоматты түрде кіреміз';

  @override
  String authResendIn(String time) {
    return '$time кейін қайта жіберу';
  }

  @override
  String get authRoleSubtitle =>
      'Сізде бірнеше рөл бар — қайсысымен кіретініңізді таңдаңыз';

  @override
  String get authRoleSubDoctor => 'Рецепттер, квестер, оқыту және әмиян';

  @override
  String get authRoleHint =>
      'Рөлді кез келген уақытта профильде ауыстыруға болады';

  @override
  String get authRegWhoTitle => 'Сіз кімсіз?';

  @override
  String get authRegWhoSubtitle =>
      'Мамандығыңызға арналған квестер мен курстарды көрсетеміз';

  @override
  String get authRegPharmacistSub => 'Провизор, дәріхана қызметкері';

  @override
  String get authRegDoctorSub => 'Денсаулық сақтау маманы';

  @override
  String get authContinue => 'Жалғастыру';

  @override
  String get authBack => 'Артқа';

  @override
  String authChooseField(String label) {
    return 'Таңдаңыз: $label';
  }

  @override
  String authMultiHint(int n) {
    return 'Бірнешеуін таңдауға болады · таңдалды: $n';
  }

  @override
  String get authMultiHintEmpty => 'Бірнешеуін таңдауға болады';

  @override
  String get authConsent => 'Дербес деректерімді өңдеуге келісемін — ';

  @override
  String get authFillRequired =>
      'Жұлдызшасы бар өрістерді толтырып, келісім беріңіз';

  @override
  String authRegWelcome(String name) {
    return 'PharmIQ-ке қош келдіңіз, $name!';
  }

  @override
  String get authGoHome => 'Басты бетке';

  @override
  String get authCityTitle => 'Қала';

  @override
  String get authCitySearch => 'Қаланы табу';

  @override
  String get authSearch => 'Іздеу';

  @override
  String get authNothingFound => 'Ештеңе табылмады';

  @override
  String get authMapTitle => 'Картадағы дәріхана';

  @override
  String get authMapStubTitle => 'Карта жақында пайда болады';

  @override
  String get authMapStubBody =>
      'Әзірге дәріхана атауын «Дәріхана / жұмыс орны» өрісіне жазыңыз — оны картада белгілеу келесі жаңартуда қолжетімді болады';

  @override
  String get authUpdateTitle => 'Қосымшаны жаңарту керек';

  @override
  String get authUpdateBody =>
      'Бұл нұсқа енді қолдау көрсетілмейді. Жалғастыру үшін PharmIQ-ті жаңартыңыз — баланс пен прогресс сақталады';

  @override
  String get authUpdateButton => 'Қосымшаны жаңарту';

  @override
  String authUpdateVersions(String current, String required) {
    return 'Сіздің нұсқаңыз $current · $required немесе жаңасы керек';
  }

  @override
  String authUpdateRequired(String required) {
    return '$required немесе жаңарақ нұсқа керек';
  }

  @override
  String get authPushTitle => 'Есептеулерді өткізіп алмаңыз';

  @override
  String get authPushBody =>
      'Чек тексерілгенде, IQC балансқа түскенде немесе жаңа квест пайда болғанда хабарлаймыз';

  @override
  String get authPushNow => 'қазір';

  @override
  String get authPushSample1Title => '+144 IQC есептелді';

  @override
  String get authPushSample1Body => 'Чек №23156 · Цинкорот №50';

  @override
  String get authPushSample2Time => '2 сағ бұрын';

  @override
  String get authPushSample2Title => 'Жаңа квест';

  @override
  String get authPushSample2Body => 'Доритрицин N10 · Korzinka ваучері';

  @override
  String get authPushEnable => 'Хабарландыруларды қосу';

  @override
  String get authPushLater => 'Қазір емес';

  @override
  String checksSentCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n чек жіберілді',
      one: '$n чек жіберілді',
    );
    return '$_temp0';
  }

  @override
  String get checksSectionRetake => 'Қайта түсіру керек';

  @override
  String get checksSectionHistory => 'Тарих';

  @override
  String get checksRetake => 'Қайта түсіру';

  @override
  String checksRetakeA11y(int id) {
    return '№$id чекті қайта түсіру';
  }

  @override
  String get checksRetakeTipBold => 'Чек бірден қабылдануы үшін:';

  @override
  String get checksRetakeTip =>
      'бүкіл чек кадрда, тегіс, жылтырсыз және жақсы жарықта.';

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
  String get checksWaitValue => '~24 сағ';

  @override
  String get checksWaitCaption => 'әдетте';

  @override
  String checksShowAll(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Барлық $n чекті көрсету',
      one: 'Барлық $n чекті көрсету',
    );
    return '$_temp0';
  }

  @override
  String get checksSendCheck => 'Чек жіберу';

  @override
  String checksMonth(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Қаңтар',
      'm2': 'Ақпан',
      'm3': 'Наурыз',
      'm4': 'Сәуір',
      'm5': 'Мамыр',
      'm6': 'Маусым',
      'm7': 'Шілде',
      'm8': 'Тамыз',
      'm9': 'Қыркүйек',
      'm10': 'Қазан',
      'm11': 'Қараша',
      'm12': 'Желтоқсан',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get checksUploadingRow => 'Чек жіберілуде…';

  @override
  String get checksUploadQueued => 'Жіберуді күтуде';

  @override
  String get checksUploadAuto =>
      'Байланыс пайда болғанда автоматты түрде жібереміз';

  @override
  String get checksEmptyTitle => 'Чектеріңіз осында пайда болады';

  @override
  String get checksEmptyText =>
      'Дәріханадан алған чекті суретке түсіріңіз — ЖИ препараттарды таниды, ал сіз IQC аласыз';

  @override
  String get checksHowToTitle => 'Қалай суретке түсіру керек';

  @override
  String get checksHow1Title => 'Бүкіл чек кадрда';

  @override
  String get checksHow1Text => 'Төрт бұрышы да көрінеді';

  @override
  String get checksHow2Title => 'Тегіс, бүктеусіз';

  @override
  String get checksHow2Text => 'Чекті үстелге қойыңыз';

  @override
  String get checksHow3Title => 'Жақсы жарық';

  @override
  String get checksHow3Text => 'Жылтырсыз және телефонның көлеңкесіз';

  @override
  String get checksSendFirst => 'Алғашқы чекті жіберу';

  @override
  String get checksPickSubtitle => 'ЖИ препараттарды фото бойынша таниды';

  @override
  String checksPhotosOf(int n, int max) {
    return 'Фото: $n / $max';
  }

  @override
  String get checksClose => 'Жабу';

  @override
  String get checksTipWhole => 'Бүкіл чек';

  @override
  String get checksTipFlat => 'Тегіс';

  @override
  String get checksTipGlare => 'Жылтырсыз';

  @override
  String get checksTakePhotoCta => 'Чекті суретке түсіру';

  @override
  String get checksPickGallery => 'Галереядан таңдау';

  @override
  String get checksRemovePhoto => 'Фотоны жою';

  @override
  String get checksAddMore => 'Тағы фото';

  @override
  String get checksAddMoreA11y => 'Тағы фото қосу';

  @override
  String get checksPhotoWaiting => 'Күтуде';

  @override
  String get checksPhotosHint =>
      'Тексеріңіз: чек нөмірі, күні және препараттар анық көрінуі керек';

  @override
  String get checksSending => 'Жіберілуде…';

  @override
  String get checksSentTitle => 'Чек жіберілді';

  @override
  String get checksSentText =>
      'Тексеру әдетте 24 сағатқа дейін созылады. IQC есептелгенде хабарлаймыз';

  @override
  String get checksDone => 'Дайын';

  @override
  String get checksSendAnother => 'Тағы чек жіберу';

  @override
  String get checksSendFailed =>
      'Фотоны сақтау мүмкін болмады. Қайталап көріңіз';

  @override
  String get checksCamTitle => 'Камераға рұқсат беріңіз';

  @override
  String get checksCamText =>
      'Камера чектер мен рецепттерді суретке түсіру үшін қажет';

  @override
  String get checksCamPoint1 => 'Тек сіз түймені басқанда ғана түсіреміз';

  @override
  String get checksCamPoint2 => 'Басқа фотоларды көрмейміз және сақтамаймыз';

  @override
  String get checksCamPoint3 => 'Рұқсатты телефон баптауларында өшіруге болады';

  @override
  String get checksCamAllow => 'Рұқсат беру';

  @override
  String get checksCamLater => 'Қазір емес';

  @override
  String get checksCamDeniedTitle => 'Камераға рұқсат жоқ';

  @override
  String get checksCamDeniedText =>
      'Камерасыз чекті суретке түсіру мүмкін емес. Телефон баптауларында рұқсатты қосыңыз — бұл 10 секунд алады';

  @override
  String get checksCamDeniedStep1 => '«Баптаулар» → PharmIQ ашыңыз';

  @override
  String get checksCamDeniedStep2 => '«Камера» ауыстырғышын қосыңыз';

  @override
  String get checksCamDeniedStep3 => 'Қолданбаға оралыңыз';

  @override
  String get checksCamOpenSettings => 'Баптауларды ашу';

  @override
  String get checksCamPickGallery => 'Галереядан фото таңдау';

  @override
  String get checksCamSettingsManual =>
      'Телефон баптаулары → Қолданбалар → PharmIQ → Рұқсаттар бөлімін ашыңыз';

  @override
  String get checksHeroPendingTitle => 'Чек тексерілуде';

  @override
  String get checksHeroPendingText =>
      'Маман чекті тексеруде. Әдетте бұл 24 сағатқа дейін созылады';

  @override
  String get checksHeroApprovedTitle => 'Чек мақұлданды';

  @override
  String get checksHeroApprovedText =>
      'Бәрі дұрыс. IQC жақын арада балансқа түседі';

  @override
  String get checksHeroCreditedTitle => 'IQC есептелді';

  @override
  String get checksHeroCreditedText => 'Ұпайлар балансыңызға түсті';

  @override
  String get checksHeroRejectedTitle => 'Чек қабылданбады';

  @override
  String get checksHeroRejectedText =>
      'Анық фото түсіріңіз — ұпайларды әлі де алуға болады';

  @override
  String get checksStepSent => 'Жіберілді';

  @override
  String get checksStepReview => 'Тексеру';

  @override
  String get checksStepApproved => 'Мақұлданды';

  @override
  String get checksStepCredited => 'Есептелді';

  @override
  String get checksPhotosTitle => 'Чек фотосы';

  @override
  String checksOpenPhoto(int n) {
    return '$n-фотоны ашу';
  }

  @override
  String get checksAiPending =>
      'Препараттар тізімі тексеруден кейін пайда болады';

  @override
  String get checksAccrualTitle => 'Есептеу';

  @override
  String get checksAccrualPendingTitle => 'Мақұлданғаннан кейін есептейміз';

  @override
  String get checksAccrualPendingText => 'Чек мақұлданғаннан кейін';

  @override
  String get checksAccrualApprovedTitle => 'Есептелуін күтуде';

  @override
  String get checksAccrualSoon => 'Жақында';

  @override
  String get checksAccrualCreditedTitle => 'Балансқа түсті';

  @override
  String get checksQuestDone => 'Квест орындалды ✓';

  @override
  String get checksSupport => 'Чек бойынша сұрақ бар ма? Бізге жазыңыз';

  @override
  String get checksRetakeCheck => 'Чекті қайта түсіру';

  @override
  String checksViewerPhotoOf(int i, int n) {
    return 'Фото $i / $n';
  }

  @override
  String get checksViewerSave => 'Фотоны сақтау';

  @override
  String get checksViewerZoomHint => 'Үлкейту үшін саусақтарыңызды ажыратыңыз';

  @override
  String get profileSectionContact => 'Байланыс';

  @override
  String get profilePersonalDataRow => 'Жеке деректер';

  @override
  String get profileTgNotLinked => 'Байланыстырылмаған';

  @override
  String get profileTgLink => 'Байланыстыру';

  @override
  String get profileTgLinkedToast => 'Telegram байланыстырылды';

  @override
  String get profileTgNotYet =>
      'Telegram әлі байланыстырылмаған — ботта аяқтаңыз';

  @override
  String get profileAppearanceTitle => 'Безендіру';

  @override
  String get profileNotifOn => 'Қосулы';

  @override
  String get profileNotifOff => 'Өшірулі';

  @override
  String get profileDeleteAccount => 'Аккаунтты жою';

  @override
  String profileVersion(String version) {
    return 'PharmIQ · нұсқа $version';
  }

  @override
  String get profileEditAria => 'Профильді өңдеу';

  @override
  String get profileNewUser => 'Жаңа пайдаланушы';

  @override
  String get profilePharmacy => 'Дәріхана';

  @override
  String get profileClinic => 'Клиника';

  @override
  String get profileCompany => 'Компания';

  @override
  String get profileNoPharmacy => 'Дәріхана көрсетілмеген';

  @override
  String get profileNoClinic => 'Клиника көрсетілмеген';

  @override
  String get profileNoCompany => 'Компания көрсетілмеген';

  @override
  String get profileNotSpecified => 'Көрсетілмеген';

  @override
  String get profileNameNotSet => 'Аты көрсетілмеген';

  @override
  String get profileActivateTitle => 'Профильді белсендіріңіз';

  @override
  String profileActivateProgress(int done, int total) {
    return '$total ішінен $done';
  }

  @override
  String get profileActivateBody =>
      'Белсендірілгеннен кейін квесттер мен IQC есептеу ашылады';

  @override
  String get profileStepPhone => 'Телефон расталды';

  @override
  String get profileStepPharmacy => 'Дәріхананы көрсетіңіз';

  @override
  String get profileStepClinic => 'Клиниканы көрсетіңіз';

  @override
  String get profileStepProfile => 'Профильді толтырыңыз';

  @override
  String get profileStepWorkHint => 'Өңіріңіздің квесттері үшін қажет';

  @override
  String get profileStepProfileHint => 'Аты-жөні және жұмыс орны';

  @override
  String get profileStepSpecify => 'Көрсету';

  @override
  String get profileStepTelegram => 'Telegram-ды байланыстырыңыз';

  @override
  String get profileStepTelegramHint => 'Хабарландырулар жібереміз';

  @override
  String get profileStepAdmin => 'Әкімшінің белсендіруі';

  @override
  String get profileStepAdminHint => 'Әдетте толтырғаннан кейін бір күн ішінде';

  @override
  String get profileActivateHelp =>
      'Белсендіру бойынша сұрақтар бар ма? Бізге жазыңыз';

  @override
  String get profileRoleSheetTitle => 'Рөлді ауыстыру';

  @override
  String get profileRoleSheetSubtitle => 'Аккаунтыңыз үшін расталған рөлдер';

  @override
  String get profileRoleCurrent => 'Ағымдағы';

  @override
  String get profileRoleDescPharmacist => 'Чектер, квесттер, оқу және әмиян';

  @override
  String get profileRoleDescDoctor => 'Рецептер, квесттер, оқу және әмиян';

  @override
  String get profileRoleDescMedrep => 'Провизорлар портфелі және рейтинг';

  @override
  String get profileRoleDescBrand => 'Бренд квесттері, өнімдер және сатылым';

  @override
  String get profileRoleNote =>
      'Қолданба таңдалған рөлдің бөлімдерімен ашылады. IQC балансы мен ваучерлер сақталады';

  @override
  String profileRoleSwitch(String role) {
    return '«$role» рөліне ауысу';
  }

  @override
  String get profileClose => 'Жабу';

  @override
  String get profileFieldName => 'Аты-жөні';

  @override
  String get profilePhoneLockedHint =>
      'Нөмір кіру үшін қажет — SMS арқылы растап өзгертіледі';

  @override
  String get profileFieldCity => 'Қала';

  @override
  String get profileCityHint => 'Қаланы таңдаңыз';

  @override
  String get profileWorkplaceHint => 'Атауы немесе нөмірі';

  @override
  String get profileMapButton => 'Дәріхананы картадан нақтылау';

  @override
  String get profileMapSoon =>
      'Дәріхананы картадан таңдау жақында пайда болады';

  @override
  String get profileSave => 'Өзгерістерді сақтау';

  @override
  String get profileFieldRequired => 'Бұл өрісті толтырыңыз';

  @override
  String get profileEditSent => 'Өтінім қолдау қызметіне жіберілді';

  @override
  String get profileEditSentHint => 'Тексергеннен кейін деректерді жаңартамыз';

  @override
  String get profileEditRequest => 'Профиль деректерін жаңартуды сұраймын:';

  @override
  String get profileEditNoChanges => 'Өзгерістер жоқ';

  @override
  String get profilePrivacyShort => 'Құпиялылық';

  @override
  String get profilePrivacyHeadline => 'Деректеріңізбен қалай жұмыс істейміз';

  @override
  String get profilePrivacyCollectTitle => 'Қандай деректерді жинаймыз';

  @override
  String get profilePrivacyCollectBody =>
      'Аты-жөні, телефон нөмірі, қала және дәріхана немесе клиника. Сіз жіберетін чектер мен рецептердің суреттері. Курстар мен тесттердің нәтижелері.';

  @override
  String get profilePrivacyWhyTitle => 'Олар не үшін қажет';

  @override
  String get profilePrivacyWhyBody =>
      'Чектер мен рецептер үшін IQC есептеу, квесттерді есепке алу, ваучерлер беру және статистикаңызды көрсету үшін.';

  @override
  String get profilePrivacyWhoTitle => 'Оларды кім көреді';

  @override
  String get profilePrivacyWhoBody =>
      'Медициналық өкіліңіз чектеріңіз бен квесттеріңіздің санын көреді. Рецептердегі пациенттердің деректері жасырылған — тек бас әріптері көрінеді.';

  @override
  String get profilePrivacyStoreTitle => 'Оларды қалай сақтаймыз';

  @override
  String get profilePrivacyStoreBody =>
      'Деректер қорғалған байланыс арқылы беріледі және компания серверлерінде сақталады.';

  @override
  String get profilePrivacyDeleteTitle => 'Деректерді қалай жоюға болады';

  @override
  String get profilePrivacyDeleteBody =>
      'Профильде → «Аккаунтты жою». Деректер баланспен және ваучерлермен бірге жойылады.';

  @override
  String get profilePrivacyFullLink => 'Саясаттың толық мәтіні';

  @override
  String get profilePrivacyContents => 'Мазмұны';

  @override
  String profilePrivacyReadTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n минут оқу',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyRuOnly => 'Құжат тек орыс тілінде қолжетімді';

  @override
  String get profileDeleteLose =>
      'Бұл әрекетті болдырмау мүмкін емес. Сіз жоғалтасыз:';

  @override
  String profileDeleteLoseIqc(String amount) {
    return 'Баланстағы $amount IQC';
  }

  @override
  String get profileDeleteLoseIqcHint =>
      'айырбастау мүмкіндігінсіз күйіп кетеді';

  @override
  String profileDeleteLoseVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n белсенді ваучер',
    );
    return '$_temp0';
  }

  @override
  String get profileDeleteLoseVouchersHint => 'жұмыс істемей қалады';

  @override
  String get profileDeleteLoseProgress => 'Квесттер мен курстардағы прогресс';

  @override
  String get profileDeleteLoseProgressHint => 'жойылады';

  @override
  String get profileDeleteTypePrompt => 'Растау үшін енгізіңіз';

  @override
  String get profileDeleteWord => 'ЖОЮ';

  @override
  String get profileDeleteForever => 'Біржола жою';

  @override
  String get profileDeleteKeep => 'Аккаунтты қалдыру';

  @override
  String get profileDeleting => 'Жойылуда…';

  @override
  String get profileDeleteFailed =>
      'Аккаунтты жою мүмкін болмады. Қайталап көріңіз';

  @override
  String get profileDeletedTitle => 'Аккаунт жойылды';

  @override
  String get profileDeletedBody =>
      'Профиліңізді, IQC балансын, ваучерлерді және тарихты жойдық. Бізбен бірге болғаныңызға рахмет';

  @override
  String get profileDeletedCardTitle => 'Ойыңыз өзгерді ме?';

  @override
  String get profileDeletedCardBody =>
      'Сол нөмірмен қайта тіркелуге болады — бірақ бұрынғы балансты қайтару мүмкін емес';

  @override
  String get profileDeletedNew => 'Жаңа аккаунт құру';

  @override
  String get profileErrorGeneric => 'Бірдеңе дұрыс болмады. Қайталап көріңіз';

  @override
  String notifNewCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n жаңа',
    );
    return '$_temp0';
  }

  @override
  String get notifAllRead => 'Барлығы оқылды';

  @override
  String get notifReadAll => 'Барлығын оқу';

  @override
  String get notifFilterAll => 'Барлығы';

  @override
  String get notifFilterChecks => 'Чектер';

  @override
  String get notifFilterRecipes => 'Бланкілер';

  @override
  String get notifFilterQuests => 'Квесттер';

  @override
  String get notifFilterLearning => 'Оқу';

  @override
  String get notifCategoryEmpty => 'Бұл санатта әзірге ештеңе жоқ';

  @override
  String get notifNewAria => 'Жаңа';

  @override
  String get notifMarkedRead => 'Оқылды';

  @override
  String get notifEmptySubtitle => 'Әзірге жаңалық жоқ';

  @override
  String get notifEmptyQuietTitle => 'Мұнда әзірге тыныш';

  @override
  String get notifEmptyQuietText =>
      'Чекті тексергенде, IQC есептегенде немесе ваучер бергенде хабарлаймыз';

  @override
  String get notifConfigure => 'Хабарландыруларды баптау';

  @override
  String get notifSettingsSubtitle => 'Телефонға не жіберу керек';

  @override
  String get notifSettingsChecksHint => 'Мақұлдау, бас тарту, IQC есептеу';

  @override
  String get notifSettingsQuestsHint => 'Жаңа квесттер, орындау, ваучерлер';

  @override
  String get notifSettingsLearningHint => 'Жаңа курстар мен еске салғыштар';

  @override
  String get notifSettingsMarketingHint =>
      'Нарық жаңалықтары мен арнайы ұсыныстар';

  @override
  String get notifSettingsFootnote =>
      'Аккаунт пен қауіпсіздік туралы маңызды хабарламалар әрқашан келеді';

  @override
  String get notifSaveFailed => 'Баптауларды сақтау мүмкін болмады';

  @override
  String get supportHeaderTitle => 'PharmIQ қолдау қызметі';

  @override
  String get supportHeaderSubtitle => 'Әдетте бір сағат ішінде жауап береміз';

  @override
  String get supportBackAria => 'Профильге оралу';

  @override
  String get supportToday => 'Бүгін';

  @override
  String get supportYesterday => 'Кеше';

  @override
  String get supportGreeting => 'Сәлеметсіз бе! Қалай көмектесе аламыз?';

  @override
  String get supportFaqTitle => 'Жиі қойылатын сұрақтар';

  @override
  String get supportFaq1 => 'Чек үшін IQC есептелмеді';

  @override
  String get supportFaq2 => 'Чек қабылданбады — неге?';

  @override
  String get supportFaq3 => 'Ваучерді қалай алуға болады';

  @override
  String get supportFaq4 => 'Курс немесе тестпен мәселе';

  @override
  String get supportMessageHint => 'Хабарлама';

  @override
  String get supportAttachAria => 'Сурет немесе чек тіркеу';

  @override
  String get supportSendAria => 'Жіберу';

  @override
  String get supportTypingAria => 'Қолдау қызметі жазып жатыр';

  @override
  String get supportAttachCheckTitle => 'Чек тіркеу';

  @override
  String get supportAttachRecipeTitle => 'Бланк тіркеу';

  @override
  String get supportAttachEmpty => 'Әзірге тіркейтін ештеңе жоқ';

  @override
  String get supportAttachRemove => 'Тіркемені алып тастау';

  @override
  String get supportAttachUnavailable =>
      'Тіркемелер чектер мен бланкілер үшін қолжетімді';

  @override
  String get supportSendFailed => 'Хабарламаны жіберу мүмкін болмады';

  @override
  String get walletFaceValue => 'Номинал';

  @override
  String get profileBack => 'Артқа';

  @override
  String homeNewCourseVideo(int n) {
    return 'Бейне ~$n мин';
  }

  @override
  String get homeNewCourseQuiz => 'тест';

  @override
  String get authHintFullName => 'Тегі Аты Әкесінің аты';

  @override
  String get authHintPharmacy => 'Мысалы, №12 дәріхана';

  @override
  String get authHintClinic => 'Медициналық мекеменің атауы';

  @override
  String get authMapCardTitle => 'Дәріхананы картада белгілеу';

  @override
  String get authMapCardSub => 'Ауданыңыздағы квестер үшін қажет';

  @override
  String get authMapCardButton => 'Белгілеу';

  @override
  String get rxStateCreditedTitle => 'IQC есептелді';

  @override
  String get rxStateCreditedText => 'Ұпайлар балансыңызға түсті';

  @override
  String get rxAccrualCreditedTitle => 'Балансқа түсті';

  @override
  String get rxCreditedCaption => 'есептелді';

  @override
  String rxListCountEarned(String count, int n) {
    return '$count · $n IQC алынды';
  }

  @override
  String get questsRewardPoints => 'Ұпайлар балансқа';

  @override
  String get walletMonthsIn =>
      'қаңтарда,ақпанда,наурызда,сәуірде,мамырда,маусымда,шілдеде,тамызда,қыркүйекте,қазанда,қарашада,желтоқсанда';

  @override
  String walletEarnedIn(String month) {
    return '$month есептелді';
  }

  @override
  String walletSpentIn(String month) {
    return '$month жұмсалды';
  }

  @override
  String get profileRoleShortMedrep => 'Медөкіл';

  @override
  String get notifActionQr => 'QR көрсету';

  @override
  String get notifActionRetake => 'Қайта түсіру';

  @override
  String homeNewCourseQuizQuestions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'тест $n сұрақ',
      one: 'тест $n сұрақ',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyDraft => 'Жоба. Соңғы мәтінді заңгер бекітеді';

  @override
  String get notifSettingsChecksOnly => 'Чектердің күйі';

  @override
  String get notifSettingsRecipesOnly => 'Бланкілердің күйі';

  @override
  String get tourWelcomeTitle => 'PharmIQ Academy-ге қош келдіңіз!';

  @override
  String get tourWelcomeText =>
      'Не қайда орналасқанын және IQC қалай табуға болатынын көрсетеміз. Бұл бір минуттан аз уақыт алады.';

  @override
  String get tourWelcomeTextDoc =>
      'Не қайда орналасқанын және бланкілер үшін IQC қалай алуға болатынын көрсетеміз. Бұл бір минуттан аз уақыт алады.';

  @override
  String get tourStart => 'Бастау';

  @override
  String get tourSkipAll => 'Оқытуды өткізіп жіберу';

  @override
  String tourStepOf(int n, int total) {
    return '$total ішінен $n-қадам';
  }

  @override
  String get tourSkip => 'Өткізу';

  @override
  String get tourNext => 'Әрі қарай';

  @override
  String get tourDoneStep => 'Дайын';

  @override
  String get tourBack => 'Артқа';

  @override
  String get tourBalanceTitle => 'IQC балансы';

  @override
  String get tourBalanceText =>
      'Мұнда сіздің IQC — мақұлданған чектер, квесттер мен сауалнамалар үшін ұпайлар. «Әмиян» түймесі тарих пен ваучерлерге айырбастауды ашады.';

  @override
  String get tourBalanceTextDoc =>
      'Мұнда сіздің IQC — мақұлданған бланкілер, квесттер мен сауалнамалар үшін ұпайлар. «Әмиян» түймесі тарих пен ваучерлерге айырбастауды ашады.';

  @override
  String get tourSendTitle => 'Чек жіберіңіз';

  @override
  String get tourSendText =>
      'Чекті суретке түсіріңіз — ЖИ препараттарды таниды. Тексеруден кейін балансқа IQC түседі.';

  @override
  String get tourSendTitleDoc => 'Бланк жіберіңіз';

  @override
  String get tourSendTextDoc =>
      'Бланкіні суретке түсіріңіз — ЖИ препараттарды таниды. Тексеруден кейін балансқа IQC түседі.';

  @override
  String get tourQuestsTitle => 'Белсенді квесттер';

  @override
  String get tourQuestsText =>
      'Өндірушілерден тапсырмалар: қажетті қаптамалар санын сатып, бонус алыңыз. Прогресс карточкада көрінеді.';

  @override
  String get tourQuestsTextDoc =>
      'Өндірушілерден тапсырмалар: қажетті бланкілер санын жазып, бонус алыңыз. Прогресс карточкада көрінеді.';

  @override
  String get tourChecksTitle => 'Сіздің чектеріңіз';

  @override
  String get tourChecksText =>
      'Барлық жіберілген чектер және олардың мәртебесі: тексеруде, мақұлданды, есептелді немесе қайта түсіру керек.';

  @override
  String get tourChecksTitleDoc => 'Сіздің бланкілеріңіз';

  @override
  String get tourChecksTextDoc =>
      'Барлық жіберілген бланкілер және олардың мәртебесі: тексеруде, мақұлданды, есептелді немесе қайта түсіру керек.';

  @override
  String get tourLearnTitle => 'Оқыту';

  @override
  String get tourLearnText =>
      'Фармнарық сарапшыларынан курстар мен тесттер. Өтілген курстар үшін ұпайлар беріледі.';

  @override
  String get tourProfileTitle => 'Профиль';

  @override
  String get tourProfileText =>
      'Жеке деректер, дәріхана, тақырып және тіл. Осы жерде бұл оқытуды қайта өтуге болады.';

  @override
  String get tourProfileTextDoc =>
      'Жеке деректер, жұмыс орны, тақырып және тіл. Осы жерде бұл оқытуды қайта өтуге болады.';

  @override
  String get tourDoneTitle => 'Бәрі дайын!';

  @override
  String get tourDoneText =>
      'Алғашқы IQC алу үшін бірінші чекті жіберіңіз немесе курсты бастаңыз.';

  @override
  String get tourDoneTextDoc =>
      'Алғашқы IQC алу үшін бірінші бланкіні жіберіңіз немесе курсты бастаңыз.';

  @override
  String get tourDoneNote => 'Оқытуды Профильде қайталауға болады.';

  @override
  String get tourFinish => 'Жұмысты бастау';

  @override
  String get profileTourAgain => 'Оқытуды қайта өту';
}

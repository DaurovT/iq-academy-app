// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AppLocalizationsKy extends AppLocalizations {
  AppLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get appTitle => 'IQ Academy';

  @override
  String get apiNetworkError => 'Тармак катасы';

  @override
  String get apiNoAccess => 'Кирүү мүмкүн эмес';

  @override
  String get checkModelStatusPending => 'Текшерилүүдө';

  @override
  String get checkModelStatusAiDetected => 'AI тааныды';

  @override
  String get checkModelStatusAiWrong => 'AI тааныган жок';

  @override
  String get checkModelStatusApproved => 'Жактырылды';

  @override
  String get checkModelStatusRejected => 'Четке кагылды';

  @override
  String get commonRolePharmacist => 'Фармацевт';

  @override
  String get commonRoleDoctor => 'Дарыгер';

  @override
  String get commonRoleMedrep => 'Медициналык өкүл';

  @override
  String get commonRoleProductOwner => 'Бренд / Продукт ээси';

  @override
  String get commonCancel => 'Жокко чыгаруу';

  @override
  String get navHome => 'Башкы бет';

  @override
  String get navChecks => 'Чектер';

  @override
  String get navQuests => 'Квесттер';

  @override
  String get navLearn => 'Окуу';

  @override
  String get navWallet => 'Капчык';

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
  String get navProducts => 'Продукттар';

  @override
  String get navBrands => 'Бренддер';

  @override
  String get navProfile => 'Профиль';

  @override
  String get miniAppsTitle => 'Мини-колдонмолор';

  @override
  String get miniAppsSubtitle => 'Программанын катышуучулары үчүн акциялар';

  @override
  String get miniAppsSoon => 'Жакында';

  @override
  String get sapperCountdownSoon => 'жакында';

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
  String get sapperTitle => 'Супер Сапёр';

  @override
  String get sapperSubtitle =>
      'IQC үчүн уячаларды тандаңыз — жыйынтык чыгарылганда алардын астында эмне бар экенин билесиз';

  @override
  String get sapperNoDraws => 'Активдүү акциялар жок';

  @override
  String get sapperRevealed => 'Аяктады';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 сыйлыктар: $prizeCount  💎 $priceIqc IQC/уяча  ';
  }

  @override
  String sapperMyCells(Object count) {
    return 'сиздин уячалар: $count';
  }

  @override
  String sapperOccupancy(Object occupied, Object total, Object percent) {
    return '$total ичинен $occupied ээленген ($percent%)';
  }

  @override
  String get sapperGoToGame => 'Талааны ачуу';

  @override
  String sapperReserveTitle(Object number) {
    return '№$number уячаны ээлейсизби?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC колдонулат. Жокко чыгарууга болбойт — уяча жыйынтык чыгарылганга чейин сизге бекитилет.';
  }

  @override
  String sapperReserveConfirm(Object price) {
    return '$price IQC үчүн ээлөө';
  }

  @override
  String sapperCellReserved(Object number) {
    return '№$number уяча ээленди';
  }

  @override
  String get sapperNoIqcTitle => 'IQC жетишсиз';

  @override
  String sapperNoIqcBody(Object price, Object have) {
    return 'Катышуу үчүн $price IQC керек, сизде $have. IQC чогултуңуз — окууну, квестти же сурамжылоону өтүңүз.';
  }

  @override
  String get sapperDraws => 'Акциялар';

  @override
  String get sapperAcceptClosed => 'Уяча тандоо жабылды — жыйынтык чыгарылууда';

  @override
  String get sapperHiddenTitle => 'ТАЛААДАГЫ СЫЙЛЫКТАР';

  @override
  String sapperFieldTotal(int count) {
    return 'Талаада $count уяча';
  }

  @override
  String sapperRevealIn(Object time) {
    return 'жыйынтыкка $time калды';
  }

  @override
  String get sapperNoPrizes => 'сыйлыктар көрсөтүлгөн жок';

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
    return 'уяча — $price IQC';
  }

  @override
  String get sapperYourBalance => 'Сиздин баланс';

  @override
  String get sapperCellPriceLabel => 'бир уяча үчүн';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Сиз $count $word алдыңыз!';
  }

  @override
  String get sapperNoWin => 'Бул жолу сыйлыксыз';

  @override
  String get sapperPrizeOne => 'сыйлык';

  @override
  String get sapperPrizeFew => 'сыйлык';

  @override
  String get sapperPrizeMany => 'сыйлык';

  @override
  String get sapperLegendMine => 'Меники';

  @override
  String get sapperLegendTheirs => 'Башкалардыкы';

  @override
  String get sapperLegendEmpty => 'Бош';

  @override
  String get sapperLegendVoucher => 'Ваучер';

  @override
  String get sapperLegendSelected => 'Тандалды';

  @override
  String get sapperLegendOccupied => 'Башкалар ээлеген';

  @override
  String get sapperLegendFree => 'Бош';

  @override
  String get sapperWinners => 'Сыйлык алгандар';

  @override
  String get newsTitle => 'Жаңылыктар';

  @override
  String get newsAll => 'Бардык жаңылыктар';

  @override
  String get newsMore => 'Толугураак →';

  @override
  String get newsDateMonths =>
      'янв,фев,мар,апр,май,июн,июл,авг,сен,окт,ноя,дек';

  @override
  String get newsEmpty => 'Азырынча жаңылыктар жок';

  @override
  String get newsPinned => 'МААНИЛҮҮ';

  @override
  String get newsDetailTitle => 'Жаңылык';

  @override
  String surveyRewardCredited(Object amount) {
    return '+$amount IQC эсепке кошулду';
  }

  @override
  String get surveyThanks => 'Жообуңуз үчүн рахмат!';

  @override
  String surveySubmitError(Object error) {
    return 'Жөнөтүлгөн жок: $error';
  }

  @override
  String get surveyTitle => 'Сурамжылоо';

  @override
  String surveyRewardBadge(Object amount) {
    return '+ $amount IQC';
  }

  @override
  String get surveyChooseOption => 'Жооп вариантын тандаңыз';

  @override
  String get surveyEnterAnswer => 'Жоопту кол менен жазыңыз';

  @override
  String get surveySubmit => 'Жооп берүү';

  @override
  String get loginTagline => 'Үйрөн.\nКолдон.\nЖет.';

  @override
  String get loginTitle => 'Кирүү';

  @override
  String get loginByPhone => 'Телефон номери аркылуу кириңиз';

  @override
  String get loginChooseMethod => 'Кирүүнүн ыңгайлуу жолун тандаңыз';

  @override
  String loginCodeSent(Object phone) {
    return '$phone номерине SMS-код жөнөтүлдү';
  }

  @override
  String get loginPhoneLabel => 'Телефон номери';

  @override
  String get loginPhoneNotFound => 'Номер системадан табылган жок';

  @override
  String get loginConfirm => 'Ырастоо';

  @override
  String get loginGoRegister => 'Каттоодон өтүү';

  @override
  String get loginRegister => 'Катталуу';

  @override
  String get loginNoAccount => 'Аккаунтуңуз жокпу?';

  @override
  String get loginEnter => 'Кирүү';

  @override
  String loginResendIn(Object seconds) {
    return '$seconds секунддан кийин кайталоо';
  }

  @override
  String get loginResendAgain => 'Кайра жөнөтүү';

  @override
  String get loginChangeNumber => '‹ Номерди өзгөртүү';

  @override
  String get loginOr => 'же';

  @override
  String get tgLoginExpired => 'Кирүү убактысы бүттү';

  @override
  String tgLoginParseError(Object error) {
    return 'Кирүү жообун иштетүү мүмкүн болгон жок: $error';
  }

  @override
  String get tgWaitingConfirm => 'Ырастоо күтүлүүдө…';

  @override
  String get tgLoginButton => 'Telegram аркылуу кирүү';

  @override
  String get notifTitle => 'Билдирмелер';

  @override
  String notifUnreadOne(Object count) {
    return '$count окула элек';
  }

  @override
  String notifUnreadMany(Object count) {
    return '$count окула элек';
  }

  @override
  String get notifMarkAllRead => 'Баарын окулду деп белгилөө';

  @override
  String get notifRead => '✓ Окулду';

  @override
  String get notifMarkRead => 'Окулду деп белгилөө';

  @override
  String get notifOpen => 'Ачуу';

  @override
  String get notifEmptyTitle => 'Билдирмелер жок';

  @override
  String get notifEmptyBody =>
      'Бул жерде чектердин абалы, квест сыйлыктары жана окуу жаңылыктары пайда болот.';

  @override
  String get placeholderComingSoon => 'Бөлүм кийинки этаптарда пайда болот.';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileSettings => 'Жөндөөлөр';

  @override
  String get profileLanguage => 'ТИЛ';

  @override
  String get profileAppearance => 'КӨРҮНҮШ';

  @override
  String get profileThemeLight => 'Жарык';

  @override
  String get profileThemeDark => 'Караңгы';

  @override
  String get profileThemeSystem => 'Система';

  @override
  String get profileAccount => 'Аккаунт';

  @override
  String get profilePersonalData => 'ЖЕКЕ МААЛЫМАТ';

  @override
  String get profileRole => 'Роль';

  @override
  String get profileChange => 'Алмаштыруу';

  @override
  String get profileLinkedServices => 'БАЙЛАНЫШКАН КЫЗМАТТАР';

  @override
  String get profilePhone => 'Телефон';

  @override
  String get profileTgConnected => 'Кошулган';

  @override
  String get profileTgLinked => 'Байланышкан';

  @override
  String get profileSupport => 'Колдоо кызматы';

  @override
  String get profileSupportSubtitle =>
      'Telegram, телефон жана колдоо чаты аркылуу жооп беребиз';

  @override
  String get profileLogout => 'Аккаунттан чыгуу';

  @override
  String get profileDeleteTitle => 'Аккаунт менен маалыматты өчүрүү';

  @override
  String get profileDeleteIrreversible => 'Бул аракетти кайтарууга болбойт';

  @override
  String get profileDelete => 'Өчүрүү';

  @override
  String get profileLanguageUpdated => 'Тил жаңыланды';

  @override
  String get profileNewPhoneTitle => 'Жаңы номер';

  @override
  String get profileCancel => 'Жокко чыгаруу';

  @override
  String get profileNext => 'Андан ары';

  @override
  String get profileSmsCodeTitle => 'SMS-код';

  @override
  String get profileCodeLabel => 'Код';

  @override
  String get profileConfirm => 'Ырастоо';

  @override
  String get profilePhoneChanged => 'Телефон өзгөртүлдү';

  @override
  String get profileLogoutConfirmTitle => 'Аккаунттан чыгасызбы?';

  @override
  String get profileLogoutConfirmBody =>
      'Колдонмону кайра колдонуу үчүн кайрадан кирүү керек болот.';

  @override
  String get profileLogoutAction => 'Чыгуу';

  @override
  String get profileDeleteConfirmTitle => 'Аккаунт өчүрүлсүнбү?';

  @override
  String get profileDeleteConfirmBody =>
      'Профиль, телефон номери, кирүү байланыштары, билдирмелер жана колдоо кызматы менен кат алышуу өчүрүлөт. Эсептөөлөр жана берилген ваучерлер тууралуу жазуулар жеке маалыматтарыңызсыз сакталат — алар эсеп үчүн керек. Бул аракетти кайтарууга болбойт.';

  @override
  String get profileStatQuests => 'КВЕСТТЕР';

  @override
  String get profileStatLevel => 'ДЕҢГЭЭЛ';

  @override
  String get questHistoryTitle => 'Катышуу тарыхы';

  @override
  String get questHistoryEmpty => 'Тарых бош';

  @override
  String get questHistoryVoucher => 'Ваучер';

  @override
  String get questHistoryActive => 'Активдүү';

  @override
  String get questHistoryDone => 'Аткарылды';

  @override
  String get registerStep1Of2 => '1-КАДАМ / 2';

  @override
  String registerStep2Of2(Object role) {
    return '2-КАДАМ / 2 · $role';
  }

  @override
  String get registerTitle => 'Каттоо';

  @override
  String get registerChooseRole => 'Кирүү үчүн ролду тандаңыз';

  @override
  String get registerBack => '‹ Артка';

  @override
  String registerConfirmField(Object label) {
    return 'Ырастаңыз: $label';
  }

  @override
  String registerFillField(Object label) {
    return 'Толтуруңуз: $label';
  }

  @override
  String get registerFinish => 'Каттоону аяктоо';

  @override
  String get registerSuccessTitle => 'Каттоо аяктады!';

  @override
  String registerWelcome(Object name) {
    return 'PharmIQ ACADEMY\'ге кош келиңиз, $name!';
  }

  @override
  String get registerStartLearning => 'Окууну баштоо';

  @override
  String get registerGoHome => 'Башкы бетке өтүү';

  @override
  String registerEnterField(Object label) {
    return '$label жазыңыз';
  }

  @override
  String get registerRequiredField => 'Милдеттүү талаа';

  @override
  String get registerSelectPlaceholder => '— тандаңыз —';

  @override
  String registerMultiSelectHintRequired(Object label) {
    return '$label * · Бир нечесин тандоого болот';
  }

  @override
  String registerMultiSelectHint(Object label) {
    return '$label · Бир нечесин тандоого болот';
  }

  @override
  String get registerConsentText => 'Жеке маалыматтарды иштетүүгө макулмун ';

  @override
  String get registerConsentMore => 'толугураак';

  @override
  String get roleSelectTagline => 'Үйрөн.\nКолдон.\nЖет.';

  @override
  String get roleSelectGreeting => 'Саламатсызбы';

  @override
  String roleSelectGreetingName(Object name) {
    return 'Саламатсызбы, $name';
  }

  @override
  String get roleSelectChooseRole => 'Кирүү үчүн ролду тандаңыз';

  @override
  String get roleSelectSubChecksQuests => 'Чектер, квесттер, окуу жана капчык';

  @override
  String get roleSelectSubMedrep => 'Провизорлор портфели жана рейтинг';

  @override
  String get roleSelectSubProductOwner => 'Дашборд, продукттар жана бренддер';

  @override
  String get roleSelectSheetTitle => 'Ролду тандаңыз';

  @override
  String get roleSelectEnter => 'Кирүү';

  @override
  String get notifSettingsTitle => 'Билдирме жөндөөлөрү';

  @override
  String get notifSettingsChecks => 'Чек жана бланк абалдары';

  @override
  String get notifSettingsQuests => 'Квесттер жана сыйлыктар';

  @override
  String get notifSettingsLearning => 'Окуу';

  @override
  String get notifSettingsMarketing => 'Жаңылыктар жана акциялар';

  @override
  String get supportBackProfile => 'Профиль';

  @override
  String get supportTitle => 'Колдоо кызматы';

  @override
  String get supportEmptyHint => 'Бизге жазыңыз — ушул жерден жооп беребиз';

  @override
  String get supportInputHint => 'Билдирүү жазыңыз...';

  @override
  String get supportYou => 'Сиз';

  @override
  String get supportTeam => 'Колдоо кызматы';

  @override
  String get appBarSwitchRole => 'Ролду алмаштыруу';

  @override
  String get asyncRetry => 'Кайталоо';

  @override
  String get brandProductsTitle => 'Продукттар';

  @override
  String get brandProductsEmpty => 'Продукттар жок';

  @override
  String brandProductsQuestCount(Object p1) {
    return '$p1 квест';
  }

  @override
  String get brandProductsDetailTitle => 'Продукт';

  @override
  String get brandQuestsTitle => 'Бренд квесттери';

  @override
  String get brandQuestsEmpty => 'Квесттер жок';

  @override
  String brandQuestsSubtitle(Object p1, Object p2, Object p3) {
    return '$p1 · $p2/$p3 атк.';
  }

  @override
  String get brandQuestsStatusActive => 'Активдүү';

  @override
  String get brandQuestsStatusOff => 'Өчүк';

  @override
  String get brandQuestsDetailTitle => 'Бренд квести';

  @override
  String brandQuestsSponsor(Object p1) {
    return 'Демөөрчү: $p1';
  }

  @override
  String get brandQuestsParticipants => 'Катышуучулар';

  @override
  String get brandQuestsCompletions => 'Аткаруулар';

  @override
  String get brandQuestsBudget => 'Бюджет';

  @override
  String get brandQuestsSpent => 'Сарпталды';

  @override
  String get brandQuestsProducts => 'Продукттар';

  @override
  String get brandQuestsMxik => 'МХИК';

  @override
  String get brandQuestsReward => 'Сыйлык';

  @override
  String get brandQuestsPeriod => 'Мезгил';

  @override
  String get brandsTitle => 'Бренддер';

  @override
  String get brandsEmpty => 'Бренддер жок';

  @override
  String brandsQuestCount(Object p1) {
    return '$p1 квест';
  }

  @override
  String get brandsDetailTitle => 'Бренд';

  @override
  String get brandsSubBrands => 'Суббренддер';

  @override
  String get brandDashTitle => 'Дашборд';

  @override
  String get brandDashChecks => 'Чектер';

  @override
  String get brandDashPacks => 'Таңгактар';

  @override
  String get brandDashActiveQuests => 'Активдүү квесттер';

  @override
  String get brandDashParticipants => 'Катышуучулар';

  @override
  String get brandDashSegmentation => 'Сегментация';

  @override
  String get brandDashRetail => 'Чекене';

  @override
  String get brandDashChain => 'Тармактар';

  @override
  String get brandDashTopProducts => 'Топ продукттар';

  @override
  String get brandDashTopSellers => 'Топ сатуучулар';

  @override
  String get brandDashRegions => 'Аймактар';

  @override
  String get brandDashSalesLogs => 'Сатуу журналдары';

  @override
  String get salesLogTitle => 'Сатуу журналдары';

  @override
  String get salesLogEmpty => 'Жазуулар жок';

  @override
  String get docHomeActiveQuests => 'Активдүү квесттер';

  @override
  String get docHomeAllQuests => 'Бардык квесттер';

  @override
  String get docHomeNoActiveQuests => 'Активдүү квесттер жок';

  @override
  String get docHomeRecommendedCourses => 'Сунушталган курстар';

  @override
  String get docHomeAllCourses => 'Бардык курстар';

  @override
  String get docHomeNoCourses => 'Азырынча курстар жок';

  @override
  String get docHomeGreetingNoName => 'Салам!';

  @override
  String docHomeGreeting(Object name) {
    return 'Салам, $name';
  }

  @override
  String get docHomeSubtitle => 'Бланктарды жөнөтүп, сыйлык алыңыз';

  @override
  String get docHomeWalletBalance => 'КАПЧЫК БАЛАНСЫ';

  @override
  String get docHomeWallet => 'Капчык';

  @override
  String get docHomeSendRecipe => 'Бланк жөнөтүү';

  @override
  String get docHomeSendRecipeHint =>
      'Бланкты сүрөткө тартыңыз — AI дарыларды тааныйт';

  @override
  String get docHomeStatRecipes => 'бардык бланктар';

  @override
  String get docHomeStatApproved => 'жактырылды';

  @override
  String get docHomeStatIqc => 'IQC упай';

  @override
  String get docHomeVoucher => 'ВАУЧЕР';

  @override
  String get docHomeProgress => 'Жүрүш';

  @override
  String docHomeProgressDone(Object pct) {
    return '$pct% аткарылды';
  }

  @override
  String get recipeDetailMyRecipes => 'Менин бланктарым';

  @override
  String recipeDetailTitle(Object id) {
    return 'Бланк №$id';
  }

  @override
  String recipeDetailPhotoCount(Object p1) {
    return 'Сүрөт $p1';
  }

  @override
  String get recipeDetailStatusApproved => 'Жактырылды';

  @override
  String get recipeDetailStatusRejected => 'Четке кагылды';

  @override
  String get recipeDetailStatusPending => 'Текшерилүүдө';

  @override
  String get recipeDetailAiRecognized => 'AI тааныды';

  @override
  String get recipeDetailNoDrugs => 'Дарылар таанылган жок';

  @override
  String get recipesTitle => 'Менин бланктарым';

  @override
  String recipesTotal(Object p1) {
    return 'бардыгы $p1';
  }

  @override
  String get recipesTabAll => 'Баары';

  @override
  String get recipesTabActive => 'Активдүү';

  @override
  String get recipesTabDone => 'Аякталган';

  @override
  String get recipesEmpty => 'Азырынча бланктар жок';

  @override
  String get recipesTakePhoto => 'Сүрөткө тартуу';

  @override
  String get recipesFromGallery => 'Галереядан тандоо';

  @override
  String get recipesUploading => 'Бланк кошулду — жүктөлүүдө';

  @override
  String get recipesDoctorInfoTitle => 'Дарыгер маалыматы (каалоо боюнча)';

  @override
  String get recipesDoctorName => 'А.Ж.А.';

  @override
  String get recipesDoctorWorkplace => 'Иш орду';

  @override
  String get recipesDoctorCity => 'Шаар';

  @override
  String get recipesDoctorPhone => 'Телефон';

  @override
  String get recipesSkip => 'Өткөрүп жиберүү';

  @override
  String get recipesSend => 'Жөнөтүү';

  @override
  String get recipesSubmitButton => 'Бланк жөнөтүү';

  @override
  String recipesPhotoCount(Object p1) {
    return 'сүрөт: $p1';
  }

  @override
  String get recipesStatusApproved => 'Жактырылды';

  @override
  String get recipesStatusRejected => 'Четке кагылды';

  @override
  String get recipesStatusPending => 'Текшерилүүдө';

  @override
  String recipesUploadingBanner(Object count) {
    return 'Жүктөлүүдө: $count';
  }

  @override
  String get recipesRetry => 'Кайталоо';

  @override
  String get companiesTitle => 'Компаниялар';

  @override
  String get companiesEmpty => 'Компаниялар жок';

  @override
  String companiesCode(Object p1) {
    return 'Код: $p1';
  }

  @override
  String get medrepHomeAttributionPrimary => 'Алгачкы';

  @override
  String get medrepHomeAttributionTotal => 'Жалпы';

  @override
  String get medrepHomeMenuPharmacists => 'Фармацевттер';

  @override
  String get medrepHomeMenuPending => 'Ырастоону күтүүдө';

  @override
  String get medrepHomeMenuCompanies => 'Компаниялар';

  @override
  String get medrepHomeMenuLeaderboard => 'Рейтинг';

  @override
  String get medrepHomeGreetingNoName => 'Салам!';

  @override
  String medrepHomeGreeting(Object name) {
    return 'Салам, $name';
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
  String get medrepHomeStatPacks => 'Таңгактар';

  @override
  String get medrepHomeStatQuests => 'Квесттер';

  @override
  String get medrepHomeLinkCopied => 'Шилтеме көчүрүлдү';

  @override
  String get medrepHomeReferralTitle => 'Реферал шилтемеси';

  @override
  String get medrepHomeReferralHint =>
      'Шилтемени провизорго жөнөтүңүз — ал катталууда сизге байланат';

  @override
  String get medrepHomeCopy => 'Көчүрүү';

  @override
  String get medrepHomeShare => 'Бөлүшүү';

  @override
  String get medrepHomeRetry => 'Кайталоо';

  @override
  String get leaderboardUnitPharm => 'дарыкана';

  @override
  String get leaderboardUnitQuests => 'квест';

  @override
  String get leaderboardUnitChecks => 'чек';

  @override
  String get leaderboardTitle => 'Рейтинг';

  @override
  String get leaderboardAttributionPrimary => 'Алгачкы';

  @override
  String get leaderboardAttributionTotal => 'Жалпы';

  @override
  String get leaderboardCompanyFallback => 'Компания';

  @override
  String get leaderboardRetry => 'Кайталоо';

  @override
  String get pharmDetailIncentivizeTitle => 'Фармацевтти сыйлоо';

  @override
  String pharmDetailRating(Object p1) {
    return 'Баа: $p1';
  }

  @override
  String get pharmDetailComment => 'Комментарий';

  @override
  String get pharmDetailCancel => 'Жокко чыгаруу';

  @override
  String get pharmDetailSend => 'Жөнөтүү';

  @override
  String get pharmDetailSent => 'Жөнөтүлдү';

  @override
  String get pharmDetailBack => 'Фармацевттер';

  @override
  String get pharmDetailChecks => 'Чектер';

  @override
  String get pharmDetailPacks => 'Таңгактар';

  @override
  String get pharmDetailQuests => 'Квесттер';

  @override
  String get pharmDetailIqcPoints => 'IQC упайлары';

  @override
  String get pharmDetailRecentChecks => 'Акыркы чектер';

  @override
  String get pharmDetailNoChecks => 'Азырынча чектер жок';

  @override
  String get pharmDetailActive => 'Активдүү';

  @override
  String get pharmDetailPassive => 'Пассивдүү';

  @override
  String get pharmDetailIncentivize => 'Сыйлоо';

  @override
  String get pharmDetailRetry => 'Кайталоо';

  @override
  String get portfolioTitle => 'Фармацевттер';

  @override
  String get portfolioUpdated => 'Жаңыланды';

  @override
  String portfolioInPortfolio(Object total) {
    return 'портфелде $total';
  }

  @override
  String get portfolioSearchHint => 'Фармацевт издөө…';

  @override
  String portfolioTabAll(Object all) {
    return 'Баары ($all)';
  }

  @override
  String portfolioTabActive(Object active) {
    return 'Активдүү ($active)';
  }

  @override
  String portfolioTabPassive(Object passive) {
    return 'Пассивдүү ($passive)';
  }

  @override
  String get portfolioNotFound => 'Фармацевттер табылган жок';

  @override
  String get portfolioRetry => 'Кайталоо';

  @override
  String get medrepQuestsTitle => 'Компания квесттери';

  @override
  String get medrepQuestsEmpty => 'Квесттер жок';

  @override
  String medrepQuestsSubtitle(Object p1, Object p2) {
    return 'Максат: $p1 · катышуучулар: $p2';
  }

  @override
  String get medrepQuestsNoParticipants => 'Азырынча катышуучулар жок';

  @override
  String get referralsAccepted => 'Өтүнмө кабыл алынды';

  @override
  String get referralsRejected => 'Өтүнмө четке кагылды';

  @override
  String get referralsTitle => 'Реферал өтүнмөлөрү';

  @override
  String get referralsEmpty => 'Жаңы өтүнмөлөр жок';

  @override
  String get referralsDecline => 'Четке кагуу';

  @override
  String get referralsAccept => 'Кабыл алуу';

  @override
  String get checkDetailBackMyChecks => 'Менин чектерим';

  @override
  String checkDetailTitle(Object id) {
    return 'Чек №$id';
  }

  @override
  String get checkDetailRejectedFallback => 'Чек четке кагылды';

  @override
  String checkDetailQuestDone(Object p1) {
    return '$p1 · Квест аткарылды ✓';
  }

  @override
  String get checkDetailQuestAfterApproval =>
      'Чек жактырылгандан кийин пайда болот';

  @override
  String get checkDetailQuestNone => 'Азырынча бир дагы квестке эсептелген жок';

  @override
  String get checkDetailChipApproved => 'Жактырылды';

  @override
  String get checkDetailChipRejected => 'Четке кагылды';

  @override
  String get checkDetailChipPending => 'Текшерилүүдө';

  @override
  String get checkDetailOpenPhoto => 'Ачуу';

  @override
  String checkDetailPhotoCount(Object p1) {
    return 'сүрөт: $p1';
  }

  @override
  String get checkDetailRejectReasonTitle => 'Четке кагуунун себеби';

  @override
  String get checkDetailResubmit => 'Кайра жөнөтүү';

  @override
  String get checkDetailPendingTitle => 'Текшерилүүдө';

  @override
  String get checkDetailPendingBody =>
      'Сиздин чек адистин текшерүүсүндө. Адатта бул 24 саатка чейин созулат.';

  @override
  String checkDetailSentAt(Object sentAt) {
    return 'Жөнөтүлдү: $sentAt';
  }

  @override
  String get checkDetailAiWaitingTitle => 'AI таануусу күтүлүүдө';

  @override
  String get checkDetailAiWaitingBody =>
      'Жыйынтык текшерүүдөн кийин пайда болот';

  @override
  String get checkDetailAiTitle => 'AI тааныды';

  @override
  String checkDetailPacks(Object p1) {
    return '$p1 таңг.';
  }

  @override
  String get checkDetailQuestCardTitle => 'Квесттерге эсептөө';

  @override
  String get checksEmpty => 'Азырынча чектер жок';

  @override
  String get checksAddedUploading => 'Чек кошулду — жүктөлүүдө';

  @override
  String get checksNewCheckTitle => 'Жаңы чек';

  @override
  String get checksTapToAddPhoto => 'Сүрөт кошуу үчүн басыңыз';

  @override
  String get checksTakePhoto => 'Сүрөткө тартуу';

  @override
  String get checksSubmitForReview => 'Текшерүүгө жөнөтүү';

  @override
  String get checksTitle => 'Менин чектерим';

  @override
  String checksTotalCount(Object p1) {
    return 'бардыгы $p1';
  }

  @override
  String get checksSendPhoto => 'Сүрөт жөнөтүү';

  @override
  String checksCardMeta(Object p1, Object p2) {
    return '$p1 · сүрөт: $p2';
  }

  @override
  String get checksAwaitUsually24h => 'Күтүңүз — адатта 24 саат';

  @override
  String get checksUploadingTitle => 'Сүрөт жүктөлүүдө';

  @override
  String get checksPhotoFallback => 'Чектин сүрөтү';

  @override
  String get checksRetry => 'Кайталоо';

  @override
  String get courseDetailTabDescription => 'СҮРӨТТӨМӨ';

  @override
  String get courseDetailTabContent => 'МАЗМУНУ';

  @override
  String courseDetailMinutes(Object totalMin) {
    return '~$totalMin мүнөт';
  }

  @override
  String get courseDetailContinueLearning => 'ОКУУНУ УЛАНТУУ';

  @override
  String get courseDetailStartLearning => 'ОКУУНУ БАШТОО';

  @override
  String get courseDetailVideoLessonOne => 'видеосабак';

  @override
  String get courseDetailVideoLessonFew => 'видеосабак';

  @override
  String get courseDetailVideoLessonMany => 'видеосабак';

  @override
  String courseDetailQuizAfterLesson(Object videosBefore) {
    return '$videosBefore-сабактан кийинки тест';
  }

  @override
  String get courseDetailQuizForCourse => 'Курс боюнча тест';

  @override
  String courseDetailLessonMin(Object p1) {
    return '$p1 мүн';
  }

  @override
  String get courseDetailQuizBadge => 'ТЕСТ';

  @override
  String get homePhActiveQuests => 'Активдүү квесттер';

  @override
  String get homePhAllQuests => 'Бардык квесттер';

  @override
  String get homePhNoActiveQuests => 'Активдүү квесттер жок';

  @override
  String get homePhRecentChecks => 'Акыркы чектер';

  @override
  String get homePhAllChecks => 'Бардык чектер';

  @override
  String get homePhNoChecks => 'Азырынча чектер жок';

  @override
  String get homePhGreeting => 'Салам!';

  @override
  String homePhGreetingName(Object name) {
    return 'Салам, $name!';
  }

  @override
  String get homePhGreetingSub => 'Жаңы билимге даярсызбы?';

  @override
  String get homePhWalletBalanceLabel => 'КАПЧЫК БАЛАНСЫ';

  @override
  String get homePhWalletButton => 'Капчык';

  @override
  String get homePhSendCheck => 'Чек жөнөтүү';

  @override
  String get homePhSendCheckSub =>
      'Чекти сүрөткө тартыңыз — AI дарыларды тааныйт';

  @override
  String get homePhStatActiveQuests => 'активдүү квест';

  @override
  String get homePhStatApprovedChecks => 'жактырылган чек';

  @override
  String get homePhStatIqcPoints => 'IQC упай';

  @override
  String get homePhVoucherBadge => 'ВАУЧЕР';

  @override
  String get homePhProgress => 'Жүрүш';

  @override
  String homePhPctDone(Object pct) {
    return '$pct% аткарылды';
  }

  @override
  String homePhCheckNumber(Object p1) {
    return 'Чек №$p1';
  }

  @override
  String get learnLessonOne => 'сабак';

  @override
  String get learnLessonFew => 'сабак';

  @override
  String get learnLessonMany => 'сабак';

  @override
  String get learnTitle => 'Окуу';

  @override
  String get learnSearchHint => 'Курстар боюнча издөө...';

  @override
  String get learnTabAll => 'Баары';

  @override
  String get learnTabMine => 'Менин курстарым';

  @override
  String get learnTabDone => 'Өтүлгөн';

  @override
  String get learnNewBadge => 'ЖАҢЫ';

  @override
  String get learnRepeatCourse => 'КУРСТУ КАЙТАЛОО';

  @override
  String get learnContinueLearning => 'ОКУУНУ УЛАНТУУ';

  @override
  String get learnStartCourse => 'КУРСТАН ӨТҮҮ';

  @override
  String get learnCompleted => 'Өтүлдү';

  @override
  String get learnNotFoundTitle => 'Курстар табылган жок';

  @override
  String get learnTryChangeFilters => 'Чыпкаларды өзгөртүп көрүңүз';

  @override
  String learnNothingForQuery(Object query) {
    return '«$query» сурамы боюнча эч нерсе табылган жок.\nСурамды өзгөртүңүз же чыпкаларды алып салыңыз.';
  }

  @override
  String get learnResetFilters => 'Чыпкаларды алып салуу';

  @override
  String lessonCompletedReward(Object p1) {
    return 'Сабак аяктады · +$p1 IQC';
  }

  @override
  String get lessonNotFound => 'Сабак табылган жок';

  @override
  String get lessonTabText => 'САБАКТЫН ТЕКСТИ';

  @override
  String get lessonTabMaterials => 'САБАКТЫН МАТЕРИАЛДАРЫ';

  @override
  String get lessonNoMaterials => 'Азырынча материалдар жок';

  @override
  String get lessonStartQuiz => 'ТЕСТТИ БАШТОО';

  @override
  String get lessonComplete => 'САБАКТЫ АЯКТОО';

  @override
  String get questDetailBackQuests => 'Квесттер';

  @override
  String get questDetailPillVoucher => 'Ваучер';

  @override
  String get questDetailLeftLabel => 'калды';

  @override
  String get questDetailDoneLabel => 'аткарылды';

  @override
  String get questDetailRewardLabel => 'СЫЙЛЫК';

  @override
  String get questDetailVoucherManual =>
      'Ваучер текшерүүдөн кийин кол менен берилет';

  @override
  String questDetailIqcToBalance(Object p1) {
    return 'Баланска +$p1 IQC';
  }

  @override
  String get questDetailHowTitle => 'Чектер кантип эсептелет';

  @override
  String get questDetailHowBody =>
      'Керектүү дары бар чектердин сүрөтүн жөнөтүңүз. Таңгакты текшерүү — автоматтык түрдө.';

  @override
  String get questDetailTodoTitle => 'Эмне кылуу керек';

  @override
  String get questDetailDrugLabel => 'Дары';

  @override
  String get questDetailLimitsLabel => 'Лимиттер';

  @override
  String get questDetailPeriodLabel => 'Мезгил';

  @override
  String get questDetailParticipantsLabel => 'Катышуучулар';

  @override
  String get questDetailPurchases => 'сатып алуу';

  @override
  String questsPeriodUntil(Object p1) {
    return '$p1 чейин';
  }

  @override
  String questsPeriodFrom(Object p1) {
    return '$p1 баштап';
  }

  @override
  String get questsPeriodNone => 'Мөөнөтсүз';

  @override
  String get questsTitle => 'Квесттер';

  @override
  String get questsTabActive => 'Активдүү';

  @override
  String get questsTabArchive => 'Архив';

  @override
  String get questsTabAll => 'Баары';

  @override
  String get questsCountWordActive => 'активдүү';

  @override
  String get questsCountWordArchive => 'архивдеги';

  @override
  String get questsCountQuestOne => 'квест';

  @override
  String get questsCountQuestFew => 'квест';

  @override
  String get questsHistoryChip => 'Катышуу тарыхы';

  @override
  String get questsSearchHint => 'Издөө';

  @override
  String questsPacksItem(Object p1, Object p2) {
    return '$p1 × $p2 таңг.';
  }

  @override
  String questsIqcNoLimit(Object p1) {
    return '+$p1 IQC · чексиз';
  }

  @override
  String get questsPillVoucher => 'Ваучер';

  @override
  String get questsActive => 'Активдүү';

  @override
  String get questsFinished => 'Аяктады';

  @override
  String get questsEmptyArchiveTitle => 'Архивдеги квесттер жок';

  @override
  String get questsEmptyArchiveSub =>
      'Аяктаган квесттер ушул жерде пайда болот';

  @override
  String get questsEmptyActiveTitle => 'Активдүү квесттер жок';

  @override
  String get questsEmptyActiveSub => 'Жаңы квесттер ушул жерде пайда болот';

  @override
  String get questsEmptyAllTitle => 'Квесттер жок';

  @override
  String get questsEmptyAllSub => 'Кийинчерээк караңыз';

  @override
  String get questsViewActive => 'Активдүүлөрдү көрүү';

  @override
  String get quizTitle => 'Тестирлөө';

  @override
  String quizQuestionOf(Object p1, Object n) {
    return 'Суроо $p1 / $n';
  }

  @override
  String get quizFinish => 'ТЕСТТИ АЯКТОО';

  @override
  String get quizNext => 'КИЙИНКИ СУРОО →';

  @override
  String get quizAnswerLabel => 'Жооп';

  @override
  String get quizCongrats => 'Куттуктайбыз!';

  @override
  String get quizPassed => 'Тест ийгиликтүү тапшырылды!';

  @override
  String get quizYouEarned => 'Сиз таптыңыз';

  @override
  String get quizCorrectLabel => 'ТУУРА ЖООПТОР';

  @override
  String get quizResultLabel => 'ЖЫЙЫНТЫК';

  @override
  String get quizToHome => 'БАШКЫ ЭКРАНГА';

  @override
  String get quizViewCertificate => 'Сертификатты көрүү →';

  @override
  String get quizTryAgainTitle => 'Дагы бир жолу аракет кылыңыз';

  @override
  String get quizFailed => 'Тест тапшырылган жок';

  @override
  String get quizYourResult => 'Сиздин жыйынтык';

  @override
  String get quizCorrectLower => 'туура';

  @override
  String quizPassMinimum(Object passScore, Object total, Object passPct) {
    return 'Өтүү үчүн минимум: $passScore/$total ($passPct%)';
  }

  @override
  String get quizRetry => '↺ КАЙРА ТАПШЫРУУ';

  @override
  String get quizBackToLesson => 'Сабакка кайтуу →';

  @override
  String get voucherNotFound => 'Ваучер табылган жок';

  @override
  String get voucherTitle => 'Менин ваучерим';

  @override
  String get voucherCodeCopied => 'Код көчүрүлдү';

  @override
  String get voucherUsed => 'Колдонулду';

  @override
  String get voucherActive => 'Активдүү';

  @override
  String voucherIssuedAt(Object p1) {
    return 'Берилди: $p1';
  }

  @override
  String get voucherGiftCardLabel => 'UZS · БЕЛЕК КАРТАСЫ';

  @override
  String get voucherShowQr => 'QR-кодду кассирге көрсөтүңүз же кодду айтыңыз';

  @override
  String get voucherStores => 'Korzinka.uz дүкөндөрү';

  @override
  String get voucherSupport => 'Колдоо кызматы';

  @override
  String get walletPendingVouchers => 'Кезектеги ваучерлер';

  @override
  String get walletUseIqc => 'IQC колдонуу';

  @override
  String get walletMyVouchers => 'Менин ваучерлерим';

  @override
  String get walletNoVouchers => 'Азырынча ваучерлер жок';

  @override
  String get walletRedeemTitle => 'Ваучерди тариздейсизби?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 — $p2 IQC үчүн';
  }

  @override
  String get walletCancel => 'Жокко чыгаруу';

  @override
  String get walletRedeem => 'Тариздөө';

  @override
  String get walletVoucherIssued => 'Ваучер таризделди';

  @override
  String get walletTitle => 'Капчык';

  @override
  String get walletBalanceLabel => 'БАЛАНС';

  @override
  String walletTotalAccrued(Object p1) {
    return 'Бардыгы эсептелди: $p1 IQC';
  }

  @override
  String get walletHistoryArrow => 'Тарых →';

  @override
  String get walletQuestDoneAwaiting =>
      'Квест аткарылды — ваучер берилүүнү күтүүдө';

  @override
  String walletForIqc(Object p1) {
    return '$p1 IQC үчүн';
  }

  @override
  String get walletGetVoucher => 'Ваучер алуу';

  @override
  String get walletNotEnoughIqc => 'IQC жетишсиз';

  @override
  String walletCodeMeta(Object p1, Object p2) {
    return 'Код: $p1 · $p2';
  }

  @override
  String get walletVoucherUsed => 'Колдонулду';

  @override
  String get walletVoucherActive => 'Активдүү';

  @override
  String get walletHistoryTitle => 'Тарых';

  @override
  String get walletNoTransactions => 'Азырынча операциялар жок';

  @override
  String get brandProductsBrand => 'Бренд';

  @override
  String get brandProductsFormat => 'Формат';

  @override
  String get brandProductsMxik => 'МХИК';

  @override
  String get brandProductsDivisible => 'Бөлүнүүчү';

  @override
  String get brandProductsYes => 'Ооба';

  @override
  String get brandProductsNo => 'Жок';

  @override
  String get brandProductsQuests => 'Квесттер';

  @override
  String get medrepHomePeriodAll => 'Баары';

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
    return '$company | Менин ордум: ';
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
    return 'Өтүнмө: $date';
  }

  @override
  String get checksStatusApproved => 'Жактырылды';

  @override
  String get checksStatusRejected => 'Четке кагылды';

  @override
  String get checksStatusPending => 'Текшерилүүдө';

  @override
  String questDetailRewardVoucherLine(Object amount) {
    return 'Korzinka ваучери · $amount IQC';
  }

  @override
  String get questDetailRewardIqcLine => 'Бардык дарыканалар · чексиз';

  @override
  String questDetailActiveUntil(Object date) {
    return '$date чейин активдүү';
  }

  @override
  String get questDetailFinished => 'Аяктады';

  @override
  String questsPurchasesOfGoal(Object completed, Object goal) {
    return '$completed / $goal сатып алуу';
  }

  @override
  String questsPurchases(Object completed) {
    return '$completed сатып алуу';
  }

  @override
  String get profileLanguageTitle => 'Тил';

  @override
  String get profileChooseLanguage => 'Тилди тандаңыз';

  @override
  String get navDoctors => 'Дарыгерлер';

  @override
  String get doctorsTitle => 'Дарыгерлер';

  @override
  String get doctorsHint =>
      'Компанияңыздын дарыгерлери жана алардын бланк квести боюнча жетишкендиги';

  @override
  String get doctorsSearchHint => 'Дарыгер, клиника, шаар боюнча издөө';

  @override
  String get doctorsCompleted => 'Аткарды';

  @override
  String get doctorsInProgress => 'Жүрүшүндө';

  @override
  String get doctorsIdle => 'Баштаган жок';

  @override
  String get doctorsNoQuest => 'Активдүү бланк квести жок';

  @override
  String get doctorsUnavailable =>
      'Компанияңызда бланк долбоору жок, ошондуктан дарыгерлер туташтырылган эмес';

  @override
  String get doctorsEmpty => 'Азырынча дарыгерлер жок';

  @override
  String get doctorsNotFound => 'Эч нерсе табылган жок';

  @override
  String get doctorsRegionUnknown => 'Аймак көрсөтүлгөн эмес';

  @override
  String doctorsRecipesCount(Object count) {
    return 'Бардык убакыттагы бланктар: $count';
  }

  @override
  String doctorsQuestGoal(Object goal) {
    return 'Норма: $goal';
  }

  @override
  String doctorsDoneTimes(Object count) {
    return 'Аткарылды ×$count';
  }

  @override
  String doctorsRegionSummary(Object doctors, Object completed) {
    return '$doctors дарыгер · $completed аткарды';
  }

  @override
  String get doctorsAll => 'Баары';

  @override
  String get loginWithGoogle => 'Google аркылуу кирүү';

  @override
  String get loginWithApple => 'Apple аркылуу кирүү';

  @override
  String get oauthLinkTitle => 'Телефон номериңизди ырастаңыз';

  @override
  String get oauthLinkBody =>
      'Номерди бир жолу ырастаңыз — ушинтип аккаунтуңузду жана упайларыңызды табабыз. Кийинки жолу бир басуу менен киресиз.';

  @override
  String get oauthLinkPhoneLabel => 'Телефон номери';

  @override
  String get oauthLinkSendCode => 'Кодду алуу';

  @override
  String oauthLinkCodeSent(String phone) {
    return 'Код $phone номерине жөнөтүлдү';
  }

  @override
  String get oauthLinkCodeLabel => 'SMS коду';

  @override
  String get oauthLinkConfirm => 'Ырастоо';

  @override
  String get oauthLinkChangePhone => 'Номерди өзгөртүү';

  @override
  String get profilePrivacy => 'Купуялык саясаты';

  @override
  String get profilePrivacySubtitle =>
      'Кандай маалыматтарды чогултабыз жана кантип сактайбыз';

  @override
  String get sapperRulesButton => 'Акциянын эрежелери';

  @override
  String get sapperRulesTitle => '«Супер Сапёр» акциясынын эрежелери';

  @override
  String get sapperRulesFull => 'Толук расмий эрежелер';

  @override
  String get sapperRulesAccept =>
      'Уячаны ээлеп, сиз акциянын эрежелерин кабыл аласыз.';

  @override
  String get sapperRule1 =>
      'Уюштуруучу — «PHARMIQ ACADEMY» ЖЧК. Apple жана Google акциянын демөөрчүсү эмес жана ага катышпайт.';

  @override
  String get sapperRule2 =>
      'Акцияда акча колдонулбайт: IQC упайлары менен гана катышууга болот.';

  @override
  String get sapperRule3 =>
      'IQC упайлары окуу, сурамжылоолор жана ырасталган квесттер үчүн берилет. Аларды сатып алууга, башка колдонуучуга өткөрүүгө же акчага алмаштырууга болбойт.';

  @override
  String get sapperRule4 =>
      'Мөөнөттөр, уячанын баасы жана сыйлыктардын толук тизмеси катышууга чейин акциянын бетинде көрсөтүлөт.';

  @override
  String get sapperRule5 =>
      'Упайлар уяча ээленгенде чегерилет, аны жокко чыгарууга болбойт. Бир уячаны бир катышуучу ээлейт; кабыл алуу жыйынтыктан 1 мүнөт мурун жабылат.';

  @override
  String get sapperRule6 =>
      'Сыйлыктар уячаларга акция башталганга чейин жайгаштырылат жана андан кийин өзгөрбөйт. Белгиленген убакта бардык уячалар бир убакта ачылат, уячадагы сыйлыкты аны ээлеген катышуучу автоматтык түрдө алат. Жыйынтык баарына көрүнөт.';

  @override
  String get sapperRule7 =>
      'Сыйлыктар — өнөктөштөрдүн белек ваучерлери жана бонус упайлар; акчага алмаштырылбайт. Ээленбеген уячалардагы сыйлыктар кайра бөлүштүрүлбөйт.';

  @override
  String get sapperRule8 =>
      'Акция жокко чыгарылса, короттулган бардык упайлар кайтарылат. 18 жаштан улуу колдонуучулар катыша алат, катышуу ыктыярдуу.';

  @override
  String get stateServerErrorTitle => 'Бир нерсе туура эмес болду';

  @override
  String get stateServerErrorText =>
      'Көйгөй тууралуу билебиз жана аны оңдоп жатабыз. Бир мүнөттөн кийин кайра аракет кылыңыз';

  @override
  String get stateWriteSupport => 'Колдоо кызматына жазуу';

  @override
  String stateErrorCode(String code) {
    return 'Ката коду: $code';
  }

  @override
  String get stateOfflineTitle => 'Интернетке туташуу жок';

  @override
  String get stateOfflineText =>
      'Wi‑Fi же мобилдик интернетти текшериңиз. Байланыш пайда болгондо экран өзү жаңырат';

  @override
  String stateOfflineBanner(String time) {
    return 'Байланыш жок · $time маалыматтары';
  }

  @override
  String get stateOfflineBannerShort => 'Байланыш жок';

  @override
  String get stateOfflineSendHint =>
      'Интернет пайда болгондо жөнөтүү мүмкүн болот';

  @override
  String get stateRefreshing => 'Жаңыртып жатабыз…';

  @override
  String get miniAppsNewGamesTitle => 'Жаңы мини-тиркемелер';

  @override
  String get miniAppsNewGamesText =>
      'Иштелип жатат — пайда болгондо кабарлайбыз';

  @override
  String sapperBackTo(String label) {
    return 'Артка: $label';
  }

  @override
  String sapperPrizesCount(int n) {
    return '$n сыйлык';
  }

  @override
  String sapperMyCellsCount(int n) {
    return 'Сиздин уячаларыңыз: $n';
  }

  @override
  String sapperResultsIn(String time) {
    return 'Жыйынтык $time кийин';
  }

  @override
  String get sapperCellPriceTitle => 'Уячанын баасы';

  @override
  String get sapperMyCellsTitle => 'Сиздин уячаларыңыз';

  @override
  String get sapperOccupiedTitle => 'Ээленген уячалар';

  @override
  String sapperOccupiedOf(int occupied, int total) {
    return '$occupied / $total';
  }

  @override
  String sapperOfTotal(int total) {
    return '/ $total';
  }

  @override
  String get sapperHiddenLabel => 'Талаада жашырылган';

  @override
  String get sapperHowTitle => 'Кантип катышуу керек';

  @override
  String get sapperStep1Title => 'Уячаларды тандаңыз';

  @override
  String sapperStep1Text(int price) {
    return 'Ар бири $price IQC турат. Бир эле учурда бир нечесин ээлөөгө болот';
  }

  @override
  String get sapperStep2Title => 'Жыйынтыкты күтүңүз';

  @override
  String get sapperStep2Text => 'Жумасына бир жолу талаа баарына ачылат';

  @override
  String get sapperStep3Title => 'Сыйлыкты алыңыз';

  @override
  String get sapperStep3Text =>
      'IQC баланска түшөт, ваучер капчыкта пайда болот';

  @override
  String get sapperSelectHint => 'Тандоо үчүн бош уячаларды басыңыз';

  @override
  String sapperSelectedHint(int n, int price) {
    return 'Тандалды: $n · $price IQC кармалат';
  }

  @override
  String sapperTakeCta(int n, int price) {
    return '$n уячаны ээлөө · $price IQC';
  }

  @override
  String sapperTakenToast(int n) {
    return '+$n уяча — жыйынтыкты күтөбүз';
  }

  @override
  String sapperReserveManyTitle(int n) {
    return '$n уячаны ээлейсизби?';
  }

  @override
  String get sapperCellFree => 'Бош уяча';

  @override
  String get sapperCellTheirs => 'Башка катышуучу ээлеген';

  @override
  String get sapperCellMine => 'Сиздин уячаңыз';

  @override
  String get sapperCellSelected => 'Тандалды, алып салуу үчүн басыңыз';

  @override
  String get sapperCellEmpty => 'Бош';

  @override
  String sapperCellPrize(String label) {
    return 'Сыйлык: $label';
  }

  @override
  String sapperGridLabel(int cols, int rows) {
    return '$cols × $rows талаа';
  }

  @override
  String get sapperGridRevealed => 'Ачылган талаа';

  @override
  String sapperWonTitle(String prize) {
    return 'Сиз $prize алдыңыз';
  }

  @override
  String sapperWonText(int wins, int total) {
    return 'Баланста · сыйлыктуу уячалар: $wins / $total';
  }

  @override
  String get sapperNotParticipated => 'Сиз бул акцияга катышкан жоксуз';

  @override
  String sapperRevealedOn(String date) {
    return 'Жыйынтык чыгарылды · $date';
  }

  @override
  String get sapperWinnerYou => 'сиз';

  @override
  String sapperWinnerCell(int n) {
    return '№$n уяча';
  }

  @override
  String get sapperPlayNew => 'Жаңы акцияга катышуу';

  @override
  String get sapperViewResults => 'Жыйынтыкты көрүү';

  @override
  String get questsSubtitle => 'Сатыңыз жана сыйлык алыңыз';

  @override
  String get questsSubtitleDoctor => 'Бланк жазыңыз жана сыйлык алыңыз';

  @override
  String get questsSearchLabel => 'Квесттерди издөө';

  @override
  String get questsTabDone => 'Аяктаган';

  @override
  String get questsSortHint => 'Адегенде — сыйлыкка эң жакындары';

  @override
  String get questsAlmostDone => 'Даяр болууга аз калды';

  @override
  String get questsCompleted => 'Аткарылды';

  @override
  String questsOfGoalSales(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal сатуудан',
    );
    return '$_temp0';
  }

  @override
  String questsOfGoalRecipes(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal бланктан',
    );
    return '$_temp0';
  }

  @override
  String questsLeftShort(int n) {
    return 'Дагы $n';
  }

  @override
  String get questsMore => 'Кененирээк';

  @override
  String get questsHowTitle => 'Квесттер кантип иштейт';

  @override
  String get questsStepSellTitle => 'Сатыңыз';

  @override
  String get questsStepSellSub => 'препаратты';

  @override
  String get questsStepPrescribeTitle => 'Жазыңыз';

  @override
  String get questsStepPrescribeSub => 'бланкты';

  @override
  String get questsStepSendTitle => 'Жөнөтүңүз';

  @override
  String get questsStepSendCheckSub => 'чектин сүрөтүн';

  @override
  String get questsStepSendRecipeSub => 'бланктын сүрөтүн';

  @override
  String get questsStepGetTitle => 'Алыңыз';

  @override
  String get questsStepGetSub => 'сыйлыкты';

  @override
  String get questsDoneFooter =>
      'Бул жерде аткарылган жана аяктаган квесттер күнү жана алынган сыйлыгы менен сакталат';

  @override
  String questsDoneOn(String date) {
    return 'Аткарылды · $date';
  }

  @override
  String questsEndedOn(String date) {
    return 'Аяктады · $date';
  }

  @override
  String get questsEmptyDoneTitle => 'Азырынча аяктаган квесттер жок';

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
  String get questsSalesLeftPrefix => 'Сатуу калды:';

  @override
  String get questsRecipesLeftPrefix => 'Жазуу калды:';

  @override
  String questsPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n таңгак',
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
      'Максатка жетти — сыйлык текшерүүдөн кийин берилет';

  @override
  String get questsRewardLabel => 'Сыйлык';

  @override
  String questsVoucherTitle(String shop) {
    return '$shop ваучери';
  }

  @override
  String get questsRewardManual => 'Текшерүүдөн кийин кол менен берилет';

  @override
  String get questsRewardIqcSub => 'Упайлар текшерүүдөн кийин балансқа түшөт';

  @override
  String get questsRewardReceived => 'Сыйлык алынды';

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
    return '$packs сатуу керек';
  }

  @override
  String questsNeedPrescribe(String recipes) {
    return '$recipes жазуу керек';
  }

  @override
  String get questsStepPhotoCheck => 'Чекти сүрөткө тартыңыз';

  @override
  String get questsStepPhotoCheckSub => 'ЖИ таңгакты автоматтык түрдө текшерет';

  @override
  String get questsStepPhotoRecipe => 'Бланкты сүрөткө тартыңыз';

  @override
  String get questsStepPhotoRecipeSub => 'ЖИ бланкты автоматтык түрдө текшерет';

  @override
  String get questsStepGetVoucher => 'Ваучер алыңыз';

  @override
  String questsStepGetIqc(int n) {
    return '$n IQC алыңыз';
  }

  @override
  String get questsConditionsTitle => 'Шарттар';

  @override
  String get questsSalesLimit => 'Сатуу лимити';

  @override
  String get questsRecipesLimit => 'Бланк лимити';

  @override
  String get questsNoLimit => 'Чектөөсүз';

  @override
  String questsPacksShort(int n) {
    return '$n таң.';
  }

  @override
  String get questsCountedTitle => 'Эсепке алынган чектер';

  @override
  String get questsCountedRecipesTitle => 'Эсепке алынган бланктар';

  @override
  String get questsCountedEmpty => 'Азырынча бир да чек жок';

  @override
  String get questsCountedEmptyRecipes => 'Азырынча бир да бланк жок';

  @override
  String get questsCountedEmptySub =>
      'Квест боюнча чектер текшерүүдөн кийин ушул жерде пайда болот';

  @override
  String get questsCountedEmptySubRecipes =>
      'Квест боюнча бланктар текшерүүдөн кийин ушул жерде пайда болот';

  @override
  String questsCountedSales(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n сатуу эсепке алынды',
    );
    return '$_temp0';
  }

  @override
  String questsCountedRecipes(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n бланк эсепке алынды',
    );
    return '$_temp0';
  }

  @override
  String get questsAllChecks => 'Бардык чектер';

  @override
  String get questsAllRecipes => 'Бардык бланктар';

  @override
  String get questsSendCheck => 'Квест боюнча чек жөнөтүү';

  @override
  String get questsSendRecipe => 'Квест боюнча бланк жөнөтүү';

  @override
  String get questsSearchPlaceholder => 'Аталышы же препарат';

  @override
  String get questsSearchClear => 'Тазалоо';

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
  String get questsPopular => 'Көп издешет';

  @override
  String get questsNothingFound => 'Эч нерсе табылган жок';

  @override
  String get questsNothingFoundSub =>
      'Препараттын аталышын текшериңиз же башка суроо жазыңыз';

  @override
  String get questsReceived => 'алынды';

  @override
  String get questsPending => 'күтүүдө';

  @override
  String get walletAccruedAllTime => 'бардык убакытта эсептелди';

  @override
  String walletAwaitingStat(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ваучер берилишин күтүүдө',
      one: 'ваучер берилишин күтүүдө',
    );
    return '$_temp0';
  }

  @override
  String get walletArchive => 'Архив';

  @override
  String get walletArchiveTitle => 'Ваучерлер архиви';

  @override
  String get walletTapCardHint => 'Картаны басыңыз — QR-кодду көрсөтөбүз';

  @override
  String get walletAllArchivedTitle => 'Бардык ваучерлер архивде';

  @override
  String get walletAllArchivedText =>
      'Жаңылары квесттер аткарылгандан кийин пайда болот';

  @override
  String get walletGiftCard => 'Белек картасы';

  @override
  String get walletGiftCardBoth => 'БЕЛЕК КАРТАСЫ · SOVG\'A KARTASI';

  @override
  String get walletGiftCardKorzinka => 'Korzinka белек картасы';

  @override
  String get walletReceived => 'Алынды';

  @override
  String get walletCode => 'Код';

  @override
  String get walletShowQr => 'Көрсөтүү';

  @override
  String get walletStatusLabel => 'Абал';

  @override
  String get walletWhere => 'Кайда';

  @override
  String get walletStatusArchived => 'Архивде';

  @override
  String get walletAwaitingTitle => 'Берилишин күтүүдө';

  @override
  String walletQuestDoneOn(String date) {
    return 'Квест аткарылды · $date';
  }

  @override
  String walletPcs(int n) {
    return '$n даана';
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
      'Ваучерлер текшерүүдөн кийин кол менен берилет — адатта бир нече күндүн ичинде';

  @override
  String walletShowAll(int n) {
    return 'Баарын көрсөтүү ($n)';
  }

  @override
  String get walletExchangeTitle => 'IQC алмаштыруу';

  @override
  String get walletShopTitle => 'IQC алмашуу';

  @override
  String walletProgressOf(String have, String need) {
    return '$have / $need IQC';
  }

  @override
  String walletMore(String n) {
    return 'Дагы $n';
  }

  @override
  String get walletSaveUp => 'Алмаштыруу үчүн IQC чогултуңуз';

  @override
  String walletExchangeFor(String amount) {
    return '$amount IQC үчүн алмаштыруу';
  }

  @override
  String walletOpenVoucher(String sum) {
    return '$sum ваучерин ачуу';
  }

  @override
  String get walletClose => 'Жабуу';

  @override
  String get walletVoucherDialog => 'Korzinka ваучери';

  @override
  String get walletArchiveUsed => 'Архивге — ваучер колдонулду';

  @override
  String walletArchivedToast(String code) {
    return '••$code ваучери архивде';
  }

  @override
  String get walletUndo => 'Жокко чыгаруу';

  @override
  String get walletBack => 'Артка';

  @override
  String get walletBackToWallet => 'Капчыкка кайтуу';

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
  String get walletRestore => 'Кайтаруу';

  @override
  String walletRestoreA11y(String code) {
    return '••$code ваучерин кайтаруу';
  }

  @override
  String get walletRestoreHint =>
      'Ваучерди жаңылыштык менен алып салсаңыз, «Кайтаруу» басыңыз — ал кайрадан капчыкта пайда болот';

  @override
  String get walletArchiveEmptyTitle => 'Архив бош';

  @override
  String get walletArchiveEmptyText =>
      'Ваучерди колдондуңузбу? Аны бул жакка алып коюңуз — капчыкта жарактуулары гана калат';

  @override
  String walletReceivedMeta(String date, String code) {
    return 'Алынды $date · код ••$code';
  }

  @override
  String get walletHistoryAll => 'Баары';

  @override
  String get walletHistoryEarned => 'Эсептөөлөр';

  @override
  String get walletHistorySpent => 'Эсептен чыгаруу';

  @override
  String get walletEarnedMonth => 'Ушул айда эсептелди';

  @override
  String get walletSpentMonth => 'Ушул айда сарпталды';

  @override
  String get walletMonths =>
      'Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,Сентябрь,Октябрь,Ноябрь,Декабрь';

  @override
  String get walletAccrued => 'эсептелди';

  @override
  String get walletDebited => 'кармалды';

  @override
  String get walletTxnCheck => 'Чек';

  @override
  String get walletTxnRecipe => 'Бланк';

  @override
  String get walletTxnSurvey => 'Сурамжылоо';

  @override
  String get walletTxnQuest => 'Квест аткарылды';

  @override
  String get walletTxnCourse => 'Курс бүттү';

  @override
  String get walletTxnRedeem => 'Ваучерге алмаштыруу';

  @override
  String get walletTxnReversal => 'Кайтаруу';

  @override
  String get walletTxnAdjust => 'Оңдоо';

  @override
  String get walletTxnOther => 'Эсептөө';

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
      other: '$n ваучер берилишин күтүүдө',
      one: '$n ваучер берилишин күтүүдө',
    );
    return '$_temp0';
  }

  @override
  String get walletStepDone => 'Квест аткарылды';

  @override
  String get walletStepReview => 'Текшерүү';

  @override
  String get walletStepIssue => 'Берүү';

  @override
  String get walletQueueHint =>
      'Ваучерлер текшерүүдөн кийин кол менен берилет — адатта бир нече күндүн ичинде. Ваучер капчыкта пайда болгондо билдирме жөнөтөбүз';

  @override
  String get walletQueueEmptyTitle => 'Кезек бош';

  @override
  String get walletQueueEmptyText =>
      'Ваучер сыйлыгы бар квестти аткарыңыз — ал берилгенге чейин ушул жерде көрүнөт';

  @override
  String get walletYourBalance => 'Сиздин балансыңыз';

  @override
  String walletEnoughFor(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ваучерге жетет',
      one: '$n ваучерге жетет',
      zero: 'Азырынча ваучерге жетпейт',
    );
    return '$_temp0';
  }

  @override
  String get walletShopNote =>
      'Ваучер алмашуу тастыкталгандан кийин капчыкта пайда болот';

  @override
  String walletConfirmTitle(String amount) {
    return '$amount IQC алмаштырылсынбы?';
  }

  @override
  String walletConfirmText(String sum) {
    return '$sum суммасына Korzinka белек картасын алыңыз';
  }

  @override
  String get walletWillDebit => 'Кармалат';

  @override
  String get walletWillRemain => 'Калат';

  @override
  String get walletWhereTo => 'Кайда келет';

  @override
  String get walletToWallet => 'Капчыкка';

  @override
  String get walletExchange => 'Алмаштыруу';

  @override
  String get walletExchangeFailed => 'IQC алмаштыруу мүмкүн болгон жок';

  @override
  String get walletShare => 'Ваучер менен бөлүшүү';

  @override
  String get walletCopyCode => 'Кодду көчүрүү';

  @override
  String get walletQrLabel => 'Ваучердин QR-коду';

  @override
  String get walletShowQrCashier =>
      'QR-кодду кассирге көрсөтүңүз же кодду айтыңыз';

  @override
  String get walletStores => 'Korzinka дүкөндөрү';

  @override
  String get walletToArchive => 'Архивге';

  @override
  String get walletToArchiveHint =>
      'Ваучерди колдондуңузбу? Аны архивге алып коюңуз — ал тарыхта калат';

  @override
  String get walletRestoreFromArchive => 'Архивден кайтаруу';

  @override
  String get learnSubtitle => 'Курстардан өтүп, IQC алыңыз';

  @override
  String get learnSearchA11y => 'Курстарды издөө';

  @override
  String get learnSearchPlaceholder => 'Курстун же бренддин аталышы';

  @override
  String get learnSearchClear => 'Тазалоо';

  @override
  String get learnSegNew => 'Жаңы';

  @override
  String get learnSegProgress => 'Өтүүдө';

  @override
  String get learnSegDone => 'Өтүлгөндөр';

  @override
  String learnTileVideo(int n) {
    return '$n видеосабак';
  }

  @override
  String learnTileQuiz(int n) {
    return '$n тест';
  }

  @override
  String get learnTileReward => 'Сыйлык';

  @override
  String learnMinutesShort(int n) {
    return '~$n мүн';
  }

  @override
  String get learnQuizStatusLocked => 'Жабык';

  @override
  String get learnQuizStatusOpen => 'Жеткиликтүү';

  @override
  String learnIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get learnCtaStart => 'Курсту баштоо';

  @override
  String get learnCtaContinue => 'Улантуу';

  @override
  String get learnCtaRepeat => 'Кайра өтүү';

  @override
  String learnProgressLabel(int pct) {
    return '$pct% өтүлдү';
  }

  @override
  String get learnEmptyTitle => 'Азырынча курстар жок';

  @override
  String get learnEmptyText =>
      'Дарыканаңыз үчүн курстар азырынча кошула элек. Жаңы курс пайда болору менен билдирүү жөнөтөбүз';

  @override
  String get learnEnableNotifications => 'Билдирүүлөрдү күйгүзүү';

  @override
  String get learnNoResultsTitle => 'Эч нерсе табылган жок';

  @override
  String learnNoResultsInTab(String query, String tab) {
    return '«$tab» өтмөгүндө «$query» суроосу боюнча курстар жок. Жазылышын текшериңиз же бардык курстардан издеңиз';
  }

  @override
  String learnNoResultsAll(String query) {
    return '«$query» суроосу боюнча курстар жок. Жазылышын текшериңиз же башка аталышты колдонуп көрүңүз';
  }

  @override
  String get learnSearchEverywhere => 'Бардык курстардан издөө';

  @override
  String get learnTabEmptyTitle => 'Бул жерде азырынча бош';

  @override
  String get learnTabEmptyNew =>
      'Бардык курстар башталган — окууну «Өтүүдө» өтмөгүндө улантыңыз';

  @override
  String get learnTabEmptyProgress =>
      '«Жаңы» өтмөгүнөн каалаган курсту баштаңыз — ал ушул жерде пайда болот';

  @override
  String get learnTabEmptyDone =>
      'Өтүлгөн курстар тесттен ийгиликтүү өткөндөн кийин ушул жерде пайда болот';

  @override
  String get learnBack => 'Артка';

  @override
  String get learnCourseTitle => 'Курс';

  @override
  String learnMetaVideos(int n) {
    return '$n видеосабак';
  }

  @override
  String learnMetaMinutes(int n) {
    return '~$n мүнөт';
  }

  @override
  String get learnProgram => 'Курстун программасы';

  @override
  String get learnRowVideo => 'Видеосабак';

  @override
  String get learnRowQuiz => 'Тест';

  @override
  String get learnRowQuizLocked => 'Видеодон кийин ачылат';

  @override
  String get learnRowRewardPending => 'Тесттен кийин эсептейбиз';

  @override
  String get learnRowRewardDone => 'Эсептелди';

  @override
  String learnLessonOf(int i, int n) {
    return '$n сабактын $i-си';
  }

  @override
  String get learnLessonTabText => 'Сабактын тексти';

  @override
  String get learnLessonTabMaterials => 'Материалдар';

  @override
  String get learnWatchVideo => 'Видеону көрүү';

  @override
  String get learnVideoUnavailable => 'Видео жеткиликсиз';

  @override
  String get learnLessonHintLocked =>
      'Видеону аягына чейин көрүңүз — андан кийин тест ачылат';

  @override
  String get learnLessonHintFinish =>
      'Видеону көрдүңүзбү? Андан ары өтүү үчүн сабакты аяктаңыз';

  @override
  String get learnStartTest => 'Тестти баштоо';

  @override
  String get learnNextLesson => 'Кийинки сабак';

  @override
  String get learnFinishLesson => 'Сабакты аяктоо';

  @override
  String get learnFinishingLesson => 'Сакталууда…';

  @override
  String get learnBackToCourse => 'Курска';

  @override
  String learnTestTopBar(String name) {
    return 'Тест · $name';
  }

  @override
  String learnQuestionOf(String i, int n) {
    return '$n суроонун $i-си';
  }

  @override
  String get learnNext => 'Кийинки';

  @override
  String get learnFinishTest => 'Тестти аяктоо';

  @override
  String get learnSubmitting => 'Текшерилүүдө…';

  @override
  String get learnCoursePassed => 'Курс өтүлдү!';

  @override
  String get learnTestPassed => 'Тест тапшырылды!';

  @override
  String get learnPassedText => 'Мыкты иш. Упайлар балансыңызга түштү.';

  @override
  String get learnPassedTextNoReward => 'Мыкты иш!';

  @override
  String learnScoreOf(int score, int total) {
    return '$totalдөн $score';
  }

  @override
  String get learnCorrectAnswers => 'туура жооп';

  @override
  String get learnOpenWallet => 'Капчыкты ачуу';

  @override
  String get learnToOtherCourses => 'Башка курстарга';

  @override
  String get learnContinueCourse => 'Курсту улантуу';

  @override
  String get learnFailedTitle => 'Аз эле калды';

  @override
  String get learnFailedText =>
      'Туура жооптор жетишсиз. Сабакты кайра карап, дагы аракет кылыңыз — упайлар сизди күтүүдө.';

  @override
  String learnRewardStillAvailable(int n) {
    return '+$n IQC дагы эле жеткиликтүү';
  }

  @override
  String get learnCanRetry => 'Тестти кайра тапшырууга болот';

  @override
  String get learnRewatchLesson => 'Сабакты кайра көрүү';

  @override
  String get learnRetryTest => 'Тестти кайра тапшыруу';

  @override
  String rxHomeGreeting(String name) {
    return 'Салам, $name!';
  }

  @override
  String get rxHomeSubtitle => 'Бланктарды жөнөтүп, сыйлыктарды алыңыз';

  @override
  String get rxHomeBellLabel => 'Билдирмелер';

  @override
  String get rxHomeBellUnread => 'Билдирмелер, жаңылары бар';

  @override
  String rxHomeStatQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'активдүү квест',
    );
    return '$_temp0';
  }

  @override
  String get rxHomeStatApproved => 'жактырылган бланк';

  @override
  String get rxHomeStatPending => 'текшерүүдө';

  @override
  String get rxHomeRecent => 'Акыркы бланктар';

  @override
  String get rxHomeAllRecipes => 'Бардык бланктар';

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
    return 'Дагы $n';
  }

  @override
  String rxQuestDone(int pct) {
    return 'Аткарылды $pct%';
  }

  @override
  String rxRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get rxRewardVoucher => 'Ваучер';

  @override
  String get rxWaitValue => '~24 саат';

  @override
  String get rxWaitCaption => 'күтүү';

  @override
  String get rxSoon => 'Жакында';

  @override
  String get rxSoonCaption => 'эсептөө';

  @override
  String get rxRetake => 'Кайра тартуу';

  @override
  String get rxRetakeRecipe => 'Бланкты кайра тартуу';

  @override
  String rxMeta(String date, int n) {
    return '$date · $n сүрөт';
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
  String get rxTabPending => 'Текшерүүдө';

  @override
  String get rxTabDone => 'Аяктаган';

  @override
  String get rxFilterEmpty => 'Бул бөлүмдө азырынча бланктар жок';

  @override
  String get rxPendingHint => '24 саатка чейин текшеребиз';

  @override
  String get rxRejectedDefault => 'Бланк текшерүүдөн өткөн жок';

  @override
  String get rxEmptyTitle => 'Бланктарыңыз ушул жерде пайда болот';

  @override
  String get rxEmptyText =>
      'Жазылган бланкты сүрөткө тартыңыз — AI дарыларды тааныйт, текшерүүдөн кийин IQC аласыз';

  @override
  String get rxHowTo => 'Кантип сүрөткө тартуу керек';

  @override
  String get rxTipWholeTitle => 'Бланк толугу менен';

  @override
  String get rxTipWholeText => 'Барактын бардык четтери кадрда';

  @override
  String get rxTipStampTitle => 'Мөөр жана кол';

  @override
  String get rxTipStampText => 'Аларсыз бланк кабыл алынбайт';

  @override
  String get rxTipLightTitle => 'Жакшы жарык';

  @override
  String get rxTipLightText => 'Жаркылдабай жана телефондун көлөкөсүз';

  @override
  String get rxSendFirst => 'Биринчи бланкты жөнөтүү';

  @override
  String get rxStatePendingTitle => 'Бланк текшерүүдө';

  @override
  String get rxStatePendingText =>
      'Адис бланкты текшерип жатат. Адатта бул 24 саатка чейин созулат';

  @override
  String get rxStateApprovedTitle => 'Бланк жактырылды';

  @override
  String get rxStateApprovedText =>
      'Баары жайында. IQC жакын арада баланска түшөт';

  @override
  String get rxStateRejectedTitle => 'Бланк четке кагылды';

  @override
  String get rxStateRejectedHint =>
      'Бланкты жакшы жарыкта толугу менен сүрөткө тартыңыз — упайларды дагы эле алууга болот';

  @override
  String get rxStepSent => 'Жөнөтүлдү';

  @override
  String get rxStepReview => 'Текшерүү';

  @override
  String get rxStepApproved => 'Жактырылды';

  @override
  String get rxStepCredited => 'Эсептелди';

  @override
  String get rxStepRejected => 'Четке кагылды';

  @override
  String get rxPhotos => 'Бланктын сүрөтү';

  @override
  String rxOpenPhoto(int n) {
    return 'Бланктын $n-сүрөтүн ачуу';
  }

  @override
  String get rxAiLater => 'Дарылардын тизмеси текшерүүдөн кийин пайда болот';

  @override
  String get rxAccrual => 'Эсептөө';

  @override
  String get rxAccrualPendingTitle => 'Жактырылгандан кийин эсептейбиз';

  @override
  String get rxAccrualPendingText => 'Бланк жактырылгандан кийин';

  @override
  String get rxAccrualApprovedTitle => 'Эсептөөнү күтүүдө';

  @override
  String get rxQuests => 'Квесттерге эсептөө';

  @override
  String get rxQuestsPending => 'Бланк жактырылгандан кийин пайда болот';

  @override
  String get rxQuestsNone => 'Азырынча бир да квестке эсептелген жок';

  @override
  String get rxData => 'Бланктын маалыматтары';

  @override
  String get rxShowText => 'Таанылган текстти көрсөтүү';

  @override
  String get rxSupport => 'Бланк боюнча суроо барбы? Бизге жазыңыз';

  @override
  String get rxCameraClose => 'Жабуу';

  @override
  String get rxCameraLabel => 'Бланк';

  @override
  String get rxCameraTip => 'Мөөр жана кол көрүнүп турушу керек';

  @override
  String get rxCameraHold => 'Телефонду бланктын үстүндө түз кармаңыз';

  @override
  String get rxCameraShoot => 'Сүрөткө тартуу';

  @override
  String get rxCameraDenied =>
      'Камерага уруксат жок. Аны жөндөөлөрдөн уруксат бериңиз';

  @override
  String get rxOcrTitle => 'Таанылган текст';

  @override
  String get rxOcrSubtitle => 'AI бланктын сүрөтүн ушундай окуду';

  @override
  String get rxOcrNote =>
      'Бейтаптын аты-жөнү жашырылган. Текст автоматтык түрдө таанылды — каталар болушу мүмкүн';

  @override
  String get rxOcrEmpty => 'Текст азырынча таанылган жок';

  @override
  String get rxOcrEmptyText =>
      'Ал сүрөт иштетилгенден кийин ушул жерде пайда болот';

  @override
  String get rxCopy => 'Көчүрүү';

  @override
  String get rxCopied => 'Текст көчүрүлдү';

  @override
  String get rxReportError => 'Тексттеги ката';

  @override
  String get rxBack => 'Артка';

  @override
  String get homeBellUnread => 'Билдирмелер, жаңылары бар';

  @override
  String homeStatActiveQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'активдүү квест',
      one: 'активдүү квест',
    );
    return '$_temp0';
  }

  @override
  String get homeStatApproved => 'жактырылган чек';

  @override
  String get homeStatPending => 'текшерүүдө';

  @override
  String homeQuestSales(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal сатуунун $done',
      one: '$goal сатуунун $done',
    );
    return '$_temp0';
  }

  @override
  String homeQuestLeft(int n) {
    return 'Дагы $n';
  }

  @override
  String get homeQuestDone => 'Аткарылды';

  @override
  String homeRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String homeCheckMeta(int id, String date) {
    return '№$id · $date';
  }

  @override
  String get homeCheckWait => '~24 саат';

  @override
  String get homeCheckWaitCaption => 'күтүү';

  @override
  String get homeCheckRetake => 'Кайра тартуу';

  @override
  String get homeMiniAppsSub => 'Сапёр жана башка акциялар';

  @override
  String get homeNewTitle => 'Кош келиңиз!';

  @override
  String get homeNewSubtitle => 'Үч кадам — жана сиз программадасыз';

  @override
  String get homeNewStepsLabel => 'Алгачкы кадамдар';

  @override
  String homeNewStepsCount(int done, int total) {
    return '$total ичинен $done';
  }

  @override
  String get homeNewHeadline => 'Биринчи чекти жөнөтүп, IQC алыңыз';

  @override
  String get homeNewStepRegister => 'Катталуу';

  @override
  String get homeNewStepDone => 'Даяр';

  @override
  String get homeNewStepCheck => 'Биринчи чекти жөнөтүңүз';

  @override
  String get homeNewStepCheckSub => 'Дарыкана чегин сүрөткө тартыңыз';

  @override
  String get homeNewStepCourse => 'Биринчи курстан өтүңүз';

  @override
  String homeNewStepCourseReward(int iqc, String title) {
    return '«$title» үчүн +$iqc IQC';
  }

  @override
  String homeNewStepCourseSub(String title) {
    return '«$title» курсу';
  }

  @override
  String get homeNewStepCourseAny => 'Курстар — «Окуу» бөлүмүндө';

  @override
  String get homeNewSendFirst => 'Биринчи чекти жөнөтүү';

  @override
  String get homeNewCourseSection => 'Курстан баштаңыз';

  @override
  String get homeNewAllCourses => 'Бардык курстар';

  @override
  String homeNewCourseLessons(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n сабак',
      one: '$n сабак',
    );
    return '$_temp0';
  }

  @override
  String homeNewCourseMinutes(int n) {
    return '~$n мүн';
  }

  @override
  String get homeNewQuestSection => 'Баштоо үчүн квест';

  @override
  String homeNewQuestGoal(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n таңгак сатыңыз',
      one: '$n таңгак сатыңыз',
    );
    return '$_temp0';
  }

  @override
  String get homeNewQuestIqc => 'IQC баланска';

  @override
  String get homeNewQuestVoucher => 'аткаргандыгы үчүн ваучер';

  @override
  String get homeNewHint =>
      'Баланс, ваучерлер жана мини-тиркемелер алгачкы IQCден кийин пайда болот';

  @override
  String get newsBack => 'Артка';

  @override
  String get newsBackToList => 'Жаңылыктарга кайтуу';

  @override
  String newsReadTime(int n) {
    return '$n мүн окуу';
  }

  @override
  String get newsEmptyText =>
      'Бул жерде программанын жаңылыктары жана пайдалуу материалдар пайда болот';

  @override
  String get surveyYourAnswer => 'Сиздин жообуңуз';

  @override
  String surveySubmitReward(int n) {
    return 'Жооп берип, $n IQC алуу';
  }

  @override
  String get surveyWriteHint => 'Жөнөтүү үчүн жооп жазыңыз';

  @override
  String get surveyRatingLabel => 'Баа';

  @override
  String surveyRatingOf(int n, int max) {
    return '$max ичинен $n';
  }

  @override
  String get surveyRatingWords => 'Начар,Анчейин,Орточо,Жакшы,Эң сонун';

  @override
  String surveyReward(int n) {
    return '+$n IQC';
  }

  @override
  String get surveyOnBalance => 'балансыңызда';

  @override
  String get surveySendFailed =>
      'Жоопту жөнөтүү мүмкүн болгон жок. Кайра аракет кылыңыз';

  @override
  String medrepHelloName(String name) {
    return 'Салам, $name!';
  }

  @override
  String get medrepAttrShared => 'жалпы атрибуция';

  @override
  String get medrepAttrPrimary => 'баштапкы атрибуция';

  @override
  String get medrepPeriodAll => 'Бардык убакыт';

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
      other: 'таңгак',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuestsDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'квест аткарылды',
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
      other: 'дарыкана',
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
      other: 'чек бардык убакытта',
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
      other: '$n таңгак',
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
      other: '$n тармак',
    );
    return '$_temp0';
  }

  @override
  String medrepPharmaciesInPortfolio(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'портфелде $n дарыкана',
    );
    return '$_temp0';
  }

  @override
  String get medrepRatingByChecks => 'Чектер боюнча рейтинг';

  @override
  String get medrepRatingAll => 'Толук рейтинг';

  @override
  String medrepPlace(int n) {
    return '$n-орун';
  }

  @override
  String medrepOutOf(int n) {
    return '$n ичинен';
  }

  @override
  String medrepGapTo(int place) {
    return '$place-орунга чейин дагы';
  }

  @override
  String get medrepLeader => 'Сиз рейтингдин лидерисиз';

  @override
  String get medrepMostActive => 'Эң активдүүлөр';

  @override
  String medrepAllN(int n) {
    return 'Баары $n';
  }

  @override
  String get medrepInviteTitle => 'Провизорду чакыруу';

  @override
  String get medrepInviteText =>
      'Шилтемени жөнөтүңүз — катталгандан кийин провизор портфелиңизге түшөт';

  @override
  String get medrepCopyLink => 'Шилтемени көчүрүү';

  @override
  String get medrepPendingSub => 'Шилтеме аркылуу өткөн провизорлор';

  @override
  String get medrepCompaniesSub => 'Портфелдеги дарыкана тармактары';

  @override
  String get medrepDoctorsSub => 'Бланк квести боюнча прогресс';

  @override
  String get medrepEmptyTitle => 'Портфель азырынча бош';

  @override
  String get medrepEmptyText =>
      'Провизорлорду шилтеме аркылуу чакырыңыз — алардын чектери жана статистикасы ушул жерде пайда болот';

  @override
  String get medrepStep1Title => 'Шилтемени жөнөтүңүз';

  @override
  String get medrepStep1Text => 'Telegram же SMS аркылуу';

  @override
  String get medrepStep2Title => 'Провизор катталат';

  @override
  String get medrepStep2Text => 'Ал дароо портфелиңизге түшөт';

  @override
  String get medrepStep3Title => 'Чектерди көзөмөлдөңүз';

  @override
  String get medrepStep3Text => 'Статистика ушул жерде пайда болот';

  @override
  String get medrepUpdatedNow => 'Азыр жаңыртылды';

  @override
  String get medrepSearchHint => 'Аты, дарыкана же шаар';

  @override
  String get medrepFilterAll => 'Баары';

  @override
  String get medrepFilterActive => 'Активдүүлөр';

  @override
  String get medrepFilterPassive => 'Пассивдүүлөр';

  @override
  String get medrepFilterFinished => 'Аяктагандар';

  @override
  String get medrepFilterApproved => 'Жактырылган';

  @override
  String get medrepFilterRejected => 'Четке кагылган';

  @override
  String get medrepClear => 'Тазалоо';

  @override
  String get medrepNotFoundTitle => 'Эч ким табылган жок';

  @override
  String medrepNotFoundText(String query) {
    return '«$query» сурамы боюнча провизорлор жок. Жазылышын текшериңиз же дарыкананын аталышы боюнча издеңиз';
  }

  @override
  String medrepNotFoundShort(String query) {
    return '«$query» сурамы боюнча эч нерсе жок. Жазылышын текшериңиз';
  }

  @override
  String get medrepResetSearch => 'Издөөнү тазалоо';

  @override
  String get medrepChecksAllTime => 'Бардык убакыттагы чектер';

  @override
  String get medrepLastActivity => 'активдүүлүк';

  @override
  String get medrepAllChecks => 'Бардык чектер';

  @override
  String medrepCheckNo(int id) {
    return 'Чек №$id';
  }

  @override
  String medrepPacksShort(int n) {
    return '$n таң.';
  }

  @override
  String get medrepPacksUnit => 'таң.';

  @override
  String get medrepLast7Days => 'Акыркы 7 күн';

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
  String get medrepTabChecks => 'Чектер';

  @override
  String get medrepTabPharm => 'Фармацевттер';

  @override
  String get medrepTabQuests => 'Квесттер';

  @override
  String medrepYouName(String name) {
    return 'Сиз · $name';
  }

  @override
  String get medrepYouShort => 'СИЗ';

  @override
  String medrepGapText(int place, String value) {
    return '$place-орунга чейин дагы $value';
  }

  @override
  String get medrepNotRankedTitle => 'Сиз азырынча рейтингде жоксуз';

  @override
  String get medrepNotRankedText =>
      'Орун провизорлоруңуздун чектери боюнча эсептелет. Биринчисин чакырыңыз — ошондо тизмеде пайда болосуз';

  @override
  String get medrepRatingEmpty => 'Рейтинг азырынча бош';

  @override
  String get medrepQuestsSub => 'Провизорлоруңуздун прогресси';

  @override
  String get medrepQuestRunning => 'Жүрүүдө';

  @override
  String medrepQuestRunningUntil(String date) {
    return 'Жүрүүдө · $date чейин';
  }

  @override
  String get medrepQuestFinished => 'Аяктады';

  @override
  String medrepQuestFinishedOn(String date) {
    return '$date аяктады';
  }

  @override
  String medrepOfN(int a, int b) {
    return '$b ичинен $a';
  }

  @override
  String get medrepParticipating => 'провизор катышууда';

  @override
  String medrepSoldOf(int n) {
    return '$n ичинен сатылды';
  }

  @override
  String medrepOfPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n таңгактын ичинен',
    );
    return '$_temp0';
  }

  @override
  String medrepGoalPercent(int p) {
    return 'максаттын $p%';
  }

  @override
  String medrepPacksLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n таңгак калды',
    );
    return '$_temp0';
  }

  @override
  String get medrepGoalDone => 'Максат аткарылды';

  @override
  String get medrepStatParticipating => 'катышууда';

  @override
  String get medrepStatCompleted => 'аткарды';

  @override
  String get medrepStatIdle => 'баштай элек';

  @override
  String get medrepPharmacistsSection => 'Провизорлор';

  @override
  String medrepDoneOf(int a, int b) {
    return 'Аткарды · $b ичинен $a';
  }

  @override
  String medrepMoreRows(int n, int packs) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Дагы $n провизор · $packs таң.',
    );
    return '$_temp0';
  }

  @override
  String get medrepShow => 'Көрсөтүү';

  @override
  String get medrepHide => 'Жыйноо';

  @override
  String get medrepPendingText =>
      'Шилтемеңиз аркылуу өтүп, аларды портфелге кошушуңузду күтүүдө';

  @override
  String medrepFollowedLink(String ago) {
    return 'Шилтеме аркылуу өттү · $ago';
  }

  @override
  String get medrepAgoNow => 'жаңы эле';

  @override
  String medrepAgoMinutes(int n) {
    return '$n мүн мурун';
  }

  @override
  String medrepAgoHours(int n) {
    return '$n саат мурун';
  }

  @override
  String get medrepAgoYesterday => 'кечээ';

  @override
  String medrepAgoDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n күн мурун',
    );
    return '$_temp0';
  }

  @override
  String get medrepChainsTitle => 'Дарыкана тармактары';

  @override
  String get medrepChainSearchHint => 'Тармактын аталышы';

  @override
  String medrepChainMeta(String city, int a, int p) {
    return '$city · $a дар. · $p пров.';
  }

  @override
  String get medrepChainKind => 'дарыкана тармагы';

  @override
  String get medrepPharmaciesSection => 'Дарыканалар';

  @override
  String get medrepMakers => 'Өндүрүүчү компаниялар';

  @override
  String medrepRewardTitle(String name) {
    return 'Сыйлоо: $name';
  }

  @override
  String get medrepRewardRating => 'Баа';

  @override
  String get medrepRewardMessage => 'Билдирүү';

  @override
  String get medrepOptional => '· милдеттүү эмес';

  @override
  String get medrepRewardHint => 'Мисалы: мыкты сатуулар үчүн рахмат!';

  @override
  String get medrepRewardNotice => 'Провизор билдирүүңүз менен эскертме алат';

  @override
  String medrepRewardSend(int n) {
    return '$n баасын жөнөтүү';
  }

  @override
  String medrepRewardStars(int n) {
    return '5тен $n баа';
  }

  @override
  String authVersion(String version) {
    return 'версия $version';
  }

  @override
  String get authLoading => 'Жүктөлүүдө';

  @override
  String get authWelcomeTitle => 'PharmIQ\'го кош келиңиз';

  @override
  String get authWelcomeSubtitle =>
      'Фармацевттер жана дарыгерлер үчүн окутуу, квесттер жана сыйлыктар — бир тиркемеде';

  @override
  String get authAppLanguage => 'Тиркеменин тили';

  @override
  String get authStart => 'Баштоо';

  @override
  String get authHaveAccount => 'Аккаунтуңуз барбы?';

  @override
  String authLanguageLabel(String language) {
    return 'Тил: $language';
  }

  @override
  String get authLoginSubtitle =>
      'Фармацевттер жана дарыгерлер үчүн окутуу жана сыйлыктар';

  @override
  String get authSmsHint => 'Кодду SMS аркылуу жөнөтөбүз';

  @override
  String get authPhoneNotRegistered =>
      'Бул номер катталган эмес. Аккаунт түзүңүз — бир мүнөт гана кетет';

  @override
  String get authOtherNumber => 'Башка номер киргизүү';

  @override
  String authCodeSentTo(String phone) {
    return '$phone номерине жөнөттүк';
  }

  @override
  String get authChange => 'Өзгөртүү';

  @override
  String get authCodeGroup => '6 сандан турган код';

  @override
  String get authCodeAuto =>
      'Кодду киргизээриңиз менен автоматтык түрдө киребиз';

  @override
  String authResendIn(String time) {
    return '$time кийин кайра жөнөтүү';
  }

  @override
  String get authRoleSubtitle =>
      'Сизде бир нече роль бар — кайсынысы менен кирерин тандаңыз';

  @override
  String get authRoleSubDoctor => 'Бланктар, квесттер, окутуу жана капчык';

  @override
  String get authRoleHint => 'Ролду каалаган убакта профилде алмаштырса болот';

  @override
  String get authRegWhoTitle => 'Сиз кимсиз?';

  @override
  String get authRegWhoSubtitle =>
      'Кесибиңизге ылайык квесттерди жана курстарды көрсөтөбүз';

  @override
  String get authRegPharmacistSub => 'Провизор, дарыкана кызматкери';

  @override
  String get authRegDoctorSub => 'Саламаттык сактоо адиси';

  @override
  String get authContinue => 'Улантуу';

  @override
  String get authBack => 'Артка';

  @override
  String authChooseField(String label) {
    return 'Тандаңыз: $label';
  }

  @override
  String authMultiHint(int n) {
    return 'Бир нечесин тандаса болот · тандалды: $n';
  }

  @override
  String get authMultiHintEmpty => 'Бир нечесин тандаса болот';

  @override
  String get authConsent => 'Жеке маалыматтарымды иштетүүгө макулмун — ';

  @override
  String get authFillRequired =>
      'Жылдызчасы бар талааларды толтуруп, макулдук бериңиз';

  @override
  String authRegWelcome(String name) {
    return 'PharmIQ\'го кош келиңиз, $name!';
  }

  @override
  String get authGoHome => 'Башкы бетке';

  @override
  String get authCityTitle => 'Шаар';

  @override
  String get authCitySearch => 'Шаарды табуу';

  @override
  String get authSearch => 'Издөө';

  @override
  String get authNothingFound => 'Эч нерсе табылган жок';

  @override
  String get authMapTitle => 'Картадагы дарыкана';

  @override
  String get authMapStubTitle => 'Карта жакында пайда болот';

  @override
  String get authMapStubBody =>
      'Азырынча дарыкананын аталышын «Дарыкана / иш орду» талаасына жазыңыз — аны картада белгилөө кийинки жаңыртууда пайда болот';

  @override
  String get authUpdateTitle => 'Тиркемени жаңыртуу керек';

  @override
  String get authUpdateBody =>
      'Бул версия мындан ары колдоого алынбайт. Улантуу үчүн PharmIQ\'ну жаңыртыңыз — баланс жана прогресс сакталат';

  @override
  String get authUpdateButton => 'Тиркемени жаңыртуу';

  @override
  String authUpdateVersions(String current, String required) {
    return 'Сиздин версияңыз $current · $required же жаңыраагы керек';
  }

  @override
  String authUpdateRequired(String required) {
    return '$required же жаңыраак версия керек';
  }

  @override
  String get authPushTitle => 'Эсептөөлөрдү өткөрүп жибербеңиз';

  @override
  String get authPushBody =>
      'Чек текшерилгенде, IQC баланска түшкөндө же жаңы квест пайда болгондо кабарлайбыз';

  @override
  String get authPushNow => 'азыр';

  @override
  String get authPushSample1Title => '+144 IQC эсептелди';

  @override
  String get authPushSample1Body => 'Чек №23156 · Цинкорот №50';

  @override
  String get authPushSample2Time => '2 саат мурун';

  @override
  String get authPushSample2Title => 'Жаңы квест';

  @override
  String get authPushSample2Body => 'Доритрицин N10 · Korzinka ваучери';

  @override
  String get authPushEnable => 'Билдирүүлөрдү күйгүзүү';

  @override
  String get authPushLater => 'Азыр эмес';

  @override
  String checksSentCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n чек жөнөтүлдү',
      one: '$n чек жөнөтүлдү',
    );
    return '$_temp0';
  }

  @override
  String get checksSectionRetake => 'Кайра тартуу керек';

  @override
  String get checksSectionHistory => 'Тарых';

  @override
  String get checksRetake => 'Кайра тартуу';

  @override
  String checksRetakeA11y(int id) {
    return '№$id чекти кайра тартуу';
  }

  @override
  String get checksRetakeTipBold => 'Чек биринчи жолу эле кабыл алынышы үчүн:';

  @override
  String get checksRetakeTip =>
      'бүт чек кадрда, түз, жалтырабай жана жакшы жарыкта.';

  @override
  String checksNumberDate(int id, String date) {
    return '№$id · $date';
  }

  @override
  String checksDatePhotos(String date, int n) {
    return '$date · $n сүрөт';
  }

  @override
  String checksPhotoCount(int n) {
    return '$n сүрөт';
  }

  @override
  String get checksWaitValue => '~24 саат';

  @override
  String get checksWaitCaption => 'адатта';

  @override
  String checksShowAll(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Бардык $n чекти көрсөтүү',
      one: 'Бардык $n чекти көрсөтүү',
    );
    return '$_temp0';
  }

  @override
  String get checksSendCheck => 'Чек жөнөтүү';

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
  String get checksUploadingRow => 'Чек жөнөтүлүүдө…';

  @override
  String get checksUploadQueued => 'Жөнөтүүнү күтүүдө';

  @override
  String get checksUploadAuto =>
      'Байланыш пайда болгондо автоматтык түрдө жөнөтөбүз';

  @override
  String get checksEmptyTitle => 'Чектериңиз ушул жерде пайда болот';

  @override
  String get checksEmptyText =>
      'Дарыканадан алган чекти сүрөткө тартыңыз — ЖИ дарыларды таанып, сиз IQC аласыз';

  @override
  String get checksHowToTitle => 'Кантип сүрөткө тартуу керек';

  @override
  String get checksHow1Title => 'Бүт чек кадрда';

  @override
  String get checksHow1Text => 'Төрт бурчу тең көрүнөт';

  @override
  String get checksHow2Title => 'Түз, бүктөлбөгөн';

  @override
  String get checksHow2Text => 'Чекти столго коюңуз';

  @override
  String get checksHow3Title => 'Жакшы жарык';

  @override
  String get checksHow3Text => 'Жалтырабай жана телефондун көлөкөсүз';

  @override
  String get checksSendFirst => 'Биринчи чекти жөнөтүү';

  @override
  String get checksPickSubtitle => 'ЖИ дарыларды сүрөт боюнча тааныйт';

  @override
  String checksPhotosOf(int n, int max) {
    return 'Сүрөт: $n / $max';
  }

  @override
  String get checksClose => 'Жабуу';

  @override
  String get checksTipWhole => 'Бүт чек';

  @override
  String get checksTipFlat => 'Түз';

  @override
  String get checksTipGlare => 'Жалтырабай';

  @override
  String get checksTakePhotoCta => 'Чекти сүрөткө тартуу';

  @override
  String get checksPickGallery => 'Галереядан тандоо';

  @override
  String get checksRemovePhoto => 'Сүрөттү өчүрүү';

  @override
  String get checksAddMore => 'Дагы сүрөт';

  @override
  String get checksAddMoreA11y => 'Дагы сүрөт кошуу';

  @override
  String get checksPhotoWaiting => 'Күтүүдө';

  @override
  String get checksPhotosHint =>
      'Текшериңиз: чектин номери, датасы жана дарылар даана көрүнсүн';

  @override
  String get checksSending => 'Жөнөтүлүүдө…';

  @override
  String get checksSentTitle => 'Чек жөнөтүлдү';

  @override
  String get checksSentText =>
      'Текшерүү адатта 24 саатка чейин созулат. IQC эсептелгенде кабарлайбыз';

  @override
  String get checksDone => 'Даяр';

  @override
  String get checksSendAnother => 'Дагы чек жөнөтүү';

  @override
  String get checksSendFailed =>
      'Сүрөттү сактоо мүмкүн болбоду. Кайра аракет кылыңыз';

  @override
  String get checksCamTitle => 'Камерага уруксат бериңиз';

  @override
  String get checksCamText =>
      'Камера чектерди жана бланктарды сүрөткө тартуу үчүн керек';

  @override
  String get checksCamPoint1 => 'Сиз баскычты басканда гана тартабыз';

  @override
  String get checksCamPoint2 => 'Башка сүрөттөрдү көрбөйбүз жана сактабайбыз';

  @override
  String get checksCamPoint3 =>
      'Уруксатты телефондун жөндөөлөрүнөн өчүрсө болот';

  @override
  String get checksCamAllow => 'Уруксат берүү';

  @override
  String get checksCamLater => 'Азыр эмес';

  @override
  String get checksCamDeniedTitle => 'Камерага уруксат жок';

  @override
  String get checksCamDeniedText =>
      'Камерасыз чекти сүрөткө тартуу мүмкүн эмес. Телефондун жөндөөлөрүнөн уруксатты күйгүзүңүз — бул 10 секунд алат';

  @override
  String get checksCamDeniedStep1 => '«Жөндөөлөр» → PharmIQ ачыңыз';

  @override
  String get checksCamDeniedStep2 => '«Камера» которгучун күйгүзүңүз';

  @override
  String get checksCamDeniedStep3 => 'Колдонмого кайтыңыз';

  @override
  String get checksCamOpenSettings => 'Жөндөөлөрдү ачуу';

  @override
  String get checksCamPickGallery => 'Галереядан сүрөт тандоо';

  @override
  String get checksCamSettingsManual =>
      'Телефондун жөндөөлөрү → Колдонмолор → PharmIQ → Уруксаттар бөлүмүн ачыңыз';

  @override
  String get checksHeroPendingTitle => 'Чек текшерүүдө';

  @override
  String get checksHeroPendingText =>
      'Адис чекти текшерип жатат. Адатта бул 24 саатка чейин созулат';

  @override
  String get checksHeroApprovedTitle => 'Чек жактырылды';

  @override
  String get checksHeroApprovedText =>
      'Баары жайында. IQC жакын арада балансқа түшөт';

  @override
  String get checksHeroCreditedTitle => 'IQC эсептелди';

  @override
  String get checksHeroCreditedText => 'Упайлар балансыңызга түштү';

  @override
  String get checksHeroRejectedTitle => 'Чек четке кагылды';

  @override
  String get checksHeroRejectedText =>
      'Даана сүрөт тартыңыз — упайларды дагы эле алса болот';

  @override
  String get checksStepSent => 'Жөнөтүлдү';

  @override
  String get checksStepReview => 'Текшерүү';

  @override
  String get checksStepApproved => 'Жактырылды';

  @override
  String get checksStepCredited => 'Эсептелди';

  @override
  String get checksPhotosTitle => 'Чектин сүрөтү';

  @override
  String checksOpenPhoto(int n) {
    return '$n-сүрөттү ачуу';
  }

  @override
  String get checksAiPending =>
      'Дарылардын тизмеси текшерүүдөн кийин пайда болот';

  @override
  String get checksAccrualTitle => 'Эсептөө';

  @override
  String get checksAccrualPendingTitle => 'Жактырылгандан кийин эсептейбиз';

  @override
  String get checksAccrualPendingText => 'Чек жактырылгандан кийин';

  @override
  String get checksAccrualApprovedTitle => 'Эсептелүүнү күтүүдө';

  @override
  String get checksAccrualSoon => 'Жакында';

  @override
  String get checksAccrualCreditedTitle => 'Балансқа түштү';

  @override
  String get checksQuestDone => 'Квест аткарылды ✓';

  @override
  String get checksSupport => 'Чек боюнча суроо барбы? Бизге жазыңыз';

  @override
  String get checksRetakeCheck => 'Чекти кайра тартуу';

  @override
  String checksViewerPhotoOf(int i, int n) {
    return 'Сүрөт $i / $n';
  }

  @override
  String get checksViewerSave => 'Сүрөттү сактоо';

  @override
  String get checksViewerZoomHint => 'Чоңойтуу үчүн манжаларыңызды жайыңыз';

  @override
  String get profileSectionContact => 'Байланыш';

  @override
  String get profilePersonalDataRow => 'Жеке маалыматтар';

  @override
  String get profileTgNotLinked => 'Байланган эмес';

  @override
  String get profileTgLink => 'Байлоо';

  @override
  String get profileTgLinkedToast => 'Telegram байланды';

  @override
  String get profileTgNotYet =>
      'Telegram азырынча байланган жок — боттон аяктаңыз';

  @override
  String get profileAppearanceTitle => 'Жасалгалоо';

  @override
  String get profileNotifOn => 'Күйүк';

  @override
  String get profileNotifOff => 'Өчүк';

  @override
  String get profileDeleteAccount => 'Аккаунтту өчүрүү';

  @override
  String profileVersion(String version) {
    return 'PharmIQ · версия $version';
  }

  @override
  String get profileEditAria => 'Профилди түзөтүү';

  @override
  String get profileNewUser => 'Жаңы колдонуучу';

  @override
  String get profilePharmacy => 'Дарыкана';

  @override
  String get profileClinic => 'Клиника';

  @override
  String get profileCompany => 'Компания';

  @override
  String get profileNoPharmacy => 'Дарыкана көрсөтүлгөн эмес';

  @override
  String get profileNoClinic => 'Клиника көрсөтүлгөн эмес';

  @override
  String get profileNoCompany => 'Компания көрсөтүлгөн эмес';

  @override
  String get profileNotSpecified => 'Көрсөтүлгөн эмес';

  @override
  String get profileNameNotSet => 'Аты көрсөтүлгөн эмес';

  @override
  String get profileActivateTitle => 'Профилди активдештириңиз';

  @override
  String profileActivateProgress(int done, int total) {
    return '$total ичинен $done';
  }

  @override
  String get profileActivateBody =>
      'Активдештирилгенден кийин квесттер жана IQC эсептөө ачылат';

  @override
  String get profileStepPhone => 'Телефон ырасталды';

  @override
  String get profileStepPharmacy => 'Дарыкананы көрсөтүңүз';

  @override
  String get profileStepClinic => 'Клиниканы көрсөтүңүз';

  @override
  String get profileStepProfile => 'Профилди толтуруңуз';

  @override
  String get profileStepWorkHint => 'Аймагыңыздын квесттери үчүн керек';

  @override
  String get profileStepProfileHint => 'Аты жана иш орду';

  @override
  String get profileStepSpecify => 'Көрсөтүү';

  @override
  String get profileStepTelegram => 'Telegram\'ды байлаңыз';

  @override
  String get profileStepTelegramHint => 'Билдирмелерди жөнөтөбүз';

  @override
  String get profileStepAdmin => 'Администратор тарабынан активдештирүү';

  @override
  String get profileStepAdminHint =>
      'Адатта толтургандан кийин бир күндүн ичинде';

  @override
  String get profileActivateHelp =>
      'Активдештирүү боюнча суроолор барбы? Бизге жазыңыз';

  @override
  String get profileRoleSheetTitle => 'Ролду алмаштыруу';

  @override
  String get profileRoleSheetSubtitle => 'Аккаунтуңуз үчүн ырасталган ролдор';

  @override
  String get profileRoleCurrent => 'Учурдагы';

  @override
  String get profileRoleDescPharmacist => 'Чектер, квесттер, окуу жана капчык';

  @override
  String get profileRoleDescDoctor => 'Бланктар, квесттер, окутуу жана капчык';

  @override
  String get profileRoleDescMedrep => 'Провизорлор портфели жана рейтинг';

  @override
  String get profileRoleDescBrand =>
      'Бренд квесттери, продукттар жана сатуулар';

  @override
  String get profileRoleNote =>
      'Колдонмо тандалган ролдун бөлүмдөрү менен ачылат. IQC балансы жана ваучерлер сакталат';

  @override
  String profileRoleSwitch(String role) {
    return '«$role» ролуна которулуу';
  }

  @override
  String get profileClose => 'Жабуу';

  @override
  String get profileFieldName => 'Аты-жөнү';

  @override
  String get profilePhoneLockedHint =>
      'Номер кирүү үчүн керек — SMS аркылуу ырастап өзгөртүлөт';

  @override
  String get profileFieldCity => 'Шаар';

  @override
  String get profileCityHint => 'Шаарды тандаңыз';

  @override
  String get profileWorkplaceHint => 'Аталышы же номери';

  @override
  String get profileMapButton => 'Дарыкананы картадан тактоо';

  @override
  String get profileMapSoon => 'Дарыкананы картадан тандоо жакында пайда болот';

  @override
  String get profileSave => 'Өзгөртүүлөрдү сактоо';

  @override
  String get profileFieldRequired => 'Бул талааны толтуруңуз';

  @override
  String get profileEditSent => 'Арыз колдоо кызматына жөнөтүлдү';

  @override
  String get profileEditSentHint =>
      'Текшергенден кийин маалыматтарды жаңыртабыз';

  @override
  String get profileEditRequest =>
      'Профилдин маалыматтарын жаңыртууну суранам:';

  @override
  String get profileEditNoChanges => 'Өзгөртүүлөр жок';

  @override
  String get profilePrivacyShort => 'Купуялуулук';

  @override
  String get profilePrivacyHeadline => 'Маалыматтарыңыз менен кантип иштейбиз';

  @override
  String get profilePrivacyCollectTitle => 'Кандай маалыматтарды чогултабыз';

  @override
  String get profilePrivacyCollectBody =>
      'Аты, телефон номери, шаар жана дарыкана же клиника. Сиз жөнөткөн чектердин жана бланктардын сүрөттөрү. Курстардын жана тесттердин жыйынтыктары.';

  @override
  String get profilePrivacyWhyTitle => 'Алар эмне үчүн керек';

  @override
  String get profilePrivacyWhyBody =>
      'Чектер жана бланктар үчүн IQC эсептөө, квесттерди эсепке алуу, ваучерлерди берүү жана статистикаңызды көрсөтүү үчүн.';

  @override
  String get profilePrivacyWhoTitle => 'Аларды ким көрөт';

  @override
  String get profilePrivacyWhoBody =>
      'Медициналык өкүлүңүз чектериңиздин жана квесттериңиздин санын көрөт. Бланктардагы бейтаптардын маалыматтары жашырылган — баш тамгалары гана көрүнөт.';

  @override
  String get profilePrivacyStoreTitle => 'Аларды кантип сактайбыз';

  @override
  String get profilePrivacyStoreBody =>
      'Маалыматтар корголгон байланыш аркылуу берилет жана компаниянын серверлеринде сакталат.';

  @override
  String get profilePrivacyDeleteTitle => 'Маалыматтарды кантип өчүрсө болот';

  @override
  String get profilePrivacyDeleteBody =>
      'Профилде → «Аккаунтту өчүрүү». Маалыматтар баланс жана ваучерлер менен бирге өчүрүлөт.';

  @override
  String get profilePrivacyFullLink => 'Саясаттын толук тексти';

  @override
  String get profilePrivacyContents => 'Мазмуну';

  @override
  String profilePrivacyReadTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n мүнөт окуу',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyRuOnly => 'Документ орус тилинде гана жеткиликтүү';

  @override
  String get profileDeleteLose =>
      'Бул аракетти жокко чыгарууга болбойт. Сиз жоготосуз:';

  @override
  String profileDeleteLoseIqc(String amount) {
    return 'Баланстагы $amount IQC';
  }

  @override
  String get profileDeleteLoseIqcHint =>
      'алмаштыруу мүмкүнчүлүгүсүз күйүп кетет';

  @override
  String profileDeleteLoseVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n активдүү ваучер',
    );
    return '$_temp0';
  }

  @override
  String get profileDeleteLoseVouchersHint => 'иштебей калат';

  @override
  String get profileDeleteLoseProgress =>
      'Квесттердеги жана курстардагы прогресс';

  @override
  String get profileDeleteLoseProgressHint => 'өчүрүлөт';

  @override
  String get profileDeleteTypePrompt => 'Ырастоо үчүн киргизиңиз';

  @override
  String get profileDeleteWord => 'ӨЧҮРҮҮ';

  @override
  String get profileDeleteForever => 'Биротоло өчүрүү';

  @override
  String get profileDeleteKeep => 'Аккаунтту калтыруу';

  @override
  String get profileDeleting => 'Өчүрүлүүдө…';

  @override
  String get profileDeleteFailed =>
      'Аккаунтту өчүрүү мүмкүн болгон жок. Кайра аракет кылыңыз';

  @override
  String get profileDeletedTitle => 'Аккаунт өчүрүлдү';

  @override
  String get profileDeletedBody =>
      'Профилиңизди, IQC балансын, ваучерлерди жана тарыхты өчүрдүк. Биз менен болгонуңуз үчүн рахмат';

  @override
  String get profileDeletedCardTitle => 'Оюңуз өзгөрдүбү?';

  @override
  String get profileDeletedCardBody =>
      'Ошол эле номер менен кайра катталууга болот — бирок мурунку балансты кайтаруу мүмкүн эмес';

  @override
  String get profileDeletedNew => 'Жаңы аккаунт түзүү';

  @override
  String get profileErrorGeneric =>
      'Бир нерсе туура эмес болду. Кайра аракет кылыңыз';

  @override
  String notifNewCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n жаңы',
    );
    return '$_temp0';
  }

  @override
  String get notifAllRead => 'Баары окулду';

  @override
  String get notifReadAll => 'Баарын окуу';

  @override
  String get notifFilterAll => 'Баары';

  @override
  String get notifFilterChecks => 'Чектер';

  @override
  String get notifFilterRecipes => 'Бланктар';

  @override
  String get notifFilterQuests => 'Квесттер';

  @override
  String get notifFilterLearning => 'Окуу';

  @override
  String get notifCategoryEmpty => 'Бул категорияда азырынча эч нерсе жок';

  @override
  String get notifNewAria => 'Жаңы';

  @override
  String get notifMarkedRead => 'Окулду';

  @override
  String get notifEmptySubtitle => 'Азырынча жаңылык жок';

  @override
  String get notifEmptyQuietTitle => 'Бул жерде азырынча тынч';

  @override
  String get notifEmptyQuietText =>
      'Чекти текшергенде, IQC эсептегенде же ваучер бергенде кабарлайбыз';

  @override
  String get notifConfigure => 'Билдирмелерди жөндөө';

  @override
  String get notifSettingsSubtitle => 'Телефонго эмнени жөнөтүү керек';

  @override
  String get notifSettingsChecksHint => 'Жактыруу, четке кагуу, IQC эсептөө';

  @override
  String get notifSettingsQuestsHint => 'Жаңы квесттер, аткаруу, ваучерлер';

  @override
  String get notifSettingsLearningHint => 'Жаңы курстар жана эскертмелер';

  @override
  String get notifSettingsMarketingHint =>
      'Рынок жаңылыктары жана атайын сунуштар';

  @override
  String get notifSettingsFootnote =>
      'Аккаунт жана коопсуздук тууралуу маанилүү билдирүүлөр ар дайым келет';

  @override
  String get notifSaveFailed => 'Жөндөөлөрдү сактоо мүмкүн болгон жок';

  @override
  String get supportHeaderTitle => 'PharmIQ колдоо кызматы';

  @override
  String get supportHeaderSubtitle => 'Адатта бир сааттын ичинде жооп беребиз';

  @override
  String get supportBackAria => 'Профилге кайтуу';

  @override
  String get supportToday => 'Бүгүн';

  @override
  String get supportYesterday => 'Кечээ';

  @override
  String get supportGreeting => 'Саламатсызбы! Кантип жардам бере алабыз?';

  @override
  String get supportFaqTitle => 'Көп берилүүчү суроолор';

  @override
  String get supportFaq1 => 'Чек үчүн IQC эсептелген жок';

  @override
  String get supportFaq2 => 'Чек четке кагылды — эмнеге?';

  @override
  String get supportFaq3 => 'Ваучерди кантип алса болот';

  @override
  String get supportFaq4 => 'Курс же тест менен көйгөй';

  @override
  String get supportMessageHint => 'Билдирүү';

  @override
  String get supportAttachAria => 'Сүрөт же чек тиркөө';

  @override
  String get supportSendAria => 'Жөнөтүү';

  @override
  String get supportTypingAria => 'Колдоо кызматы жазып жатат';

  @override
  String get supportAttachCheckTitle => 'Чек тиркөө';

  @override
  String get supportAttachRecipeTitle => 'Бланк тиркөө';

  @override
  String get supportAttachEmpty => 'Азырынча тиркей турган эч нерсе жок';

  @override
  String get supportAttachRemove => 'Тиркемени алып салуу';

  @override
  String get supportAttachUnavailable =>
      'Тиркемелер чектер жана бланктар үчүн жеткиликтүү';

  @override
  String get supportSendFailed => 'Билдирүүнү жөнөтүү мүмкүн болгон жок';

  @override
  String get walletFaceValue => 'Номинал';

  @override
  String get profileBack => 'Артка';

  @override
  String homeNewCourseVideo(int n) {
    return 'Видео ~$n мүн';
  }

  @override
  String get homeNewCourseQuiz => 'тест';

  @override
  String get authHintFullName => 'Фамилиясы Аты Атасынын аты';

  @override
  String get authHintPharmacy => 'Мисалы, №12 дарыкана';

  @override
  String get authHintClinic => 'Медициналык мекеменин аталышы';

  @override
  String get authMapCardTitle => 'Дарыкананы картада белгилөө';

  @override
  String get authMapCardSub => 'Районуңуздагы квесттер үчүн керек';

  @override
  String get authMapCardButton => 'Белгилөө';

  @override
  String get rxStateCreditedTitle => 'IQC эсептелди';

  @override
  String get rxStateCreditedText => 'Упайлар балансыңызга түштү';

  @override
  String get rxAccrualCreditedTitle => 'Баланска түштү';

  @override
  String get rxCreditedCaption => 'эсептелди';

  @override
  String rxListCountEarned(String count, int n) {
    return '$count · $n IQC алынды';
  }

  @override
  String get questsRewardPoints => 'Упайлар баланска';

  @override
  String get walletMonthsIn =>
      'январда,февралда,мартта,апрелде,майда,июнда,июлда,августта,сентябрда,октябрда,ноябрда,декабрда';

  @override
  String walletEarnedIn(String month) {
    return '$month эсептелди';
  }

  @override
  String walletSpentIn(String month) {
    return '$month сарпталды';
  }

  @override
  String get profileRoleShortMedrep => 'Медөкүл';

  @override
  String get notifActionQr => 'QR көрсөтүү';

  @override
  String get notifActionRetake => 'Кайра тартуу';

  @override
  String homeNewCourseQuizQuestions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'тест $n суроо',
      one: 'тест $n суроо',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyDraft => 'Долбоор. Акыркы текстти юрист бекитет';

  @override
  String get notifSettingsChecksOnly => 'Чектердин абалы';

  @override
  String get notifSettingsRecipesOnly => 'Бланктардын абалы';

  @override
  String get tourWelcomeTitle => 'PharmIQ Academy\'ге кош келиңиз!';

  @override
  String get tourWelcomeText =>
      'Эмне кайда экенин жана IQC кантип табууну көрсөтөбүз. Бул бир мүнөттөн аз убакыт алат.';

  @override
  String get tourWelcomeTextDoc =>
      'Эмне кайда экенин жана бланктар үчүн IQC кантип алууну көрсөтөбүз. Бул бир мүнөттөн аз убакыт алат.';

  @override
  String get tourStart => 'Баштоо';

  @override
  String get tourSkipAll => 'Окутууну өткөрүп жиберүү';

  @override
  String tourStepOf(int n, int total) {
    return '$total ичинен $n-кадам';
  }

  @override
  String get tourSkip => 'Өткөрүү';

  @override
  String get tourNext => 'Кийинки';

  @override
  String get tourDoneStep => 'Даяр';

  @override
  String get tourBack => 'Артка';

  @override
  String get tourBalanceTitle => 'IQC балансы';

  @override
  String get tourBalanceText =>
      'Бул жерде сиздин IQC — жактырылган чектер, квесттер жана сурамжылоолор үчүн упайлар. «Капчык» баскычы тарыхты жана ваучерлерге алмаштырууну ачат.';

  @override
  String get tourBalanceTextDoc =>
      'Бул жерде сиздин IQC — жактырылган бланктар, квесттер жана сурамжылоолор үчүн упайлар. «Капчык» баскычы тарыхты жана ваучерлерге алмаштырууну ачат.';

  @override
  String get tourSendTitle => 'Чек жөнөтүңүз';

  @override
  String get tourSendText =>
      'Чекти сүрөткө тартыңыз — ЖИ дарыларды тааныйт. Текшерүүдөн кийин баланска IQC түшөт.';

  @override
  String get tourSendTitleDoc => 'Бланк жөнөтүңүз';

  @override
  String get tourSendTextDoc =>
      'Бланкты сүрөткө тартыңыз — ЖИ дарыларды тааныйт. Текшерүүдөн кийин баланска IQC түшөт.';

  @override
  String get tourQuestsTitle => 'Активдүү квесттер';

  @override
  String get tourQuestsText =>
      'Өндүрүүчүлөрдүн тапшырмалары: керектүү сандагы таңгактарды сатып, сыйлык алыңыз. Прогресс карточкада көрүнөт.';

  @override
  String get tourQuestsTextDoc =>
      'Өндүрүүчүлөрдүн тапшырмалары: керектүү сандагы бланктарды жазып, сыйлык алыңыз. Прогресс карточкада көрүнөт.';

  @override
  String get tourChecksTitle => 'Сиздин чектериңиз';

  @override
  String get tourChecksText =>
      'Бардык жөнөтүлгөн чектер жана алардын абалы: текшерүүдө, жактырылды, эсептелди же кайра тартуу керек.';

  @override
  String get tourChecksTitleDoc => 'Сиздин бланктарыңыз';

  @override
  String get tourChecksTextDoc =>
      'Бардык жөнөтүлгөн бланктар жана алардын абалы: текшерүүдө, жактырылды, эсептелди же кайра тартуу керек.';

  @override
  String get tourLearnTitle => 'Окутуу';

  @override
  String get tourLearnText =>
      'Фарм рыногунун эксперттеринен курстар жана тесттер. Өтүлгөн курстар үчүн упайлар берилет.';

  @override
  String get tourProfileTitle => 'Профиль';

  @override
  String get tourProfileText =>
      'Жеке маалыматтар, дарыкана, тема жана тил. Ушул жерде бул окутууну кайра өтүүгө болот.';

  @override
  String get tourProfileTextDoc =>
      'Жеке маалыматтар, иш орду, тема жана тил. Ушул жерде бул окутууну кайра өтүүгө болот.';

  @override
  String get tourDoneTitle => 'Баары даяр!';

  @override
  String get tourDoneText =>
      'Алгачкы IQC алуу үчүн биринчи чекти жөнөтүңүз же курсту баштаңыз.';

  @override
  String get tourDoneTextDoc =>
      'Алгачкы IQC алуу үчүн биринчи бланкты жөнөтүңүз же курсту баштаңыз.';

  @override
  String get tourDoneNote => 'Окутууну Профилде кайталоого болот.';

  @override
  String get tourFinish => 'Ишти баштоо';

  @override
  String get profileTourAgain => 'Окутууну кайра өтүү';

  @override
  String get walletConfirmTextPlain => 'Korzinka белек картасын алыңыз';

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
}

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
  String get navProducts => 'Продукттар';

  @override
  String get navBrands => 'Бренддер';

  @override
  String get navProfile => 'Профиль';

  @override
  String get miniAppsTitle => 'Мини-колдонмолор';

  @override
  String get miniAppsSubtitle => 'Ойноп, IQC үчүн байге утуп алыңыз';

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
      'IQC үчүн клеткаларды ээлеңиз — ачылуу саатында алардын астында эмне бар экенин билесиз';

  @override
  String get sapperNoDraws => 'Оюндар жок';

  @override
  String get sapperRevealed => 'Ачылды';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 $prizeCount байге  💎 $priceIqc IQC/клетка  ';
  }

  @override
  String sapperMyCells(Object count) {
    return 'сиздин клеткалар: $count';
  }

  @override
  String sapperOccupancy(Object occupied, Object total, Object percent) {
    return '$total ичинен $occupied ээленген ($percent%)';
  }

  @override
  String get sapperGoToGame => 'Оюнга өтүү';

  @override
  String sapperReserveTitle(Object number) {
    return '№$number клетканы ээлейсизби?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC алынат. Жокко чыгарууга болбойт — клетка ачылганга чейин сизге бекитилет.';
  }

  @override
  String sapperReserveConfirm(Object price) {
    return '$price IQC үчүн ээлөө';
  }

  @override
  String sapperCellReserved(Object number) {
    return '№$number клетка ээленди';
  }

  @override
  String get sapperNoIqcTitle => 'IQC жетишсиз';

  @override
  String sapperNoIqcBody(Object price, Object have) {
    return 'Катышуу үчүн $price IQC керек, сизде $have. IQC чогултуңуз — окууну, квестти же сурамжылоону өтүңүз.';
  }

  @override
  String get sapperDraws => 'Байге оюндары';

  @override
  String get sapperAcceptClosed =>
      'Клетка кабыл алуу жабылды — ачылууга даярдык жүрүп жатат';

  @override
  String get sapperHiddenTitle => 'ТАЛААДА КАТЫЛГАН';

  @override
  String sapperRevealIn(Object time) {
    return 'ачылууга $time калды';
  }

  @override
  String get sapperNoPrizes => 'байгелер жарыяланган жок';

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
    return 'клетка баасы $price IQC';
  }

  @override
  String get sapperYourBalance => 'Сиздин баланс';

  @override
  String get sapperCellPriceLabel => 'клетка баасы';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Сиз $count $word уттуңуз!';
  }

  @override
  String get sapperNoWin => 'Бул жолу утушсуз';

  @override
  String get sapperPrizeOne => 'байге';

  @override
  String get sapperPrizeFew => 'байге';

  @override
  String get sapperPrizeMany => 'байге';

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
  String get sapperLegendOccupied => 'Ээленген';

  @override
  String get sapperLegendFree => 'Бош';

  @override
  String get sapperWinners => 'Жеңүүчүлөр';

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
  String get profileSupportSubtitle => 'Биз ар дайым байланыштабыз';

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
  String get profileLogoutAction => 'Чыгуу';

  @override
  String get profileDeleteConfirmTitle => 'Аккаунт өчүрүлсүнбү?';

  @override
  String get profileDeleteConfirmBody =>
      'Бул аракетти кайтарууга болбойт. Бардык маалымат өчүрүлөт.';

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
  String get notifSettingsChecks => 'Чек жана рецепт абалдары';

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
  String get docHomeSubtitle => 'Рецепттерди жөнөтүп, сыйлык алыңыз';

  @override
  String get docHomeWalletBalance => 'КАПЧЫК БАЛАНСЫ';

  @override
  String get docHomeWallet => 'Капчык';

  @override
  String get docHomeSendRecipe => 'Рецепт жөнөтүү';

  @override
  String get docHomeSendRecipeHint =>
      'Рецептти сүрөткө тартыңыз — AI дарыларды тааныйт';

  @override
  String get docHomeStatRecipes => 'бардык рецепттер';

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
  String get recipeDetailMyRecipes => 'Менин рецепттерим';

  @override
  String recipeDetailTitle(Object id) {
    return 'Рецепт №$id';
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
  String get recipesTitle => 'Менин рецепттерим';

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
  String get recipesEmpty => 'Азырынча рецепттер жок';

  @override
  String get recipesTakePhoto => 'Сүрөткө тартуу';

  @override
  String get recipesFromGallery => 'Галереядан тандоо';

  @override
  String get recipesUploading => 'Рецепт кошулду — жүктөлүүдө';

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
  String get recipesSubmitButton => 'Рецепт жөнөтүү';

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
  String get walletRedeemTitle => 'Упайлар алмаштырылсынбы?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 — $p2 IQC үчүн';
  }

  @override
  String get walletCancel => 'Жокко чыгаруу';

  @override
  String get walletRedeem => 'Алмаштыруу';

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
    return 'Korzinka · $amount сум';
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
}

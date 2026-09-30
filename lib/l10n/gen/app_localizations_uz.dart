// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'IQ Academy';

  @override
  String get apiNetworkError => 'Tarmoq xatosi';

  @override
  String get apiNoAccess => 'Ruxsat yo\'q';

  @override
  String get checkModelStatusPending => 'Tekshirilmoqda';

  @override
  String get checkModelStatusAiDetected => 'AI tanidi';

  @override
  String get checkModelStatusAiWrong => 'AI tanimadi';

  @override
  String get checkModelStatusApproved => 'Tasdiqlangan';

  @override
  String get checkModelStatusRejected => 'Rad etilgan';

  @override
  String get commonRolePharmacist => 'Farmatsevt';

  @override
  String get commonRoleDoctor => 'Shifokor';

  @override
  String get commonRoleMedrep => 'Tibbiy vakil';

  @override
  String get commonRoleProductOwner => 'Brend / Mahsulot egasi';

  @override
  String get commonCancel => 'Bekor qilish';

  @override
  String get navHome => 'Asosiy';

  @override
  String get navChecks => 'Cheklar';

  @override
  String get navQuests => 'Kvestlar';

  @override
  String get navLearn => 'Ta\'lim';

  @override
  String get navWallet => 'Hamyon';

  @override
  String get navRecipes => 'Blanklar';

  @override
  String get navPortfolio => 'Portfel';

  @override
  String get navPharm => 'Farm.';

  @override
  String get navTop => 'Top';

  @override
  String get navDashboard => 'Boshqaruv';

  @override
  String get navProducts => 'Mahsulotlar';

  @override
  String get navBrands => 'Brendlar';

  @override
  String get navProfile => 'Profil';

  @override
  String get miniAppsTitle => 'Mini-ilovalar';

  @override
  String get miniAppsSubtitle => 'Dastur ishtirokchilari uchun aksiyalar';

  @override
  String get miniAppsSoon => 'Tez orada';

  @override
  String get sapperCountdownSoon => 'tez orada';

  @override
  String sapperCountdownDaysHours(Object days, Object hours) {
    return '${days}k ${hours}s';
  }

  @override
  String sapperCountdownHoursMinutes(Object hours, Object minutes) {
    return '${hours}s ${minutes}d';
  }

  @override
  String sapperCountdownMinutesSeconds(Object minutes, Object seconds) {
    return '${minutes}d ${seconds}s';
  }

  @override
  String get sapperTitle => 'Super Sapyor';

  @override
  String get sapperSubtitle =>
      'IQC evaziga kataklarni tanlang — natijalar e\'lon qilinganda ular ostida nima borligini bilib olasiz';

  @override
  String get sapperNoDraws => 'Faol aksiyalar yo\'q';

  @override
  String get sapperRevealed => 'Yakunlangan';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 sovrinlar: $prizeCount  💎 $priceIqc IQC/katak  ';
  }

  @override
  String sapperMyCells(Object count) {
    return 'sizning kataklaringiz: $count';
  }

  @override
  String sapperOccupancy(Object occupied, Object total, Object percent) {
    return 'band $occupied / $total ($percent%)';
  }

  @override
  String get sapperGoToGame => 'Maydonni ochish';

  @override
  String sapperReserveTitle(Object number) {
    return '$number-katakni egallaysizmi?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC ishlatiladi. Bekor qilib bo\'lmaydi — katak natijalar e\'lon qilingunga qadar sizniki bo\'lib qoladi.';
  }

  @override
  String sapperReserveConfirm(Object price) {
    return '$price IQC evaziga egallash';
  }

  @override
  String sapperCellReserved(Object number) {
    return '$number-katak band qilindi';
  }

  @override
  String get sapperNoIqcTitle => 'IQC yetarli emas';

  @override
  String sapperNoIqcBody(Object price, Object have) {
    return 'Ishtirok etish uchun $price IQC kerak, sizda $have. IQC toplang — ta\'lim, kvest yoki so\'rovnomadan o\'ting.';
  }

  @override
  String get sapperDraws => 'Aksiyalar';

  @override
  String get sapperAcceptClosed =>
      'Kataklarni tanlash yopildi — natijalar tayyorlanmoqda';

  @override
  String get sapperHiddenTitle => 'MAYDONDAGI SOVRINLAR';

  @override
  String sapperFieldTotal(int count) {
    return 'Maydonda $count ta katak';
  }

  @override
  String sapperRevealIn(Object time) {
    return 'natijalargacha $time';
  }

  @override
  String get sapperNoPrizes => 'sovrinlar ko\'rsatilmagan';

  @override
  String sapperPrizeChip(Object count, Object label) {
    return '🎁 $count× $label';
  }

  @override
  String sapperBalance(Object balance) {
    return 'Balans: $balance IQC';
  }

  @override
  String sapperCellPrice(Object price) {
    return 'katak — $price IQC';
  }

  @override
  String get sapperYourBalance => 'Sizning balansingiz';

  @override
  String get sapperCellPriceLabel => 'bir katak uchun';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Siz $count $word oldingiz!';
  }

  @override
  String get sapperNoWin => 'Bu safar sovrinsiz';

  @override
  String get sapperPrizeOne => 'sovrin';

  @override
  String get sapperPrizeFew => 'sovrin';

  @override
  String get sapperPrizeMany => 'sovrin';

  @override
  String get sapperLegendMine => 'Meniki';

  @override
  String get sapperLegendTheirs => 'Boshqalarniki';

  @override
  String get sapperLegendEmpty => 'Bo‘sh';

  @override
  String get sapperLegendVoucher => 'Vaucher';

  @override
  String get sapperLegendSelected => 'Tanlangan';

  @override
  String get sapperLegendOccupied => 'Boshqalar band qilgan';

  @override
  String get sapperLegendFree => 'Bo\'sh';

  @override
  String get sapperWinners => 'Sovrin olganlar';

  @override
  String get newsTitle => 'Yangiliklar';

  @override
  String get newsAll => 'Barcha yangiliklar';

  @override
  String get newsMore => 'Batafsil →';

  @override
  String get newsDateMonths =>
      'yan,fev,mar,apr,may,iyn,iyl,avg,sen,okt,noy,dek';

  @override
  String get newsEmpty => 'Hozircha yangiliklar yo\'q';

  @override
  String get newsPinned => 'MUHIM';

  @override
  String get newsDetailTitle => 'Yangilik';

  @override
  String surveyRewardCredited(Object amount) {
    return '+$amount IQC hisobga qo\'shildi';
  }

  @override
  String get surveyThanks => 'Javobingiz uchun rahmat!';

  @override
  String surveySubmitError(Object error) {
    return 'Yuborib bo\'lmadi: $error';
  }

  @override
  String get surveyTitle => 'So\'rovnoma';

  @override
  String surveyRewardBadge(Object amount) {
    return '+ $amount IQC';
  }

  @override
  String get surveyChooseOption => 'Javob variantini tanlang';

  @override
  String get surveyEnterAnswer => 'Javobni qo\'lda kiriting';

  @override
  String get surveySubmit => 'Javob berish';

  @override
  String get loginTagline => 'O\'rgan.\nQo\'lla.\nErish.';

  @override
  String get loginTitle => 'Kirish';

  @override
  String get loginByPhone => 'Telefon raqami orqali kiring';

  @override
  String get loginChooseMethod => 'Kirishning qulay usulini tanlang';

  @override
  String loginCodeSent(Object phone) {
    return '$phone raqamiga SMS-kod yuborildi';
  }

  @override
  String get loginPhoneLabel => 'Telefon raqami';

  @override
  String get loginPhoneNotFound => 'Raqam tizimda topilmadi';

  @override
  String get loginConfirm => 'Tasdiqlash';

  @override
  String get loginGoRegister => 'Ro\'yxatdan o\'tish';

  @override
  String get loginRegister => 'Ro\'yxatdan o\'tish';

  @override
  String get loginNoAccount => 'Akkauntingiz yo\'qmi?';

  @override
  String get loginEnter => 'Kirish';

  @override
  String loginResendIn(Object seconds) {
    return '$seconds soniyadan so\'ng qayta yuborish';
  }

  @override
  String get loginResendAgain => 'Qayta yuborish';

  @override
  String get loginChangeNumber => '‹ Raqamni o\'zgartirish';

  @override
  String get loginOr => 'yoki';

  @override
  String get tgLoginExpired => 'Kirish vaqti tugadi';

  @override
  String tgLoginParseError(Object error) {
    return 'Kirish javobini qayta ishlab bo\'lmadi: $error';
  }

  @override
  String get tgWaitingConfirm => 'Tasdiqlash kutilmoqda…';

  @override
  String get tgLoginButton => 'Telegram orqali kirish';

  @override
  String get notifTitle => 'Bildirishnomalar';

  @override
  String notifUnreadOne(Object count) {
    return '$count ta o\'qilmagan';
  }

  @override
  String notifUnreadMany(Object count) {
    return '$count ta o\'qilmagan';
  }

  @override
  String get notifMarkAllRead => 'Hammasini o\'qilgan deb belgilash';

  @override
  String get notifRead => '✓ O\'qilgan';

  @override
  String get notifMarkRead => 'O\'qilgan deb belgilash';

  @override
  String get notifOpen => 'Ochish';

  @override
  String get notifEmptyTitle => 'Bildirishnomalar yo\'q';

  @override
  String get notifEmptyBody =>
      'Bu yerda chek holatlari, kvest mukofotlari va ta\'lim yangiliklari paydo bo\'ladi.';

  @override
  String get placeholderComingSoon =>
      'Bo\'lim keyingi bosqichlarda paydo bo\'ladi.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileSettings => 'Sozlamalar';

  @override
  String get profileLanguage => 'TIL';

  @override
  String get profileAppearance => 'KO\'RINISH';

  @override
  String get profileThemeLight => 'Yorug\'';

  @override
  String get profileThemeDark => 'Tungi';

  @override
  String get profileThemeSystem => 'Tizim';

  @override
  String get profileAccount => 'Hisob';

  @override
  String get profilePersonalData => 'SHAXSIY MA\'LUMOTLAR';

  @override
  String get profileRole => 'Rol';

  @override
  String get profileChange => 'O\'zgartirish';

  @override
  String get profileLinkedServices => 'ULANGAN XIZMATLAR';

  @override
  String get profilePhone => 'Telefon';

  @override
  String get profileTgConnected => 'Ulangan';

  @override
  String get profileTgLinked => 'Bog\'langan';

  @override
  String get profileSupport => 'Yordam xizmati';

  @override
  String get profileSupportSubtitle =>
      'Telegram va telefon orqali javob beramiz';

  @override
  String get profileLogout => 'Hisobdan chiqish';

  @override
  String get profileDeleteTitle => 'Hisob va ma\'lumotlarni o\'chirish';

  @override
  String get profileDeleteIrreversible => 'Bu amalni qaytarib bo\'lmaydi';

  @override
  String get profileDelete => 'O\'chirish';

  @override
  String get profileLanguageUpdated => 'Til yangilandi';

  @override
  String get profileNewPhoneTitle => 'Yangi raqam';

  @override
  String get profileCancel => 'Bekor qilish';

  @override
  String get profileNext => 'Davom etish';

  @override
  String get profileSmsCodeTitle => 'SMS-kod';

  @override
  String get profileCodeLabel => 'Kod';

  @override
  String get profileConfirm => 'Tasdiqlash';

  @override
  String get profilePhoneChanged => 'Telefon o\'zgartirildi';

  @override
  String get profileLogoutConfirmTitle => 'Hisobdan chiqasizmi?';

  @override
  String get profileLogoutConfirmBody =>
      'Ilovadan yana foydalanish uchun qaytadan kirishingiz kerak bo\'ladi.';

  @override
  String get profileLogoutAction => 'Chiqish';

  @override
  String get profileDeleteConfirmTitle => 'Hisob o\'chirilsinmi?';

  @override
  String get profileDeleteConfirmBody =>
      'Profil, telefon raqami, kirish bog\'lanishlari, bildirishnomalar va qo\'llab-quvvatlash bilan yozishmalar o\'chiriladi. Hisoblangan ballar va berilgan vaucherlar haqidagi yozuvlar shaxsiy ma\'lumotlaringizsiz saqlanadi — ular hisob uchun kerak. Bu amalni qaytarib bo\'lmaydi.';

  @override
  String get profileStatQuests => 'KVESTLAR';

  @override
  String get profileStatLevel => 'DARAJA';

  @override
  String get questHistoryTitle => 'Ishtirok tarixi';

  @override
  String get questHistoryEmpty => 'Tarix bo\'sh';

  @override
  String get questHistoryVoucher => 'Vaucher';

  @override
  String get questHistoryActive => 'Faol';

  @override
  String get questHistoryDone => 'Bajarilgan';

  @override
  String get registerStep1Of2 => '1-QADAM / 2';

  @override
  String registerStep2Of2(Object role) {
    return '2-QADAM / 2 · $role';
  }

  @override
  String get registerTitle => 'Ro\'yxatdan o\'tish';

  @override
  String get registerChooseRole => 'Kirish uchun rolni tanlang';

  @override
  String get registerBack => '‹ Orqaga';

  @override
  String registerConfirmField(Object label) {
    return 'Tasdiqlang: $label';
  }

  @override
  String registerFillField(Object label) {
    return 'To\'ldiring: $label';
  }

  @override
  String get registerFinish => 'Ro\'yxatdan o\'tishni yakunlash';

  @override
  String get registerSuccessTitle => 'Ro\'yxatdan o\'tish yakunlandi!';

  @override
  String registerWelcome(Object name) {
    return 'PharmIQ ACADEMY\'ga xush kelibsiz, $name!';
  }

  @override
  String get registerStartLearning => 'O\'qishni boshlash';

  @override
  String get registerGoHome => 'Asosiy sahifaga o\'tish';

  @override
  String registerEnterField(Object label) {
    return '$label kiriting';
  }

  @override
  String get registerRequiredField => 'Majburiy maydon';

  @override
  String get registerSelectPlaceholder => '— tanlang —';

  @override
  String registerMultiSelectHintRequired(Object label) {
    return '$label * · Bir nechtasini tanlash mumkin';
  }

  @override
  String registerMultiSelectHint(Object label) {
    return '$label · Bir nechtasini tanlash mumkin';
  }

  @override
  String get registerConsentText =>
      'Shaxsiy ma\'lumotlarni qayta ishlashga roziman ';

  @override
  String get registerConsentMore => 'batafsil';

  @override
  String get roleSelectTagline => 'O\'rgan.\nQo\'lla.\nErish.';

  @override
  String get roleSelectGreeting => 'Assalomu alaykum';

  @override
  String roleSelectGreetingName(Object name) {
    return 'Assalomu alaykum, $name';
  }

  @override
  String get roleSelectChooseRole => 'Kirish uchun rolni tanlang';

  @override
  String get roleSelectSubChecksQuests =>
      'Cheklar, kvestlar, ta\'lim va hamyon';

  @override
  String get roleSelectSubMedrep => 'Provizorlar portfeli va reyting';

  @override
  String get roleSelectSubProductOwner =>
      'Boshqaruv paneli, mahsulotlar va brendlar';

  @override
  String get roleSelectSheetTitle => 'Rolni tanlang';

  @override
  String get roleSelectEnter => 'Kirish';

  @override
  String get notifSettingsTitle => 'Bildirishnoma sozlamalari';

  @override
  String get notifSettingsChecks => 'Chek va blank holatlari';

  @override
  String get notifSettingsQuests => 'Kvestlar va mukofotlar';

  @override
  String get notifSettingsLearning => 'Ta\'lim';

  @override
  String get notifSettingsMarketing => 'Yangiliklar va aksiyalar';

  @override
  String get supportBackProfile => 'Profil';

  @override
  String get supportTitle => 'Yordam xizmati';

  @override
  String get supportEmptyHint => 'Bizga yozing — shu yerda javob beramiz';

  @override
  String get supportInputHint => 'Xabar yozing...';

  @override
  String get supportYou => 'Siz';

  @override
  String get supportTeam => 'Yordam xizmati';

  @override
  String get appBarSwitchRole => 'Rolni almashtirish';

  @override
  String get asyncRetry => 'Qayta urinish';

  @override
  String get brandProductsTitle => 'Mahsulotlar';

  @override
  String get brandProductsEmpty => 'Mahsulotlar yo\'q';

  @override
  String brandProductsQuestCount(Object p1) {
    return '$p1 ta kvest';
  }

  @override
  String get brandProductsDetailTitle => 'Mahsulot';

  @override
  String get brandQuestsTitle => 'Brend kvestlari';

  @override
  String get brandQuestsEmpty => 'Kvestlar yo\'q';

  @override
  String brandQuestsSubtitle(Object p1, Object p2, Object p3) {
    return '$p1 · $p2/$p3 bajarildi';
  }

  @override
  String get brandQuestsStatusActive => 'Faol';

  @override
  String get brandQuestsStatusOff => 'O\'chiq';

  @override
  String get brandQuestsDetailTitle => 'Brend kvesti';

  @override
  String brandQuestsSponsor(Object p1) {
    return 'Homiy: $p1';
  }

  @override
  String get brandQuestsParticipants => 'Ishtirokchilar';

  @override
  String get brandQuestsCompletions => 'Bajarilganlar';

  @override
  String get brandQuestsBudget => 'Byudjet';

  @override
  String get brandQuestsSpent => 'Sarflangan';

  @override
  String get brandQuestsProducts => 'Mahsulotlar';

  @override
  String get brandQuestsMxik => 'MXIK';

  @override
  String get brandQuestsReward => 'Mukofot';

  @override
  String get brandQuestsPeriod => 'Davr';

  @override
  String get brandsTitle => 'Brendlar';

  @override
  String get brandsEmpty => 'Brendlar yo\'q';

  @override
  String brandsQuestCount(Object p1) {
    return '$p1 ta kvest';
  }

  @override
  String get brandsDetailTitle => 'Brend';

  @override
  String get brandsSubBrands => 'Sub-brendlar';

  @override
  String get brandDashTitle => 'Boshqaruv paneli';

  @override
  String get brandDashChecks => 'Cheklar';

  @override
  String get brandDashPacks => 'Qadoqlar';

  @override
  String get brandDashActiveQuests => 'Faol kvestlar';

  @override
  String get brandDashParticipants => 'Ishtirokchilar';

  @override
  String get brandDashSegmentation => 'Segmentatsiya';

  @override
  String get brandDashRetail => 'Chakana';

  @override
  String get brandDashChain => 'Tarmoqlar';

  @override
  String get brandDashTopProducts => 'Top mahsulotlar';

  @override
  String get brandDashTopSellers => 'Top sotuvchilar';

  @override
  String get brandDashRegions => 'Hududlar';

  @override
  String get brandDashSalesLogs => 'Sotuv jurnallari';

  @override
  String get salesLogTitle => 'Sotuv jurnallari';

  @override
  String get salesLogEmpty => 'Yozuvlar yo\'q';

  @override
  String get docHomeActiveQuests => 'Faol kvestlar';

  @override
  String get docHomeAllQuests => 'Barcha kvestlar';

  @override
  String get docHomeNoActiveQuests => 'Faol kvestlar yo\'q';

  @override
  String get docHomeRecommendedCourses => 'Tavsiya etilgan kurslar';

  @override
  String get docHomeAllCourses => 'Barcha kurslar';

  @override
  String get docHomeNoCourses => 'Hozircha kurslar yo\'q';

  @override
  String get docHomeGreetingNoName => 'Salom!';

  @override
  String docHomeGreeting(Object name) {
    return 'Salom, $name';
  }

  @override
  String get docHomeSubtitle => 'Blanklarni yuboring va mukofot oling';

  @override
  String get docHomeWalletBalance => 'HAMYON BALANSI';

  @override
  String get docHomeWallet => 'Hamyon';

  @override
  String get docHomeSendRecipe => 'Blank yuborish';

  @override
  String get docHomeSendRecipeHint =>
      'Blankni suratga oling — AI dorilarni taniydi';

  @override
  String get docHomeStatRecipes => 'jami blanklar';

  @override
  String get docHomeStatApproved => 'tasdiqlangan';

  @override
  String get docHomeStatIqc => 'IQC ball';

  @override
  String get docHomeVoucher => 'VAUCHER';

  @override
  String get docHomeProgress => 'Jarayon';

  @override
  String docHomeProgressDone(Object pct) {
    return '$pct% bajarildi';
  }

  @override
  String get recipeDetailMyRecipes => 'Mening blanklarim';

  @override
  String recipeDetailTitle(Object id) {
    return 'Blank №$id';
  }

  @override
  String recipeDetailPhotoCount(Object p1) {
    return 'Surat $p1';
  }

  @override
  String get recipeDetailStatusApproved => 'Tasdiqlangan';

  @override
  String get recipeDetailStatusRejected => 'Rad etilgan';

  @override
  String get recipeDetailStatusPending => 'Tekshirilmoqda';

  @override
  String get recipeDetailAiRecognized => 'AI tanidi';

  @override
  String get recipeDetailNoDrugs => 'Dorilar tanilmadi';

  @override
  String get recipesTitle => 'Mening blanklarim';

  @override
  String recipesTotal(Object p1) {
    return 'jami $p1';
  }

  @override
  String get recipesTabAll => 'Barchasi';

  @override
  String get recipesTabActive => 'Faol';

  @override
  String get recipesTabDone => 'Yakunlangan';

  @override
  String get recipesEmpty => 'Hozircha blanklar yo\'q';

  @override
  String get recipesTakePhoto => 'Suratga olish';

  @override
  String get recipesFromGallery => 'Galereyadan tanlash';

  @override
  String get recipesUploading => 'Blank qo\'shildi — yuklanmoqda';

  @override
  String get recipesDoctorInfoTitle => 'Shifokor ma\'lumotlari (ixtiyoriy)';

  @override
  String get recipesDoctorName => 'F.I.Sh.';

  @override
  String get recipesDoctorWorkplace => 'Ish joyi';

  @override
  String get recipesDoctorCity => 'Shahar';

  @override
  String get recipesDoctorPhone => 'Telefon';

  @override
  String get recipesSkip => 'O\'tkazib yuborish';

  @override
  String get recipesSend => 'Yuborish';

  @override
  String get recipesSubmitButton => 'Blank yuborish';

  @override
  String recipesPhotoCount(Object p1) {
    return 'surat: $p1';
  }

  @override
  String get recipesStatusApproved => 'Tasdiqlangan';

  @override
  String get recipesStatusRejected => 'Rad etilgan';

  @override
  String get recipesStatusPending => 'Tekshirilmoqda';

  @override
  String recipesUploadingBanner(Object count) {
    return 'Yuklanmoqda: $count';
  }

  @override
  String get recipesRetry => 'Qayta urinish';

  @override
  String get companiesTitle => 'Kompaniyalar';

  @override
  String get companiesEmpty => 'Kompaniyalar yo\'q';

  @override
  String companiesCode(Object p1) {
    return 'Kod: $p1';
  }

  @override
  String get medrepHomeAttributionPrimary => 'Birlamchi';

  @override
  String get medrepHomeAttributionTotal => 'Umumiy';

  @override
  String get medrepHomeMenuPharmacists => 'Farmatsevtlar';

  @override
  String get medrepHomeMenuPending => 'Tasdiqlash kutilmoqda';

  @override
  String get medrepHomeMenuCompanies => 'Kompaniyalar';

  @override
  String get medrepHomeMenuLeaderboard => 'Reyting';

  @override
  String get medrepHomeGreetingNoName => 'Salom!';

  @override
  String medrepHomeGreeting(Object name) {
    return 'Salom, $name';
  }

  @override
  String medrepHomeAttribution(Object attribution) {
    return 'Atributsiya: $attribution';
  }

  @override
  String get medrepHomeStatPharmacists => 'Farmatsevtlar';

  @override
  String get medrepHomeStatChecks => 'Cheklar';

  @override
  String get medrepHomeStatPacks => 'Qadoqlar';

  @override
  String get medrepHomeStatQuests => 'Kvestlar';

  @override
  String get medrepHomeLinkCopied => 'Havola nusxalandi';

  @override
  String get medrepHomeReferralTitle => 'Referal havola';

  @override
  String get medrepHomeReferralHint =>
      'Havolani provizorga yuboring — u ro\'yxatdan o\'tishda sizga bog\'lanadi';

  @override
  String get medrepHomeCopy => 'Nusxalash';

  @override
  String get medrepHomeShare => 'Ulashish';

  @override
  String get medrepHomeRetry => 'Qayta urinish';

  @override
  String get leaderboardUnitPharm => 'dorixona';

  @override
  String get leaderboardUnitQuests => 'kvest';

  @override
  String get leaderboardUnitChecks => 'chek';

  @override
  String get leaderboardTitle => 'Reyting';

  @override
  String get leaderboardAttributionPrimary => 'Birlamchi';

  @override
  String get leaderboardAttributionTotal => 'Umumiy';

  @override
  String get leaderboardCompanyFallback => 'Kompaniya';

  @override
  String get leaderboardRetry => 'Qayta urinish';

  @override
  String get pharmDetailIncentivizeTitle => 'Farmatsevtni rag\'batlantirish';

  @override
  String pharmDetailRating(Object p1) {
    return 'Baho: $p1';
  }

  @override
  String get pharmDetailComment => 'Izoh';

  @override
  String get pharmDetailCancel => 'Bekor qilish';

  @override
  String get pharmDetailSend => 'Yuborish';

  @override
  String get pharmDetailSent => 'Yuborildi';

  @override
  String get pharmDetailBack => 'Farmatsevtlar';

  @override
  String get pharmDetailChecks => 'Cheklar';

  @override
  String get pharmDetailPacks => 'Qadoqlar';

  @override
  String get pharmDetailQuests => 'Kvestlar';

  @override
  String get pharmDetailIqcPoints => 'IQC ball';

  @override
  String get pharmDetailRecentChecks => 'So\'nggi cheklar';

  @override
  String get pharmDetailNoChecks => 'Hozircha cheklar yo\'q';

  @override
  String get pharmDetailActive => 'Faol';

  @override
  String get pharmDetailPassive => 'Passiv';

  @override
  String get pharmDetailIncentivize => 'Rag\'batlantirish';

  @override
  String get pharmDetailRetry => 'Qayta urinish';

  @override
  String get portfolioTitle => 'Farmatsevtlar';

  @override
  String get portfolioUpdated => 'Yangilandi';

  @override
  String portfolioInPortfolio(Object total) {
    return 'portfelda $total ta';
  }

  @override
  String get portfolioSearchHint => 'Farmatsevt qidirish…';

  @override
  String portfolioTabAll(Object all) {
    return 'Barchasi ($all)';
  }

  @override
  String portfolioTabActive(Object active) {
    return 'Faollar ($active)';
  }

  @override
  String portfolioTabPassive(Object passive) {
    return 'Passivlar ($passive)';
  }

  @override
  String get portfolioNotFound => 'Farmatsevtlar topilmadi';

  @override
  String get portfolioRetry => 'Qayta urinish';

  @override
  String get medrepQuestsTitle => 'Kompaniya kvestlari';

  @override
  String get medrepQuestsEmpty => 'Kvestlar yo\'q';

  @override
  String medrepQuestsSubtitle(Object p1, Object p2) {
    return 'Maqsad: $p1 · ishtirokchilar: $p2';
  }

  @override
  String get medrepQuestsNoParticipants => 'Hozircha ishtirokchilar yo\'q';

  @override
  String get referralsAccepted => 'Ariza qabul qilindi';

  @override
  String get referralsRejected => 'Ariza rad etildi';

  @override
  String get referralsTitle => 'Referal arizalari';

  @override
  String get referralsEmpty => 'Yangi arizalar yo\'q';

  @override
  String get referralsDecline => 'Rad etish';

  @override
  String get referralsAccept => 'Qabul qilish';

  @override
  String get checkDetailBackMyChecks => 'Mening cheklarim';

  @override
  String checkDetailTitle(Object id) {
    return 'Chek №$id';
  }

  @override
  String get checkDetailRejectedFallback => 'Chek rad etildi';

  @override
  String checkDetailQuestDone(Object p1) {
    return '$p1 · Kvest bajarildi ✓';
  }

  @override
  String get checkDetailQuestAfterApproval =>
      'Chek tasdiqlangach paydo bo\'ladi';

  @override
  String get checkDetailQuestNone => 'Hozircha birorta kvestga hisoblanmagan';

  @override
  String get checkDetailChipApproved => 'Tasdiqlangan';

  @override
  String get checkDetailChipRejected => 'Rad etilgan';

  @override
  String get checkDetailChipPending => 'Tekshirilmoqda';

  @override
  String get checkDetailOpenPhoto => 'Ochish';

  @override
  String checkDetailPhotoCount(Object p1) {
    return 'surat: $p1';
  }

  @override
  String get checkDetailRejectReasonTitle => 'Rad etish sababi';

  @override
  String get checkDetailResubmit => 'Qayta yuborish';

  @override
  String get checkDetailPendingTitle => 'Tekshirilmoqda';

  @override
  String get checkDetailPendingBody =>
      'Chekingiz mutaxassis tekshiruvida. Odatda bu 24 soatgacha davom etadi.';

  @override
  String checkDetailSentAt(Object sentAt) {
    return 'Yuborilgan: $sentAt';
  }

  @override
  String get checkDetailAiWaitingTitle => 'AI tanishi kutilmoqda';

  @override
  String get checkDetailAiWaitingBody =>
      'Natija tekshiruvdan so\'ng paydo bo\'ladi';

  @override
  String get checkDetailAiTitle => 'AI tanidi';

  @override
  String checkDetailPacks(Object p1) {
    return '$p1 qadoq';
  }

  @override
  String get checkDetailQuestCardTitle => 'Kvestlarga hisoblash';

  @override
  String get checksEmpty => 'Hozircha cheklar yo\'q';

  @override
  String get checksAddedUploading => 'Chek qo\'shildi — yuklanmoqda';

  @override
  String get checksNewCheckTitle => 'Yangi chek';

  @override
  String get checksTapToAddPhoto => 'Surat qo\'shish uchun bosing';

  @override
  String get checksTakePhoto => 'Suratga olish';

  @override
  String get checksSubmitForReview => 'Tekshiruvga yuborish';

  @override
  String get checksTitle => 'Mening cheklarim';

  @override
  String checksTotalCount(Object p1) {
    return 'jami $p1';
  }

  @override
  String get checksSendPhoto => 'Surat yuborish';

  @override
  String checksCardMeta(Object p1, Object p2) {
    return '$p1 · surat: $p2';
  }

  @override
  String get checksAwaitUsually24h => 'Kuting — odatda 24 soat';

  @override
  String get checksUploadingTitle => 'Surat yuklanmoqda';

  @override
  String get checksPhotoFallback => 'Chek surati';

  @override
  String get checksRetry => 'Qayta urinish';

  @override
  String get courseDetailTabDescription => 'TAVSIF';

  @override
  String get courseDetailTabContent => 'MUNDARIJA';

  @override
  String courseDetailMinutes(Object totalMin) {
    return '~$totalMin daqiqa';
  }

  @override
  String get courseDetailContinueLearning => 'O\'QISHNI DAVOM ETTIRISH';

  @override
  String get courseDetailStartLearning => 'O\'QISHNI BOSHLASH';

  @override
  String get courseDetailVideoLessonOne => 'videodars';

  @override
  String get courseDetailVideoLessonFew => 'videodars';

  @override
  String get courseDetailVideoLessonMany => 'videodars';

  @override
  String courseDetailQuizAfterLesson(Object videosBefore) {
    return '$videosBefore-darsdan keyingi test';
  }

  @override
  String get courseDetailQuizForCourse => 'Kurs bo\'yicha test';

  @override
  String courseDetailLessonMin(Object p1) {
    return '$p1 daq';
  }

  @override
  String get courseDetailQuizBadge => 'TEST';

  @override
  String get homePhActiveQuests => 'Faol kvestlar';

  @override
  String get homePhAllQuests => 'Barcha kvestlar';

  @override
  String get homePhNoActiveQuests => 'Faol kvestlar yo\'q';

  @override
  String get homePhRecentChecks => 'So\'nggi cheklar';

  @override
  String get homePhAllChecks => 'Barcha cheklar';

  @override
  String get homePhNoChecks => 'Hozircha cheklar yo\'q';

  @override
  String get homePhGreeting => 'Salom!';

  @override
  String homePhGreetingName(Object name) {
    return 'Salom, $name!';
  }

  @override
  String get homePhGreetingSub => 'Yangi bilimlarga tayyormisiz?';

  @override
  String get homePhWalletBalanceLabel => 'HAMYON BALANSI';

  @override
  String get homePhWalletButton => 'Hamyon';

  @override
  String get homePhSendCheck => 'Chek yuborish';

  @override
  String get homePhSendCheckSub =>
      'Chekni suratga oling — AI dorilarni taniydi';

  @override
  String get homePhStatActiveQuests => 'faol kvestlar';

  @override
  String get homePhStatApprovedChecks => 'tasdiqlangan cheklar';

  @override
  String get homePhStatIqcPoints => 'IQC ball';

  @override
  String get homePhVoucherBadge => 'VAUCHER';

  @override
  String get homePhProgress => 'Jarayon';

  @override
  String homePhPctDone(Object pct) {
    return '$pct% bajarildi';
  }

  @override
  String homePhCheckNumber(Object p1) {
    return 'Chek №$p1';
  }

  @override
  String get learnLessonOne => 'dars';

  @override
  String get learnLessonFew => 'dars';

  @override
  String get learnLessonMany => 'dars';

  @override
  String get learnTitle => 'Ta\'lim';

  @override
  String get learnSearchHint => 'Kurslar bo\'yicha qidirish...';

  @override
  String get learnTabAll => 'Barchasi';

  @override
  String get learnTabMine => 'Mening kurslarim';

  @override
  String get learnTabDone => 'Tugallangan';

  @override
  String get learnNewBadge => 'YANGI';

  @override
  String get learnRepeatCourse => 'KURSNI TAKRORLASH';

  @override
  String get learnContinueLearning => 'O\'QISHNI DAVOM ETTIRISH';

  @override
  String get learnStartCourse => 'KURSNI BOSHLASH';

  @override
  String get learnCompleted => 'Tugallangan';

  @override
  String get learnNotFoundTitle => 'Kurslar topilmadi';

  @override
  String get learnTryChangeFilters => 'Filtrlarni o\'zgartirib ko\'ring';

  @override
  String learnNothingForQuery(Object query) {
    return '«$query» so\'rovi bo\'yicha hech narsa topilmadi.\nSo\'rovni o\'zgartiring yoki filtrlarni tiklang.';
  }

  @override
  String get learnResetFilters => 'Filtrlarni tiklash';

  @override
  String lessonCompletedReward(Object p1) {
    return 'Dars yakunlandi · +$p1 IQC';
  }

  @override
  String get lessonNotFound => 'Dars topilmadi';

  @override
  String get lessonTabText => 'DARS MATNI';

  @override
  String get lessonTabMaterials => 'DARS MATERIALLARI';

  @override
  String get lessonNoMaterials => 'Hozircha materiallar yo\'q';

  @override
  String get lessonStartQuiz => 'TESTNI BOSHLASH';

  @override
  String get lessonComplete => 'DARSNI YAKUNLASH';

  @override
  String get questDetailBackQuests => 'Kvestlar';

  @override
  String get questDetailPillVoucher => 'Vaucher';

  @override
  String get questDetailLeftLabel => 'qoldi';

  @override
  String get questDetailDoneLabel => 'bajarildi';

  @override
  String get questDetailRewardLabel => 'MUKOFOT';

  @override
  String get questDetailVoucherManual =>
      'Vaucher tekshiruvdan so\'ng qo\'lda beriladi';

  @override
  String questDetailIqcToBalance(Object p1) {
    return 'Balansga +$p1 IQC';
  }

  @override
  String get questDetailHowTitle => 'Cheklar qanday hisoblanadi';

  @override
  String get questDetailHowBody =>
      'Kerakli dori aks etgan chek suratlarini yuboring. Qadoq tekshiruvi — avtomatik.';

  @override
  String get questDetailTodoTitle => 'Nima qilish kerak';

  @override
  String get questDetailDrugLabel => 'Dori';

  @override
  String get questDetailLimitsLabel => 'Limitlar';

  @override
  String get questDetailPeriodLabel => 'Davr';

  @override
  String get questDetailParticipantsLabel => 'Ishtirokchilar';

  @override
  String get questDetailPurchases => 'xarid';

  @override
  String questsPeriodUntil(Object p1) {
    return '$p1 gacha';
  }

  @override
  String questsPeriodFrom(Object p1) {
    return '$p1 dan';
  }

  @override
  String get questsPeriodNone => 'Muddatsiz';

  @override
  String get questsTitle => 'Kvestlar';

  @override
  String get questsTabActive => 'Faol';

  @override
  String get questsTabArchive => 'Arxiv';

  @override
  String get questsTabAll => 'Barchasi';

  @override
  String get questsCountWordActive => 'faol';

  @override
  String get questsCountWordArchive => 'arxivdagi';

  @override
  String get questsCountQuestOne => 'kvest';

  @override
  String get questsCountQuestFew => 'kvest';

  @override
  String get questsHistoryChip => 'Ishtirok tarixi';

  @override
  String get questsSearchHint => 'Qidirish';

  @override
  String questsPacksItem(Object p1, Object p2) {
    return '$p1 × $p2 qadoq';
  }

  @override
  String questsIqcNoLimit(Object p1) {
    return '+$p1 IQC · limitsiz';
  }

  @override
  String get questsPillVoucher => 'Vaucher';

  @override
  String get questsActive => 'Faol';

  @override
  String get questsFinished => 'Yakunlangan';

  @override
  String get questsEmptyArchiveTitle => 'Arxiv kvestlari yo\'q';

  @override
  String get questsEmptyArchiveSub =>
      'Yakunlangan kvestlar shu yerda paydo bo\'ladi';

  @override
  String get questsEmptyActiveTitle => 'Faol kvestlar yo\'q';

  @override
  String get questsEmptyActiveSub => 'Yangi kvestlar shu yerda paydo bo\'ladi';

  @override
  String get questsEmptyAllTitle => 'Kvestlar yo\'q';

  @override
  String get questsEmptyAllSub => 'Keyinroq qarab ko\'ring';

  @override
  String get questsViewActive => 'Faollarni ko\'rish';

  @override
  String get quizTitle => 'Test sinovi';

  @override
  String quizQuestionOf(Object p1, Object n) {
    return 'Savol $p1 / $n';
  }

  @override
  String get quizFinish => 'TESTNI YAKUNLASH';

  @override
  String get quizNext => 'KEYINGI SAVOL →';

  @override
  String get quizAnswerLabel => 'Javob';

  @override
  String get quizCongrats => 'Tabriklaymiz!';

  @override
  String get quizPassed => 'Test muvaffaqiyatli topshirildi!';

  @override
  String get quizYouEarned => 'Siz ishlab topdingiz';

  @override
  String get quizCorrectLabel => 'TO\'G\'RI JAVOBLAR';

  @override
  String get quizResultLabel => 'NATIJA';

  @override
  String get quizToHome => 'ASOSIY EKRANGA';

  @override
  String get quizViewCertificate => 'Sertifikatni ko\'rish →';

  @override
  String get quizTryAgainTitle => 'Yana bir bor urinib ko\'ring';

  @override
  String get quizFailed => 'Test topshirilmadi';

  @override
  String get quizYourResult => 'Sizning natijangiz';

  @override
  String get quizCorrectLower => 'to\'g\'ri';

  @override
  String quizPassMinimum(Object passScore, Object total, Object passPct) {
    return 'O\'tish uchun minimum: $passScore/$total ($passPct%)';
  }

  @override
  String get quizRetry => '↺ QAYTA TOPSHIRISH';

  @override
  String get quizBackToLesson => 'Darsga qaytish →';

  @override
  String get voucherNotFound => 'Vaucher topilmadi';

  @override
  String get voucherTitle => 'Mening vaucherim';

  @override
  String get voucherCodeCopied => 'Kod nusxalandi';

  @override
  String get voucherUsed => 'Ishlatilgan';

  @override
  String get voucherActive => 'Faol';

  @override
  String voucherIssuedAt(Object p1) {
    return 'Berilgan: $p1';
  }

  @override
  String get voucherGiftCardLabel => 'UZS · SOVG\'A KARTASI';

  @override
  String get voucherShowQr => 'QR-kodni kassirga ko\'rsating yoki kodni ayting';

  @override
  String get voucherStores => 'Korzinka.uz do\'konlari';

  @override
  String get voucherSupport => 'Yordam xizmati';

  @override
  String get walletPendingVouchers => 'Navbatdagi vaucherlar';

  @override
  String get walletUseIqc => 'IQC dan foydalanish';

  @override
  String get walletMyVouchers => 'Mening vaucherlarim';

  @override
  String get walletNoVouchers => 'Hozircha vaucherlar yo\'q';

  @override
  String get walletRedeemTitle => 'Vaucherni rasmiylashtirasizmi?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 — $p2 IQC evaziga';
  }

  @override
  String get walletCancel => 'Bekor qilish';

  @override
  String get walletRedeem => 'Rasmiylashtirish';

  @override
  String get walletVoucherIssued => 'Vaucher rasmiylashtirildi';

  @override
  String get walletTitle => 'Hamyon';

  @override
  String get walletBalanceLabel => 'BALANS';

  @override
  String walletTotalAccrued(Object p1) {
    return 'Jami hisoblangan: $p1 IQC';
  }

  @override
  String get walletHistoryArrow => 'Tarix →';

  @override
  String get walletQuestDoneAwaiting =>
      'Kvest bajarildi — vaucher berilishini kutmoqda';

  @override
  String walletForIqc(Object p1) {
    return '$p1 IQC evaziga';
  }

  @override
  String get walletGetVoucher => 'Vaucher olish';

  @override
  String get walletNotEnoughIqc => 'IQC yetarli emas';

  @override
  String walletCodeMeta(Object p1, Object p2) {
    return 'Kod: $p1 · $p2';
  }

  @override
  String get walletVoucherUsed => 'Ishlatilgan';

  @override
  String get walletVoucherActive => 'Faol';

  @override
  String get walletHistoryTitle => 'Tarix';

  @override
  String get walletNoTransactions => 'Hozircha operatsiyalar yo\'q';

  @override
  String get brandProductsBrand => 'Brend';

  @override
  String get brandProductsFormat => 'Format';

  @override
  String get brandProductsMxik => 'MXIK';

  @override
  String get brandProductsDivisible => 'Bo\'linadigan';

  @override
  String get brandProductsYes => 'Ha';

  @override
  String get brandProductsNo => 'Yo\'q';

  @override
  String get brandProductsQuests => 'Kvestlar';

  @override
  String get medrepHomePeriodAll => 'Barchasi';

  @override
  String get medrepHomePeriod30d => '30 kun';

  @override
  String get medrepHomePeriod7d => '7 kun';

  @override
  String get leaderboardTabChecks => 'Cheklar';

  @override
  String get leaderboardTabPharm => 'Farmatsevtlar';

  @override
  String get leaderboardTabQuests => 'Kvestlar';

  @override
  String leaderboardMyRankLabel(Object company) {
    return '$company | Mening o\'rnim: ';
  }

  @override
  String leaderboardMyRank(Object rank, Object total) {
    return '#$rank / $total';
  }

  @override
  String portfolioChecksChip(Object count) {
    return 'Cheklar: $count';
  }

  @override
  String portfolioQuestsChip(Object count) {
    return 'Kvestlar: $count';
  }

  @override
  String referralsDate(Object date) {
    return 'Ariza: $date';
  }

  @override
  String get checksStatusApproved => 'Tasdiqlangan';

  @override
  String get checksStatusRejected => 'Rad etilgan';

  @override
  String get checksStatusPending => 'Tekshirilmoqda';

  @override
  String questDetailRewardVoucherLine(Object amount) {
    return 'Korzinka vaucheri · $amount IQC';
  }

  @override
  String get questDetailRewardIqcLine => 'Barcha dorixonalar · limitsiz';

  @override
  String questDetailActiveUntil(Object date) {
    return '$date gacha faol';
  }

  @override
  String get questDetailFinished => 'Yakunlangan';

  @override
  String questsPurchasesOfGoal(Object completed, Object goal) {
    return '$completed / $goal xarid';
  }

  @override
  String questsPurchases(Object completed) {
    return '$completed xarid';
  }

  @override
  String get profileLanguageTitle => 'Til';

  @override
  String get profileChooseLanguage => 'Tilni tanlang';

  @override
  String get navDoctors => 'Shifokorlar';

  @override
  String get doctorsTitle => 'Shifokorlar';

  @override
  String get doctorsHint =>
      'Kompaniyangiz shifokorlari va ularning blank kvesti bo‘yicha natijasi';

  @override
  String get doctorsSearchHint =>
      'Shifokor, klinika yoki shahar bo‘yicha qidirish';

  @override
  String get doctorsCompleted => 'Bajardi';

  @override
  String get doctorsInProgress => 'Jarayonda';

  @override
  String get doctorsIdle => 'Boshlamagan';

  @override
  String get doctorsNoQuest => 'Faol blank kvesti yo‘q';

  @override
  String get doctorsUnavailable =>
      'Kompaniyangizda blank loyihasi yo‘q, shuning uchun shifokorlar ulanmagan';

  @override
  String get doctorsEmpty => 'Hozircha shifokorlar yo‘q';

  @override
  String get doctorsNotFound => 'Hech narsa topilmadi';

  @override
  String get doctorsRegionUnknown => 'Hudud ko‘rsatilmagan';

  @override
  String doctorsRecipesCount(Object count) {
    return 'Barcha vaqt uchun blanklar: $count';
  }

  @override
  String doctorsQuestGoal(Object goal) {
    return 'Norma: $goal';
  }

  @override
  String doctorsDoneTimes(Object count) {
    return 'Bajarilgan ×$count';
  }

  @override
  String doctorsRegionSummary(Object doctors, Object completed) {
    return '$doctors shifokor · $completed bajardi';
  }

  @override
  String get doctorsAll => 'Barchasi';

  @override
  String get loginWithGoogle => 'Google orqali kirish';

  @override
  String get loginWithApple => 'Apple orqali kirish';

  @override
  String get oauthLinkTitle => 'Telefon raqamingizni tasdiqlang';

  @override
  String get oauthLinkBody =>
      'Raqamni bir marta tasdiqlang — shunda hisobingiz va ballaringizni topamiz. Keyingi safar bir bosishda kirasiz.';

  @override
  String get oauthLinkPhoneLabel => 'Telefon raqami';

  @override
  String get oauthLinkSendCode => 'Kodni olish';

  @override
  String oauthLinkCodeSent(String phone) {
    return 'Kod $phone raqamiga yuborildi';
  }

  @override
  String get oauthLinkCodeLabel => 'SMS kodi';

  @override
  String get oauthLinkConfirm => 'Tasdiqlash';

  @override
  String get oauthLinkChangePhone => 'Raqamni o‘zgartirish';

  @override
  String get profilePrivacy => 'Maxfiylik siyosati';

  @override
  String get profilePrivacySubtitle =>
      'Qanday ma\'lumotlarni yig\'amiz va qanday saqlaymiz';

  @override
  String get sapperRulesButton => 'Aksiya qoidalari';

  @override
  String get sapperRulesTitle => '«Super Saper» aksiyasi qoidalari';

  @override
  String get sapperRulesFull => 'To‘liq rasmiy qoidalar';

  @override
  String get sapperRulesAccept =>
      'Katakni egallash orqali siz aksiya qoidalarini qabul qilasiz.';

  @override
  String get sapperRule1 =>
      'Tashkilotchi — «PHARMIQ ACADEMY» MChJ. Apple va Google aksiya homiysi emas va unda ishtirok etmaydi.';

  @override
  String get sapperRule2 =>
      'Aksiyada pul ishlatilmaydi: faqat IQC ballari evaziga ishtirok etish mumkin.';

  @override
  String get sapperRule3 =>
      'IQC ballari ta’lim, so‘rovnomalar va tasdiqlangan kvestlar uchun beriladi. Ularni sotib olib, boshqa foydalanuvchiga o‘tkazib yoki pulga almashtirib bo‘lmaydi.';

  @override
  String get sapperRule4 =>
      'Muddatlar, katak narxi va sovrinlarning to‘liq ro‘yxati ishtirokdan oldin aksiya sahifasida ko‘rsatiladi.';

  @override
  String get sapperRule5 =>
      'Ballar katak egallanganda yechiladi, buni bekor qilib bo‘lmaydi. Bitta katakni bitta ishtirokchi egallaydi; qabul natijalardan 1 daqiqa oldin yopiladi.';

  @override
  String get sapperRule6 =>
      'Sovrinlar aksiya boshlanishidan oldin kataklarga joylashtiriladi va keyin o‘zgarmaydi. Belgilangan vaqtda barcha kataklar bir vaqtda ochiladi, katakdagi sovrinni uni egallagan ishtirokchi avtomatik oladi. Natijalar hammaga ko‘rinadi.';

  @override
  String get sapperRule7 =>
      'Sovrinlar — hamkorlarning sovg‘a vaucherlari va bonus ballar; pulga almashtirilmaydi. Egallanmagan kataklardagi sovrinlar qayta taqsimlanmaydi.';

  @override
  String get sapperRule8 =>
      'Aksiya bekor qilinsa, sarflangan barcha ballar qaytariladi. 18 yoshdan katta foydalanuvchilar ishtirok etishi mumkin, ishtirok ixtiyoriy.';

  @override
  String get stateServerErrorTitle => 'Nimadir xato ketdi';

  @override
  String get stateServerErrorText =>
      'Muammodan xabardormiz va uni tuzatyapmiz. Bir daqiqadan so\'ng qayta urinib ko\'ring';

  @override
  String get stateWriteSupport => 'Qo\'llab-quvvatlashga yozish';

  @override
  String stateErrorCode(String code) {
    return 'Xato kodi: $code';
  }

  @override
  String get stateOfflineTitle => 'Internetga ulanish yo\'q';

  @override
  String get stateOfflineText =>
      'Wi‑Fi yoki mobil internetni tekshiring. Aloqa paydo bo\'lishi bilan ekran o\'zi yangilanadi';

  @override
  String stateOfflineBanner(String time) {
    return 'Aloqa yo\'q · $time dagi ma\'lumotlar';
  }

  @override
  String get stateOfflineBannerShort => 'Aloqa yo\'q';

  @override
  String get stateOfflineSendHint =>
      'Internet paydo bo\'lganda yuborish mumkin bo\'ladi';

  @override
  String get stateRefreshing => 'Yangilanmoqda…';

  @override
  String get miniAppsNewGamesTitle => 'Yangi mini-ilovalar';

  @override
  String get miniAppsNewGamesText =>
      'Ishlab chiqilmoqda — paydo bo‘lganda xabar beramiz';

  @override
  String sapperBackTo(String label) {
    return 'Orqaga: $label';
  }

  @override
  String sapperPrizesCount(int n) {
    return '$n ta sovg‘a';
  }

  @override
  String sapperMyCellsCount(int n) {
    return 'Sizning kataklaringiz: $n';
  }

  @override
  String sapperResultsIn(String time) {
    return 'Natijalar $time dan so\'ng';
  }

  @override
  String get sapperCellPriceTitle => 'Katak narxi';

  @override
  String get sapperMyCellsTitle => 'Sizning kataklaringiz';

  @override
  String get sapperOccupiedTitle => 'Band kataklar';

  @override
  String sapperOccupiedOf(int occupied, int total) {
    return '$occupied / $total';
  }

  @override
  String sapperOfTotal(int total) {
    return '/ $total';
  }

  @override
  String get sapperHiddenLabel => 'Maydonda yashirilgan';

  @override
  String get sapperHowTitle => 'Qanday qatnashish mumkin';

  @override
  String get sapperStep1Title => 'Kataklarni tanlang';

  @override
  String sapperStep1Text(int price) {
    return 'Har biri $price IQC turadi. Bir nechtasini birdaniga band qilish mumkin';
  }

  @override
  String get sapperStep2Title => 'Natijalar e\'lon qilinishini kuting';

  @override
  String get sapperStep2Text => 'Haftada bir marta maydon hamma uchun ochiladi';

  @override
  String get sapperStep3Title => 'Sovg\'ani oling';

  @override
  String get sapperStep3Text =>
      'IQC balansga o‘tkaziladi, vaucher hamyonda paydo bo‘ladi';

  @override
  String get sapperSelectHint => 'Tanlash uchun bo‘sh kataklarni bosing';

  @override
  String sapperSelectedHint(int n, int price) {
    return 'Tanlandi: $n · $price IQC yechiladi';
  }

  @override
  String sapperTakeCta(int n, int price) {
    return '$n ta katakni band qilish · $price IQC';
  }

  @override
  String sapperTakenToast(int n) {
    return '+$n katak — natijalarni kutamiz';
  }

  @override
  String sapperReserveManyTitle(int n) {
    return '$n ta katakni band qilasizmi?';
  }

  @override
  String get sapperCellFree => 'Bo‘sh katak';

  @override
  String get sapperCellTheirs => 'Boshqa ishtirokchi band qilgan';

  @override
  String get sapperCellMine => 'Sizning katagingiz';

  @override
  String get sapperCellSelected => 'Tanlangan, bekor qilish uchun bosing';

  @override
  String get sapperCellEmpty => 'Bo‘sh';

  @override
  String sapperCellPrize(String label) {
    return 'Sovg‘a: $label';
  }

  @override
  String sapperGridLabel(int cols, int rows) {
    return '$cols × $rows maydon';
  }

  @override
  String get sapperGridRevealed => 'Ochilgan maydon';

  @override
  String sapperWonTitle(String prize) {
    return 'Siz $prize oldingiz';
  }

  @override
  String sapperWonText(int wins, int total) {
    return 'Balansda · sovg\'ali kataklar: $wins / $total';
  }

  @override
  String get sapperNotParticipated => 'Siz bu aksiyada qatnashmadingiz';

  @override
  String sapperRevealedOn(String date) {
    return 'Natijalar e\'lon qilindi · $date';
  }

  @override
  String get sapperWinnerYou => 'siz';

  @override
  String sapperWinnerCell(int n) {
    return '$n-katak';
  }

  @override
  String get sapperPlayNew => 'Yangi aksiyada qatnashish';

  @override
  String get sapperViewResults => 'Natijalarni ko‘rish';

  @override
  String get questsSubtitle => 'Soting va mukofotlar oling';

  @override
  String get questsSubtitleDoctor => 'Retsept yozing va mukofotlar oling';

  @override
  String get questsSearchLabel => 'Kvestlarni qidirish';

  @override
  String get questsTabDone => 'Yakunlangan';

  @override
  String get questsSortHint => 'Avval — mukofotga eng yaqinlari';

  @override
  String get questsAlmostDone => 'Deyarli tayyor';

  @override
  String get questsCompleted => 'Bajarildi';

  @override
  String questsOfGoalSales(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal ta sotuvdan',
    );
    return '$_temp0';
  }

  @override
  String questsOfGoalRecipes(int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal ta retseptdan',
    );
    return '$_temp0';
  }

  @override
  String questsLeftShort(int n) {
    return 'Yana $n';
  }

  @override
  String get questsMore => 'Batafsil';

  @override
  String get questsHowTitle => 'Kvestlar qanday ishlaydi';

  @override
  String get questsStepSellTitle => 'Soting';

  @override
  String get questsStepSellSub => 'dori vositasini';

  @override
  String get questsStepPrescribeTitle => 'Yozing';

  @override
  String get questsStepPrescribeSub => 'retseptni';

  @override
  String get questsStepSendTitle => 'Yuboring';

  @override
  String get questsStepSendCheckSub => 'chek suratini';

  @override
  String get questsStepSendRecipeSub => 'retsept suratini';

  @override
  String get questsStepGetTitle => 'Oling';

  @override
  String get questsStepGetSub => 'mukofotni';

  @override
  String get questsDoneFooter =>
      'Bu yerda bajarilgan va yakunlangan kvestlar sanasi va olingan mukofoti bilan saqlanadi';

  @override
  String questsDoneOn(String date) {
    return 'Bajarildi · $date';
  }

  @override
  String questsEndedOn(String date) {
    return 'Yakunlandi · $date';
  }

  @override
  String get questsEmptyDoneTitle => 'Hozircha yakunlangan kvestlar yo‘q';

  @override
  String questsMonthName(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Yanvar',
      'm2': 'Fevral',
      'm3': 'Mart',
      'm4': 'Aprel',
      'm5': 'May',
      'm6': 'Iyun',
      'm7': 'Iyul',
      'm8': 'Avgust',
      'm9': 'Sentabr',
      'm10': 'Oktabr',
      'm11': 'Noyabr',
      'm12': 'Dekabr',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get questsSalesLeftPrefix => 'Sotish qoldi:';

  @override
  String get questsRecipesLeftPrefix => 'Yozish qoldi:';

  @override
  String questsPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta qadoq',
    );
    return '$_temp0';
  }

  @override
  String questsRecipesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta retsept',
    );
    return '$_temp0';
  }

  @override
  String get questsGoalReached =>
      'Maqsadga erishildi — mukofot tekshiruvdan so‘ng beriladi';

  @override
  String get questsRewardLabel => 'Mukofot';

  @override
  String questsVoucherTitle(String shop) {
    return '$shop vaucheri';
  }

  @override
  String get questsRewardManual => 'Tekshiruvdan so‘ng qo‘lda beriladi';

  @override
  String get questsRewardIqcSub => 'Ballar tekshiruvdan so‘ng balansga tushadi';

  @override
  String get questsRewardReceived => 'Mukofot olindi';

  @override
  String questsStepSellDrug(String drug) {
    return '$drug ni soting';
  }

  @override
  String questsStepPrescribeDrug(String drug) {
    return '$drug ni yozing';
  }

  @override
  String questsNeedSell(String packs) {
    return '$packs sotish kerak';
  }

  @override
  String questsNeedPrescribe(String recipes) {
    return '$recipes yozish kerak';
  }

  @override
  String get questsStepPhotoCheck => 'Chekni suratga oling';

  @override
  String get questsStepPhotoCheckSub => 'SI qadoqni avtomatik tekshiradi';

  @override
  String get questsStepPhotoRecipe => 'Retseptni suratga oling';

  @override
  String get questsStepPhotoRecipeSub => 'SI retseptni avtomatik tekshiradi';

  @override
  String get questsStepGetVoucher => 'Vaucher oling';

  @override
  String questsStepGetIqc(int n) {
    return '$n IQC oling';
  }

  @override
  String get questsConditionsTitle => 'Shartlar';

  @override
  String get questsSalesLimit => 'Sotuv limiti';

  @override
  String get questsRecipesLimit => 'Retseptlar limiti';

  @override
  String get questsNoLimit => 'Cheklovsiz';

  @override
  String questsPacksShort(int n) {
    return '$n dona';
  }

  @override
  String get questsCountedTitle => 'Hisobga olingan cheklar';

  @override
  String get questsCountedRecipesTitle => 'Hisobga olingan retseptlar';

  @override
  String get questsCountedEmpty => 'Hozircha birorta chek yo‘q';

  @override
  String get questsCountedEmptyRecipes => 'Hozircha birorta retsept yo‘q';

  @override
  String get questsCountedEmptySub =>
      'Kvest bo‘yicha cheklar tekshiruvdan so‘ng shu yerda paydo bo‘ladi';

  @override
  String get questsCountedEmptySubRecipes =>
      'Kvest bo‘yicha retseptlar tekshiruvdan so‘ng shu yerda paydo bo‘ladi';

  @override
  String questsCountedSales(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta sotuv hisobga olindi',
    );
    return '$_temp0';
  }

  @override
  String questsCountedRecipes(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta retsept hisobga olindi',
    );
    return '$_temp0';
  }

  @override
  String get questsAllChecks => 'Barcha cheklar';

  @override
  String get questsAllRecipes => 'Barcha retseptlar';

  @override
  String get questsSendCheck => 'Kvest bo‘yicha chek yuborish';

  @override
  String get questsSendRecipe => 'Kvest bo‘yicha retsept yuborish';

  @override
  String get questsSearchPlaceholder => 'Nomi yoki dori vositasi';

  @override
  String get questsSearchClear => 'Tozalash';

  @override
  String questsFound(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta kvest topildi',
    );
    return '$_temp0';
  }

  @override
  String get questsPopular => 'Ko‘p qidiriladi';

  @override
  String get questsNothingFound => 'Hech narsa topilmadi';

  @override
  String get questsNothingFoundSub =>
      'Dori nomini tekshiring yoki boshqa so‘rovni sinab ko‘ring';

  @override
  String get questsReceived => 'olindi';

  @override
  String get questsPending => 'kutilmoqda';

  @override
  String get walletAccruedAllTime => 'jami hisoblangan';

  @override
  String walletAwaitingStat(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'vaucher berilishini kutmoqda',
      one: 'vaucher berilishini kutmoqda',
    );
    return '$_temp0';
  }

  @override
  String get walletArchive => 'Arxiv';

  @override
  String get walletArchiveTitle => 'Vaucherlar arxivi';

  @override
  String get walletTapCardHint => 'Kartani bosing — QR-kodni ko\'rsatamiz';

  @override
  String get walletAllArchivedTitle => 'Barcha vaucherlar arxivda';

  @override
  String get walletAllArchivedText =>
      'Yangilari kvestlar bajarilgandan so\'ng paydo bo\'ladi';

  @override
  String get walletGiftCard => 'Sovg\'a kartasi';

  @override
  String get walletGiftCardBoth => 'SOVG\'A KARTASI · ПОДАРОЧНАЯ КАРТА';

  @override
  String get walletGiftCardKorzinka => 'Korzinka sovg\'a kartasi';

  @override
  String get walletReceived => 'Olingan';

  @override
  String get walletCode => 'Kod';

  @override
  String get walletShowQr => 'Ko\'rsatish';

  @override
  String get walletStatusLabel => 'Holat';

  @override
  String get walletWhere => 'Qayerda';

  @override
  String get walletStatusArchived => 'Arxivda';

  @override
  String get walletAwaitingTitle => 'Berilishini kutmoqda';

  @override
  String walletQuestDoneOn(String date) {
    return 'Kvest bajarildi · $date';
  }

  @override
  String walletPcs(int n) {
    return '$n dona';
  }

  @override
  String walletVouchersCaption(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'vaucher',
      one: 'vaucher',
    );
    return '$_temp0';
  }

  @override
  String get walletManualHint =>
      'Vaucherlar tekshiruvdan so\'ng qo\'lda beriladi — odatda bir necha kun ichida';

  @override
  String walletShowAll(int n) {
    return 'Hammasini ko\'rsatish ($n)';
  }

  @override
  String get walletExchangeTitle => 'IQC almashtirish';

  @override
  String get walletShopTitle => 'IQC almashinuvi';

  @override
  String walletProgressOf(String have, String need) {
    return '$have / $need IQC';
  }

  @override
  String walletMore(String n) {
    return 'Yana $n';
  }

  @override
  String get walletSaveUp => 'Almashtirish uchun IQC to\'plang';

  @override
  String walletExchangeFor(String amount) {
    return '$amount IQC evaziga almashtirish';
  }

  @override
  String walletOpenVoucher(String sum) {
    return '$sum vaucherini ochish';
  }

  @override
  String get walletClose => 'Yopish';

  @override
  String get walletVoucherDialog => 'Korzinka vaucheri';

  @override
  String get walletArchiveUsed => 'Arxivga — vaucher ishlatildi';

  @override
  String walletArchivedToast(String code) {
    return '••$code vaucheri arxivda';
  }

  @override
  String get walletUndo => 'Bekor qilish';

  @override
  String get walletBack => 'Orqaga';

  @override
  String get walletBackToWallet => 'Hamyonga qaytish';

  @override
  String walletArchiveSummary(int n, String sum) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vaucher',
      one: '$n vaucher',
    );
    return '$_temp0 · $sum';
  }

  @override
  String get walletRestore => 'Qaytarish';

  @override
  String walletRestoreA11y(String code) {
    return '••$code vaucherini qaytarish';
  }

  @override
  String get walletRestoreHint =>
      'Agar vaucherni xato bilan olib tashlagan bo\'lsangiz, «Qaytarish»ni bosing — u yana hamyonda paydo bo\'ladi';

  @override
  String get walletArchiveEmptyTitle => 'Arxiv bo\'sh';

  @override
  String get walletArchiveEmptyText =>
      'Vaucherni ishlatdingizmi? Uni shu yerga olib qo\'ying — hamyonda faqat amaldagilari qoladi';

  @override
  String walletReceivedMeta(String date, String code) {
    return 'Olingan $date · kod ••$code';
  }

  @override
  String get walletHistoryAll => 'Barchasi';

  @override
  String get walletHistoryEarned => 'Hisoblashlar';

  @override
  String get walletHistorySpent => 'Yechib olishlar';

  @override
  String get walletEarnedMonth => 'Shu oyda hisoblangan';

  @override
  String get walletSpentMonth => 'Shu oyda sarflangan';

  @override
  String get walletMonths =>
      'Yanvar,Fevral,Mart,Aprel,May,Iyun,Iyul,Avgust,Sentabr,Oktabr,Noyabr,Dekabr';

  @override
  String get walletAccrued => 'hisoblandi';

  @override
  String get walletDebited => 'yechildi';

  @override
  String get walletTxnCheck => 'Chek';

  @override
  String get walletTxnRecipe => 'Retsept';

  @override
  String get walletTxnSurvey => 'So\'rovnoma';

  @override
  String get walletTxnQuest => 'Kvest bajarildi';

  @override
  String get walletTxnCourse => 'Kurs tugallandi';

  @override
  String get walletTxnRedeem => 'Vaucherga almashtirish';

  @override
  String get walletTxnReversal => 'Qaytarish';

  @override
  String get walletTxnAdjust => 'Tuzatish';

  @override
  String get walletTxnOther => 'Hisoblash';

  @override
  String walletQueueQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kvest',
      one: '$n kvest',
    );
    return '$_temp0';
  }

  @override
  String walletQueueVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vaucher berilishini kutmoqda',
      one: '$n vaucher berilishini kutmoqda',
    );
    return '$_temp0';
  }

  @override
  String get walletStepDone => 'Kvest bajarildi';

  @override
  String get walletStepReview => 'Tekshiruv';

  @override
  String get walletStepIssue => 'Berish';

  @override
  String get walletQueueHint =>
      'Vaucherlar tekshiruvdan so\'ng qo\'lda beriladi — odatda bir necha kun ichida. Vaucher hamyonda paydo bo\'lganda xabar yuboramiz';

  @override
  String get walletQueueEmptyTitle => 'Navbat bo\'sh';

  @override
  String get walletQueueEmptyText =>
      'Vaucher mukofotli kvestni bajaring — u berilgunga qadar shu yerda ko\'rinadi';

  @override
  String get walletYourBalance => 'Sizning balansingiz';

  @override
  String walletEnoughFor(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vaucherga yetadi',
      one: '$n vaucherga yetadi',
      zero: 'Hozircha vaucherga yetmaydi',
    );
    return '$_temp0';
  }

  @override
  String get walletShopNote =>
      'Vaucher almashinuv tasdiqlangandan so\'ng hamyonda paydo bo\'ladi';

  @override
  String walletConfirmTitle(String amount) {
    return '$amount IQC almashtirilsinmi?';
  }

  @override
  String walletConfirmText(String sum) {
    return '$sum miqdoridagi Korzinka sovg\'a kartasini oling';
  }

  @override
  String get walletWillDebit => 'Yechiladi';

  @override
  String get walletWillRemain => 'Qoladi';

  @override
  String get walletWhereTo => 'Qayerga keladi';

  @override
  String get walletToWallet => 'Hamyonga';

  @override
  String get walletExchange => 'Almashtirish';

  @override
  String get walletExchangeFailed => 'IQC almashtirib bo\'lmadi';

  @override
  String get walletShare => 'Vaucher bilan ulashish';

  @override
  String get walletCopyCode => 'Kodni nusxalash';

  @override
  String get walletQrLabel => 'Vaucher QR-kodi';

  @override
  String get walletShowQrCashier =>
      'QR-kodni kassirga ko\'rsating yoki kodni ayting';

  @override
  String get walletStores => 'Korzinka do\'konlari';

  @override
  String get walletToArchive => 'Arxivga';

  @override
  String get walletToArchiveHint =>
      'Vaucherni ishlatdingizmi? Uni arxivga olib qo\'ying — u tarixda qoladi';

  @override
  String get walletRestoreFromArchive => 'Arxivdan qaytarish';

  @override
  String get learnSubtitle => 'Kurslardan o‘ting — IQC oling';

  @override
  String get learnSearchA11y => 'Kurslarni qidirish';

  @override
  String get learnSearchPlaceholder => 'Kurs yoki brend nomi';

  @override
  String get learnSearchClear => 'Tozalash';

  @override
  String get learnSegNew => 'Yangi';

  @override
  String get learnSegProgress => 'Jarayonda';

  @override
  String get learnSegDone => 'Tugatilgan';

  @override
  String learnTileVideo(int n) {
    return '$n ta videodars';
  }

  @override
  String learnTileQuiz(int n) {
    return '$n ta test';
  }

  @override
  String get learnTileReward => 'Mukofot';

  @override
  String learnMinutesShort(int n) {
    return '~$n daq';
  }

  @override
  String get learnQuizStatusLocked => 'Yopiq';

  @override
  String get learnQuizStatusOpen => 'Ochiq';

  @override
  String learnIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get learnCtaStart => 'Kursni boshlash';

  @override
  String get learnCtaContinue => 'Davom etish';

  @override
  String get learnCtaRepeat => 'Qayta o‘tish';

  @override
  String learnProgressLabel(int pct) {
    return '$pct% bajarildi';
  }

  @override
  String get learnEmptyTitle => 'Hozircha kurslar yo‘q';

  @override
  String get learnEmptyText =>
      'Dorixonangiz uchun kurslar hali qo‘shilmagan. Yangi kurs paydo bo‘lishi bilan xabar yuboramiz';

  @override
  String get learnEnableNotifications => 'Bildirishnomalarni yoqish';

  @override
  String get learnNoResultsTitle => 'Hech narsa topilmadi';

  @override
  String learnNoResultsInTab(String query, String tab) {
    return '«$tab» bo‘limida «$query» so‘rovi bo‘yicha kurslar yo‘q. Imloni tekshiring yoki barcha kurslardan qidiring';
  }

  @override
  String learnNoResultsAll(String query) {
    return '«$query» so‘rovi bo‘yicha kurslar yo‘q. Imloni tekshiring yoki boshqa nom bilan urinib ko‘ring';
  }

  @override
  String get learnSearchEverywhere => 'Barcha kurslardan qidirish';

  @override
  String get learnTabEmptyTitle => 'Bu yerda hozircha bo‘sh';

  @override
  String get learnTabEmptyNew =>
      'Barcha kurslar boshlangan — «Jarayonda» bo‘limida o‘qishni davom ettiring';

  @override
  String get learnTabEmptyProgress =>
      '«Yangi» bo‘limidan istalgan kursni boshlang — u shu yerda paydo bo‘ladi';

  @override
  String get learnTabEmptyDone =>
      'Tugatilgan kurslar testdan muvaffaqiyatli o‘tgach shu yerda paydo bo‘ladi';

  @override
  String get learnBack => 'Orqaga';

  @override
  String get learnCourseTitle => 'Kurs';

  @override
  String learnMetaVideos(int n) {
    return '$n ta videodars';
  }

  @override
  String learnMetaMinutes(int n) {
    return '~$n daqiqa';
  }

  @override
  String get learnProgram => 'Kurs dasturi';

  @override
  String get learnRowVideo => 'Videodars';

  @override
  String get learnRowQuiz => 'Test';

  @override
  String get learnRowQuizLocked => 'Videodan so‘ng ochiladi';

  @override
  String get learnRowRewardPending => 'Testdan so‘ng hisoblaymiz';

  @override
  String get learnRowRewardDone => 'Hisoblandi';

  @override
  String learnLessonOf(int i, int n) {
    return '$n tadan $i-dars';
  }

  @override
  String get learnLessonTabText => 'Dars matni';

  @override
  String get learnLessonTabMaterials => 'Materiallar';

  @override
  String get learnWatchVideo => 'Videoni ko‘rish';

  @override
  String get learnVideoUnavailable => 'Video mavjud emas';

  @override
  String get learnLessonHintLocked =>
      'Videoni oxirigacha ko‘ring — so‘ng test ochiladi';

  @override
  String get learnLessonHintFinish =>
      'Videoni ko‘rdingizmi? Davom etish uchun darsni yakunlang';

  @override
  String get learnStartTest => 'Testni boshlash';

  @override
  String get learnNextLesson => 'Keyingi dars';

  @override
  String get learnFinishLesson => 'Darsni yakunlash';

  @override
  String get learnFinishingLesson => 'Saqlanmoqda…';

  @override
  String get learnBackToCourse => 'Kursga';

  @override
  String learnTestTopBar(String name) {
    return 'Test · $name';
  }

  @override
  String learnQuestionOf(String i, int n) {
    return '$n tadan $i-savol';
  }

  @override
  String get learnNext => 'Keyingisi';

  @override
  String get learnFinishTest => 'Testni yakunlash';

  @override
  String get learnSubmitting => 'Tekshirilmoqda…';

  @override
  String get learnCoursePassed => 'Kurs tugatildi!';

  @override
  String get learnTestPassed => 'Test topshirildi!';

  @override
  String get learnPassedText =>
      'Ajoyib natija. Ballar allaqachon balansingizda.';

  @override
  String get learnPassedTextNoReward => 'Ajoyib natija!';

  @override
  String learnScoreOf(int score, int total) {
    return '$total tadan $score';
  }

  @override
  String get learnCorrectAnswers => 'to‘g‘ri javob';

  @override
  String get learnOpenWallet => 'Hamyonni ochish';

  @override
  String get learnToOtherCourses => 'Boshqa kurslarga';

  @override
  String get learnContinueCourse => 'Kursni davom ettirish';

  @override
  String get learnFailedTitle => 'Oz qoldi';

  @override
  String get learnFailedText =>
      'To‘g‘ri javoblar yetarli emas. Darsni qayta ko‘ring va yana urinib ko‘ring — ballar sizni kutmoqda.';

  @override
  String learnRewardStillAvailable(int n) {
    return '+$n IQC hali ham mavjud';
  }

  @override
  String get learnCanRetry => 'Testni qayta topshirish mumkin';

  @override
  String get learnRewatchLesson => 'Darsni qayta ko‘rish';

  @override
  String get learnRetryTest => 'Testni qayta topshirish';

  @override
  String rxHomeGreeting(String name) {
    return 'Salom, $name!';
  }

  @override
  String get rxHomeSubtitle => 'Blanklarni yuboring va mukofotlar oling';

  @override
  String get rxHomeBellLabel => 'Bildirishnomalar';

  @override
  String get rxHomeBellUnread => 'Bildirishnomalar, yangilari bor';

  @override
  String rxHomeStatQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'faol kvest',
    );
    return '$_temp0';
  }

  @override
  String get rxHomeStatApproved => 'tasdiqlangan blank';

  @override
  String get rxHomeStatPending => 'tekshiruvda';

  @override
  String get rxHomeRecent => 'So\'nggi blanklar';

  @override
  String get rxHomeAllRecipes => 'Barcha blanklar';

  @override
  String rxQuestProgress(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$goal ta blank',
    );
    return '$done / $_temp0';
  }

  @override
  String rxQuestLeft(int n) {
    return 'Yana $n';
  }

  @override
  String rxQuestDone(int pct) {
    return 'Bajarildi $pct%';
  }

  @override
  String rxRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String get rxRewardVoucher => 'Vaucher';

  @override
  String get rxWaitValue => '~24 soat';

  @override
  String get rxWaitCaption => 'kutilmoqda';

  @override
  String get rxSoon => 'Tez orada';

  @override
  String get rxSoonCaption => 'hisoblash';

  @override
  String get rxRetake => 'Qayta suratga olish';

  @override
  String get rxRetakeRecipe => 'Blankni qayta suratga olish';

  @override
  String rxMeta(String date, int n) {
    return '$date · $n ta surat';
  }

  @override
  String rxListCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta blank',
    );
    return '$_temp0';
  }

  @override
  String get rxTabPending => 'Tekshiruvda';

  @override
  String get rxTabDone => 'Yakunlangan';

  @override
  String get rxFilterEmpty => 'Bu bo\'limda hozircha blanklar yo\'q';

  @override
  String get rxPendingHint => '24 soatgacha tekshiramiz';

  @override
  String get rxRejectedDefault => 'Blank tekshiruvdan o\'tmadi';

  @override
  String get rxEmptyTitle => 'Blanklaringiz shu yerda paydo bo\'ladi';

  @override
  String get rxEmptyText =>
      'Yozilgan blankni suratga oling — AI dorilarni taniydi, tekshiruvdan so\'ng IQC olasiz';

  @override
  String get rxHowTo => 'Qanday suratga olish kerak';

  @override
  String get rxTipWholeTitle => 'Blank to\'liq';

  @override
  String get rxTipWholeText => 'Varaqning barcha chetlari kadrda';

  @override
  String get rxTipStampTitle => 'Muhr va imzo';

  @override
  String get rxTipStampText => 'Ularsiz blank qabul qilinmaydi';

  @override
  String get rxTipLightTitle => 'Yaxshi yorug\'lik';

  @override
  String get rxTipLightText => 'Yaltirash va telefon soyasisiz';

  @override
  String get rxSendFirst => 'Birinchi blankni yuborish';

  @override
  String get rxStatePendingTitle => 'Blank tekshiruvda';

  @override
  String get rxStatePendingText =>
      'Mutaxassis blankni tekshirmoqda. Odatda bu 24 soatgacha davom etadi';

  @override
  String get rxStateApprovedTitle => 'Blank tasdiqlandi';

  @override
  String get rxStateApprovedText =>
      'Hammasi joyida. IQC tez orada balansga tushadi';

  @override
  String get rxStateRejectedTitle => 'Blank rad etildi';

  @override
  String get rxStateRejectedHint =>
      'Blankni yaxshi yorug\'likda to\'liq suratga oling — ballarni hali olish mumkin';

  @override
  String get rxStepSent => 'Yuborildi';

  @override
  String get rxStepReview => 'Tekshiruv';

  @override
  String get rxStepApproved => 'Tasdiqlandi';

  @override
  String get rxStepCredited => 'Hisoblandi';

  @override
  String get rxStepRejected => 'Rad etildi';

  @override
  String get rxPhotos => 'Blank surati';

  @override
  String rxOpenPhoto(int n) {
    return 'Blankning $n-suratini ochish';
  }

  @override
  String get rxAiLater =>
      'Dorilar ro\'yxati tekshiruvdan so\'ng paydo bo\'ladi';

  @override
  String get rxAccrual => 'Hisoblash';

  @override
  String get rxAccrualPendingTitle => 'Tasdiqlangandan so\'ng hisoblaymiz';

  @override
  String get rxAccrualPendingText => 'Blank tasdiqlangandan so\'ng';

  @override
  String get rxAccrualApprovedTitle => 'Hisoblash kutilmoqda';

  @override
  String get rxQuests => 'Kvestlarga hisoblash';

  @override
  String get rxQuestsPending => 'Blank tasdiqlangandan so\'ng paydo bo\'ladi';

  @override
  String get rxQuestsNone => 'Hozircha birorta kvestga hisoblanmagan';

  @override
  String get rxData => 'Blank ma\'lumotlari';

  @override
  String get rxShowText => 'Tanib olingan matnni ko\'rsatish';

  @override
  String get rxSupport => 'Blank bo\'yicha savol bormi? Bizga yozing';

  @override
  String get rxCameraClose => 'Yopish';

  @override
  String get rxCameraLabel => 'Blank';

  @override
  String get rxCameraTip => 'Muhr va imzo ko\'rinib turishi kerak';

  @override
  String get rxCameraHold => 'Telefonni blank ustida tekis tuting';

  @override
  String get rxCameraShoot => 'Suratga olish';

  @override
  String get rxCameraDenied => 'Kameraga ruxsat yo\'q. Uni sozlamalarda yoqing';

  @override
  String get rxOcrTitle => 'Tanib olingan matn';

  @override
  String get rxOcrSubtitle => 'AI blank suratini shunday o\'qidi';

  @override
  String get rxOcrNote =>
      'Bemorning F.I.Sh. yashirilgan. Matn avtomatik tanib olingan — xatolar bo\'lishi mumkin';

  @override
  String get rxOcrEmpty => 'Matn hali tanib olinmagan';

  @override
  String get rxOcrEmptyText =>
      'U surat qayta ishlangandan so\'ng shu yerda paydo bo\'ladi';

  @override
  String get rxCopy => 'Nusxalash';

  @override
  String get rxCopied => 'Matn nusxalandi';

  @override
  String get rxReportError => 'Matnda xato';

  @override
  String get rxBack => 'Orqaga';

  @override
  String get homeBellUnread => 'Bildirishnomalar, yangilari bor';

  @override
  String homeStatActiveQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'faol kvest',
      one: 'faol kvest',
    );
    return '$_temp0';
  }

  @override
  String get homeStatApproved => 'tasdiqlangan chek';

  @override
  String get homeStatPending => 'tekshiruvda';

  @override
  String homeQuestSales(int done, int goal) {
    String _temp0 = intl.Intl.pluralLogic(
      goal,
      locale: localeName,
      other: '$done / $goal ta sotuv',
      one: '$done / $goal ta sotuv',
    );
    return '$_temp0';
  }

  @override
  String homeQuestLeft(int n) {
    return 'Yana $n';
  }

  @override
  String get homeQuestDone => 'Bajarildi';

  @override
  String homeRewardIqc(int n) {
    return '+$n IQC';
  }

  @override
  String homeCheckMeta(int id, String date) {
    return '№$id · $date';
  }

  @override
  String get homeCheckWait => '~24 soat';

  @override
  String get homeCheckWaitCaption => 'kutilmoqda';

  @override
  String get homeCheckRetake => 'Qayta suratga olish';

  @override
  String get homeMiniAppsSub => 'Saper va boshqa aksiyalar';

  @override
  String get homeNewTitle => 'Xush kelibsiz!';

  @override
  String get homeNewSubtitle => 'Uch qadam — va siz dasturdasiz';

  @override
  String get homeNewStepsLabel => 'Birinchi qadamlar';

  @override
  String homeNewStepsCount(int done, int total) {
    return '$done / $total';
  }

  @override
  String get homeNewHeadline => 'Birinchi chekni yuboring va IQC oling';

  @override
  String get homeNewStepRegister => 'Ro\'yxatdan o\'tish';

  @override
  String get homeNewStepDone => 'Tayyor';

  @override
  String get homeNewStepCheck => 'Birinchi chekni yuboring';

  @override
  String get homeNewStepCheckSub => 'Dorixona chekini suratga oling';

  @override
  String get homeNewStepCourse => 'Birinchi kursni o\'ting';

  @override
  String homeNewStepCourseReward(int iqc, String title) {
    return '«$title» uchun +$iqc IQC';
  }

  @override
  String homeNewStepCourseSub(String title) {
    return '«$title» kursi';
  }

  @override
  String get homeNewStepCourseAny => 'Kurslar — «Ta\'lim» bo\'limida';

  @override
  String get homeNewSendFirst => 'Birinchi chekni yuborish';

  @override
  String get homeNewCourseSection => 'Kursdan boshlang';

  @override
  String get homeNewAllCourses => 'Barcha kurslar';

  @override
  String homeNewCourseLessons(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta dars',
      one: '$n ta dars',
    );
    return '$_temp0';
  }

  @override
  String homeNewCourseMinutes(int n) {
    return '~$n daq';
  }

  @override
  String get homeNewQuestSection => 'Boshlash uchun kvest';

  @override
  String homeNewQuestGoal(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta qadoq soting',
      one: '$n ta qadoq soting',
    );
    return '$_temp0';
  }

  @override
  String get homeNewQuestIqc => 'IQC balansga';

  @override
  String get homeNewQuestVoucher => 'bajarish uchun vaucher';

  @override
  String get homeNewHint =>
      'Balans, vaucherlar va mini-ilovalar birinchi IQC dan keyin paydo bo\'ladi';

  @override
  String get newsBack => 'Orqaga';

  @override
  String get newsBackToList => 'Yangiliklarga qaytish';

  @override
  String newsReadTime(int n) {
    return '$n daqiqa o\'qish';
  }

  @override
  String get newsEmptyText =>
      'Bu yerda dastur yangiliklari va foydali materiallar paydo bo\'ladi';

  @override
  String get surveyYourAnswer => 'Javobingiz';

  @override
  String surveySubmitReward(int n) {
    return 'Javob berish va $n IQC olish';
  }

  @override
  String get surveyWriteHint => 'Yuborish uchun javob yozing';

  @override
  String get surveyRatingLabel => 'Baho';

  @override
  String surveyRatingOf(int n, int max) {
    return '$n / $max';
  }

  @override
  String get surveyRatingWords => 'Yomon,O\'rtacha emas,Normal,Yaxshi,A\'lo';

  @override
  String surveyReward(int n) {
    return '+$n IQC';
  }

  @override
  String get surveyOnBalance => 'allaqachon balansingizda';

  @override
  String get surveySendFailed =>
      'Javobni yuborib bo\'lmadi. Qayta urinib ko\'ring';

  @override
  String medrepHelloName(String name) {
    return 'Salom, $name!';
  }

  @override
  String get medrepAttrShared => 'umumiy atributsiya';

  @override
  String get medrepAttrPrimary => 'birlamchi atributsiya';

  @override
  String get medrepPeriodAll => 'Butun davr';

  @override
  String get medrepPeriod30 => '30 kun';

  @override
  String get medrepPeriod7 => '7 kun';

  @override
  String medrepUnitPharm(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'farmatsevt',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitChecks(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: 'chek');
    return '$_temp0';
  }

  @override
  String medrepUnitPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'qadoq',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuestsDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'kvest bajarildi',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'kvest',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPharmacies(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'dorixona',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitPharmacists(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'provizor',
    );
    return '$_temp0';
  }

  @override
  String medrepUnitChecksAllTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ta chek butun davrda',
    );
    return '$_temp0';
  }

  @override
  String medrepCountChecks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta chek',
    );
    return '$_temp0';
  }

  @override
  String medrepCountPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta qadoq',
    );
    return '$_temp0';
  }

  @override
  String medrepCountQuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta kvest',
    );
    return '$_temp0';
  }

  @override
  String medrepCountMedreps(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta medpred',
    );
    return '$_temp0';
  }

  @override
  String medrepCountPharmacists(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta provizor',
    );
    return '$_temp0';
  }

  @override
  String medrepCountChains(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta tarmoq',
    );
    return '$_temp0';
  }

  @override
  String medrepPharmaciesInPortfolio(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'portfelda $n ta dorixona',
    );
    return '$_temp0';
  }

  @override
  String get medrepRatingByChecks => 'Cheklar bo\'yicha reyting';

  @override
  String get medrepRatingAll => 'Butun reyting';

  @override
  String medrepPlace(int n) {
    return '$n-o\'rin';
  }

  @override
  String medrepOutOf(int n) {
    return '$n tadan';
  }

  @override
  String medrepGapTo(int place) {
    return '$place-o\'ringacha yana';
  }

  @override
  String get medrepLeader => 'Siz reyting yetakchisisiz';

  @override
  String get medrepMostActive => 'Eng faollar';

  @override
  String medrepAllN(int n) {
    return 'Barchasi $n';
  }

  @override
  String get medrepInviteTitle => 'Provizorni taklif qilish';

  @override
  String get medrepInviteText =>
      'Havolani yuboring — ro\'yxatdan o\'tgach, provizor portfelingizga tushadi';

  @override
  String get medrepCopyLink => 'Havolani nusxalash';

  @override
  String get medrepPendingSub => 'Havola orqali o\'tgan provizorlar';

  @override
  String get medrepCompaniesSub => 'Portfeldagi dorixona tarmoqlari';

  @override
  String get medrepDoctorsSub => 'Blankalar kvesti bo\'yicha jarayon';

  @override
  String get medrepEmptyTitle => 'Portfel hozircha bo\'sh';

  @override
  String get medrepEmptyText =>
      'Provizorlarni havola orqali taklif qiling — ularning cheklari va statistikasi shu yerda paydo bo\'ladi';

  @override
  String get medrepStep1Title => 'Havolani yuboring';

  @override
  String get medrepStep1Text => 'Telegram yoki SMS orqali';

  @override
  String get medrepStep2Title => 'Provizor ro\'yxatdan o\'tadi';

  @override
  String get medrepStep2Text => 'U darhol portfelingizga tushadi';

  @override
  String get medrepStep3Title => 'Cheklarni kuzating';

  @override
  String get medrepStep3Text => 'Statistika shu yerda paydo bo\'ladi';

  @override
  String get medrepUpdatedNow => 'Hozir yangilandi';

  @override
  String get medrepSearchHint => 'Ism, dorixona yoki shahar';

  @override
  String get medrepFilterAll => 'Barchasi';

  @override
  String get medrepFilterActive => 'Faollar';

  @override
  String get medrepFilterPassive => 'Passivlar';

  @override
  String get medrepFilterFinished => 'Yakunlanganlar';

  @override
  String get medrepFilterApproved => 'Tasdiqlangan';

  @override
  String get medrepFilterRejected => 'Rad etilgan';

  @override
  String get medrepClear => 'Tozalash';

  @override
  String get medrepNotFoundTitle => 'Hech kim topilmadi';

  @override
  String medrepNotFoundText(String query) {
    return '«$query» so\'rovi bo\'yicha provizorlar yo\'q. Yozilishini tekshiring yoki dorixona nomi bo\'yicha qidiring';
  }

  @override
  String medrepNotFoundShort(String query) {
    return '«$query» so\'rovi bo\'yicha hech narsa yo\'q. Yozilishini tekshiring';
  }

  @override
  String get medrepResetSearch => 'Qidiruvni tozalash';

  @override
  String get medrepChecksAllTime => 'Butun davrdagi cheklar';

  @override
  String get medrepLastActivity => 'faollik';

  @override
  String get medrepAllChecks => 'Barcha cheklar';

  @override
  String medrepCheckNo(int id) {
    return 'Chek №$id';
  }

  @override
  String medrepPacksShort(int n) {
    return '$n qad.';
  }

  @override
  String get medrepPacksUnit => 'qad.';

  @override
  String get medrepLast7Days => 'Oxirgi 7 kun';

  @override
  String medrepMonthYear(String month, String year) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'm1': 'Yanvar',
      'm2': 'Fevral',
      'm3': 'Mart',
      'm4': 'Aprel',
      'm5': 'May',
      'm6': 'Iyun',
      'm7': 'Iyul',
      'm8': 'Avgust',
      'm9': 'Sentabr',
      'm10': 'Oktabr',
      'm11': 'Noyabr',
      'm12': 'Dekabr',
      'other': '',
    });
    return '$_temp0 $year';
  }

  @override
  String get medrepTabChecks => 'Cheklar';

  @override
  String get medrepTabPharm => 'Farmatsevtlar';

  @override
  String get medrepTabQuests => 'Kvestlar';

  @override
  String medrepYouName(String name) {
    return 'Siz · $name';
  }

  @override
  String get medrepYouShort => 'SIZ';

  @override
  String medrepGapText(int place, String value) {
    return '$place-o\'ringacha yana $value';
  }

  @override
  String get medrepNotRankedTitle => 'Siz hozircha reytingda yo\'qsiz';

  @override
  String get medrepNotRankedText =>
      'O\'rin provizorlaringiz cheklari bo\'yicha hisoblanadi. Birinchisini taklif qiling — va siz ro\'yxatda paydo bo\'lasiz';

  @override
  String get medrepRatingEmpty => 'Reyting hozircha bo\'sh';

  @override
  String get medrepQuestsSub => 'Provizorlaringiz natijalari';

  @override
  String get medrepQuestRunning => 'Davom etmoqda';

  @override
  String medrepQuestRunningUntil(String date) {
    return 'Davom etmoqda · $date gacha';
  }

  @override
  String get medrepQuestFinished => 'Yakunlangan';

  @override
  String medrepQuestFinishedOn(String date) {
    return '$date yakunlangan';
  }

  @override
  String medrepOfN(int a, int b) {
    return '$b dan $a';
  }

  @override
  String get medrepParticipating => 'provizor qatnashmoqda';

  @override
  String medrepSoldOf(int n) {
    return '$n tadan sotildi';
  }

  @override
  String medrepOfPacks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta qadoqdan',
    );
    return '$_temp0';
  }

  @override
  String medrepGoalPercent(int p) {
    return 'maqsadning $p%';
  }

  @override
  String medrepPacksLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'yana $n ta qadoq qoldi',
    );
    return '$_temp0';
  }

  @override
  String get medrepGoalDone => 'Maqsad bajarildi';

  @override
  String get medrepStatParticipating => 'qatnashmoqda';

  @override
  String get medrepStatCompleted => 'bajardi';

  @override
  String get medrepStatIdle => 'boshlamadi';

  @override
  String get medrepPharmacistsSection => 'Provizorlar';

  @override
  String medrepDoneOf(int a, int b) {
    return 'Bajardi · $b dan $a';
  }

  @override
  String medrepMoreRows(int n, int packs) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Yana $n ta provizor · $packs qad.',
    );
    return '$_temp0';
  }

  @override
  String get medrepShow => 'Ko\'rsatish';

  @override
  String get medrepHide => 'Yig\'ish';

  @override
  String get medrepPendingText =>
      'Havolangiz orqali o\'tishdi va ularni portfelga qo\'shishingizni kutishmoqda';

  @override
  String medrepFollowedLink(String ago) {
    return 'Havola orqali o\'tdi · $ago';
  }

  @override
  String get medrepAgoNow => 'hozirgina';

  @override
  String medrepAgoMinutes(int n) {
    return '$n daqiqa oldin';
  }

  @override
  String medrepAgoHours(int n) {
    return '$n soat oldin';
  }

  @override
  String get medrepAgoYesterday => 'kecha';

  @override
  String medrepAgoDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kun oldin',
    );
    return '$_temp0';
  }

  @override
  String get medrepChainsTitle => 'Dorixona tarmoqlari';

  @override
  String get medrepChainSearchHint => 'Tarmoq nomi';

  @override
  String medrepChainMeta(String city, int a, int p) {
    return '$city · $a dor. · $p prov.';
  }

  @override
  String get medrepChainKind => 'dorixona tarmog\'i';

  @override
  String get medrepPharmaciesSection => 'Dorixonalar';

  @override
  String get medrepMakers => 'Ishlab chiqaruvchi kompaniyalar';

  @override
  String medrepRewardTitle(String name) {
    return 'Rag\'batlantirish: $name';
  }

  @override
  String get medrepRewardRating => 'Baho';

  @override
  String get medrepRewardMessage => 'Xabar';

  @override
  String get medrepOptional => '· ixtiyoriy';

  @override
  String get medrepRewardHint => 'Masalan: ajoyib savdo uchun rahmat!';

  @override
  String get medrepRewardNotice =>
      'Provizor xabaringiz bilan bildirishnoma oladi';

  @override
  String medrepRewardSend(int n) {
    return '$n bahoni yuborish';
  }

  @override
  String medrepRewardStars(int n) {
    return '5 dan $n baho';
  }

  @override
  String authVersion(String version) {
    return 'versiya $version';
  }

  @override
  String get authLoading => 'Yuklanmoqda';

  @override
  String get authWelcomeTitle => 'PharmIQ\'ga xush kelibsiz';

  @override
  String get authWelcomeSubtitle =>
      'Farmatsevtlar va shifokorlar uchun ta\'lim, kvestlar va mukofotlar — bitta ilovada';

  @override
  String get authAppLanguage => 'Ilova tili';

  @override
  String get authStart => 'Boshlash';

  @override
  String get authHaveAccount => 'Akkauntingiz bormi?';

  @override
  String authLanguageLabel(String language) {
    return 'Til: $language';
  }

  @override
  String get authLoginSubtitle =>
      'Farmatsevtlar va shifokorlar uchun ta\'lim va mukofotlar';

  @override
  String get authSmsHint => 'Kodni SMS orqali yuboramiz';

  @override
  String get authPhoneNotRegistered =>
      'Bu raqam ro\'yxatdan o\'tmagan. Akkaunt yarating — bu bir daqiqa oladi';

  @override
  String get authOtherNumber => 'Boshqa raqam kiritish';

  @override
  String authCodeSentTo(String phone) {
    return '$phone raqamiga yubordik';
  }

  @override
  String get authChange => 'O\'zgartirish';

  @override
  String get authCodeGroup => '6 raqamli kod';

  @override
  String get authCodeAuto => 'Kodni kiritishingiz bilan avtomatik kiramiz';

  @override
  String authResendIn(String time) {
    return '$time dan so\'ng qayta yuborish';
  }

  @override
  String get authRoleSubtitle =>
      'Sizda bir nechta rol bor — qaysi biri bilan kirishni tanlang';

  @override
  String get authRoleSubDoctor => 'Retseptlar, kvestlar, ta\'lim va hamyon';

  @override
  String get authRoleHint =>
      'Rolni istalgan vaqtda profilda almashtirish mumkin';

  @override
  String get authRegWhoTitle => 'Siz kimsiz?';

  @override
  String get authRegWhoSubtitle =>
      'Kasbingizga mos kvestlar va kurslarni ko\'rsatamiz';

  @override
  String get authRegPharmacistSub => 'Provizor, dorixona xodimi';

  @override
  String get authRegDoctorSub => 'Sog\'liqni saqlash mutaxassisi';

  @override
  String get authContinue => 'Davom etish';

  @override
  String get authBack => 'Orqaga';

  @override
  String authChooseField(String label) {
    return 'Tanlang: $label';
  }

  @override
  String authMultiHint(int n) {
    return 'Bir nechtasini tanlash mumkin · tanlandi: $n';
  }

  @override
  String get authMultiHintEmpty => 'Bir nechtasini tanlash mumkin';

  @override
  String get authConsent =>
      'Shaxsiy ma\'lumotlarimni qayta ishlashga roziman — ';

  @override
  String get authFillRequired =>
      'Yulduzcha bilan belgilangan maydonlarni to\'ldiring va rozilik bering';

  @override
  String authRegWelcome(String name) {
    return 'PharmIQ\'ga xush kelibsiz, $name!';
  }

  @override
  String get authGoHome => 'Bosh sahifaga';

  @override
  String get authCityTitle => 'Shahar';

  @override
  String get authCitySearch => 'Shaharni topish';

  @override
  String get authSearch => 'Qidirish';

  @override
  String get authNothingFound => 'Hech narsa topilmadi';

  @override
  String get authMapTitle => 'Xaritadagi dorixona';

  @override
  String get authMapStubTitle => 'Xarita tez orada paydo bo\'ladi';

  @override
  String get authMapStubBody =>
      'Hozircha dorixona nomini «Dorixona / ish joyi» maydoniga yozing — uni xaritada belgilash keyingi yangilanishda paydo bo\'ladi';

  @override
  String get authUpdateTitle => 'Ilovani yangilash kerak';

  @override
  String get authUpdateBody =>
      'Bu versiya endi qo\'llab-quvvatlanmaydi. Davom etish uchun PharmIQ\'ni yangilang — balans va natijalaringiz saqlanadi';

  @override
  String get authUpdateButton => 'Ilovani yangilash';

  @override
  String authUpdateVersions(String current, String required) {
    return 'Sizning versiyangiz $current · $required yoki undan yangisi kerak';
  }

  @override
  String authUpdateRequired(String required) {
    return '$required yoki undan yangi versiya kerak';
  }

  @override
  String get authPushTitle => 'Hisoblanishlarni o\'tkazib yubormang';

  @override
  String get authPushBody =>
      'Chek tekshirilganda, IQC balansga tushganda yoki yangi kvest paydo bo\'lganda xabar beramiz';

  @override
  String get authPushNow => 'hozir';

  @override
  String get authPushSample1Title => '+144 IQC hisoblandi';

  @override
  String get authPushSample1Body => 'Chek №23156 · Sinkorot №50';

  @override
  String get authPushSample2Time => '2 soat oldin';

  @override
  String get authPushSample2Title => 'Yangi kvest';

  @override
  String get authPushSample2Body => 'Doritritsin N10 · Korzinka vaucheri';

  @override
  String get authPushEnable => 'Bildirishnomalarni yoqish';

  @override
  String get authPushLater => 'Hozir emas';

  @override
  String checksSentCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta chek yuborilgan',
      one: '$n ta chek yuborilgan',
    );
    return '$_temp0';
  }

  @override
  String get checksSectionRetake => 'Qayta suratga olish kerak';

  @override
  String get checksSectionHistory => 'Tarix';

  @override
  String get checksRetake => 'Qayta olish';

  @override
  String checksRetakeA11y(int id) {
    return '№$id chekni qayta suratga olish';
  }

  @override
  String get checksRetakeTipBold =>
      'Chek birinchi urinishda qabul qilinishi uchun:';

  @override
  String get checksRetakeTip =>
      'butun chek kadrda, tekis, yaltirashsiz va yaxshi yorug‘likda.';

  @override
  String checksNumberDate(int id, String date) {
    return '№$id · $date';
  }

  @override
  String checksDatePhotos(String date, int n) {
    return '$date · $n ta surat';
  }

  @override
  String checksPhotoCount(int n) {
    return '$n ta surat';
  }

  @override
  String get checksWaitValue => '~24 soat';

  @override
  String get checksWaitCaption => 'odatda';

  @override
  String checksShowAll(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Barcha $n ta chekni ko‘rsatish',
      one: 'Barcha $n ta chekni ko‘rsatish',
    );
    return '$_temp0';
  }

  @override
  String get checksSendCheck => 'Chek yuborish';

  @override
  String checksMonth(String m) {
    String _temp0 = intl.Intl.selectLogic(m, {
      'm1': 'Yanvar',
      'm2': 'Fevral',
      'm3': 'Mart',
      'm4': 'Aprel',
      'm5': 'May',
      'm6': 'Iyun',
      'm7': 'Iyul',
      'm8': 'Avgust',
      'm9': 'Sentabr',
      'm10': 'Oktabr',
      'm11': 'Noyabr',
      'm12': 'Dekabr',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get checksUploadingRow => 'Chek yuborilmoqda…';

  @override
  String get checksUploadQueued => 'Yuborishni kutmoqda';

  @override
  String get checksUploadAuto => 'Aloqa paydo bo‘lganda avtomatik yuboramiz';

  @override
  String get checksEmptyTitle => 'Cheklaringiz shu yerda paydo bo‘ladi';

  @override
  String get checksEmptyText =>
      'Dorixona chekini suratga oling — SI dorilarni aniqlaydi va siz IQC olasiz';

  @override
  String get checksHowToTitle => 'Qanday suratga olish kerak';

  @override
  String get checksHow1Title => 'Butun chek kadrda';

  @override
  String get checksHow1Text => 'To‘rtala burchagi ko‘rinib tursin';

  @override
  String get checksHow2Title => 'Tekis, burmalarsiz';

  @override
  String get checksHow2Text => 'Chekni stolga qo‘ying';

  @override
  String get checksHow3Title => 'Yaxshi yorug‘lik';

  @override
  String get checksHow3Text => 'Yaltirash va telefon soyasisiz';

  @override
  String get checksSendFirst => 'Birinchi chekni yuborish';

  @override
  String get checksPickSubtitle => 'SI dorilarni surat bo‘yicha aniqlaydi';

  @override
  String checksPhotosOf(int n, int max) {
    return 'Surat: $n / $max';
  }

  @override
  String get checksClose => 'Yopish';

  @override
  String get checksTipWhole => 'Butun chek';

  @override
  String get checksTipFlat => 'Tekis';

  @override
  String get checksTipGlare => 'Yaltirashsiz';

  @override
  String get checksTakePhotoCta => 'Chekni suratga olish';

  @override
  String get checksPickGallery => 'Galereyadan tanlash';

  @override
  String get checksRemovePhoto => 'Suratni o‘chirish';

  @override
  String get checksAddMore => 'Yana surat';

  @override
  String get checksAddMoreA11y => 'Yana surat qo‘shish';

  @override
  String get checksPhotoWaiting => 'Kutmoqda';

  @override
  String get checksPhotosHint =>
      'Tekshiring: chek raqami, sana va dorilar aniq ko‘rinsin';

  @override
  String get checksSending => 'Yuborilmoqda…';

  @override
  String get checksSentTitle => 'Chek yuborildi';

  @override
  String get checksSentText =>
      'Tekshiruv odatda 24 soatgacha davom etadi. IQC hisoblanganda xabar beramiz';

  @override
  String get checksDone => 'Tayyor';

  @override
  String get checksSendAnother => 'Yana chek yuborish';

  @override
  String get checksSendFailed =>
      'Suratni saqlab bo‘lmadi. Qayta urinib ko‘ring';

  @override
  String get checksCamTitle => 'Kameraga ruxsat bering';

  @override
  String get checksCamText =>
      'Kamera chek va retseptlarni suratga olish uchun kerak';

  @override
  String get checksCamPoint1 =>
      'Faqat siz tugmani bosganingizda suratga olamiz';

  @override
  String get checksCamPoint2 => 'Boshqa suratlarni ko‘rmaymiz va saqlamaymiz';

  @override
  String get checksCamPoint3 =>
      'Ruxsatni telefon sozlamalarida o‘chirish mumkin';

  @override
  String get checksCamAllow => 'Ruxsat berish';

  @override
  String get checksCamLater => 'Hozir emas';

  @override
  String get checksCamDeniedTitle => 'Kameraga ruxsat yo‘q';

  @override
  String get checksCamDeniedText =>
      'Kamerasiz chekni suratga olib bo‘lmaydi. Telefon sozlamalarida ruxsatni yoqing — bu 10 soniya oladi';

  @override
  String get checksCamDeniedStep1 => '«Sozlamalar» → PharmIQ ni oching';

  @override
  String get checksCamDeniedStep2 => '«Kamera» tugmachasini yoqing';

  @override
  String get checksCamDeniedStep3 => 'Ilovaga qayting';

  @override
  String get checksCamOpenSettings => 'Sozlamalarni ochish';

  @override
  String get checksCamPickGallery => 'Galereyadan surat tanlash';

  @override
  String get checksCamSettingsManual =>
      'Telefon sozlamalari → Ilovalar → PharmIQ → Ruxsatlar bo‘limini oching';

  @override
  String get checksHeroPendingTitle => 'Chek tekshiruvda';

  @override
  String get checksHeroPendingText =>
      'Mutaxassis chekni tekshirmoqda. Odatda bu 24 soatgacha davom etadi';

  @override
  String get checksHeroApprovedTitle => 'Chek tasdiqlandi';

  @override
  String get checksHeroApprovedText =>
      'Hammasi joyida. IQC yaqin orada balansga tushadi';

  @override
  String get checksHeroCreditedTitle => 'IQC hisoblandi';

  @override
  String get checksHeroCreditedText => 'Ballar balansingizga o‘tkazildi';

  @override
  String get checksHeroRejectedTitle => 'Chek rad etildi';

  @override
  String get checksHeroRejectedText =>
      'Aniq surat oling — ballarni hali ham olish mumkin';

  @override
  String get checksStepSent => 'Yuborildi';

  @override
  String get checksStepReview => 'Tekshiruv';

  @override
  String get checksStepApproved => 'Tasdiqlandi';

  @override
  String get checksStepCredited => 'Hisoblandi';

  @override
  String get checksPhotosTitle => 'Chek surati';

  @override
  String checksOpenPhoto(int n) {
    return '$n-suratni ochish';
  }

  @override
  String get checksAiPending =>
      'Dorilar ro‘yxati tekshiruvdan so‘ng paydo bo‘ladi';

  @override
  String get checksAccrualTitle => 'Hisoblash';

  @override
  String get checksAccrualPendingTitle => 'Tasdiqlangandan so‘ng hisoblaymiz';

  @override
  String get checksAccrualPendingText => 'Chek tasdiqlangandan so‘ng';

  @override
  String get checksAccrualApprovedTitle => 'Hisoblanishini kutmoqda';

  @override
  String get checksAccrualSoon => 'Tez orada';

  @override
  String get checksAccrualCreditedTitle => 'Balansga o‘tkazildi';

  @override
  String get checksQuestDone => 'Kvest bajarildi ✓';

  @override
  String get checksSupport => 'Chek bo‘yicha savol bormi? Bizga yozing';

  @override
  String get checksRetakeCheck => 'Chekni qayta suratga olish';

  @override
  String checksViewerPhotoOf(int i, int n) {
    return 'Surat $i / $n';
  }

  @override
  String get checksViewerSave => 'Suratni saqlash';

  @override
  String get checksViewerZoomHint =>
      'Kattalashtirish uchun barmoqlaringizni yoying';

  @override
  String get profileSectionContact => 'Aloqa';

  @override
  String get profilePersonalDataRow => 'Shaxsiy ma\'lumotlar';

  @override
  String get profileTgNotLinked => 'Bog\'lanmagan';

  @override
  String get profileTgLink => 'Bog\'lash';

  @override
  String get profileTgLinkedToast => 'Telegram bog\'landi';

  @override
  String get profileTgNotYet =>
      'Telegram hali bog\'lanmagan — botda bog\'lashni yakunlang';

  @override
  String get profileAppearanceTitle => 'Ko\'rinish';

  @override
  String get profileNotifOn => 'Yoqilgan';

  @override
  String get profileNotifOff => 'O\'chirilgan';

  @override
  String get profileDeleteAccount => 'Akkauntni o\'chirish';

  @override
  String profileVersion(String version) {
    return 'PharmIQ · versiya $version';
  }

  @override
  String get profileEditAria => 'Profilni tahrirlash';

  @override
  String get profileNewUser => 'Yangi foydalanuvchi';

  @override
  String get profilePharmacy => 'Dorixona';

  @override
  String get profileClinic => 'Klinika';

  @override
  String get profileCompany => 'Kompaniya';

  @override
  String get profileNoPharmacy => 'Dorixona ko\'rsatilmagan';

  @override
  String get profileNoClinic => 'Klinika ko\'rsatilmagan';

  @override
  String get profileNoCompany => 'Kompaniya ko\'rsatilmagan';

  @override
  String get profileNotSpecified => 'Ko\'rsatilmagan';

  @override
  String get profileNameNotSet => 'Ism ko\'rsatilmagan';

  @override
  String get profileActivateTitle => 'Profilni faollashtiring';

  @override
  String profileActivateProgress(int done, int total) {
    return '$total dan $done';
  }

  @override
  String get profileActivateBody =>
      'Faollashtirilgandan so\'ng kvestlar va IQC hisoblanishi ochiladi';

  @override
  String get profileStepPhone => 'Telefon tasdiqlangan';

  @override
  String get profileStepPharmacy => 'Dorixonani ko\'rsating';

  @override
  String get profileStepClinic => 'Klinikani ko\'rsating';

  @override
  String get profileStepProfile => 'Profilni to\'ldiring';

  @override
  String get profileStepWorkHint => 'Hududingiz kvestlari uchun kerak';

  @override
  String get profileStepProfileHint => 'Ism va ish joyi';

  @override
  String get profileStepSpecify => 'Ko\'rsatish';

  @override
  String get profileStepTelegram => 'Telegramni bog\'lang';

  @override
  String get profileStepTelegramHint => 'Bildirishnomalar yuboramiz';

  @override
  String get profileStepAdmin => 'Administrator tomonidan faollashtirish';

  @override
  String get profileStepAdminHint =>
      'Odatda to\'ldirilgandan keyin bir kun ichida';

  @override
  String get profileActivateHelp =>
      'Faollashtirish bo\'yicha savollar? Bizga yozing';

  @override
  String get profileRoleSheetTitle => 'Rolni almashtirish';

  @override
  String get profileRoleSheetSubtitle =>
      'Akkauntingiz uchun tasdiqlangan rollar';

  @override
  String get profileRoleCurrent => 'Joriy';

  @override
  String get profileRoleDescPharmacist =>
      'Cheklar, kvestlar, o\'qish va hamyon';

  @override
  String get profileRoleDescDoctor => 'Retseptlar, kvestlar, o\'qish va hamyon';

  @override
  String get profileRoleDescMedrep => 'Provizorlar portfeli va reyting';

  @override
  String get profileRoleDescBrand => 'Brend kvestlari, mahsulotlar va savdo';

  @override
  String get profileRoleNote =>
      'Ilova tanlangan rol bo\'limlari bilan ochiladi. IQC balansi va vaucherlar saqlanadi';

  @override
  String profileRoleSwitch(String role) {
    return '«$role» roliga o\'tish';
  }

  @override
  String get profileClose => 'Yopish';

  @override
  String get profileFieldName => 'F.I.Sh.';

  @override
  String get profilePhoneLockedHint =>
      'Raqam kirish uchun kerak — SMS orqali tasdiqlab o\'zgartiriladi';

  @override
  String get profileFieldCity => 'Shahar';

  @override
  String get profileCityHint => 'Shaharni tanlang';

  @override
  String get profileWorkplaceHint => 'Nomi yoki raqami';

  @override
  String get profileMapButton => 'Dorixonani xaritada aniqlash';

  @override
  String get profileMapSoon =>
      'Dorixonani xaritada tanlash tez orada paydo bo\'ladi';

  @override
  String get profileSave => 'O\'zgarishlarni saqlash';

  @override
  String get profileFieldRequired => 'Ushbu maydonni to\'ldiring';

  @override
  String get profileEditSent => 'So\'rov qo\'llab-quvvatlashga yuborildi';

  @override
  String get profileEditSentHint =>
      'Tekshiruvdan so\'ng ma\'lumotlarni yangilaymiz';

  @override
  String get profileEditRequest =>
      'Profil ma\'lumotlarini yangilashni so\'rayman:';

  @override
  String get profileEditNoChanges => 'O\'zgarishlar yo\'q';

  @override
  String get profilePrivacyShort => 'Maxfiylik';

  @override
  String get profilePrivacyHeadline =>
      'Ma\'lumotlaringiz bilan qanday ishlaymiz';

  @override
  String get profilePrivacyCollectTitle => 'Qanday ma\'lumotlarni yig\'amiz';

  @override
  String get profilePrivacyCollectBody =>
      'Ism, telefon raqami, shahar va dorixona yoki klinika. Siz yuboradigan chek va retsept rasmlari. Kurslar va testlar natijalari.';

  @override
  String get profilePrivacyWhyTitle => 'Ular nima uchun kerak';

  @override
  String get profilePrivacyWhyBody =>
      'Cheklar va retseptlar uchun IQC hisoblash, kvestlarni hisobga olish, vaucherlar berish va statistikangizni ko\'rsatish uchun.';

  @override
  String get profilePrivacyWhoTitle => 'Ularni kim ko\'radi';

  @override
  String get profilePrivacyWhoBody =>
      'Tibbiy vakilingiz cheklaringiz va kvestlaringiz sonini ko\'radi. Retseptlardagi bemor ma\'lumotlari yashirilgan — faqat bosh harflar ko\'rinadi.';

  @override
  String get profilePrivacyStoreTitle => 'Ularni qanday saqlaymiz';

  @override
  String get profilePrivacyStoreBody =>
      'Ma\'lumotlar himoyalangan ulanish orqali uzatiladi va kompaniya serverlarida saqlanadi.';

  @override
  String get profilePrivacyDeleteTitle =>
      'Ma\'lumotlarni qanday o\'chirish mumkin';

  @override
  String get profilePrivacyDeleteBody =>
      'Profilda → «Akkauntni o\'chirish». Ma\'lumotlar balans va vaucherlar bilan birga o\'chiriladi.';

  @override
  String get profilePrivacyFullLink => 'Siyosatning to\'liq matni';

  @override
  String get profilePrivacyContents => 'Mundarija';

  @override
  String profilePrivacyReadTime(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n daqiqa o\'qish',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyRuOnly => 'Hujjat faqat rus tilida mavjud';

  @override
  String get profileDeleteLose =>
      'Bu amalni bekor qilib bo\'lmaydi. Siz yo\'qotasiz:';

  @override
  String profileDeleteLoseIqc(String amount) {
    return 'Balansdagi $amount IQC';
  }

  @override
  String get profileDeleteLoseIqcHint =>
      'almashtirish imkoniyatisiz yonib ketadi';

  @override
  String profileDeleteLoseVouchers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta faol vaucher',
    );
    return '$_temp0';
  }

  @override
  String get profileDeleteLoseVouchersHint => 'ishlamay qoladi';

  @override
  String get profileDeleteLoseProgress => 'Kvestlar va kurslardagi natijalar';

  @override
  String get profileDeleteLoseProgressHint => 'o\'chiriladi';

  @override
  String get profileDeleteTypePrompt => 'Tasdiqlash uchun kiriting';

  @override
  String get profileDeleteWord => 'O\'CHIRISH';

  @override
  String get profileDeleteForever => 'Butunlay o\'chirish';

  @override
  String get profileDeleteKeep => 'Akkauntni qoldirish';

  @override
  String get profileDeleting => 'O\'chirilmoqda…';

  @override
  String get profileDeleteFailed =>
      'Akkauntni o\'chirib bo\'lmadi. Qayta urinib ko\'ring';

  @override
  String get profileDeletedTitle => 'Akkaunt o\'chirildi';

  @override
  String get profileDeletedBody =>
      'Profilingiz, IQC balansi, vaucherlar va tarix o\'chirildi. Biz bilan bo\'lganingiz uchun rahmat';

  @override
  String get profileDeletedCardTitle => 'Fikringiz o\'zgardimi?';

  @override
  String get profileDeletedCardBody =>
      'Xuddi shu raqam bilan qayta ro\'yxatdan o\'tish mumkin — lekin avvalgi balansni qaytarib bo\'lmaydi';

  @override
  String get profileDeletedNew => 'Yangi akkaunt yaratish';

  @override
  String get profileErrorGeneric => 'Nimadir xato ketdi. Qayta urinib ko\'ring';

  @override
  String notifNewCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ta yangi',
    );
    return '$_temp0';
  }

  @override
  String get notifAllRead => 'Hammasi o\'qilgan';

  @override
  String get notifReadAll => 'Hammasini o\'qish';

  @override
  String get notifFilterAll => 'Hammasi';

  @override
  String get notifFilterChecks => 'Cheklar';

  @override
  String get notifFilterRecipes => 'Blankalar';

  @override
  String get notifFilterQuests => 'Kvestlar';

  @override
  String get notifFilterLearning => 'O\'qish';

  @override
  String get notifCategoryEmpty => 'Bu toifada hozircha hech narsa yo\'q';

  @override
  String get notifNewAria => 'Yangi';

  @override
  String get notifMarkedRead => 'O\'qildi';

  @override
  String get notifEmptySubtitle => 'Hozircha yangilik yo\'q';

  @override
  String get notifEmptyQuietTitle => 'Bu yerda hozircha jimjit';

  @override
  String get notifEmptyQuietText =>
      'Chekni tekshirganimizda, IQC hisoblaganimizda yoki vaucher berganimizda xabar beramiz';

  @override
  String get notifConfigure => 'Bildirishnomalarni sozlash';

  @override
  String get notifSettingsSubtitle => 'Telefonga nimalarni yuborish';

  @override
  String get notifSettingsChecksHint => 'Tasdiqlash, rad etish, IQC hisoblash';

  @override
  String get notifSettingsQuestsHint =>
      'Yangi kvestlar, bajarilish, vaucherlar';

  @override
  String get notifSettingsLearningHint => 'Yangi kurslar va eslatmalar';

  @override
  String get notifSettingsMarketingHint =>
      'Bozor yangiliklari va maxsus takliflar';

  @override
  String get notifSettingsFootnote =>
      'Akkaunt va xavfsizlik haqidagi muhim xabarlar doim keladi';

  @override
  String get notifSaveFailed => 'Sozlamalarni saqlab bo\'lmadi';

  @override
  String get supportHeaderTitle => 'PharmIQ qo\'llab-quvvatlash';

  @override
  String get supportHeaderSubtitle => 'Odatda bir soat ichida javob beramiz';

  @override
  String get supportBackAria => 'Profilga qaytish';

  @override
  String get supportToday => 'Bugun';

  @override
  String get supportYesterday => 'Kecha';

  @override
  String get supportGreeting => 'Assalomu alaykum! Qanday yordam bera olamiz?';

  @override
  String get supportFaqTitle => 'Ko\'p beriladigan savollar';

  @override
  String get supportFaq1 => 'Chek uchun IQC hisoblanmadi';

  @override
  String get supportFaq2 => 'Chek rad etildi — nega?';

  @override
  String get supportFaq3 => 'Vaucherni qanday olish mumkin';

  @override
  String get supportFaq4 => 'Kurs yoki test bilan muammo';

  @override
  String get supportMessageHint => 'Xabar';

  @override
  String get supportAttachAria => 'Rasm yoki chek biriktirish';

  @override
  String get supportSendAria => 'Yuborish';

  @override
  String get supportTypingAria => 'Qo\'llab-quvvatlash yozmoqda';

  @override
  String get supportAttachCheckTitle => 'Chek biriktirish';

  @override
  String get supportAttachRecipeTitle => 'Blanka biriktirish';

  @override
  String get supportAttachEmpty => 'Hozircha biriktiradigan narsa yo\'q';

  @override
  String get supportAttachRemove => 'Biriktirmani olib tashlash';

  @override
  String get supportAttachUnavailable =>
      'Biriktirmalar cheklar va blankalar uchun mavjud';

  @override
  String get supportSendFailed => 'Xabarni yuborib bo\'lmadi';

  @override
  String get walletFaceValue => 'Nominal';

  @override
  String get profileBack => 'Orqaga';

  @override
  String homeNewCourseVideo(int n) {
    return 'Video ~$n daq';
  }

  @override
  String get homeNewCourseQuiz => 'test';

  @override
  String get authHintFullName => 'Familiya Ism Otasining ismi';

  @override
  String get authHintPharmacy => 'Masalan, 12-dorixona';

  @override
  String get authHintClinic => 'Tibbiyot muassasasi nomi';

  @override
  String get authMapCardTitle => 'Dorixonani xaritada belgilash';

  @override
  String get authMapCardSub => 'Tumaningiz kvestlari uchun kerak';

  @override
  String get authMapCardButton => 'Belgilash';

  @override
  String get rxStateCreditedTitle => 'IQC hisoblandi';

  @override
  String get rxStateCreditedText => 'Ballar balansingizga o\'tkazildi';

  @override
  String get rxAccrualCreditedTitle => 'Balansga o\'tkazildi';

  @override
  String get rxCreditedCaption => 'hisoblandi';

  @override
  String rxListCountEarned(String count, int n) {
    return '$count · $n IQC olindi';
  }

  @override
  String get questsRewardPoints => 'Ballar balansga';

  @override
  String get walletMonthsIn =>
      'yanvarda,fevralda,martda,aprelda,mayda,iyunda,iyulda,avgustda,sentabrda,oktabrda,noyabrda,dekabrda';

  @override
  String walletEarnedIn(String month) {
    return '$month hisoblangan';
  }

  @override
  String walletSpentIn(String month) {
    return '$month sarflangan';
  }

  @override
  String get profileRoleShortMedrep => 'Tibbiy vakil';

  @override
  String get notifActionQr => 'QR ko\'rsatish';

  @override
  String get notifActionRetake => 'Qayta suratga olish';

  @override
  String homeNewCourseQuizQuestions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'test $n ta savol',
      one: 'test $n ta savol',
    );
    return '$_temp0';
  }

  @override
  String get profilePrivacyDraft =>
      'Qoralama. Yakuniy matnni yurist tasdiqlaydi';

  @override
  String get notifSettingsChecksOnly => 'Cheklar holati';

  @override
  String get notifSettingsRecipesOnly => 'Blankalar holati';

  @override
  String get tourWelcomeTitle => 'PharmIQ Academy\'ga xush kelibsiz!';

  @override
  String get tourWelcomeText =>
      'Nima qayerda joylashganini va IQC qanday topishni ko\'rsatamiz. Bu bir daqiqadan kam vaqt oladi.';

  @override
  String get tourWelcomeTextDoc =>
      'Nima qayerda joylashganini va blankalar uchun IQC qanday olishni ko\'rsatamiz. Bu bir daqiqadan kam vaqt oladi.';

  @override
  String get tourStart => 'Boshlash';

  @override
  String get tourSkipAll => 'O\'qitishni o\'tkazib yuborish';

  @override
  String tourStepOf(int n, int total) {
    return '$total dan $n-qadam';
  }

  @override
  String get tourSkip => 'O\'tkazib yuborish';

  @override
  String get tourNext => 'Keyingi';

  @override
  String get tourDoneStep => 'Tayyor';

  @override
  String get tourBack => 'Orqaga';

  @override
  String get tourBalanceTitle => 'IQC balansi';

  @override
  String get tourBalanceText =>
      'Bu yerda IQC — tasdiqlangan cheklar, kvestlar va so\'rovnomalar uchun ballar. «Hamyon» tugmasi tarix va vaucherlarga almashishni ochadi.';

  @override
  String get tourBalanceTextDoc =>
      'Bu yerda IQC — tasdiqlangan blankalar, kvestlar va so\'rovnomalar uchun ballar. «Hamyon» tugmasi tarix va vaucherlarga almashishni ochadi.';

  @override
  String get tourSendTitle => 'Chek yuboring';

  @override
  String get tourSendText =>
      'Chekni suratga oling — sun\'iy intellekt dori vositalarini aniqlaydi. Tekshiruvdan so\'ng balansga IQC tushadi.';

  @override
  String get tourSendTitleDoc => 'Blanka yuboring';

  @override
  String get tourSendTextDoc =>
      'Blankani suratga oling — sun\'iy intellekt dori vositalarini aniqlaydi. Tekshiruvdan so\'ng balansga IQC tushadi.';

  @override
  String get tourQuestsTitle => 'Faol kvestlar';

  @override
  String get tourQuestsText =>
      'Ishlab chiqaruvchilardan topshiriqlar: kerakli miqdordagi qadoqlarni soting va bonus oling. Jarayon kartochkada ko\'rinadi.';

  @override
  String get tourQuestsTextDoc =>
      'Ishlab chiqaruvchilardan topshiriqlar: kerakli miqdordagi blankalarni yozing va bonus oling. Jarayon kartochkada ko\'rinadi.';

  @override
  String get tourChecksTitle => 'Cheklaringiz';

  @override
  String get tourChecksText =>
      'Barcha yuborilgan cheklar va ularning holati: tekshiruvda, tasdiqlangan, hisoblangan yoki qayta suratga olish kerak.';

  @override
  String get tourChecksTitleDoc => 'Blankalaringiz';

  @override
  String get tourChecksTextDoc =>
      'Barcha yuborilgan blankalar va ularning holati: tekshiruvda, tasdiqlangan, hisoblangan yoki qayta suratga olish kerak.';

  @override
  String get tourLearnTitle => 'O\'qitish';

  @override
  String get tourLearnText =>
      'Farm bozori ekspertlaridan kurslar va testlar. O\'tilgan kurslar uchun ballar beriladi.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileText =>
      'Shaxsiy ma\'lumotlar, dorixona, mavzu va til. Shu yerda bu o\'qitishni qayta o\'tish mumkin.';

  @override
  String get tourProfileTextDoc =>
      'Shaxsiy ma\'lumotlar, ish joyi, mavzu va til. Shu yerda bu o\'qitishni qayta o\'tish mumkin.';

  @override
  String get tourDoneTitle => 'Hammasi tayyor!';

  @override
  String get tourDoneText =>
      'Birinchi IQC olish uchun birinchi chekni yuboring yoki kursni boshlang.';

  @override
  String get tourDoneTextDoc =>
      'Birinchi IQC olish uchun birinchi blankani yuboring yoki kursni boshlang.';

  @override
  String get tourDoneNote => 'O\'qitishni Profilda takrorlash mumkin.';

  @override
  String get tourFinish => 'Ishni boshlash';

  @override
  String get profileTourAgain => 'O\'qitishni qayta o\'tish';
}

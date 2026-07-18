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
  String get navRecipes => 'Retseptlar';

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
  String get miniAppsSubtitle =>
      'O\'ynang va IQC evaziga sovg\'alar yutib oling';

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
      'IQC evaziga kataklarni egallang — ochilish soatida ular ostida nima borligini bilib olasiz';

  @override
  String get sapperNoDraws => 'O\'yinlar yo\'q';

  @override
  String get sapperRevealed => 'Ochilgan';

  @override
  String sapperPrizesAndPrice(Object prizeCount, Object priceIqc) {
    return '🎁 $prizeCount ta sovg\'a  💎 $priceIqc IQC/katak  ';
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
  String get sapperGoToGame => 'O\'yinga o\'tish';

  @override
  String sapperReserveTitle(Object number) {
    return '$number-katakni egallaysizmi?';
  }

  @override
  String sapperReserveBody(Object price) {
    return '$price IQC yechiladi. Bekor qilib bo\'lmaydi — katak ochilishgacha sizniki bo\'lib qoladi.';
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
  String get sapperDraws => 'Yutuq o\'yinlari';

  @override
  String get sapperAcceptClosed =>
      'Kataklarni band qilish yopildi — ochilishga tayyorgarlik ketmoqda';

  @override
  String get sapperHiddenTitle => 'MAYDONDA YASHIRINGAN';

  @override
  String sapperRevealIn(Object time) {
    return 'ochilishgacha $time';
  }

  @override
  String get sapperNoPrizes => 'sovg\'alar e\'lon qilinmagan';

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
    return 'katak narxi $price IQC';
  }

  @override
  String get sapperYourBalance => 'Sizning balansingiz';

  @override
  String get sapperCellPriceLabel => 'katak narxi';

  @override
  String sapperWinBannerWin(Object count, Object word) {
    return '🎉 Siz $count $word yutdingiz!';
  }

  @override
  String get sapperNoWin => 'Bu safar yutuqsiz';

  @override
  String get sapperPrizeOne => 'sovg\'a';

  @override
  String get sapperPrizeFew => 'sovg\'a';

  @override
  String get sapperPrizeMany => 'sovg\'a';

  @override
  String get sapperLegendMine => 'Meniki';

  @override
  String get sapperLegendTheirs => 'Boshqalarniki';

  @override
  String get sapperLegendEmpty => 'Bo\'sh';

  @override
  String get sapperLegendVoucher => 'Vaucher';

  @override
  String get sapperLegendSelected => 'Tanlangan';

  @override
  String get sapperLegendOccupied => 'Band';

  @override
  String get sapperLegendFree => 'Bo\'sh';

  @override
  String get sapperWinners => 'G\'oliblar';

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
  String get profileSupportSubtitle => 'Biz doim aloqadamiz';

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
  String get profileLogoutAction => 'Chiqish';

  @override
  String get profileDeleteConfirmTitle => 'Hisob o\'chirilsinmi?';

  @override
  String get profileDeleteConfirmBody =>
      'Bu amalni qaytarib bo\'lmaydi. Barcha ma\'lumotlar o\'chiriladi.';

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
  String get notifSettingsChecks => 'Chek va retsept holatlari';

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
  String get docHomeSubtitle => 'Retseptlarni yuboring va mukofot oling';

  @override
  String get docHomeWalletBalance => 'HAMYON BALANSI';

  @override
  String get docHomeWallet => 'Hamyon';

  @override
  String get docHomeSendRecipe => 'Retsept yuborish';

  @override
  String get docHomeSendRecipeHint =>
      'Retseptni suratga oling — AI dorilarni taniydi';

  @override
  String get docHomeStatRecipes => 'jami retseptlar';

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
  String get recipeDetailMyRecipes => 'Mening retseptlarim';

  @override
  String recipeDetailTitle(Object id) {
    return 'Retsept №$id';
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
  String get recipesTitle => 'Mening retseptlarim';

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
  String get recipesEmpty => 'Hozircha retseptlar yo\'q';

  @override
  String get recipesTakePhoto => 'Suratga olish';

  @override
  String get recipesFromGallery => 'Galereyadan tanlash';

  @override
  String get recipesUploading => 'Retsept qo\'shildi — yuklanmoqda';

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
  String get recipesSubmitButton => 'Retsept yuborish';

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
  String get walletRedeemTitle => 'Ballar almashtirilsinmi?';

  @override
  String walletRedeemBody(Object p1, Object p2) {
    return '$p1 — $p2 IQC evaziga';
  }

  @override
  String get walletCancel => 'Bekor qilish';

  @override
  String get walletRedeem => 'Almashtirish';

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
    return 'Korzinka · $amount so\'m';
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
}

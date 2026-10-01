// Текст «Политики конфиденциальности» для экрана PrivacyFull.
// GENERATED из https://pharmview.uz/privacy (редакция от 21 сентября 2026 г.,
// русская и узбекская версии) — дословно, без правок. Не редактировать вручную:
// при новой редакции на сайте перегенерировать.
library;

/// Раздел документа: номер, заголовок, абзацы и пункты («• …»).
class PrivacyDocSection {
  const PrivacyDocSection(this.number, this.title, this.items);
  final String number;
  final String title;
  final List<String> items;
}

/// Документ на одном языке.
class PrivacyDoc {
  const PrivacyDoc({
    required this.title,
    required this.edition,
    required this.intro,
    required this.sections,
  });
  final String title;

  /// «Редакция от …».
  final String edition;
  final List<String> intro;
  final List<PrivacyDocSection> sections;
}

/// Политика на языке интерфейса: есть русская и узбекская версии;
/// для остальных языков показывается русская.
PrivacyDoc privacyDocFor(String languageCode) =>
    languageCode == 'uz' ? kPrivacyDocUz : kPrivacyDocRu;

/// Есть ли перевод политики на этот язык.
bool privacyDocTranslated(String languageCode) =>
    languageCode == 'ru' || languageCode == 'uz';

const kPrivacyDocRu = PrivacyDoc(
  title: "Политика конфиденциальности",
  edition: "Редакция от 21 сентября 2026 г.",
  intro: [
    "Политика описывает, какие данные собирает приложение PharmIQ Academy и сайт pharmview.uz (далее — «Сервис»), зачем, кому передаёт и как их удалить.",
  ],
  sections: [
    PrivacyDocSection("1", "Оператор персональных данных", [
      "ООО «PHARMIQ ACADEMY», ИНН 309799613, адрес: г. Ташкент, Мирзо-Улугбекский район, МФЙ Лашкарбеги, ул. Лашкарбеги.\nВопросы о данных: support@pharmiq.uz, поддержка в приложении (Профиль → Поддержка) или телефон +998 90 027 69 69.",
    ]),
    PrivacyDocSection("2", "Какие данные мы собираем", [
      "• Регистрация и профиль: ФИО, номер телефона, город, название аптеки или клиники, специальность, код приглашения (если есть).",
      "• Вход: номер телефона и код из SMS; при входе через Telegram — ваш Telegram ID; при входе через Apple или Google — идентификатор учётной записи и адрес email, который передаёт провайдер.",
      "• Фото чеков и бланков, которые вы отправляете, и распознанные на них данные (названия препаратов, количество, дата). На бланках могут быть данные третьих лиц, в том числе пациентов. Отправляйте только то, что вправе передавать.",
      "• Участие в программе: прохождение курсов и тестов, ответы на опросы, квесты, начисления и списания баллов IQC, выданные ваучеры, участие в акциях.",
      "• Переписка со службой поддержки.",
      "• Технические данные: токен push-уведомлений, тип устройства и платформы, время входа.",
      "Мы не собираем геолокацию, контакты телефона и рекламные идентификаторы, не отслеживаем вас в других приложениях, не показываем рекламу и не продаём данные.",
    ]),
    PrivacyDocSection("3", "Зачем", [
      "• работа Сервиса: вход, обучение, проверка чеков и бланков, начисление баллов, выдача ваучеров;",
      "• уведомления о статусе чеков, начислениях, новостях и опросах;",
      "• поддержка пользователей;",
      "• безопасность и предотвращение злоупотреблений (повторные и поддельные чеки);",
      "• отчётность компаниям-партнёрам программы в объёме, описанном в разделе 4.",
      "Основание обработки — ваше согласие, которое вы даёте при регистрации, и исполнение условий программы. Согласие можно отозвать, удалив аккаунт (раздел 7).",
    ]),
    PrivacyDocSection("4", "Кому передаются данные", [
      "• Компаниям-партнёрам программы (фармацевтические компании): медицинский представитель компании видит ФИО, аптеку, город и показатели активности привязанных к нему участников; компании получают сводную статистику по своим квестам.",
      "• Обработчикам, которые помогают работать Сервису:\nMicrosoft Azure (распознавание фото чеков и бланков), Google Firebase (push-уведомления), Eskiz.uz (отправка SMS), Telegram (вход и уведомления через бота), Apple и Google (вход через их учётные записи), Vimeo (воспроизведение видеоуроков).",
      "• Государственным органам — только по требованию закона.",
    ]),
    PrivacyDocSection("5", "Где хранятся данные", [
      "Данные хранятся на серверах провайдера Hostinger в Литовской Республике (Европейский союз). При распознавании фото и отправке уведомлений данные обрабатываются инфраструктурой Microsoft и Google.",
    ]),
    PrivacyDocSection("6", "Сколько хранятся", [
      "• Данные профиля — пока аккаунт существует.",
      "• После удаления аккаунта персональные данные удаляются сразу; записи о начислениях баллов и выданных ваучерах хранятся без персональных данных 5 лет для учёта.",
      "• Фото чеков и бланков хранятся 4 месяца после проверки для разбора спорных начислений, затем удаляются автоматически.",
    ]),
    PrivacyDocSection("7", "Ваши права и удаление аккаунта", [
      "Вы можете узнать, какие данные о вас хранятся, исправить их, отозвать согласие и удалить аккаунт.",
      "• Удалить аккаунт: в приложении Профиль → «Удалить аккаунт». Подробно и без приложения: pharmview.uz/delete-account.",
      "• Другие запросы: support@pharmiq.uz, поддержка в приложении (Профиль → Поддержка) или телефон +998 90 027 69 69. Отвечаем в течение 30 дней.",
    ]),
    PrivacyDocSection("8", "Безопасность", [
      "Данные передаются только по зашифрованному соединению (HTTPS). Доступ к данным ограничен сотрудниками, которым он нужен по работе. Долгоживущие токены входа хранятся в зашифрованном виде.",
    ]),
    PrivacyDocSection("9", "Возраст", [
      "Сервис предназначен для специалистов фармацевтической и медицинской отрасли старше 18 лет.",
    ]),
    PrivacyDocSection("10", "Изменения", [
      "При существенных изменениях мы сообщим в приложении. Актуальная редакция всегда доступна на этой странице.",
    ]),
  ],
);

const kPrivacyDocUz = PrivacyDoc(
  title: "Maxfiylik siyosati",
  edition: "Tahrir sanasi: 2026-yil 21-sentabr",
  intro: [
    "Ushbu siyosat PharmIQ Academy ilovasi va pharmview.uz sayti («Xizmat») qanday ma’lumotlarni yig‘ishi, nima uchun, kimga uzatishi va ularni qanday o‘chirish mumkinligini tushuntiradi.",
  ],
  sections: [
    PrivacyDocSection("1", "Shaxsga doir ma’lumotlar operatori", [
      "«PHARMIQ ACADEMY» MChJ, STIR 309799613, manzil: Toshkent sh., Mirzo Ulug‘bek tumani, Lashkarbegi MFY, Lashkarbegi ko‘chasi.\nMurojaat: support@pharmiq.uz, ilova ichidagi yordam xizmati (Profil → Yordam) yoki telefon +998 90 027 69 69.",
    ]),
    PrivacyDocSection("2", "Qanday ma’lumotlarni yig‘amiz", [
      "• Ro‘yxatdan o‘tish va profil: F.I.Sh., telefon raqami, shahar, dorixona yoki klinika nomi, mutaxassislik, taklif kodi.",
      "• Kirish: telefon raqami va SMS kodi; Telegram orqali — Telegram ID; Apple yoki Google orqali — hisob identifikatori va email.",
      "• Chek va blank suratlari hamda ulardan aniqlangan ma’lumotlar (dori nomlari, soni, sana). Blanklarda uchinchi shaxslar, jumladan bemorlar ma’lumotlari bo‘lishi mumkin.",
      "• Dasturdagi ishtirok: kurslar va testlar, so‘rovnomalar, kvestlar, IQC ballari, berilgan vaucherlar, aksiyalarda ishtirok.",
      "• Yordam xizmati bilan yozishmalar.",
      "• Texnik ma’lumotlar: push-bildirishnoma tokeni, qurilma turi, kirish vaqti.",
      "Geolokatsiya, kontaktlar va reklama identifikatorlarini yig‘maymiz, reklama ko‘rsatmaymiz va ma’lumotlarni sotmaymiz.",
    ]),
    PrivacyDocSection("3", "Nima uchun", [
      "Xizmat ishlashi (kirish, ta’lim, chek va blanklarni tekshirish, ballar, vaucherlar), bildirishnomalar, yordam, suiiste’mollarning oldini olish va 4-bo‘limda ko‘rsatilgan hajmda hamkor kompaniyalarga hisobot. Asos — ro‘yxatdan o‘tishda beriladigan rozilik.",
    ]),
    PrivacyDocSection("4", "Kimga uzatiladi", [
      "• Dastur hamkori bo‘lgan farmatsevtika kompaniyalariga: tibbiy vakil unga biriktirilgan ishtirokchilarning F.I.Sh., dorixonasi, shahri va faollik ko‘rsatkichlarini ko‘radi; kompaniyalar o‘z kvestlari bo‘yicha umumiy statistikani oladi.",
      "• Xizmat ko‘rsatuvchilarga: Microsoft Azure (suratlarni aniqlash), Google Firebase (bildirishnomalar), Eskiz.uz (SMS), Telegram, Apple va Google (kirish), Vimeo (videodarslar).",
      "• Davlat organlariga — faqat qonun talabiga ko‘ra.",
    ]),
    PrivacyDocSection("5", "Ma’lumotlar qayerda saqlanadi", [
      "Litva Respublikasidagi (Yevropa Ittifoqi) Hostinger provayderi serverlarida.",
    ]),
    PrivacyDocSection("6", "Saqlash muddati", [
      "Profil ma’lumotlari hisob mavjud ekan saqlanadi. Hisob o‘chirilgach shaxsiy ma’lumotlar darhol o‘chiriladi; ballar va vaucherlar yozuvlari shaxsiy ma’lumotlarsiz 5 yil saqlanadi; chek va blank suratlari 4 oy saqlanadi va avtomatik o‘chiriladi.",
    ]),
    PrivacyDocSection("7", "Huquqlaringiz va hisobni o‘chirish", [
      "Ilovada: Profil → «Hisobni o‘chirish». Batafsil: pharmview.uz/delete-account. Boshqa murojaatlar: support@pharmiq.uz, ilova ichidagi yordam xizmati yoki +998 90 027 69 69 — 30 kun ichida javob beramiz.",
    ]),
    PrivacyDocSection("8", "Xavfsizlik, yosh, o‘zgarishlar", [
      "Ma’lumotlar faqat shifrlangan ulanish (HTTPS) orqali uzatiladi. Xizmat 18 yoshdan katta mutaxassislar uchun. Muhim o‘zgarishlar haqida ilovada xabar beramiz.",
    ]),
  ],
);

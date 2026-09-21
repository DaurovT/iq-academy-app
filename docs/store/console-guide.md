# Пошаговое заполнение App Store Connect и Google Play Console

Все тексты — в `listing.md`, ответы про данные — в `privacy-answers.md`, заметки для проверки — в `review-notes.md`,
картинки — в `assets/`. Если название кнопки чуть отличается — ищите похожую по смыслу.

---

## Часть A. App Store Connect (https://appstoreconnect.apple.com)

### A1. Создать приложение
1. **Apps** → синий **＋** → **New App**.
2. **Platforms:** iOS.
3. **Name:** `PharmIQ Academy`
4. **Primary Language:** Russian.
5. **Bundle ID:** выбрать `uz.iqacademy.platformApp`.
6. **SKU:** `pharmiq-academy-2026`
7. **User Access:** Full Access → **Create**.

### A2. App Information (слева)
- **Subtitle:** `Обучение и баллы для аптек`
- **Category:** Primary — **Education**, Secondary — **Medical**.
- **Content Rights:** «Contains third-party content» → **Yes** (курсы и материалы компаний-партнёров) → подтвердить, что права есть.
- **Age Rating** → Edit → отвечать так:
  - Medical or Treatment-Focused Content → **Infrequent/Mild**
  - Contests → **Frequent/Intense** («Супер Сапёр» — призовая акция)
  - Simulated Gambling → **None** (ставок на деньги нет)
  - Всё остальное → **None / No**. Unrestricted Web Access → **No**. Age restriction: 18+ (если спросит).

### A3. Pricing and Availability
- **Price:** Free.
- **Availability:** Uzbekistan (добавьте Казахстан, Таджикистан, Кыргызстан, если программа там работает).

### A4. App Privacy
1. **Privacy Policy URL:** `https://pharmview.uz/privacy`
2. **Data Collection** → Get Started → **Yes, we collect data**.
3. Отметить типы из таблицы Apple в `privacy-answers.md`: Name, Phone Number, Email Address, Other User Contact Info,
   Health, Photos or Videos, Other User Content, User ID, Device ID, Product Interaction.
4. Для **каждого** типа: Purpose → **App Functionality**; Linked to user → **Yes**; Used for tracking → **No**.
5. **Publish**.

### A5. Страница версии (слева «1.0 Prepare for Submission»)
- **Screenshots → iPhone 6.9"**: перетащить 3 файла из `assets/appstore/`.
- **Promotional Text, Description, Keywords** — из `listing.md` (раздел «Русский»).
- **Support URL:** `https://pharmview.uz/privacy` (там все контакты). **Marketing URL:** пусто.
- **Version:** `1.0.0`. **Copyright:** `2026 PHARMIQ ACADEMY LLC`
- **Build:** появится после загрузки из Xcode (Product → Archive → Distribute App → App Store Connect).
  При загрузке на вопрос о шифровании: **None of the algorithms mentioned above** (используется только стандартный HTTPS).
- **App Review Information:**
  - Sign-in required → ✓. **User name:** `+998901112233` **Password:** `00000`
  - **Notes:** вставить английский текст из `review-notes.md` (там все три демо-аккаунта).
  - Contact: имя, телефон `+998900276969`, email `support@pharmiq.uz`.
- **Version Release:** Manually release.
- **Add for Review** → **Submit**.

---

## Часть B. Google Play Console (https://play.google.com/console)

> Если аккаунт разработчика **личный** и создан после ноября 2023 — Google требует закрытое тестирование
> (12+ тестировщиков, 14 дней) до выпуска в production. Для аккаунта **организации** (ООО) этого требования нет.

### B1. Создать приложение
1. **All apps** → **Create app**.
2. **App name:** `PharmIQ Academy`. **Default language:** Russian – ru-RU. **App or game:** App. **Free or paid:** Free.
3. Отметить обе декларации → **Create app**.

### B2. «Set up your app» (Dashboard → по списку задач)
- **App access** → «All or some functionality is restricted» → **Add instructions**:
  Name `Demo`, Username `+998901112233`, Password `00000`,
  Other: «Code 00000 works for demo numbers without SMS. Doctor: +998907778899, Medical rep: +998901234567.»
- **Ads** → **No**, the app does not contain ads.
- **Content rating** → Start questionnaire → email `support@pharmiq.uz`, категория **Reference, News, or Educational**.
  Насилие, секс, лексика, наркотики — **No**. Об азартных играх: реальных денег — **No**;
  на вопрос о призах/акциях отвечать честно: призовая акция за внутренние баллы, покупок нет.
- **Target audience** → только **18 and over**.
- **News app** → No. **Government app** → No. **Financial features** → My app doesn't provide financial features.
- **Health apps** (если спросит) → приложение обучающее для специалистов, не для лечения/диагностики.
- **Data safety** → по разделу Google в `privacy-answers.md`:
  - Collects data → Yes; Shares data → Yes (компании-партнёры программы).
  - Encrypted in transit → Yes. Users can request deletion → Yes → URL `https://pharmview.uz/delete-account`
  - Типы и цели — по таблице.
- **Privacy policy** → `https://pharmview.uz/privacy`

### B3. Store settings
- **App category:** Education. **Contact:** email `support@pharmiq.uz`, phone `+998900276969`, website `https://pharmview.uz`.

### B4. Main store listing
- **App name:** `PharmIQ Academy`
- **Short description:** `Курсы, тесты и программа баллов для фармацевтов и врачей`
- **Full description:** из `listing.md` (раздел «Русский», «Описание»).
- **App icon:** `assets/googleplay/icon-512.png`
- **Feature graphic:** `assets/googleplay/feature-graphic-1024x500.png`
- **Phone screenshots:** 3 файла `assets/googleplay/1-*.png … 3-*.png`
- **Save**.

### B5. Выпуск
1. **Test and release → Production** (или Internal testing для первой проверки) → **Create new release**.
2. Принять **Play App Signing**.
3. Загрузить `app-release.aab` (свежую сборку даст разработчик).
4. Release name `1.0.0`, заметки: «Первый выпуск».
5. **Review release** → **Start rollout**.
6. ⚠️ После загрузки: **Test and release → App integrity → App signing** → скопировать **SHA-1** из
   «App signing key certificate» и добавить в Firebase (проект pharmiq-fb → Android-приложение → Add fingerprint).
   Без этого вход через Google не заработает у скачавших из Google Play.

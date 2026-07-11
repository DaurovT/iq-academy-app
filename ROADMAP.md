# IQ Academy — Flutter клиент · Дорожная карта и контекст проекта

> Полный контекст разработки. Документ самодостаточен — по нему можно продолжить
> работу с нуля (в т.ч. в новой сессии), не восстанавливая знания заново.

---

## 1. Что это за проект

Мобильное клиентское приложение **IQ Academy** — геймифицированная фарма-платформа
(Узбекистан, валюта — сум, 1 IQC = 1000 UZS).

- **Проект:** `/root/platform_app` (Flutter, iOS + Android).
- **Источник правды:** существующий React-веб `/root/platform_web`
  (Vite + react-query + react-router). Flutter — его **зеркало**: те же роли,
  экраны, API. При сомнениях смотреть веб.
- **Бэкенд (REST, общий с вебом):** `http://194.5.157.183:4000/api/1.0`
  (значение `VITE_API_BASE` из `platform_web/.env`). **Внимание: http, не https.**
- **Контракт веба:** `platform_web/src/lib/api/contract.ts`, типы —
  `platform_web/src/lib/types.ts`. Именно они перенесены в Dart 1-в-1.

### Роли (4)
| Роль (enum `Role`) | JSON | Кто |
|---|---|---|
| `pharmacist` | `pharmacist` | Фармацевт |
| `doctor` | `doctor` | Врач |
| `medrep` | `medrep` | Мед. представитель |
| `productOwner` | `product_owner` | Бренд / Продукт-оунер |

Один аккаунт может иметь несколько ролей; активная выбирается после входа и
хранится локально. Навигация и набор экранов зависят от активной роли.

---

## 2. Технологический стек (и почему)

Выбран под новичка в Flutter — мейнстрим, максимум документации.

| Задача | Пакет | Версия | Почему |
|---|---|---|---|
| Стейт + кэш запросов | `flutter_riverpod` | ^3.3.2 | аналог react-query: загрузка/данные/ошибка, кэш, инвалидация |
| Сеть | `dio` | ^5.10.0 | интерсепторы токена/ошибок, multipart для фото |
| Модели (fromJson) | `freezed` + `json_serializable` | ^3.1.0 / ^6.9.5 | кодоген неизменяемых моделей, union-типы |
| Роутинг + гварды | `go_router` | ^17.0.0 | redirect-гварды по ролям (аналог `Gate` из веба) |
| Токен | `flutter_secure_storage` | **^9.2.4** | шифрованное хранилище (НЕ поднимать до 10/11 — см. §7) |
| Локализация | `intl` | ^0.19.0 | форматирование; slang для i18n добавим на фазе 11 |
| Фото | `image_picker` | ^1.2.1 | камера/галерея |
| QR | `qr_flutter` | ^4.1.0 | QR ваучера из кода |
| Внешние ссылки | `url_launcher` | ^6.3.2 | открытие Telegram-бота |
| Оффлайн-очередь | `uuid`, `connectivity_plus`, `path_provider` | 4.5.3 / 7.2.0 / 2.1.5 | idempotencyKey, сеть, персист файлов |

Кодоген: `dart run build_runner build --delete-conflicting-outputs`
(после правки любой freezed-модели).

---

## 3. Архитектура и структура

Feature-first. UI зависит **только** от абстрактного `PlatformApi`, а не от Dio —
это позволяет позже подменять реализацию (mock/real), как в вебе.

```
lib/
  main.dart                     # ProviderScope + MaterialApp.router
  core/
    api/
      platform_api.dart         # абстрактный контракт (зеркало contract.ts): 12 секций
      http_api.dart             # реализация на Dio
      api_client.dart           # createDio: baseUrl, Bearer-токен, разбор ошибок FastAPI {detail}
      api_exception.dart        # ApiException (текст ошибки, statusCode, unauthorized)
      token_store.dart          # secure storage: token, activeRole, themeMode
      upload.dart               # UploadFile {path} — абстракция файла (без Dio)
      providers.dart            # secureStorage → tokenStore → dio → apiProvider
    auth/
      auth_controller.dart      # AsyncNotifier<AuthState>: сессия, роль, вход/выход
    theme/
      app_theme.dart            # Material 3 из seed-цвета 0xFF2E7D5B (зелёный)
      theme_controller.dart     # ThemeMode + сохранение в хранилище
    router/
      app_router.dart           # go_router: все роуты + redirect-гвард
    format.dart                 # formatUzs / formatIqc / formatDate / formatDateTime
    models/                     # ~40 freezed-моделей из types.ts
      common.dart               # Role, Language (enum @JsonValue), LocalizedText(+конвертер)
      account.dart              # Account, Session, TgLoginStart, TgPollResult(sealed union)
      wallet.dart               # Wallet, WalletTxn, VoucherDenomination, IssuedVoucher, PendingAccrual
      quest.dart                # Quest, QuestDetail, QuestMechanic, TopSeller, QuestParticipation + enums
      learn.dart                # Course, Lesson, CourseDetail, Quiz, QuizQuestion, QuizResult, QuizAnswer
      check.dart                # Check, CheckDetail, Recipe, RecipeDetail, Photo, DoctorRecipeInfo + CheckStatus
      notification.dart         # AppNotification, AccountSettings, NotificationSettings
      medrep.dart               # MedrepMetrics, MedrepQuest(+участники), PortfolioPharmacist, Leaderboard, ...
      brand.dart                # BrandDashboard, BrandQuest, BrandProduct, BrandInfo, SalesLogRow, сегменты
      registration.dart         # RegistrationSchema, RegField(+RegFieldType), RegOption, RefItem
      support.dart              # SupportMessage
    uploads/
      pending_upload.dart       # модель отложенной загрузки (toJson/fromJson)
      upload_queue.dart         # AsyncNotifier: очередь, ретраи по сети, персист на диск
  features/
    shell/
      app_shell.dart            # оболочка: контент + нижняя навигация (по роли); держит очередь живой
      nav_config.dart           # kRoleNav: Map<Role, List<NavItem>> — навигация как в web/AppShell.tsx
    shared/
      splash/  login/  register/  role_select/  home/  notifications/
      profile/  support/  settings/  quest_history/  placeholder/
      widgets/home_app_bar.dart # шапка главной: тема, уведомления(+бейдж), смена роли
      providers.dart            # notifications, unreadCount, registrationSchema, cities, specialties,
                                #   supportThread, notificationSettings, accountSettings
    pharmacist/                 # home, quests(+detail), quest_detail, wallet, voucher,
                                #   checks(+detail), learn, course_detail, lesson_view, quiz + providers
    doctor/                     # home, recipes(+detail) + providers
    medrep/                     # home, portfolio(+detail), quests, leaderboard, referrals, companies + providers
    brand/                      # dashboard, brand_quests(+detail), brand_products(+detail),
                                #   brands(+detail), sales_log + providers
  widgets/
    async_view.dart             # AsyncView<T>: единый рендер загрузка/ошибка+повтор/данные; EmptyState
    stat_tile.dart              # StatTile / StatGrid для дашбордов
```

### Ключевые паттерны
- **Экран = провайдер + AsyncView.** `ref.watch(провайдер)` → `AsyncView(value:…, data:…)`
  даёт загрузку/ошибку/повтор бесплатно. Pull-to-refresh — `ref.invalidate(провайдер)`.
  Эталон: `features/pharmacist/quests_screen.dart`.
- **Мутации** (обмен ваучера, отправка чека, поощрение) — `ref.read(apiProvider)…`,
  затем `ref.invalidate(...)` затронутых провайдеров + SnackBar.
- **Riverpod-цепочка:** `secureStorageProvider → tokenStoreProvider → dioProvider → apiProvider`.
- **AsyncValue:** в этой версии Riverpod геттер `.valueOrNull` недоступен — использовать
  **`.asData?.value`**.

---

## 4. Навигация и роуты (go_router)

Гости: `/splash`, `/login`, `/register`. Приложение — под `ShellRoute` (`AppShell`):

```
/splash /login /register /role                 — вне оболочки
/app                                            — HomeScreen (диспетчер по роли)
/app/checks  /app/checks/:id                    — фармацевт
/app/quests  /app/quests/history  /app/quests/:id
/app/wallet  /app/wallet/voucher/:id
/app/learn   /app/learn/:id
/app/learn/:courseId/lesson/:lessonId
/app/learn/:courseId/quiz/:lessonId
/app/recipes /app/recipes/:id                   — врач
/app/portfolio /app/portfolio/:telegramId       — медпред
/app/leaderboard /app/medrep/quests /app/referrals /app/companies
/app/brand/quests(/:id) /app/brand/products(/:id) — бренд
/app/brand/brands(/:id) /app/brand/logs
/app/notifications /app/profile /app/support
/app/settings/notifications                     — общие
```

**Redirect-гвард** (единый, в `app_router.dart`): пока идёт проверка сессии → `/splash`;
гость → `/login`; вошёл без роли → `/role`; готов и на служебном экране → `/app`.
Реактивность — через `ValueNotifier`, дёргаемый `ref.listen(authControllerProvider)`.

Нижняя навигация — из `nav_config.dart` (`kRoleNav`): свои 4 вкладки на роль + профиль.
Каждый экран рисует **свой** `AppBar` (у `AppShell` его нет — иначе двойная шапка).

---

## 5. API-контракт (секции `PlatformApi`)

Все — в `core/api/platform_api.dart`, реализация в `http_api.dart`. Токен ставит
интерсептор Dio. Пути 1-в-1 с `platform_web/src/lib/api/http.ts`.

- `auth` — checkNumber, sendSms, confirmCode, session(`POST /auth/userCheck`),
  logout, register, telegramStart, telegramPoll
- `reference` — registrationSchema, cities, specialties
- `account` — settings, setLanguage, telegram link, logoutAll, deleteAccount, changePhone start/confirm
- `wallet` — get, transactions, pendingAccruals, availableVouchers, myVouchers, redeem
- `quests` — list(target?), get(id), participations
- `catalog` — courses, course, completeLesson, quiz, submitQuiz
- `checks` — mine, submit(multipart), get(id)
- `recipes` — mine, submit(multipart, doctor?), get(id)
- `notifications` — list, unreadCount, markAllRead, markRead, settings, setSettings
- `medrep` — metrics, portfolio, pharmacist, leaderboard, quests, reflink, companies,
  pendingReferrals, accept/rejectReferral, incentivize
- `brand` — dashboard, quests, quest, products, product, brands, brandInfo, salesLog
- `support` — thread, send

Загрузка фото (`checks/recipes.submit`) идёт **через оффлайн-очередь** (§6), а не напрямую.

---

## 6. Оффлайн-очередь загрузки фото (`core/uploads/`)

- При отправке чека/рецепта файлы **копируются** в `<docs>/uploads/` (temp-файлы
  image_picker могут очиститься), задача пишется в `queue.json`.
- `idempotencyKey = id` (uuid) — бэк не создаёт дублей при ретраях.
- Ретрай при появлении сети (`connectivity_plus`) и при старте.
- Держится живой через `ref.watch(uploadQueueProvider)` в `AppShell`.
- Индикатор ожидающих — баннер в `checks_screen` (`pendingUploadCountProvider`).

---

## 7. Сборка и окружение (важно!)

- **Flutter:** 3.29 / Dart 3.7 в `/home/flutterdev/flutter/bin` (нет в PATH — добавлять).
  Сборка от root → нужен `git config --global --add safe.directory '*'`.
- **Android SDK:** `ANDROID_HOME=/home/flutterdev/android-sdk`. Есть android-34/35/36, NDK 26.3.
- **Сборка APK зелёная:** `flutter build apk --debug` → `build/app/outputs/flutter-apk/app-debug.apk` (~190 МБ).

### Тулчейн (пришлось поднять — `androidx.core 1.18` потянул каскад)
| Что | Значение | Файл |
|---|---|---|
| AGP | **8.9.1** | `android/settings.gradle.kts` |
| Kotlin plugin | **2.1.20** | `android/settings.gradle.kts` |
| Gradle wrapper | **8.11.1** | `android/gradle/wrapper/gradle-wrapper.properties` |
| compileSdk | **36** | `android/app/build.gradle.kts` |
| minSdk | **23** | `android/app/build.gradle.kts` |

### Память Gradle (критично для контейнера)
`android/gradle.properties`: `-Xmx2560m` + `org.gradle.daemon=false` + `parallel=false`.
Дефолтный `-Xmx8G` **OOM-killит демон** (в контейнере ~3.5 Gi свободно).

### Платформенная конфигурация (иначе не работает при тесте)
- **Android** (`AndroidManifest.xml`): `usesCleartextTraffic="true"` (API по http!),
  `INTERNET`, `CAMERA`, queries для схем `https`/`tg`. Label = «IQ Academy».
- **iOS** (`Info.plist`): `NSAppTransportSecurity → NSAllowsArbitraryLoads`,
  `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription`, `LSApplicationQueriesSchemes` (tg, https).

### Мелочи
- `flutter_secure_storage` держать на **9.x** (10/11 требуют ещё более новый androidx.core).
- Пакеты `slang`/`slang_flutter`/`slang_build_runner` временно **убраны** (падал их build.yaml
  без конфига) — вернуть на фазе 11.

---

## 8. Прогресс: 14 / 19

### ✅ Готово и проверено
- [x] Фаза 1 — Фундамент: проект, стек, тема M3
- [x] Фаза 1 — Auth: телефон+SMS, secure token, go_router гварды
- [x] Фаза 2 — ~40 моделей freezed + полный PlatformApi/HttpApi
- [x] Фаза 3 — AppShell + ролевая навигация + общие виджеты
- [x] Фаза 3 — Фармацевт: Home / Квесты(+деталь+история) / Кошелёк / Чеки(+деталь+фото) / Обучение
- [x] Фаза 4 — Регистрация: динамическая форма по RegistrationSchema + выбор роли
- [x] Фаза 5 — Обучение: просмотр урока + завершение
- [x] Фаза 5 — Квиз-движок: single/multi/numeric/ordering/matching, таймер, результат+разбор
- [x] Фаза 6 — Врач: Рецепты(+деталь+фото с онбордингом) + Home
- [x] Фаза 6 — История квестов (QuestParticipation)
- [x] Фаза 7 — Медпред: Обзор / Портфель(+деталь+поощрение) / Квесты / Лидерборд / Рефералы / Компании
- [x] Фаза 8 — Бренд: Дашборд / Квесты(+деталь) / Продукты(+деталь) / Бренды(+деталь) / Логи продаж
- [x] Фаза 9 — Поддержка(чат) + настройки уведомлений + управление аккаунтом
- [x] Фаза 10 — Telegram-вход (deep-link + поллинг nonce)
- [x] Фаза 12 — QR-ваучеры + экран ваучера + бейдж unread
- [x] Фаза 13 — Оффлайн-очередь фото (idempotencyKey, ретраи, персист)
- [x] Фаза 15a — Сохранение темы между запусками
- [x] Платформа — cleartext-HTTP, права, схемы (Android+iOS)
- [x] Сборка APK зелёная (тулчейн выше)

### ⏳ Осталось
- [ ] **Фаза 11 — i18n**: вернуть slang, локализовать все строки на ru/uz/kz + переключатель языка.
      Строки сейчас зашиты по-русски. Метки: `Role.label`, `CheckStatus.label`, тексты экранов.
      *Делать лучше после теста флоу — иначе локализуем то, что может измениться.*
- [ ] **Фаза 14 — Полировка UI**: перенести фирменные токены/цвета из
      `platform_web/src/theme/tokens.css`, skeleton-загрузка вместо спиннеров, анимации переходов.
- [ ] **Фаза 15b — Push (FCM)**: опционально. Нужен Firebase-проект + `google-services.json` /
      `GoogleService-Info.plist`. **Решение пользователя: нужен ли вообще.**
- [ ] **Фаза 16 — Запуск на эмуляторе**: `flutter emulators --launch <id>` → `flutter run`.
      Тест против боевого API тест-аккаунтом (Тимур, tg 835936704). Фикс найденных багов.
      *Планирует делать пользователь.*
- [ ] **Фаза 17 — Релиз**: иконка/сплеш (`flutter_launcher_icons` + исходник лого),
      подпись Android (keystore + `signingConfigs`), сборка iOS.

---

## 9. Как продолжить (шпаргалка)

```bash
export PATH="$PATH:/home/flutterdev/flutter/bin"
export ANDROID_HOME=/home/flutterdev/android-sdk
cd /root/platform_app

flutter analyze                                   # проверка
dart run build_runner build --delete-conflicting-outputs   # после правки моделей
flutter test                                      # тесты
flutter build apk --debug                         # сборка (~несколько минут)
flutter run                                        # запуск на устройстве/эмуляторе
```

Тест-данные: ваучеры на 13000 сум — тестовые; тест-аккаунт Тимур (tg 835936704).

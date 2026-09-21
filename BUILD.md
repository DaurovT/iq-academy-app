# Сборка PharmIQ Academy

Ветка разработки — `figma-redesign`. Бэкенд — `https://pharmview.uz/api/1.0` (прописан в коде).

## 1. Что нужно установить
- **Flutter 3.44.6** (Dart 3.12). На более старом Flutter `pub get` упадёт — этого требует `sign_in_with_apple`.
- **Android:** Android SDK с платформой 36, JDK 17.
- **iOS:** Mac с Xcode 16+, доступ к команде Apple Developer `XQ35SJRLQH`.

```bash
git clone https://github.com/DaurovT/iq-academy-app.git && cd iq-academy-app
git checkout figma-redesign
flutter pub get
```
Сгенерированные файлы (модели freezed/json, локализация) лежат в репозитории — генерацию запускать не нужно.
После правок моделей: `dart run build_runner build --delete-conflicting-outputs`; после правок `lib/l10n/*.arb`: `flutter gen-l10n`.

## 2. Подпись Android (обязательно для релиза)
Ключ загрузки **не хранится в git** (репозиторий публичный). Его SHA-1 зарегистрирован в Firebase —
без этого ключа вход через Google в релизной сборке работать не будет.

1. Скачать с сервера `/root/secrets/android/pharmiq-upload.jks` и `/root/secrets/android/key.properties.backup`
   (в VS Code Remote: правый клик по файлу → Download).
2. Положить ключ в надёжное место вне репозитория, например `~/keys/pharmiq-upload.jks`.
3. Создать `android/key.properties` (он в `.gitignore`) — содержимое из `key.properties.backup`,
   но `storeFile` поменять на **свой** путь к ключу:
   ```
   storePassword=…
   keyPassword=…
   keyAlias=upload
   storeFile=/Users/<вы>/keys/pharmiq-upload.jks
   ```
4. Сделать резервную копию ключа и паролей: при потере придётся восстанавливать ключ загрузки через поддержку Google.

Без `key.properties` релиз подписывается отладочным ключом — Google Play такую сборку не примет.

## 3. Сборка Android (Google Play)
```bash
flutter build appbundle --release
# → build/app/outputs/bundle/release/app-release.aab
```
Проверить подпись: `keytool -printcert -jarfile build/app/outputs/bundle/release/app-release.aab`
→ SHA-1 должен быть `D6:53:DA:1C:2E:1F:B1:2F:D0:08:32:DB:20:6E:54:66:32:17:96:2A`.

## 4. Сборка iOS (App Store)
```bash
flutter build ipa --release
```
или: `open ios/Runner.xcworkspace` → Runner → Signing & Capabilities → Team `XQ35SJRLQH`, Automatic signing →
Product → Archive → Distribute App → App Store Connect.
Приложение только для iPhone, только вертикальная ориентация. Sign in with Apple, push и URL-схема Google уже настроены.

## 5. Номер версии
В `pubspec.yaml`: `version: 1.0.0+1` — `1.0.0` видно пользователям, `+1` — номер сборки.
**Каждая новая загрузка в стор — номер сборки +1** (`1.0.0+2`, `1.0.0+3`…), иначе консоль её не примет.

## 6. Известные ловушки
- Flutter-тулинг иногда сам откатывает `minSdk = 23` в `android/app/build.gradle.kts` на `flutter.minSdkVersion`
  (замечено после `flutter create` и `flutter build apk`). Перед релизом: `git diff android/app/build.gradle.kts`.
- После первой загрузки в Google Play добавить в Firebase SHA-1 ключа **App Signing** из Play Console
  (App integrity → App signing), иначе вход через Google не заработает у скачавших из стора.
- `deploy_web.sh` — выкатка веб-версии на сервер pharmview.uz, запускается только на сервере.

## 7. Материалы для сторов
`docs/store/`: `console-guide.md` — пошаговое заполнение консолей, `listing.md` — тексты, `privacy-answers.md` —
анкеты данных, `review-notes.md` — заметки для проверки, `assets/` — скриншоты, обложка, иконка.
Демо-аккаунты для проверяющих: `+998901112233` (фармацевт), `+998907778899` (врач), `+998901234567` (медпред), код `00000`.

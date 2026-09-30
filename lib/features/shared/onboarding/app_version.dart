/// Версия приложения для заставки и экрана обновления.
///
/// Пакета package_info в зависимостях нет, поэтому версия передаётся при
/// сборке: `flutter build … --dart-define=APP_VERSION=1.2.0` (значение из
/// `version:` в pubspec.yaml). Пустая строка — версия не показывается.
const kAppVersion = String.fromEnvironment('APP_VERSION');

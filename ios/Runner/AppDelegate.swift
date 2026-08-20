import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Пуш-уведомления: делегат нужен, чтобы уведомления показывались при открытом
    // приложении и чтобы отрабатывал тап по ним. Регистрацию в APNs делает firebase_messaging.
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
    }
    // ВАЖНО: при схеме с implicit engine firebase_messaging НЕ вызывает регистрацию
    // в APNs автоматически — Apple не выдаёт APNs-токен, и FCM-токен не появляется
    // (на iOS токен вообще не уходил на бэкенд). Запрашиваем регистрацию явно;
    // APNs-токен затем перехватывает swizzling firebase_messaging.
    application.registerForRemoteNotifications()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}

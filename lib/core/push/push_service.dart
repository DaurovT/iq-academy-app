import 'dart:convert';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/providers.dart';
import '../auth/auth_controller.dart';
import '../router/app_router.dart';

/// Пуш-уведомления (Firebase Cloud Messaging), Android + iOS.
///
/// Как работает:
///  • приложение получает от FCM токен устройства → отправляет его на сервер (привязка к аккаунту);
///  • сервер шлёт пуш на этот токен при событии (начислен IQC, выигрыш в Сапёре, опрос и т.д.);
///  • приложение закрыто/свёрнуто → уведомление рисует система (мы шлём notification-payload);
///  • приложение открыто → Android сам не рисует, показываем локальным уведомлением;
///  • тап по уведомлению → открываем нужный экран (по refType/refId из data).
///
/// Всё обёрнуто в try/catch: сбой пушей НИКОГДА не должен ронять приложение.

/// Обработчик фоновых сообщений. Должен быть top-level с vm:entry-point —
/// его вызывает отдельный изолят, когда приложение свёрнуто/закрыто.
/// Само уведомление рисует система (мы шлём notification-payload), тут ничего не нужно.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {}

const _channel = AndroidNotificationChannel(
  'pharmiq_default', // должен совпадать с default_notification_channel_id в AndroidManifest
  'Уведомления',
  description: 'Начисления IQC, розыгрыши, опросы и новости',
  importance: Importance.high,
);

class PushService {
  static final _local = FlutterLocalNotificationsPlugin();
  static bool _ready = false;
  static String? _token;

  /// Шаг 1 — до runApp: поднять Firebase и локальные уведомления.
  static Future<void> initFirebase() async {
    try {
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

      await _local.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        ),
        onDidReceiveNotificationResponse: (resp) {
          final payload = resp.payload;
          if (payload == null || payload.isEmpty) return;
          try {
            _pendingRoute = routeFor(jsonDecode(payload) as Map<String, dynamic>);
            _consumePendingRoute();
          } catch (_) {}
        },
      );
      await _local
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);

      // iOS: показывать уведомление и когда приложение открыто
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true,
      );
      _ready = true;
    } catch (e) {
      debugPrint('PushService.initFirebase: $e');
    }
  }

  /// Шаг 2 — из виджета приложения: спросить разрешение, слушать сообщения,
  /// привязывать/отвязывать токен по состоянию авторизации.
  static void attach(WidgetRef ref) {
    if (!_ready) return;
    try {
      _requestPermission();

      // приложение открыто → рисуем сами (Android). На iOS покажет система.
      FirebaseMessaging.onMessage.listen((m) {
        final n = m.notification;
        if (n == null || !Platform.isAndroid) return;
        _local.show(
          n.hashCode,
          n.title,
          n.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _channel.id, _channel.name,
              channelDescription: _channel.description,
              importance: Importance.high, priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
          ),
          payload: jsonEncode(m.data),
        );
      });

      // тап по уведомлению, когда приложение было свёрнуто
      FirebaseMessaging.onMessageOpenedApp.listen((m) {
        _pendingRoute = routeFor(m.data);
        _consumePendingRoute(ref);
      });

      // приложение запущено тапом по уведомлению (было полностью закрыто)
      FirebaseMessaging.instance.getInitialMessage().then((m) {
        if (m == null) return;
        _pendingRoute = routeFor(m.data);
        _consumePendingRoute(ref);
      });

      _ref = ref;
      // токен привязываем/отвязываем вслед за авторизацией
      ref.listen<AsyncValue<AuthState>>(authControllerProvider, (prev, next) {
        final wasAuthed = prev?.asData?.value.isAuthed ?? false;
        final isAuthed = next.asData?.value.isAuthed ?? false;
        if (isAuthed && !wasAuthed) syncToken(ref);
        if (!isAuthed && wasAuthed) dropToken(ref);
      });
      // если уже авторизованы на старте — привязать сразу
      if (ref.read(authControllerProvider).asData?.value.isAuthed ?? false) {
        syncToken(ref);
      }

      FirebaseMessaging.instance.onTokenRefresh.listen((t) {
        _token = t;
        _sendToken(ref, t);
      });
    } catch (e) {
      debugPrint('PushService.attach: $e');
    }
  }

  static WidgetRef? _ref;
  static String? _pendingRoute;

  static Future<void> _requestPermission() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: true, badge: true, sound: true,
      );
    } catch (e) {
      debugPrint('PushService.requestPermission: $e');
    }
  }

  /// Получить токен устройства и отправить на сервер.
  static Future<void> syncToken(WidgetRef ref) async {
    try {
      final t = await FirebaseMessaging.instance.getToken();
      if (t == null) return;
      _token = t;
      await _sendToken(ref, t);
    } catch (e) {
      debugPrint('PushService.syncToken: $e');
    }
  }

  static Future<void> _sendToken(WidgetRef ref, String token) async {
    try {
      await ref.read(apiProvider).devices.register(token, Platform.isIOS ? 'ios' : 'android');
    } catch (e) {
      debugPrint('PushService._sendToken: $e');
    }
  }

  /// Отвязать токен при выходе — чтобы пуши не летели прошлому пользователю.
  static Future<void> dropToken(WidgetRef ref) async {
    final t = _token;
    if (t == null) return;
    try {
      await ref.read(apiProvider).devices.unregister(t);
    } catch (e) {
      debugPrint('PushService.dropToken: $e');
    }
  }

  /// Куда вести по тапу — из data-полей, которые кладёт сервер (refType/refId).
  static String routeFor(Map<String, dynamic> data) {
    final refType = (data['refType'] ?? '').toString();
    final refId = (data['refId'] ?? '').toString();
    switch (refType) {
      case 'sapper':
        return refId.isNotEmpty ? '/app/sapper/$refId' : '/app/sapper';
      case 'news':
        return refId.isNotEmpty ? '/app/news/$refId' : '/app/news';
      case 'survey':
        return '/app'; // блок опроса живёт на главной
      case 'reward':
      case 'voucher':
        return '/app/wallet';
      case 'check':
        return refId.isNotEmpty ? '/app/checks/$refId' : '/app/checks';
      case 'recipe':
        return refId.isNotEmpty ? '/app/recipes/$refId' : '/app/recipes';
    }
    return '/app/notifications';
  }

  static void _consumePendingRoute([WidgetRef? ref]) {
    final r = _pendingRoute;
    final useRef = ref ?? _ref;
    if (r == null || useRef == null) return;
    _pendingRoute = null;
    try {
      useRef.read(routerProvider).push(r);
    } catch (e) {
      debugPrint('PushService._consumePendingRoute: $e');
    }
  }
}

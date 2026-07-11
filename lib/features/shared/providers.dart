import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/common.dart';
import '../../core/models/notification.dart';
import '../../core/models/registration.dart';
import '../../core/models/support.dart';

final notificationsProvider = FutureProvider<List<AppNotification>>((ref) {
  return ref.watch(apiProvider).notifications.list();
});

final unreadCountProvider = FutureProvider<int>((ref) {
  return ref.watch(apiProvider).notifications.unreadCount();
});

// ── Справочники / регистрация ──
final registrationSchemaProvider =
    FutureProvider.family<RegistrationSchema, Role>((ref, role) {
  return ref.watch(apiProvider).reference.registrationSchema(role);
});

final citiesProvider = FutureProvider<List<RefItem>>((ref) {
  return ref.watch(apiProvider).reference.cities();
});

final specialtiesProvider = FutureProvider<List<RefItem>>((ref) {
  return ref.watch(apiProvider).reference.specialties();
});

// ── Поддержка / настройки ──
final supportThreadProvider = FutureProvider<List<SupportMessage>>((ref) {
  return ref.watch(apiProvider).support.thread();
});

final notificationSettingsProvider =
    FutureProvider<NotificationSettings>((ref) {
  return ref.watch(apiProvider).notifications.settings();
});

final accountSettingsProvider = FutureProvider<AccountSettings>((ref) {
  return ref.watch(apiProvider).account.settings();
});

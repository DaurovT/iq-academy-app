import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api/providers.dart';
import 'auth/auth_controller.dart';
import 'models/common.dart';

/// Видимость разделов приложения — прятать/показывать из админки (раздел «Приложение»)
/// без новой сборки. Только видимость: функции модуля сервер не блокирует.
///
/// Нет данных (офлайн, первый запуск) → показываем всё: лучше лишний раздел, чем пустое меню.
class AppModules {
  const AppModules(this._map, {this.versions = const {}});
  static const empty = AppModules({});

  final Map<String, ({bool visible, List<String> hiddenRoles})> _map;

  /// Версии приложения из админки (docs/SERVER_TASKS.md, задача 9):
  /// `{"ios": {"latest": "1.2.6", "min": "1.2.0"}, "android": {...}}`.
  final Map<String, ({String? latest, String? min})> versions;

  ({String? latest, String? min}) get _platformVersions {
    final key = defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android';
    return versions[key] ?? (latest: null, min: null);
  }

  /// Последняя версия в магазине для этой платформы (или null).
  String? get latestVersion => _platformVersions.latest;

  /// Минимальная поддерживаемая версия: ниже — экран «Нужно обновить приложение».
  String? get minVersion => _platformVersions.min;

  bool isVisible(String key, Role? role) {
    final m = _map[key];
    if (m == null) return true;
    if (!m.visible) return false;
    return role == null || !m.hiddenRoles.contains(role.apiValue);
  }

  static AppModules fromJson(Map<String, dynamic> j) {
    final mods = (j['modules'] as Map?) ?? const {};
    final vers = (j['appVersions'] as Map?) ?? const {};
    String? s(Object? v) => v is String && v.trim().isNotEmpty ? v.trim() : null;
    return AppModules({
      for (final e in mods.entries)
        e.key as String: (
          visible: (e.value as Map)['visible'] != false,
          hiddenRoles: ((e.value as Map)['hiddenRoles'] as List? ?? const []).cast<String>(),
        ),
    }, versions: {
      for (final e in vers.entries)
        if (e.value is Map)
          e.key as String: (
            latest: s((e.value as Map)['latest']),
            min: s((e.value as Map)['min']),
          ),
    });
  }

  Map<String, dynamic> toJson() => {
        'modules': {
          for (final e in _map.entries)
            e.key: {'visible': e.value.visible, 'hiddenRoles': e.value.hiddenRoles},
        },
        'appVersions': {
          for (final e in versions.entries)
            e.key: {'latest': e.value.latest, 'min': e.value.min},
        },
      };
}

/// Разделы приложения по путям. Ключи — как в справочнике сервера (platform_api/app/app_modules.py).
const _routeModules = <String, String>{
  '/app/checks': 'checks',
  '/app/recipes': 'recipes',
  '/app/quests': 'quests',
  '/app/learn': 'learn',
  '/app/wallet': 'wallet',
  '/app/news': 'news',
  '/app/mini-apps': 'mini_apps',
  '/app/sapper': 'sapper',
  '/app/sapper-rules': 'sapper',
  '/app/support': 'support',
  '/app/portfolio': 'medrep_portfolio',
  '/app/doctors': 'medrep_doctors',
  '/app/medrep/quests': 'medrep_quests',
  '/app/referrals': 'medrep_referrals',
  '/app/companies': 'medrep_companies',
  '/app/leaderboard': 'leaderboard',
  '/app/brand': 'brand',
};

/// Модуль раздела по пути (самое длинное совпадение по сегментам) или null.
String? moduleForPath(String path) {
  String? best;
  var bestLen = -1;
  _routeModules.forEach((prefix, key) {
    final match = path == prefix || path.startsWith('$prefix/');
    if (match && prefix.length > bestLen) {
      best = key;
      bestLen = prefix.length;
    }
  });
  return best;
}

class AppModulesController extends AsyncNotifier<AppModules> {
  @override
  Future<AppModules> build() async {
    final authed = ref.watch(
        authControllerProvider.select((a) => a.asData?.value.isAuthed ?? false));
    final store = ref.read(tokenStoreProvider);
    AppModules? cached;
    try {
      final raw = await store.readModules();
      if (raw != null) cached = AppModules.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {}
    if (!authed) return cached ?? AppModules.empty;
    try {
      return await _fetch();
    } catch (_) {
      return cached ?? AppModules.empty;
    }
  }

  Future<AppModules> _fetch() async {
    final fresh = await ref
        .read(apiProvider)
        .account
        .appConfig()
        .timeout(const Duration(seconds: 8));
    await ref.read(tokenStoreProvider).writeModules(jsonEncode(fresh.toJson()));
    return fresh;
  }

  /// Перечитать при возврате в приложение — изменения из админки видны без перезапуска.
  Future<void> refresh() async {
    if (!(ref.read(authControllerProvider).asData?.value.isAuthed ?? false)) return;
    try {
      state = AsyncData(await _fetch());
    } catch (_) {}
  }
}

final appModulesProvider =
    AsyncNotifierProvider<AppModulesController, AppModules>(AppModulesController.new);

extension ModuleVisibilityRef on WidgetRef {
  /// Виден ли раздел для текущей роли. Пока настройки грузятся — виден.
  bool moduleVisible(String key) {
    final role = watch(authControllerProvider).asData?.value.activeRole;
    final m = watch(appModulesProvider).asData?.value;
    return m == null || m.isVisible(key, role);
  }
}

/// Показывает [child], только если раздел [module] не скрыт в админке.
class ModuleGate extends ConsumerWidget {
  const ModuleGate({super.key, required this.module, required this.child});

  final String module;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.moduleVisible(module) ? child : const SizedBox.shrink();
}

/// Сравнение версий «1.2.10» и «1.2.9» по числам; нечисловые части — 0.
int compareVersions(String a, String b) {
  List<int> parts(String v) =>
      v.split(RegExp(r'[.+-]')).map((x) => int.tryParse(x) ?? 0).toList();
  final pa = parts(a), pb = parts(b);
  for (var i = 0; i < 3; i++) {
    final x = i < pa.length ? pa[i] : 0, y = i < pb.length ? pb[i] : 0;
    if (x != y) return x.compareTo(y);
  }
  return 0;
}

/// Установленная версия ниже минимальной из админки → нужно обновиться.
/// Без версии сборки (отладка, тесты) проверка не срабатывает.
bool needsForceUpdate(AppModules m, String current) {
  final min = m.minVersion;
  return current.isNotEmpty && min != null && compareVersions(current, min) < 0;
}

/// В магазине есть версия новее установленной → мягкая подсказка.
bool hasNewerVersion(AppModules m, String current) {
  final latest = m.latestVersion;
  return current.isNotEmpty && latest != null && compareVersions(current, latest) < 0;
}

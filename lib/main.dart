import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/push/push_service.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Пуши: поднимаем Firebase до старта UI. Сбой не должен мешать запуску — внутри try/catch.
  await PushService.initFirebase();
  runApp(const ProviderScope(child: IqAcademyApp()));
}

class IqAcademyApp extends ConsumerStatefulWidget {
  const IqAcademyApp({super.key});

  @override
  ConsumerState<IqAcademyApp> createState() => _IqAcademyAppState();
}

class _IqAcademyAppState extends ConsumerState<IqAcademyApp> {
  @override
  void initState() {
    super.initState();
    // Разрешение на уведомления, слушатели сообщений и привязка токена к аккаунту.
    WidgetsBinding.instance.addPostFrameCallback((_) => PushService.attach(ref));
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'IQ Academy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}

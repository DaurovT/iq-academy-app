import 'package:flutter/material.dart';

/// Экран загрузки: показывается, пока проверяется сохранённая сессия.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

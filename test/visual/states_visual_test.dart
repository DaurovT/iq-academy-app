import 'package:flutter/material.dart';
import 'package:platform_app/core/design/design.dart';
import 'package:platform_app/widgets/pq_states.dart';

import 'pq_shot.dart';

/// Общие состояния: «Нет подключения» (OfflineFull) и «Что-то пошло не так» (ServerError).
Widget _screen(Widget body) => Scaffold(
      body: Stack(children: [
        const Positioned.fill(child: PqBackground()),
        SafeArea(
          child: Column(children: [
            PqTabHeader(onBell: () {}, bellLabel: 'Уведомления'),
            Expanded(child: body),
          ]),
        ),
      ]),
    );

void main() {
  pqShotBoth('OfflineFull', (t, dark) => pqShot(t,
      name: 'OfflineFull',
      dark: dark,
      nav: pharmacistNav,
      navIndex: 0,
      screen: _screen(PqOfflineView(onRetry: () {}))));
  pqShotBoth('ServerError', (t, dark) => pqShot(t,
      name: 'ServerError',
      dark: dark,
      nav: pharmacistNav,
      navIndex: 0,
      screen: _screen(PqErrorView(onRetry: () {}, onSupport: () {}, code: '503'))));
}

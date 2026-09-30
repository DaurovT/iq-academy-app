// Визуальная сверка раздела «Мини-приложения · Супер Сапёр» с макетами
// MiniApps, SapperIntro, SapperGame, SapperResult (тёмная + Light).
//   PQ_SHOTS_DIR=/path flutter test --no-pub test/visual/mini_apps_visual_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/api/platform_api.dart';
import 'package:platform_app/core/api/providers.dart';
import 'package:platform_app/core/app_modules.dart';
import 'package:platform_app/core/auth/auth_controller.dart';
import 'package:platform_app/core/models/sapper.dart';
import 'package:platform_app/features/mini_apps/mini_apps_screens.dart';
import 'package:platform_app/features/mini_apps/sapper_game_screen.dart';
import 'package:platform_app/features/mini_apps/sapper_widgets.dart';

import 'pq_shot.dart';

class _FakeAuth extends AuthController {
  @override
  Future<AuthState> build() async => const AuthState();
}

class _FakeModules extends AppModulesController {
  @override
  Future<AppModules> build() async => AppModules.empty;
}

/// Сапёр без сети: занятие клетки меняет состояние поля как в прототипе.
class _FakeSapper implements SapperApi {
  final extraMine = <int>[];
  int balance = 248;

  @override
  Future<List<SapperDrawItem>> draws() async => _draws();

  @override
  Future<SapperField> field(int id) async => _activeField(this);

  @override
  Future<SapperReserveResult> reserve(int id, int cellIndex) async {
    extraMine.add(cellIndex);
    balance -= 1;
    return SapperReserveResult(cellIndex: cellIndex, balanceIqc: balance);
  }
}

class _FakeApi implements PlatformApi {
  _FakeApi(this.sapper);

  @override
  final SapperApi sapper;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// ── Данные из макетов ────────────────────────────────────────────────────────
String _in6d23h() =>
    DateTime.now().add(const Duration(days: 6, hours: 23, minutes: 30)).toIso8601String();

const _legend = [
  SapperLegend(label: '10 IQC', count: 2),
  SapperLegend(label: '5 IQC', count: 3),
  SapperLegend(label: 'ваучер 13 000 сум', count: 1),
];

/// Чужие клетки (OTH) и мои клетки из прототипа SapperGame.
const _others = [0, 5, 7, 14, 17, 23, 25, 33, 40, 42, 44, 46, 28];
const _mine = [2, 11, 19, 30, 37];

List<SapperOccupied> get _occupied => [
      for (final i in _others) SapperOccupied(index: i, mine: false),
      for (final i in _mine) SapperOccupied(index: i, mine: true),
    ];

const _apps = [
  MiniApp(
    key: 'sapper',
    title: 'Супер Сапёр',
    subtitle:
        'Занимайте клетки за IQC. Раз в неделю поле вскрывается — под клетками прячутся IQC и ваучеры',
    available: true,
    activeDraws: 1,
  ),
];

List<SapperDrawItem> _draws() => [
      SapperDrawItem(
        id: 1,
        title: 'Розыгрыш недели',
        status: 'active',
        cellCount: 48,
        priceIqc: 1,
        revealAt: _in6d23h(),
        occupied: 18,
        myCells: 5,
        prizeCount: 6,
      ),
    ];

SapperField _activeField([_FakeSapper? api]) => SapperField(
      id: 1,
      title: 'Розыгрыш недели',
      status: 'active',
      cellCount: 48,
      cols: 8,
      priceIqc: 1,
      revealAt: _in6d23h(),
      acceptingUntil: _in6d23h(),
      balanceIqc: api?.balance ?? 248,
      legend: _legend,
      occupied: [
        ..._occupied,
        for (final i in api?.extraMine ?? const <int>[]) SapperOccupied(index: i, mine: true),
      ],
      myCells: [..._mine, ...?api?.extraMine],
    );

SapperField _finishedField() {
  // Клетки поля из макета SapperResult (чужие — те же, что в игре, кроме 25 и 33).
  const others = [0, 5, 7, 14, 17, 23, 28, 40, 42, 44, 46];
  return SapperField(
    id: 1,
    title: 'Розыгрыш недели',
    status: 'finished',
    cellCount: 48,
    cols: 8,
    priceIqc: 1,
    revealAt: '2026-06-29T12:00:00',
    balanceIqc: 248,
    legend: _legend,
    occupied: [
      for (final i in others) SapperOccupied(index: i, mine: false),
      for (final i in _mine) SapperOccupied(index: i, mine: true),
    ],
    myCells: _mine,
    prizes: const [
      SapperRevealPrize(index: 4, label: '10 IQC', won: false, wonByMe: false),
      SapperRevealPrize(index: 11, label: '10 IQC', won: true, wonByMe: true),
      SapperRevealPrize(index: 21, label: 'ваучер 13 000 сум', won: false, wonByMe: false),
      SapperRevealPrize(index: 25, label: '5 IQC', won: false, wonByMe: false),
      SapperRevealPrize(index: 33, label: '5 IQC', won: false, wonByMe: false),
      SapperRevealPrize(index: 41, label: '5 IQC', won: false, wonByMe: false),
    ],
    winners: const [
      SapperWinner(index: 11, label: '10 IQC', name: 'Тимур Дауров'),
      SapperWinner(index: 25, label: '5 IQC', name: 'Нилуфар А.'),
      SapperWinner(index: 33, label: '5 IQC', name: 'Шахзод К.'),
    ],
  );
}

List _overrides({SapperField? field, _FakeSapper? api}) => [
      if (api != null) apiProvider.overrideWithValue(_FakeApi(api)),
      authControllerProvider.overrideWith(_FakeAuth.new),
      appModulesProvider.overrideWith(_FakeModules.new),
      miniAppsProvider.overrideWith((ref) async => _apps),
      sapperDrawsProvider.overrideWith((ref) async => _draws()),
      sapperFieldProvider(1).overrideWith((ref) async => field ?? _activeField(api)),
    ];

/// Нажимает клетку [i] поля 8 колонок по 44 с зазором 4.
Future<void> _tapCell(WidgetTester t, int i) async {
  for (var k = 0; k < 5; k++) {
    await t.pump(const Duration(milliseconds: 50));
  }
  final grid = find.byType(SapperGrid);
  final box = t.getRect(grid);
  final left = box.left + (box.width - (8 * 44 + 7 * 4)) / 2;
  await t.tapAt(Offset(left + (i % 8) * 48 + 22, box.top + (i ~/ 8) * 48 + 22));
  await t.pump();
}

void main() {
  pqShotBoth('MiniApps', (t, dark) => pqShot(t,
      name: 'MiniApps',
      dark: dark,
      overrides: _overrides(),
      screen: const MiniAppsHubScreen()));

  pqShotBoth('SapperIntro', (t, dark) => pqShot(t,
      name: 'SapperIntro',
      dark: dark,
      height: 960,
      overrides: _overrides(),
      screen: const SapperDrawsScreen()));

  // Состояния прототипа SapperGame (эталоны — развёрнутый шаблон,
  // sapz/sapper_states.py): выбрана клетка 26 (pqSel) · без выбора ·
  // после «Занять 1 клетку» (тост, клетка 26 — моя, баланс 247).
  pqShotBoth('SapperGameSel', (t, dark) => pqShot(t,
      name: 'SapperGameSel',
      dark: dark,
      overrides: _overrides(),
      screen: const SapperGameScreen(id: 1),
      before: (t) => _tapCell(t, 26)));

  pqShotBoth('SapperGameIdle', (t, dark) => pqShot(t,
      name: 'SapperGameIdle',
      dark: dark,
      overrides: _overrides(),
      screen: const SapperGameScreen(id: 1)));

  pqShotBoth('SapperGameToast', (t, dark) {
    final api = _FakeSapper();
    return pqShot(t,
        name: 'SapperGameToast',
        dark: dark,
        overrides: _overrides(api: api),
        screen: const SapperGameScreen(id: 1),
        settle: const Duration(milliseconds: 1500),
        before: (t) async {
          await _tapCell(t, 26);
          await t.tap(find.text('Занять 1 клетку · 1 IQC'));
          for (var k = 0; k < 8; k++) {
            await t.pump(const Duration(milliseconds: 100));
          }
          await t.tap(find.text('Занять за 1 IQC'));
          for (var k = 0; k < 8; k++) {
            await t.pump(const Duration(milliseconds: 100));
          }
        });
  });

  pqShotBoth('SapperResult', (t, dark) => pqShot(t,
      name: 'SapperResult',
      dark: dark,
      height: 1060,
      overrides: _overrides(field: _finishedField()),
      screen: const SapperGameScreen(id: 1)));
}

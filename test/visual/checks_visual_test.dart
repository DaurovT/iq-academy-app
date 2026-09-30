// Визуальная сверка раздела «Чеки» с макетами (данные — как в макетах).
//   PQ_SHOTS_DIR=… flutter test --no-pub test/visual/checks_visual_test.dart
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_app/core/models/check.dart';
import 'package:platform_app/core/uploads/pending_upload.dart';
import 'package:platform_app/core/uploads/upload_queue.dart';
import 'package:platform_app/features/pharmacist/check_detail_screen.dart';
import 'package:platform_app/features/pharmacist/checks/camera_access.dart';
import 'package:platform_app/features/pharmacist/checks/check_ui.dart';
import 'package:platform_app/features/pharmacist/checks/upload_sheet.dart';
import 'package:platform_app/features/pharmacist/checks_screen.dart';
import 'package:platform_app/features/pharmacist/providers.dart';
import 'package:platform_app/features/shared/providers.dart';
import 'package:platform_app/features/shared/widgets/photo_lightbox.dart';

import 'pq_shot.dart';

/// Очередь без диска и сети.
class _Queue extends UploadQueue {
  @override
  Future<List<PendingUpload>> build() async => const [];

  @override
  Future<void> enqueueCheck(List<XFile> photos) async {}
}

// Даты — локальные (без «Z»), чтобы на экране было ровно как в макете.
Check _approved(int id, String at, String drug, int packs) => Check(
    id: id,
    status: CheckStatus.approved,
    createdAt: at,
    photoCount: 1,
    drugs: [CheckDrug(name: drug, packs: packs)]);

/// Макет Checks: 14 чеков — 2 переснять, 1 на проверке, история.
final _checks = <Check>[
  const Check(
      id: 12594,
      status: CheckStatus.rejected,
      createdAt: '2026-01-15T19:54:00',
      photoCount: 1,
      drugs: [],
      rejectReason: 'Чек размыт или обрезан'),
  const Check(
      id: 9517,
      status: CheckStatus.rejected,
      createdAt: '2025-12-02T11:52:00',
      photoCount: 1,
      drugs: [],
      rejectReason: 'Плохое качество фото'),
  const Check(
      id: 11203,
      status: CheckStatus.pending,
      createdAt: '2026-06-28T09:12:00',
      photoCount: 2,
      drugs: []),
  _approved(23345, '2026-06-30T18:38:00', 'Бронхо Веда', 56),
  _approved(23156, '2026-06-29T18:15:00', 'Цинкорот №50', 144),
  for (var i = 0; i < 9; i++)
    _approved(22000 - i, '2026-05-${20 - i}T12:00:00', 'Магнерот N50', 60),
];

CheckDetail _detail(int id, CheckStatus s, String at, int photos,
        {List<CheckDrug> drugs = const [],
        List<CheckAllocation> alloc = const [],
        String? reason}) =>
    CheckDetail(
      id: id,
      status: s,
      createdAt: at,
      photoCount: photos,
      drugs: drugs,
      rejectReason: reason,
      photos: [
        for (var i = 0; i < photos; i++) Photo(id: i, url: 'https://pq.invalid/$id-$i.jpg'),
      ],
      allocations: alloc,
    );

final _pending = _detail(11203, CheckStatus.pending, '2026-06-28T09:12:00', 2);
final _approvedD = _detail(23345, CheckStatus.approved, '2026-06-30T18:38:00', 1,
    drugs: const [CheckDrug(name: 'Бронхо Веда', packs: 56)]);
final _credited = _detail(23156, CheckStatus.approved, '2026-06-29T18:15:00', 1,
    drugs: const [CheckDrug(name: 'Цинкорот №50', packs: 144)],
    alloc: const [CheckAllocation(questId: 7, questName: 'Бронхо Веда', packs: 144)]);
final _rejected = _detail(12594, CheckStatus.rejected, '2026-01-15T19:54:00', 1,
    reason: 'Чек размыт или обрезан');

List _overrides({
  List<Check>? checks,
  CheckDetail? detail,
  bool online = true,
  bool loading = false,
}) =>
    [
      checksProvider.overrideWith((_) =>
          loading ? Completer<List<Check>>().future : Future.value(checks ?? _checks)),
      if (detail != null) checkDetailProvider.overrideWith((_, __) async => detail),
      uploadQueueProvider.overrideWith(_Queue.new),
      checksOnlineProvider.overrideWith((_) => Stream.value(online)),
      unreadCountProvider.overrideWith((_) async => 0),
    ];

/// Открыть лист «Новый чек» поверх экрана.
Future<void> Function(WidgetTester) _sheet({List<XFile> photos = const [], bool send = false}) =>
    (t) async {
      await t.pump(const Duration(milliseconds: 100));
      showCheckUploadSheet(t.element(find.byType(ChecksScreen)), initialPhotos: photos);
      for (var i = 0; i < 20; i++) {
        await t.pump(const Duration(milliseconds: 100));
      }
      if (send) {
        await t.tap(find.text('Отправить на проверку'));
        await t.pump(const Duration(milliseconds: 100));
      }
    };

// Реальный файл из репозитория: фото из галереи в тесте не получить.
final _three = [for (var i = 0; i < 3; i++) XFile('${Directory.current.path}/assets/app_icon.png')];

void main() {
  pqShotBoth('Checks', (t, dark) => pqShot(t,
      name: 'Checks',
      dark: dark,
      height: 1180,
      screen: const ChecksScreen(),
      nav: pharmacistNav,
      navIndex: 1,
      overrides: _overrides()));

  pqShotBoth('ChecksEmpty', (t, dark) => pqShot(t,
      name: 'ChecksEmpty',
      dark: dark,
      screen: const ChecksScreen(),
      nav: pharmacistNav,
      navIndex: 1,
      overrides: _overrides(checks: const [])));

  pqShotBoth('Offline', (t, dark) => pqShot(t,
      name: 'Offline',
      dark: dark,
      screen: const ChecksScreen(),
      nav: pharmacistNav,
      navIndex: 1,
      overrides: _overrides(online: false)));

  pqShotBoth('SkelList', (t, dark) => pqShot(t,
      name: 'SkelList',
      dark: dark,
      screen: const ChecksScreen(),
      nav: pharmacistNav,
      navIndex: 1,
      overrides: _overrides(loading: true)));

  for (final (name, d, h) in [
    ('CheckPending', _pending, 1160.0),
    ('CheckApproved', _approvedD, 1080.0),
    ('CheckCredited', _credited, 1070.0),
    ('CheckRejected', _rejected, 1000.0),
  ]) {
    pqShotBoth(name, (t, dark) => pqShot(t,
        name: name,
        dark: dark,
        height: h,
        screen: CheckDetailScreen(id: d.id),
        nav: pharmacistNav,
        navIndex: 1,
        overrides: _overrides(detail: d)));
  }

  // Лист «Новый чек»: фон — «Мои чеки» в загрузке, как в макетах Upload*.
  for (final (name, before) in [
    ('Upload', _sheet()),
    ('UploadPick', _sheet()),
    ('UploadPhotos', _sheet(photos: _three)),
    ('UploadDone', _sheet(photos: _three.take(1).toList(), send: true)),
  ]) {
    pqShotBoth(name, (t, dark) => pqShot(t,
        name: name,
        dark: dark,
        screen: const ChecksScreen(),
        overrides: _overrides(loading: true),
        before: before));
  }

  pqShotBoth('PermCamera', (t, dark) => pqShot(t,
      name: 'PermCamera', dark: dark, screen: const CameraPrimerScreen()));
  pqShotBoth('PermDenied', (t, dark) => pqShot(t,
      name: 'PermDenied', dark: dark, screen: const CameraDeniedScreen()));

  // Просмотр фото есть только в тёмном варианте (фон всегда чёрный).
  testWidgets('PhotoViewer', (t) => pqShot(t,
      name: 'PhotoViewer',
      dark: true,
      screen: const Scaffold(body: SizedBox.expand()),
      before: (t) async {
        showPhotoLightbox(t.element(find.byType(Scaffold)),
            ['https://pq.invalid/1.jpg', 'https://pq.invalid/2.jpg'],
            title: 'Чек №23156');
        await t.pump(const Duration(milliseconds: 100));
      }));
}

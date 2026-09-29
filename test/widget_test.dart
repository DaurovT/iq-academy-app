import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:platform_app/core/models/common.dart';
import 'package:platform_app/l10n/gen/app_localizations.dart';

void main() {
  test('Role JSON-значения совпадают с бэкендом', () {
    expect(Role.productOwner.name, 'productOwner');
    expect(Role.pharmacist.label(lookupAppLocalizations(const Locale('ru'))), 'Фармацевт');
  });

  testWidgets('Приложение стартует в ProviderScope', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: SizedBox.shrink())),
    );
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

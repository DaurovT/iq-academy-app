import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';

/// Выбор аптеки на карте (макет MapPicker).
///
/// Пока экран-заглушка: в зависимостях нет пакета карт, а в API — списка
/// аптек с координатами и поля «аптека» в регистрации/профиле. Когда они
/// появятся, экран вернёт название выбранной аптеки. Сейчас всегда `null`.
Future<String?> showPqMapPicker(BuildContext context) {
  return Navigator.of(context, rootNavigator: true).push<String>(
    MaterialPageRoute(fullscreenDialog: true, builder: (_) => const MapPickerScreen()),
  );
}

class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(title: l10n.authMapTitle, backLabel: l10n.authBack),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: PqAnimate(
                  fx: PqFx.up,
                  child: PqEmptyState(
                    icon: PqIcons.mapPin,
                    tone: PqTone.accent,
                    title: l10n.authMapStubTitle,
                    message: l10n.authMapStubBody,
                    action: PqButton(
                      label: l10n.authBack,
                      kind: PqButtonKind.secondary,
                      expand: false,
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

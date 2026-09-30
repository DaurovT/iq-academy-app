import 'dart:io' show File, Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';

/// Маршруты экранов доступа к камере (без нижнего меню).
const kChecksCameraPrimerPath = '/app/checks/camera';
const kChecksCameraDeniedPath = '/app/checks/camera-denied';

/// Результат экрана «Нет доступа к камере»: выбрать фото из галереи.
const kChecksPickGallery = 'gallery';

/// Праймер камеры показываем один раз — до первого системного запроса.
/// Флаг — пустой файл в папке приложения (на вебе праймер не нужен:
/// браузер сам спрашивает доступ при выборе файла).
abstract final class CameraPrimerFlag {
  static bool? _cached;

  static Future<File?> _file() async {
    if (kIsWeb) return null;
    try {
      final dir = await getApplicationSupportDirectory();
      return File('${dir.path}/camera_primer_shown');
    } catch (_) {
      return null;
    }
  }

  static Future<bool> shown() async {
    if (kIsWeb) return true;
    if (_cached != null) return _cached!;
    final f = await _file();
    return _cached = f == null || f.existsSync();
  }

  static Future<void> markShown() async {
    _cached = true;
    try {
      final f = await _file();
      if (f != null && !f.existsSync()) await f.create(recursive: true);
    } catch (_) {}
  }
}

/// Открыть системные настройки приложения. На iOS — схема `app-settings:`;
/// на Android без отдельного плагина это невозможно, поэтому подсказываем путь.
Future<void> openAppSettings(BuildContext context) async {
  final manual = context.l10n.checksCamSettingsManual;
  var ok = false;
  if (!kIsWeb && Platform.isIOS) {
    try {
      ok = await launchUrl(Uri.parse('app-settings:'));
    } catch (_) {}
  }
  if (!ok && context.mounted) {
    showPqToast(context, manual, tone: PqTone.info, icon: PqIcons.settings);
  }
}

/// Праймер «Разрешите доступ к камере» (макет PermCamera).
/// Возвращает `true`, если пользователь нажал «Разрешить доступ».
class CameraPrimerScreen extends StatelessWidget {
  const CameraPrimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return _PermLayout(
      icon: PqIcons.camera,
      tone: PqTone.accent,
      title: l.checksCamTitle,
      text: l.checksCamText,
      points: [
        (PqIcons.check, l.checksCamPoint1),
        (PqIcons.lock, l.checksCamPoint2),
        (PqIcons.settings, l.checksCamPoint3),
      ],
      actions: [
        PqButton(label: l.checksCamAllow, onPressed: () => context.pop(true)),
        PqButton(
          label: l.checksCamLater,
          kind: PqButtonKind.text,
          height: 48,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          onPressed: () => context.pop(false),
        ),
      ],
    );
  }
}

/// «Нет доступа к камере» (макет PermDenied). Возвращает [kChecksPickGallery],
/// если пользователь выбрал галерею.
class CameraDeniedScreen extends StatelessWidget {
  const CameraDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return _PermLayout(
      icon: PqIcons.camera,
      tone: PqTone.danger,
      title: l.checksCamDeniedTitle,
      text: l.checksCamDeniedText,
      points: [
        (PqIcons.settings, l.checksCamDeniedStep1),
        (PqIcons.camera, l.checksCamDeniedStep2),
        (PqIcons.undo, l.checksCamDeniedStep3),
      ],
      actions: [
        PqButton(
          label: l.checksCamOpenSettings,
          onPressed: () => openAppSettings(context),
        ),
        PqButton(
          label: l.checksCamPickGallery,
          icon: PqIcons.image,
          kind: PqButtonKind.secondary,
          height: 52,
          fontWeight: FontWeight.w600,
          iconSize: 18,
          iconGap: 8,
          onPressed: () => context.pop(kChecksPickGallery),
        ),
      ],
    );
  }
}

/// Общий макет экранов разрешений: плитка 104 (pqPop + pqBob 3.2s),
/// заголовок 26/700, текст 16/1.5, пункты с плитками 36, кнопки снизу.
class _PermLayout extends StatelessWidget {
  const _PermLayout({
    required this.icon,
    required this.tone,
    required this.title,
    required this.text,
    required this.points,
    required this.actions,
  });

  final PqIcons icon;
  final PqTone tone;
  final String title;
  final String text;
  final List<(PqIcons, String)> points;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final t = pq.tone(tone);
    return PqScreen(
      drift: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 34),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: PqStagger.auth(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PqAnimate(
                        fx: PqFx.pop,
                        child: PqBob(
                          duration: const Duration(milliseconds: 3200),
                          delay: const Duration(milliseconds: 600),
                          child: Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                              color: t.bg,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            alignment: Alignment.center,
                            child: PqIcon(icon, size: 47, color: t.fg),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Semantics(
                          header: true,
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: PqText.heading(
                              26,
                              FontWeight.w700,
                              height: 1.2,
                              c: pq.text,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 330),
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: PqText.bodyLarge(c: pq.textMuted),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          children: [
                            for (final (ic, label) in points)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    PqIconTile(
                                      ic,
                                      size: 36,
                                      radius: 10,
                                      iconSize: 18,
                                      background: pq.surfaceAlt,
                                      foreground: pq.accentText,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        label,
                                        style: PqText.text(
                                          15,
                                          FontWeight.w400,
                                          c: pq.textSecondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            for (var i = 0; i < actions.length; i++) ...[
              if (i > 0) const SizedBox(height: 6),
              actions[i],
            ],
          ],
        ),
      ),
    );
  }
}

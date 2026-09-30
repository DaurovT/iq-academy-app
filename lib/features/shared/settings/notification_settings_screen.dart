import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/common.dart';
import '../../../core/models/notification.dart';
import '../../../widgets/pq_states.dart';
import '../profile/profile_widgets.dart';
import '../providers.dart';

/// «Настройки уведомлений» — нижний лист (макет NotifSettings): четыре
/// переключателя PqSwitch, сохраняются сразу (NotificationsApi.setSettings).
Future<void> showNotificationSettingsSheet(BuildContext context) =>
    showPqSheet<void>(
      context,
      scrollable: true,
      padding: _kSheetPadding,
      handleGap: 12,
      bordered: true,
      scrim: const Color(0x9E05060A),
      builder: (_) => const _SettingsBody(),
    );

/// Поля листа NotifSettings: 10/20/28.
const _kSheetPadding = EdgeInsets.fromLTRB(20, 10, 20, 28);

/// Полноэкранная обёртка для маршрута `/app/settings/notifications`
/// (открывается ссылкой): тот же лист поверх фона экрана.
class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PqScreen(
      child: Column(
        children: [
          PqTopBar(
            backLabel: context.l10n.profileBack,
            onBack: () => profileGoBack(context),
          ),
          const Spacer(),
          const PqAnimate(
            fx: PqFx.sheet,
            child: PqSheet(
              padding: _kSheetPadding,
              handleGap: 12,
              bordered: true,
              child: _SettingsBody(inSheet: false),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsBody extends ConsumerStatefulWidget {
  const _SettingsBody({this.inSheet = true});

  final bool inSheet;

  @override
  ConsumerState<_SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends ConsumerState<_SettingsBody> {
  /// Оптимистичное значение, пока запрос сохранения в пути.
  NotificationSettings? _local;

  Future<void> _save(NotificationSettings s) async {
    setState(() => _local = s);
    try {
      await ref.read(apiProvider).notifications.setSettings(s);
      ref.invalidate(notificationSettingsProvider);
    } catch (_) {
      if (!mounted) return;
      setState(() => _local = null);
      showPqToast(context, context.l10n.notifSaveFailed, tone: PqTone.danger);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final settings = ref.watch(notificationSettingsProvider);
    final doctor =
        ref.watch(authControllerProvider).asData?.value.activeRole ==
        Role.doctor;

    Widget row(
      PqIcons icon,
      String title,
      String hint,
      bool value,
      NotificationSettings Function(bool) apply,
      NotificationSettings s,
    ) =>
    // min-height 64 — у содержимого (content-box) + поля 6/6.
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 64),
        child: MergeSemantics(
          child: Row(
            children: [
              ProfileRowTile(icon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: PqText.text(16, FontWeight.w600, c: pq.text),
                    ),
                    const SizedBox(height: 2),
                    Text(hint, style: PqText.body(c: pq.textMuted)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              PqSwitch(
                large: true,
                value: value,
                label: title,
                onChanged: (v) => _save(apply(v)),
              ),
            ],
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.inSheet)
          ProfileSheetHeader(
            title: l.notifSettingsTitle,
            subtitle: l.notifSettingsSubtitle,
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.notifSettingsTitle,
                style: PqText.heading(22, FontWeight.w700, c: pq.text),
              ),
              const SizedBox(height: 2),
              Text(
                l.notifSettingsSubtitle,
                style: PqText.body(c: pq.textMuted),
              ),
            ],
          ),
        const SizedBox(height: 12),
        PqAsync<NotificationSettings>(
          value: settings,
          onRetry: () => ref.invalidate(notificationSettingsProvider),
          loading: PqLoadingKind.spinner,
          loadingBuilder:
              (_) => Column(
                children: [
                  for (var i = 0; i < 4; i++)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        children: [
                          PqSkeleton(width: 36, height: 36, radius: 10),
                          SizedBox(width: 12),
                          Expanded(child: PqSkeleton(height: 16)),
                          SizedBox(width: 12),
                          PqSkeleton(width: 52, height: 32, radius: 16),
                        ],
                      ),
                    ),
                ],
              ),
          data: (remote) {
            final s = _local ?? remote;
            final rows = [
              row(
                PqIcons.coin,
                doctor ? l.notifSettingsRecipesOnly : l.notifSettingsChecksOnly,
                l.notifSettingsChecksHint,
                s.checks,
                (v) => s.copyWith(checks: v),
                s,
              ),
              row(
                PqIcons.trophy,
                l.notifSettingsQuests,
                l.notifSettingsQuestsHint,
                s.quests,
                (v) => s.copyWith(quests: v),
                s,
              ),
              row(
                PqIcons.bookOpen,
                l.notifSettingsLearning,
                l.notifSettingsLearningHint,
                s.learning,
                (v) => s.copyWith(learning: v),
                s,
              ),
              row(
                PqIcons.megaphone,
                l.notifSettingsMarketing,
                l.notifSettingsMarketingHint,
                s.marketing,
                (v) => s.copyWith(marketing: v),
                s,
              ),
            ];
            return Column(
              children: [
                for (var i = 0; i < rows.length; i++)
                  Container(
                    // Container учитывает рамку в размере: border-bottom = 1 px, как в CSS.
                    decoration: BoxDecoration(
                      border:
                          i < rows.length - 1
                              ? Border(bottom: BorderSide(color: pq.divider))
                              : null,
                    ),
                    child: rows[i],
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 12),
        Text(
          l.notifSettingsFootnote,
          style: PqText.text(
            12,
            FontWeight.w400,
            height: 1.45,
            c: pq.textMuted,
          ),
        ),
      ],
    );
  }
}

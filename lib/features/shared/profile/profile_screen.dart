import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api/providers.dart';
import '../../../core/app_modules.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/models/common.dart';
import '../../../core/theme/theme_controller.dart';
import '../../../widgets/pq_states.dart';
import '../../medrep/medrep_widgets.dart' show medCopyCode;
import '../../medrep/providers.dart';
import '../providers.dart';
import '../../tour/tour_controller.dart';
import '../settings/notification_settings_screen.dart';
import 'delete_account_sheet.dart';
import 'profile_phone_sheet.dart';
import 'profile_role_sheet.dart';
import 'profile_widgets.dart';

/// Профиль (макеты Profile / DocProfile / MedProfile / ProfileNew).
///
/// Один экран с вариантами по активной роли: фармацевт, врач, медпред
/// (строка «Компания» — из списка компаний медпреда). Пока ФИО не заполнено,
/// показывается вариант «Новый пользователь» с карточкой активации.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> with WidgetsBindingObserver {
  /// Пользователь ушёл в Telegram-бот привязывать аккаунт — по возвращении
  /// в приложение проверяем привязку (AccountApi.telegramLinkConfirm).
  bool _awaitingTelegram = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _awaitingTelegram) {
      _awaitingTelegram = false;
      _confirmTelegram();
    }
  }

  // ── Действия ──────────────────────────────────────────────────────────

  Future<void> _linkTelegram() async {
    try {
      final r = await ref.read(apiProvider).account.telegramLinkStart();
      var opened = false;
      final deep = Uri.tryParse(r.deepLink);
      if (deep != null) {
        try {
          opened = await launchUrl(deep, mode: LaunchMode.externalApplication);
        } catch (_) {
          opened = false;
        }
      }
      if (!opened) {
        await launchUrl(Uri.parse(r.botUrl), mode: LaunchMode.externalApplication);
      }
      _awaitingTelegram = true;
    } catch (e) {
      if (mounted) showPqToast(context, profileErrorText(context, e), tone: PqTone.danger);
    }
  }

  Future<void> _confirmTelegram() async {
    try {
      final r = await ref.read(apiProvider).account.telegramLinkConfirm();
      ref.invalidate(accountSettingsProvider);
      if (!mounted) return;
      final l = context.l10n;
      if (r.linked) {
        showPqToast(context, l.profileTgLinkedToast, icon: PqIcons.send);
      } else {
        showPqToast(context, l.profileTgNotYet, tone: PqTone.warning, icon: PqIcons.send);
      }
    } catch (_) {
      // Проверка по возвращении — best effort; статус подтянется при обновлении.
    }
  }

  Future<void> _setLocale(Locale locale) async {
    // Интерфейс переключаем сразу и локально — это главное действие.
    ref.read(localeProvider.notifier).set(locale);
    showPqToast(context, lookupAppLocalizations(locale).profileLanguageUpdated,
        icon: PqIcons.globe);
    // Бэкенд знает только ru/uz/kz — синхронизируем, где возможно (для
    // рассылок/контента). tg и ky на сервере не представлены — пропускаем.
    final backendLang = switch (locale.languageCode) {
      'ru' => Language.ru,
      'uz' => Language.uz,
      'kk' => Language.kz,
      _ => null,
    };
    if (backendLang == null) return;
    try {
      await ref.read(apiProvider).account.setLanguage(backendLang);
      ref.invalidate(authControllerProvider);
    } catch (_) {
      // Синхронизация с сервером — best effort; язык приложения уже сменён.
    }
  }

  Future<void> _logout() async {
    final l = context.l10n;
    final ok = await showPqConfirm(
      context,
      title: l.profileLogoutConfirmTitle,
      message: l.profileLogoutConfirmBody,
      confirmLabel: l.profileLogoutAction,
      cancelLabel: l.profileCancel,
      danger: true,
      icon: PqIcons.logout,
    );
    if (ok) await ref.read(authControllerProvider.notifier).logout();
  }

  Future<void> _refresh() async {
    ref.invalidate(accountSettingsProvider);
    ref.invalidate(notificationSettingsProvider);
    ref.invalidate(unreadCountProvider);
    await Future.wait<Object?>([
      ref.read(accountSettingsProvider.future).then<Object?>((v) => v, onError: (_) => null),
      ref.read(notificationSettingsProvider.future).then<Object?>((v) => v, onError: (_) => null),
    ]);
  }

  /// Названия языков всегда пишутся на самом языке — не локализуются.
  static String _localeName(String code) => switch (code) {
        'ru' => 'Русский',
        'uz' => "O'zbekcha",
        'kk' => 'Қазақша',
        'tg' => 'Тоҷикӣ',
        'ky' => 'Кыргызча',
        _ => code,
      };

  // ── Разметка ──────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final auth = ref.watch(authControllerProvider).asData?.value;
    final account = auth?.account;
    final role = auth?.activeRole;
    final name = account?.fullName.trim() ?? '';
    final isNew = account != null && name.isEmpty;
    final tgLinked = ref.watch(accountSettingsProvider).asData?.value.telegramLinked;
    final notif = ref.watch(notificationSettingsProvider).asData?.value;
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    final companies = role == Role.medrep
        ? ref.watch(companiesProvider).asData?.value.map((c) => c.name).join(', ')
        : null;
    final medrepCode = role == Role.medrep
        ? ref.watch(medrepCodeProvider).asData?.value.code
        : null;
    final roleLabel = role?.label(l) ?? '';

    final (workLabel, noWork) = switch (role) {
      Role.pharmacist => (l.profilePharmacy, l.profileNoPharmacy),
      Role.doctor => (l.profileClinic, l.profileNoClinic),
      _ => (l.profileCompany, l.profileNoCompany),
    };
    final hasCompany = companies != null && companies.isNotEmpty;

    void edit() => context.push('/app/profile/edit');

    final sections = <Widget>[
      Semantics(header: true, child: Text(l.profileTitle, style: PqText.display(c: pq.text))),
      _HeaderCard(
        name: isNew ? l.profileNewUser : name,
        avatarName: name,
        subtitle: isNew
            ? (hasCompany ? companies : noWork)
            : [roleLabel, if (hasCompany) companies].join(' · '),
        subtitleWarning: isNew && !hasCompany,
        onEdit: edit,
      ),
      if (isNew)
        _ActivationCard(
          role: role,
          phone: profileFormatPhone(account.phone),
          tgLinked: tgLinked ?? false,
          onSpecify: edit,
          onLinkTelegram: _linkTelegram,
          onSupport: ref.moduleVisible('support') ? () => context.push('/app/support') : null,
        ),
      ProfileSection(title: l.profileAccount, children: [
        ProfileRow(
          icon: PqIcons.user,
          title: l.profilePersonalDataRow,
          subtitle: isNew ? l.profileNameNotSet : name,
          onTap: edit,
        ),
        if (isNew || hasCompany)
          ProfileRow(
            icon: PqIcons.building,
            title: workLabel,
            value: hasCompany ? companies : l.profileNotSpecified,
            valueColor: hasCompany ? null : pq.warning,
            onTap: role == Role.medrep ? () => context.push('/app/companies') : edit,
          ),
        // MedProfile: кодовое слово медпреда с копированием.
        if (medrepCode != null && medrepCode.isNotEmpty)
          ProfileRow(
            icon: PqIcons.key,
            title: l.medrepProfileCode,
            subtitle: l.medrepProfileCodeSub,
            subtitleMaxLines: 2,
            chevron: false,
            onTap: () => context.push('/app/portfolio/invite'),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(medrepCode,
                  style: PqText.heading(16, FontWeight.w800, ls: 2, c: pq.text)),
              const SizedBox(width: 2),
              PqPressable(
                onTap: () => medCopyCode(context, medrepCode),
                semanticLabel: l.medrepCopyCode,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: PqIcon(PqIcons.copy, size: 18, color: pq.accentText),
                  ),
                ),
              ),
            ]),
          ),
        ProfileRow(
          icon: PqIcons.shieldCheck,
          title: l.profileRole,
          value: role == Role.medrep ? l.profileRoleShortMedrep : roleLabel,
          onTap: () => showProfileRoleSheet(context),
        ),
      ]),
      ProfileSection(title: l.profileSectionContact, children: [
        ProfileRow(
          icon: PqIcons.phone,
          title: l.profilePhone,
          value: account == null ? '—' : profileFormatPhone(account.phone),
          onTap: () => showProfilePhoneSheet(context),
        ),
        ProfileRow(
          icon: PqIcons.send,
          title: 'Telegram',
          subtitle: tgLinked == false ? l.profileTgNotLinked : null,
          trailing: switch (tgLinked) {
            true => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: pq.successSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(l.profileTgLinked, style: PqText.tag(c: pq.success)),
              ),
            false => Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: pq.accent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(l.profileTgLink,
                    style: PqText.text(13, FontWeight.w700, c: pq.onAccent)),
              ),
            null => const SizedBox.shrink(),
          },
          onTap: tgLinked == false ? _linkTelegram : null,
        ),
      ]),
      ProfileSection(title: l.profileSettings, children: [
        _SettingGroup(
          icon: PqIcons.globe,
          title: l.profileLanguageTitle,
          child: ProfileSegGrid<String>(
            semanticLabel: l.profileLanguageTitle,
            columns: 2,
            values: [for (final loc in supportedAppLocales) loc.languageCode],
            selected: ref.watch(localeProvider).languageCode,
            labelOf: _localeName,
            onChanged: (code) =>
                _setLocale(supportedAppLocales.firstWhere((x) => x.languageCode == code)),
          ),
        ),
        _SettingGroup(
          icon: PqIcons.moon,
          title: l.profileAppearanceTitle,
          child: ProfileSegGrid<ThemeMode>(
            semanticLabel: l.profileAppearanceTitle,
            columns: 3,
            values: const [ThemeMode.light, ThemeMode.dark, ThemeMode.system],
            selected: ref.watch(themeModeProvider),
            labelOf: (m) => switch (m) {
              ThemeMode.light => l.profileThemeLight,
              ThemeMode.dark => l.profileThemeDark,
              ThemeMode.system => l.profileThemeSystem,
            },
            onChanged: (m) => ref.read(themeModeProvider.notifier).set(m),
          ),
        ),
        ProfileRow(
          icon: PqIcons.bell,
          title: l.notifTitle,
          value: notif == null
              ? null
              : (notif.checks || notif.quests || notif.learning || notif.marketing)
                  ? l.profileNotifOn
                  : l.profileNotifOff,
          onTap: () => showNotificationSettingsSheet(context),
        ),
      ]),
      ProfileSection(children: [
        if (ref.moduleVisible('support'))
          ProfileRow(
            icon: PqIcons.headphones,
            accent: true,
            title: l.profileSupport,
            subtitle: l.profileSupportSubtitle,
            onTap: () => context.push('/app/support'),
          ),
        ProfileRow(
          icon: PqIcons.shield,
          title: l.profilePrivacyShort,
          subtitle: l.profilePrivacySubtitle,
          onTap: () => context.push('/app/privacy'),
        ),
        // Повтор обучающего тура (спецификация TourSpec: «Профиль → Пройти
        // обучение заново» запускает тур с приветствия на главной).
        if (TourController.supports(
            ref.watch(authControllerProvider).asData?.value.activeRole))
          ProfileRow(
            icon: PqIcons.sparkles,
            title: l.profileTourAgain,
            onTap: () {
              context.go('/app');
              WidgetsBinding.instance.addPostFrameCallback(
                  (_) => ref.read(tourProvider.notifier).start());
            },
          ),
      ]),
      ProfileSection(children: [
        ProfileRow(
          icon: PqIcons.logout,
          title: l.profileLogout,
          chevron: false,
          onTap: _logout,
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(children: [
          PqPressable(
            onTap: () => showDeleteAccountSheet(context),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 44),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                PqIcon(PqIcons.trash, size: 16, color: pq.danger),
                const SizedBox(width: 6),
                Text(l.profileDeleteAccount, style: PqText.link(c: pq.danger)),
              ]),
            ),
          ),
          const SizedBox(height: 4),
          Text(l.profileVersion(kProfileAppVersion), style: PqText.caption(c: pq.textMuted)),
        ]),
      ),
    ];

    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTabHeader(
          onBell: () => context.push('/app/notifications'),
          bellLabel: l.notifTitle,
          unread: unread > 0,
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: _refresh,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
              itemCount: sections.length,
              separatorBuilder: (_, __) => const SizedBox(height: 22),
              itemBuilder: (_, i) =>
                  PqAnimate(delay: PqMotion.staggerDelay(i), child: sections[i]),
            ),
          ),
        ),
      ]),
    );
  }
}

/// Карточка профиля: аватар 64 · имя Onest 20/700 + подпись 14 · «редактировать» 44.
class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.name,
    required this.avatarName,
    required this.subtitle,
    required this.subtitleWarning,
    required this.onEdit,
  });

  final String name;
  final String avatarName;
  final String subtitle;
  final bool subtitleWarning;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqCard(
      radius: 24,
      padding: const EdgeInsets.all(18),
      child: Row(children: [
        ProfileAvatar(name: avatarName),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: PqText.heading(20, FontWeight.w700, c: pq.text)),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 3),
              Text(subtitle,
                  style: PqText.text(14, FontWeight.w400,
                      c: subtitleWarning ? pq.warning : pq.textMuted)),
            ],
          ]),
        ),
        const SizedBox(width: 14),
        PqIconButton(
          icon: PqIcons.pen,
          iconSize: 18,
          label: context.l10n.profileEditAria,
          background: pq.surfaceAlt,
          onTap: onEdit,
        ),
      ]),
    );
  }
}

/// Группа настройки: строка «плитка + название» и сегменты под ней.
class _SettingGroup extends StatelessWidget {
  const _SettingGroup({required this.icon, required this.title, required this.child});

  final PqIcons icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          ProfileRowTile(icon),
          const SizedBox(width: 12),
          Text(title, style: PqText.text(16, FontWeight.w500, c: pq.text)),
        ]),
        const SizedBox(height: 10),
        child,
      ]),
    );
  }
}

/// «Активируйте профиль» (макет ProfileNew): прогресс 4 шага + шаги.
class _ActivationCard extends StatelessWidget {
  const _ActivationCard({
    required this.role,
    required this.phone,
    required this.tgLinked,
    required this.onSpecify,
    required this.onLinkTelegram,
    required this.onSupport,
  });

  final Role? role;
  final String phone;
  final bool tgLinked;
  final VoidCallback onSpecify;
  final VoidCallback onLinkTelegram;
  final VoidCallback? onSupport;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    const total = 4;
    final done = 1 + (tgLinked ? 1 : 0);
    final (workTitle, workHint) = switch (role) {
      Role.pharmacist => (l.profileStepPharmacy, l.profileStepWorkHint),
      Role.doctor => (l.profileStepClinic, l.profileStepWorkHint),
      _ => (l.profileStepProfile, l.profileStepProfileHint),
    };
    // Номер «ожидающего» шага — по порядку среди невыполненных.
    var n = 1;

    Widget step({
      required Widget mark,
      required String title,
      required String hint,
      bool done = false,
      String? action,
      VoidCallback? onAction,
    }) =>
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(children: [
            mark,
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title,
                    style: PqText.text(15, FontWeight.w600, c: done ? pq.textMuted : pq.text)
                        .copyWith(decoration: done ? TextDecoration.lineThrough : null)),
                const SizedBox(height: 1),
                Text(hint, style: PqText.text(13, FontWeight.w400, c: pq.textMuted)),
              ]),
            ),
            if (action != null) ...[
              const SizedBox(width: 12),
              PqPillButton(label: action, height: 36, onPressed: onAction),
            ],
          ]),
        );

    Widget doneMark() => Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: pq.success, shape: BoxShape.circle),
          child: PqIcon(PqIcons.check, size: 16, color: pq.bg),
        );
    Widget numMark(int i) => Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: pq.warning, width: 2),
          ),
          child: Text('$i', style: PqText.text(13, FontWeight.w700, c: pq.warning)),
        );

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: pq.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: pq.warning),
        boxShadow: pq.cardShadow,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          PqIcon(PqIcons.alertCircle, size: 20, color: pq.warning),
          const SizedBox(width: 10),
          Expanded(child: Text(l.profileActivateTitle, style: PqText.title(c: pq.text))),
          const SizedBox(width: 10),
          Text(l.profileActivateProgress(done, total),
              style: PqText.text(14, FontWeight.w700, c: pq.warning)),
        ]),
        const SizedBox(height: 6),
        Text(l.profileActivateBody, style: PqText.body(c: pq.textSecondary)),
        const SizedBox(height: 4 + 6),
        PqSegmentProgress(
          total: total,
          filled: done,
          height: 4,
          fillColor: pq.success,
          trackColor: pq.isDark ? pq.border : const Color(0xFFE5E7EB),
        ),
        const SizedBox(height: 4 + 6),
        step(
          mark: doneMark(),
          title: l.profileStepPhone,
          hint: phone,
          done: true,
        ),
        const SizedBox(height: 6),
        step(
          mark: numMark(++n),
          title: workTitle,
          hint: workHint,
          action: l.profileStepSpecify,
          onAction: onSpecify,
        ),
        const SizedBox(height: 6),
        tgLinked
            ? step(
                mark: doneMark(),
                title: l.profileTgLinkedToast,
                hint: l.profileStepTelegramHint,
                done: true,
              )
            : step(
                mark: numMark(++n),
                title: l.profileStepTelegram,
                hint: l.profileStepTelegramHint,
                action: l.profileTgLink,
                onAction: onLinkTelegram,
              ),
        const SizedBox(height: 6),
        step(
          mark: ProfileDashedCircle(
            size: 28,
            color: pq.borderStrong,
            child: PqIcon(PqIcons.clock, size: 14, color: pq.textMuted),
          ),
          title: l.profileStepAdmin,
          hint: l.profileStepAdminHint,
        ),
        if (onSupport != null) ...[
          const SizedBox(height: 2 + 6),
          DecoratedBox(
            decoration: BoxDecoration(border: Border(top: BorderSide(color: pq.divider))),
            child: PqPressable(
              onTap: onSupport,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 44),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  PqIcon(PqIcons.headphones, size: 16, color: pq.accent),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(l.profileActivateHelp,
                        textAlign: TextAlign.center, style: PqText.link(c: pq.accent)),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/common.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// Участник команды в общем списке: фармацевт или врач.
class TeamMember {
  TeamMember.pharmacist(TeamPharmacist p)
      : doctor = null,
        pharmacist = p,
        name = p.name,
        active = p.active,
        value = p.checks,
        seed = p.telegramId ?? p.accountId ?? 0,
        subtitle = [p.shop, p.city].where((s) => s.isNotEmpty).join(' · '),
        searchText = '${p.name} ${p.shop} ${p.city}'.toLowerCase();

  TeamMember.doctor(TeamDoctor d)
      : doctor = d,
        pharmacist = null,
        name = d.name,
        active = d.active,
        value = d.recipes,
        seed = d.accountId ?? d.telegramId ?? 0,
        subtitle = [d.specialty, d.workplace].where((s) => s.isNotEmpty).join(' · '),
        searchText =
            '${d.name} ${d.specialty} ${d.workplace} ${d.city}'.toLowerCase();

  final TeamDoctor? doctor;
  final TeamPharmacist? pharmacist;
  final String name;
  final bool active;

  /// Чеки у фармацевта, бланки у врача.
  final int value;
  final int seed;
  final String subtitle;
  final String searchText;

  bool get isDoctor => doctor != null;
}

/// Ключ врача для адреса карточки: по аккаунту, иначе по Telegram.
String teamDoctorKey(TeamDoctor d) =>
    d.accountId != null ? 'a${d.accountId}' : 't${d.telegramId ?? 0}';

/// Сначала активные, внутри — по числу чеков/бланков.
List<TeamMember> teamMembers(MedrepTeam team) {
  final all = [
    for (final p in team.pharmacists) TeamMember.pharmacist(p),
    for (final d in team.doctors) TeamMember.doctor(d),
  ];
  all.sort((a, b) {
    if (a.active != b.active) return a.active ? -1 : 1;
    return b.value.compareTo(a.value);
  });
  return all;
}

/// Экран «Команда» (макеты MedPharmacists / MedSearchEmpty): врачи и
/// фармацевты медпреда, кодовое слово для приглашения, поиск и вкладки.
class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

enum _Tab { all, pharmacists, doctors }

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  final _search = TextEditingController();
  String _query = '';
  _Tab _tab = _Tab.all;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final team = ref.watch(medrepTeamProvider);
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTabHeader(
          onBell: () => context.go('/app/notifications'),
          bellLabel: l.notifTitle,
          unread: unread > 0,
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(medrepTeamProvider);
              ref.invalidate(medrepCodeProvider);
              await ref
                  .read(medrepTeamProvider.future)
                  .then((_) {}, onError: (_) {});
            },
            child: PqAsync<MedrepTeam>(
              value: team,
              onRetry: () => ref.invalidate(medrepTeamProvider),
              data: (t) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, kPqNavClearance),
                child: _body(context, t),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, MedrepTeam team) {
    final pq = context.pq;
    final l = context.l10n;
    final items = teamMembers(team);
    final pharmCount = team.pharmacists.length;
    final doctorCount = team.doctors.length;
    final q = _query.trim().toLowerCase();
    var filtered = switch (_tab) {
      _Tab.all => items,
      _Tab.pharmacists => items.where((m) => !m.isDoctor).toList(),
      _Tab.doctors => items.where((m) => m.isDoctor).toList(),
    };
    if (q.isNotEmpty) {
      filtered = filtered.where((m) => m.searchText.contains(q)).toList();
    }
    final searchEmpty = q.isNotEmpty && filtered.isEmpty;
    final code = ref.watch(medrepCodeProvider).asData?.value.code;

    Widget content;
    if (items.isEmpty) {
      content = MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.users,
          background: pq.accentSoft,
          foreground: pq.accentText,
        ),
        title: l.medrepEmptyTitle,
        message: l.medrepEmptyText,
      );
    } else if (searchEmpty) {
      content = MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.search,
          size: 80,
          radius: 24,
          iconSize: 34,
          background: pq.surface,
          foreground: pq.accentText,
          borderColor: pq.border,
        ),
        title: l.medrepNotFoundTitle,
        message: l.medrepNotFoundText(_query.trim()),
        action: MedOutlineButton(
          label: l.medrepResetSearch,
          icon: PqIcons.x,
          onTap: () {
            _search.clear();
            setState(() => _query = '');
          },
        ),
      );
    } else if (filtered.isEmpty) {
      content = MedEmptyBlock(
        tile: MedPopTile(
          icon: PqIcons.users,
          size: 80,
          radius: 24,
          iconSize: 34,
          background: pq.surface,
          foreground: pq.accentText,
          borderColor: pq.border,
        ),
        title: l.medrepTeamNobody,
      );
    } else {
      content = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        for (var i = 0; i < filtered.length; i++) ...[
          if (i > 0) const SizedBox(height: 10),
          _MemberCard(member: filtered[i]),
        ],
      ]);
    }

    return PqStagger(gap: 16, children: [
      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(
          child: PqPageTitle(
            l.medrepTeamTitle,
            subtitle:
                '${l.medrepCountPharm(pharmCount)} · ${l.medrepCountDoctors(doctorCount)}',
          ),
        ),
        if (!searchEmpty && items.isNotEmpty) ...[
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              PqBreath(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration:
                      BoxDecoration(color: pq.success, shape: BoxShape.circle),
                ),
              ),
              const SizedBox(width: 6),
              Text(l.medrepUpdatedNow, style: PqText.caption(c: pq.textMuted)),
            ]),
          ),
        ],
      ]),
      if (!searchEmpty) _InviteStrip(code: code),
      if (items.isNotEmpty)
        MedSearchField(
          controller: _search,
          hint: l.medrepSearchHint,
          onChanged: (v) => setState(() => _query = v),
        ),
      if (items.isNotEmpty && !searchEmpty)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(children: [
            _CountChip(
              label: l.medrepFilterAll,
              count: items.length,
              selected: _tab == _Tab.all,
              onTap: () => setState(() => _tab = _Tab.all),
            ),
            const SizedBox(width: 8),
            _CountChip(
              label: l.medrepTabPharm,
              count: pharmCount,
              selected: _tab == _Tab.pharmacists,
              onTap: () => setState(() => _tab = _Tab.pharmacists),
            ),
            const SizedBox(width: 8),
            _CountChip(
              label: l.navDoctors,
              count: doctorCount,
              selected: _tab == _Tab.doctors,
              onTap: () => setState(() => _tab = _Tab.doctors),
            ),
          ]),
        ),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: PqMotion.ease,
        child: KeyedSubtree(
          key: ValueKey('${_tab.name}|$searchEmpty|${filtered.isEmpty}'),
          child: content,
        ),
      ),
    ]);
  }
}

/// Строка «Кодовое слово для приглашения» с кнопкой «Пригласить»:
/// пунктирная рамка акцентом, радиус 18.
class _InviteStrip extends StatelessWidget {
  const _InviteStrip({required this.code});

  final String? code;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return PqPressable(
      onTap: () => context.push('/app/portfolio/invite'),
      semanticLabel: l.medrepInviteTitle,
      child: CustomPaint(
        foregroundPainter: MedDashedBorder(color: pq.accentText, radius: 18),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
          decoration: BoxDecoration(
            color: pq.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.medrepCodeForInvite, style: PqText.caption(c: pq.textMuted)),
                const SizedBox(height: 2),
                MedCodeWord(code, size: 22, spacing: 5),
              ]),
            ),
            const SizedBox(width: 12),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: pq.accent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                PqIcon(PqIcons.userPlus, size: 18, color: pq.onAccent),
                const SizedBox(width: 6),
                Text(l.medrepInviteShort,
                    style: PqText.text(14, FontWeight.w700, c: pq.onAccent)),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

/// Чип-фильтр 40 со счётчиком (opacity .7).
class _CountChip extends StatelessWidget {
  const _CountChip({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final fg = selected ? pq.chipActiveText : pq.textSecondary;
    return Semantics(
      selected: selected,
      button: true,
      child: PqPressable(
        onTap: onTap,
        scale: .96,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: selected ? pq.chipActiveBg : pq.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: selected ? pq.chipActiveBg : pq.border),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(label,
                style: PqText.text(14, selected ? FontWeight.w700 : FontWeight.w500,
                    c: fg)),
            const SizedBox(width: 6),
            Opacity(
              opacity: .7,
              child: Text('$count',
                  style: PqText.text(14, selected ? FontWeight.w700 : FontWeight.w500,
                      c: fg)),
            ),
          ]),
        ),
      ),
    );
  }
}

/// Метка роли в строке участника: «Фармацевт» — акцент, «Врач» — фиолетовая.
class MedRoleTag extends StatelessWidget {
  const MedRoleTag({super.key, required this.doctor});

  final bool doctor;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final (Color bg, Color fg) = doctor
        ? (pq.isDark
            ? (const Color(0x2E7C3AED), const Color(0xFFC4B5FD))
            : (const Color(0xFFEDE9FE), const Color(0xFF6D28D9)))
        : (pq.isDark
            ? (pq.accentSoft, pq.accentText)
            : (const Color(0xFFDBEAFE), const Color(0xFF1D4ED8)));
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(
        (doctor ? Role.doctor : Role.pharmacist).label(l),
        style: PqText.tag(c: fg),
      ),
    );
  }
}

/// Карточка участника: аватар 48 · имя, место работы, роль и статус ·
/// число чеков или бланков.
class _MemberCard extends StatelessWidget {
  const _MemberCard({required this.member});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final m = member;
    final statusColor = m.active ? pq.success : pq.textMuted;
    final VoidCallback? onTap = m.isDoctor
        ? () => context.push('/app/portfolio/doctor/${teamDoctorKey(m.doctor!)}')
        // Карточка фармацевта строится по Telegram-id; у пришедших из
        // приложения его может не быть.
        : (m.pharmacist!.telegramId == null
            ? null
            : () => context.push('/app/portfolio/${m.pharmacist!.telegramId}'));
    final card = PqCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      onTap: onTap,
      child: Row(children: [
        MedAvatar(m.name,
            size: 48, seed: m.seed, colors: m.active ? null : kMedMutedGradient),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(m.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.heading(16, FontWeight.w700, c: pq.text)),
            if (m.subtitle.isNotEmpty) ...[
              const SizedBox(height: 3),
              Text(m.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.caption(c: pq.textMuted)),
            ],
            const SizedBox(height: 3),
            Row(mainAxisSize: MainAxisSize.min, children: [
              MedRoleTag(doctor: m.isDoctor),
              const SizedBox(width: 8),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(m.active ? l.pharmDetailActive : l.pharmDetailPassive,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.caption(c: statusColor)),
              ),
            ]),
          ]),
        ),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('${m.value}',
              style: PqText.heading(20, FontWeight.w800, height: 1.1, c: pq.text)),
          const SizedBox(height: 2),
          Text(m.isDoctor ? l.medrepUnitBlanks(m.value) : l.medrepUnitChecks(m.value),
              style: PqText.caption(c: pq.textMuted)),
        ]),
      ]),
    );
    return m.active ? card : Opacity(opacity: .78, child: card);
  }
}

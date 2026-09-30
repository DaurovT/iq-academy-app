import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'companies_screen.dart' show MedChain, medChainsOf;
import 'medrep_widgets.dart';
import 'providers.dart';

/// Аптечная сеть (макет MedCompany): сводка, аптеки и провизоры сети.
class MedrepCompanyScreen extends ConsumerStatefulWidget {
  const MedrepCompanyScreen({super.key, required this.chain});

  /// Название сети (как в [medChainsOf]).
  final String chain;

  @override
  ConsumerState<MedrepCompanyScreen> createState() => _MedrepCompanyScreenState();
}

class _MedrepCompanyScreenState extends ConsumerState<MedrepCompanyScreen> {
  static const _visible = 5;
  bool _all = false;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final portfolio = ref.watch(portfolioProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.companiesTitle,
          backLabel: l.companiesTitle,
          onBack: () => medBack(context, '/app/companies'),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(portfolioProvider);
              await ref.read(portfolioProvider.future).then((_) {}, onError: (_) {});
            },
            child: PqAsync<List<PortfolioPharmacist>>(
              value: portfolio,
              loading: PqLoadingKind.home,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              onRetry: () => ref.invalidate(portfolioProvider),
              data: (items) {
                final key = widget.chain.toLowerCase();
                final chain =
                    medChainsOf(items).where((c) => c.name.toLowerCase() == key).firstOrNull;
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                  child: chain == null
                      ? PqEmptyState(icon: PqIcons.building, title: l.companiesEmpty)
                      : _body(context, chain),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, MedChain c) {
    final pq = context.pq;
    final l = context.l10n;
    final muted = medHeroMuted(pq);
    final city = c.city;
    final pharmacies = c.pharmacies.entries.toList()
      ..sort((a, b) => b.value
          .fold<int>(0, (s, p) => s + p.checks)
          .compareTo(a.value.fold<int>(0, (s, p) => s + p.checks)));
    final people = c.pharmacists..sort((a, b) => b.checks.compareTo(a.checks));
    final shownPeople = _all ? people : people.take(_visible).toList();

    return PqStagger(gap: 24, children: [
      MedHeroCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0x29FFFFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const PqIcon(PqIcons.building, size: 26, color: Colors.white),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c.name, style: PqText.heading(20, FontWeight.w700, c: Colors.white)),
                const SizedBox(height: 2),
                Text([if (city.isNotEmpty) city, l.medrepChainKind].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.text(14, FontWeight.w400, c: muted)),
              ]),
            ),
          ]),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('${c.checks}',
                  style: PqText.heading(48, FontWeight.w800, height: 1, c: Colors.white)),
              const SizedBox(width: 8),
              Flexible(
                child: Text(l.medrepUnitChecksAllTime(c.checks),
                    style: PqText.heading(16, FontWeight.w700, c: muted)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          MedHeroStats(items: [
            ('${c.pharmacies.length}', l.medrepUnitPharmacies(c.pharmacies.length)),
            ('${people.length}', l.medrepUnitPharmacists(people.length)),
            ('${c.quests}', l.medrepUnitQuests(c.quests)),
          ]),
        ]),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PqSectionHeader(l.medrepPharmaciesSection),
        const SizedBox(height: 8),
        PqListCard(children: [
          for (final e in pharmacies)
            PqListRow(
              icon: PqIcons.building,
              title: e.key,
              subtitle: [
                if (e.value.first.city.isNotEmpty) e.value.first.city,
                l.medrepCountPharmacists(e.value.length),
              ].join(' · '),
              value: '${e.value.fold<int>(0, (s, p) => s + p.checks)}',
              valueCaption:
                  l.medrepUnitChecks(e.value.fold<int>(0, (s, p) => s + p.checks)),
            ),
        ]),
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PqSectionHeader(
          l.medrepPharmacistsSection,
          actionLabel: _all ? l.medrepHide : l.medrepAllN(people.length),
          onAction: () => people.length > _visible
              ? setState(() => _all = !_all)
              : context.go('/app/portfolio'),
        ),
        const SizedBox(height: 8),
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: PqMotion.ease,
          alignment: Alignment.topCenter,
          child: PqListCard(children: [
            for (final p in shownPeople)
              MedPersonRow(
                name: p.name,
                avatarSeed: p.telegramId,
                subtitle: [
                  p.shop,
                  if (p.quests > 0) l.medrepCountQuests(p.quests),
                ].join(' · '),
                value: '${p.checks}',
                unit: l.medrepUnitChecks(p.checks),
                avatarColors: p.checks > 0 ? null : kMedMutedGradient,
                onTap: () => context.push('/app/portfolio/${p.telegramId}'),
              ),
          ]),
        ),
      ]),
    ]);
  }
}

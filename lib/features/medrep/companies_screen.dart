import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// «MARXAMAT MED FARM №4» → «MARXAMAT MED FARM».
String medChainOf(String shop) {
  final s = shop
      .replaceFirst(RegExp(r'\s*№\s*\d+\s*$'), '')
      .replaceFirst(RegExp(r'\s+N\s?\d+\s*$'), '')
      .trim();
  return s.isEmpty ? shop.trim() : s;
}

/// Аптечная сеть, собранная из портфеля медпреда (отдельного эндпоинта нет).
class MedChain {
  MedChain(this.name);

  final String name;

  /// Аптека (полное название) → провизоры в ней.
  final pharmacies = <String, List<PortfolioPharmacist>>{};

  List<PortfolioPharmacist> get pharmacists =>
      [for (final l in pharmacies.values) ...l];

  int get checks => pharmacists.fold(0, (s, p) => s + p.checks);
  int get quests => pharmacists.fold(0, (s, p) => s + p.quests);

  /// Самый частый город сети.
  String get city {
    final c = <String, int>{};
    for (final p in pharmacists) {
      if (p.city.isNotEmpty) c[p.city] = (c[p.city] ?? 0) + 1;
    }
    if (c.isEmpty) return '';
    return (c.entries.toList()..sort((a, b) => b.value.compareTo(a.value))).first.key;
  }
}

/// Сети в порядке портфеля (по первому провизору сети).
List<MedChain> medChainsOf(List<PortfolioPharmacist> items) {
  final map = <String, MedChain>{};
  for (final p in items) {
    final shop = p.shop.trim();
    if (shop.isEmpty) continue;
    final name = medChainOf(shop);
    map
        .putIfAbsent(name.toLowerCase(), () => MedChain(name))
        .pharmacies
        .putIfAbsent(shop, () => [])
        .add(p);
  }
  return map.values.toList();
}

/// «Компании» — аптечные сети в портфеле (макет MedCompanies).
class CompaniesScreen extends ConsumerStatefulWidget {
  const CompaniesScreen({super.key});

  @override
  ConsumerState<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends ConsumerState<CompaniesScreen> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final portfolio = ref.watch(portfolioProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.companiesTitle,
          backLabel: l.navPortfolio,
          onBack: () => medBack(context),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(portfolioProvider);
              ref.invalidate(companiesProvider);
              await ref.read(portfolioProvider.future).then((_) {}, onError: (_) {});
            },
            child: PqAsync<List<PortfolioPharmacist>>(
              value: portfolio,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              onRetry: () => ref.invalidate(portfolioProvider),
              data: (items) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                child: _body(context, items),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context, List<PortfolioPharmacist> items) {
    final pq = context.pq;
    final l = context.l10n;
    final chains = medChainsOf(items);
    final pharmacies = chains.fold<int>(0, (s, c) => s + c.pharmacies.length);
    final q = _query.trim().toLowerCase();
    final shown = q.isEmpty
        ? chains
        : chains
            .where((c) =>
                c.name.toLowerCase().contains(q) || c.city.toLowerCase().contains(q))
            .toList();
    final makers = ref.watch(companiesProvider).asData?.value ?? const <Company>[];

    return PqStagger(gap: 16, children: [
      PqPageTitle(
        l.medrepChainsTitle,
        subtitle:
            '${l.medrepCountChains(chains.length)} · ${l.medrepPharmaciesInPortfolio(pharmacies)}',
      ),
      if (chains.isNotEmpty)
        MedSearchField(
          controller: _search,
          hint: l.medrepChainSearchHint,
          onChanged: (v) => setState(() => _query = v),
        ),
      if (chains.isEmpty)
        MedEmptyBlock(
          tile: MedPopTile(
            icon: PqIcons.building,
            background: pq.accentSoft,
            foreground: pq.accentText,
          ),
          title: l.companiesEmpty,
        )
      else if (shown.isEmpty)
        MedEmptyBlock(
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
          message: l.medrepNotFoundShort(_query.trim()),
          action: MedOutlineButton(
            label: l.medrepResetSearch,
            icon: PqIcons.x,
            onTap: () {
              _search.clear();
              setState(() => _query = '');
            },
          ),
        )
      else
        PqListCard(children: [
          for (final c in shown)
            PqListRow(
              icon: PqIcons.building,
              title: c.name,
              subtitle: l.medrepChainMeta(
                  c.city, c.pharmacies.length, c.pharmacists.length),
              value: '${c.checks}',
              valueCaption: l.medrepUnitChecks(c.checks),
              onTap: () =>
                  context.push('/app/companies/${Uri.encodeComponent(c.name)}'),
            ),
        ]),
      // Компании-производители медпреда (эндпоинт /medrep/companies) —
      // в макете их нет, но данные не теряем.
      if (makers.isNotEmpty && q.isEmpty)
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          PqSectionHeader(l.medrepMakers),
          const SizedBox(height: 8),
          PqListCard(children: [
            for (final m in makers)
              PqListRow(
                icon: PqIcons.package,
                tone: PqTone.neutral,
                title: m.name,
                subtitle: l.companiesCode(m.labelCode),
              ),
          ]),
        ]),
    ]);
  }
}

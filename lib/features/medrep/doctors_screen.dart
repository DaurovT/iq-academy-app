import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/medrep.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import 'portfolio_screen.dart' show initialsOf;
import 'providers.dart';

/// Экран «Врачи» медпреда. Временное решение, пока нет прямой связки
/// «медпред → врач»: показывает всех врачей рецептурного проекта компании
/// медпреда (медпред Бионорики видит только врачей Бионорики), по регионам,
/// со статусом выполнения рецептурного квеста.
class DoctorsScreen extends ConsumerStatefulWidget {
  const DoctorsScreen({super.key});

  @override
  ConsumerState<DoctorsScreen> createState() => _DoctorsScreenState();
}

/// Статус врача по выбранному квесту.
enum _Status { completed, inProgress, idle }

_Status _statusOf(DoctorRow d) => d.done > 0
    ? _Status.completed
    : (d.collected > 0 ? _Status.inProgress : _Status.idle);

const _green = Color(0xFF10B981);
const _amber = Color(0xFFF59E0B);
const _grey = Color(0xFF9CA3AF);

Color _colorOf(_Status s) => switch (s) {
      _Status.completed => _green,
      _Status.inProgress => _amber,
      _Status.idle => _grey,
    };

/// 15.0 → «15», 2.5 → «2.5».
String _n(double v) =>
    v == v.roundToDouble() ? v.toInt().toString() : v.toStringAsFixed(1);

/// Бэкенд отдаёт этот ярлык для пустого города — переводим на язык UI.
const _backendUnknownRegion = 'Регион не указан';

class _DoctorsScreenState extends ConsumerState<DoctorsScreen> {
  int? _questId; // null — квест по умолчанию (ближайший к завершению)
  String _query = '';
  _Status? _filter; // null — все
  final _collapsed = <String>{};

  @override
  Widget build(BuildContext context) {
    final p = PharmPalette.of(context);
    final data = ref.watch(doctorsProvider(_questId));

    return Scaffold(
      backgroundColor: p.bg,
      body: Stack(
        children: [
          Positioned.fill(child: ScreenDecor(medrepPortfolioDecor)),
          Column(
            children: [
              const PharmTopBar(),
              Expanded(
                child: data.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => _Message(
                    palette: p,
                    icon: Icons.error_outline,
                    text: e.toString(),
                    onRetry: () => ref.invalidate(doctorsProvider(_questId)),
                  ),
                  data: (o) => RefreshIndicator(
                    onRefresh: () async =>
                        ref.invalidate(doctorsProvider(_questId)),
                    child: _body(context, p, o),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, PharmPalette p, DoctorsOverview o) {
    final l10n = context.l10n;
    final children = <Widget>[
      _Header(palette: p, total: o.totals.doctors, company: o.companyName),
    ];

    if (!o.available) {
      children.addAll([
        const SizedBox(height: 24),
        _Message(
            palette: p,
            icon: Icons.medical_services_outlined,
            text: l10n.doctorsUnavailable),
      ]);
      return _list(children);
    }
    if (o.totals.doctors == 0) {
      children.addAll([
        const SizedBox(height: 24),
        _Message(
            palette: p,
            icon: Icons.person_search_outlined,
            text: l10n.doctorsEmpty),
      ]);
      return _list(children);
    }

    final quest = o.quests.where((q) => q.id == o.questId).firstOrNull;

    // квесты: переключатель, только если активных больше одного
    if (o.quests.length > 1) {
      children.addAll([
        const SizedBox(height: 16),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final q in o.quests)
            _Pill(
              palette: p,
              label: q.name,
              selected: q.id == o.questId,
              onTap: () => setState(() => _questId = q.id),
            ),
        ]),
      ]);
    }
    children.addAll([
      const SizedBox(height: 16),
      _QuestCard(palette: p, quest: quest),
      const SizedBox(height: 16),
      _Summary(
        palette: p,
        totals: o.totals,
        filter: _filter,
        onFilter: (s) => setState(() => _filter = _filter == s ? null : s),
      ),
      const SizedBox(height: 16),
      _SearchField(palette: p, onChanged: (v) => setState(() => _query = v)),
      const SizedBox(height: 16),
    ]);

    final q = _query.trim().toLowerCase();
    var shown = 0;
    for (final g in o.regions) {
      final items = g.items.where((d) {
        if (_filter != null && _statusOf(d) != _filter) return false;
        if (q.isEmpty) return true;
        return d.name.toLowerCase().contains(q) ||
            d.workplace.toLowerCase().contains(q) ||
            d.city.toLowerCase().contains(q) ||
            g.region.toLowerCase().contains(q);
      }).toList();
      if (items.isEmpty) continue;
      shown += items.length;

      final region = g.region == _backendUnknownRegion
          ? l10n.doctorsRegionUnknown
          : g.region;
      final collapsed = _collapsed.contains(g.region);
      children.add(_RegionHeader(
        palette: p,
        title: region,
        summary: l10n.doctorsRegionSummary(g.doctors, g.completed),
        collapsed: collapsed,
        onTap: () => setState(() => collapsed
            ? _collapsed.remove(g.region)
            : _collapsed.add(g.region)),
      ));
      if (!collapsed) {
        for (final d in items) {
          children.addAll([
            const SizedBox(height: 10),
            _DoctorCard(palette: p, doctor: d, hasQuest: quest != null),
          ]);
        }
      }
      children.add(const SizedBox(height: 20));
    }

    if (shown == 0) {
      children.add(_Message(
          palette: p, icon: Icons.search_off, text: l10n.doctorsNotFound));
    }
    return _list(children);
  }

  Widget _list(List<Widget> children) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: children,
      );
}

// ── Заголовок ───────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header(
      {required this.palette, required this.total, required this.company});

  final PharmPalette palette;
  final int total;
  final String? company;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                context.l10n.doctorsTitle,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: palette.textPrimary),
              ),
            ),
            if (total > 0)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: palette.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text('$total',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: palette.accent)),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          company == null || company!.isEmpty
              ? context.l10n.doctorsHint
              : '${context.l10n.doctorsHint} · $company',
          style: TextStyle(fontSize: 14, color: palette.textMuted),
        ),
      ],
    );
  }
}

// ── Квест ───────────────────────────────────────────────────────────────

class _QuestCard extends StatelessWidget {
  const _QuestCard({required this.palette, required this.quest});

  final PharmPalette palette;
  final DoctorQuestInfo? quest;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final q = quest;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: palette.accent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.flag_outlined, color: palette.accent, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: q == null
                ? Text(context.l10n.doctorsNoQuest,
                    style: TextStyle(fontSize: 14, color: palette.textMuted))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q.name,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: palette.textPrimary)),
                      const SizedBox(height: 4),
                      Text(
                        [
                          if (q.startDate != null && q.endDate != null)
                            '${_date(q.startDate!)} — ${_date(q.endDate!)}',
                          context.l10n.doctorsQuestGoal(_n(q.goal)),
                        ].join(' · '),
                        style:
                            TextStyle(fontSize: 12, color: palette.textMuted),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  /// '2026-09-08' → '08.09'
  static String _date(String iso) {
    final parts = iso.split('-');
    return parts.length == 3 ? '${parts[2]}.${parts[1]}' : iso;
  }
}

// ── Сводка-фильтр ───────────────────────────────────────────────────────

class _Summary extends StatelessWidget {
  const _Summary({
    required this.palette,
    required this.totals,
    required this.filter,
    required this.onFilter,
  });

  final PharmPalette palette;
  final DoctorTotals totals;
  final _Status? filter;
  final ValueChanged<_Status> onFilter;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget tile(_Status s, String label, int value) => Expanded(
          child: _StatTile(
            palette: palette,
            label: label,
            value: value,
            color: _colorOf(s),
            selected: filter == s,
            onTap: () => onFilter(s),
          ),
        );
    return Row(children: [
      tile(_Status.completed, l10n.doctorsCompleted, totals.completed),
      const SizedBox(width: 8),
      tile(_Status.inProgress, l10n.doctorsInProgress, totals.inProgress),
      const SizedBox(width: 8),
      tile(_Status.idle, l10n.doctorsIdle, totals.idle),
    ]);
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.palette,
    required this.label,
    required this.value,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final PharmPalette palette;
  final String label;
  final int value;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: selected ? color.withValues(alpha: 0.16) : palette.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: selected
              ? color
              : (isDark ? Colors.transparent : palette.cardBorder),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$value',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: color)),
              const SizedBox(height: 2),
              Text(label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: palette.textMuted)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Поиск ───────────────────────────────────────────────────────────────

class _SearchField extends StatelessWidget {
  const _SearchField({required this.palette, required this.onChanged});

  final PharmPalette palette;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(14),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 15, color: palette.textPrimary),
        decoration: InputDecoration(
          isDense: true,
          hintText: context.l10n.doctorsSearchHint,
          hintStyle: TextStyle(fontSize: 15, color: palette.textMuted),
          prefixIcon: Icon(Icons.search, size: 20, color: palette.textMuted),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }
}

// ── Регион ──────────────────────────────────────────────────────────────

class _RegionHeader extends StatelessWidget {
  const _RegionHeader({
    required this.palette,
    required this.title,
    required this.summary,
    required this.collapsed,
    required this.onTap,
  });

  final PharmPalette palette;
  final String title;
  final String summary;
  final bool collapsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Row(
          children: [
            Icon(Icons.place_outlined, size: 18, color: palette.accent),
            const SizedBox(width: 6),
            Expanded(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: palette.textPrimary)),
            ),
            Text(summary,
                style: TextStyle(fontSize: 12, color: palette.textMuted)),
            const SizedBox(width: 4),
            Icon(collapsed ? Icons.expand_more : Icons.expand_less,
                size: 20, color: palette.textMuted),
          ],
        ),
      ),
    );
  }
}

// ── Карточка врача ──────────────────────────────────────────────────────

class _DoctorCard extends StatelessWidget {
  const _DoctorCard(
      {required this.palette, required this.doctor, required this.hasQuest});

  final PharmPalette palette;
  final DoctorRow doctor;
  final bool hasQuest;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = context.l10n;
    final d = doctor;
    final status = _statusOf(d);
    final color = _colorOf(status);
    final label = switch (status) {
      _Status.completed => l10n.doctorsDoneTimes(d.done),
      _Status.inProgress => l10n.doctorsInProgress,
      _Status.idle => l10n.doctorsIdle,
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.9),
                    shape: BoxShape.circle),
                child: Text(initialsOf(d.name),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: palette.textPrimary)),
                    const SizedBox(height: 2),
                    Text(
                      '${d.workplace} · ${d.city}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: palette.textMuted),
                    ),
                  ],
                ),
              ),
              if (hasQuest) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: isDark ? 0.20 : 0.12),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(label,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: color)),
                ),
              ],
            ],
          ),
          if (hasQuest) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      // Выполненный квест — полная полоса: бэкенд обнуляет
                      // текущий прогресс после выполнения, и без этого
                      // выполнивший врач выглядел бы как «0 / 15».
                      value: d.done > 0 ? 1.0 : d.progress.clamp(0.0, 1.0),
                      minHeight: 6,
                      backgroundColor: palette.progressTrack,
                      valueColor: AlwaysStoppedAnimation(color),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                    d.done > 0
                        ? '${_n(d.goal)} / ${_n(d.goal)}'
                            '${d.collected > 0 ? ' +${_n(d.collected)}' : ''}'
                        : '${_n(d.collected)} / ${_n(d.goal)}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: palette.textPrimary)),
              ],
            ),
          ],
          const SizedBox(height: 8),
          Text(l10n.doctorsRecipesCount(d.recipes),
              style: TextStyle(fontSize: 11, color: palette.textMuted)),
        ],
      ),
    );
  }
}

// ── Прочее ──────────────────────────────────────────────────────────────

class _Pill extends StatelessWidget {
  const _Pill({
    required this.palette,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final PharmPalette palette;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: selected
          ? palette.accent
          : (isDark ? const Color(0xFF22232B) : Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
        side: BorderSide(
            color: selected
                ? Colors.transparent
                : (isDark ? const Color(0xFF2D2E38) : palette.cardBorder)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : palette.textMuted)),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.palette,
    required this.icon,
    required this.text,
    this.onRetry,
  });

  final PharmPalette palette;
  final IconData icon;
  final String text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      margin: onRetry == null ? null : const EdgeInsets.all(16),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 36, color: palette.textMuted),
          const SizedBox(height: 12),
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(color: palette.textMuted)),
          if (onRetry != null) ...[
            const SizedBox(height: 12),
            FilledButton.tonal(
                onPressed: onRetry, child: Text(context.l10n.portfolioRetry)),
          ],
        ],
      ),
    );
  }
}

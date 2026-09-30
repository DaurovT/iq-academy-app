import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/learn.dart';
import '../../widgets/pq_states.dart';
import '../shared/providers.dart';
import 'learn/learn_widgets.dart';
import 'providers.dart';

enum _Tab { fresh, progress, done }

bool _inTab(Course c, _Tab t) => switch (t) {
  _Tab.fresh => c.progress <= 0,
  _Tab.progress => c.progress > 0 && c.progress < 1,
  _Tab.done => c.progress >= 1,
};

/// Обучение — список курсов (макеты Learn, LearnEmpty, LearnNoResults).
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  /// null — вкладка ещё не выбрана: берём первую непустую.
  _Tab? _tab;
  bool _searching = false;
  final _search = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _search.dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    ref.invalidate(courseDetailProvider);
    ref.invalidate(coursesProvider);
    await ref.read(coursesProvider.future);
  }

  void _openSearch() {
    setState(() => _searching = true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  void _closeSearch() {
    _focus.unfocus();
    _search.clear();
    setState(() => _searching = false);
  }

  String _tabLabel(_Tab t) {
    final l = context.l10n;
    return switch (t) {
      _Tab.fresh => l.learnSegNew,
      _Tab.progress => l.learnSegProgress,
      _Tab.done => l.learnSegDone,
    };
  }

  bool _matches(Course c, String q) {
    if (q.isEmpty) return true;
    bool has(String? s) => s != null && s.toLowerCase().contains(q);
    return has(c.title) || has(c.ownerBrand) || has(c.category);
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final unread = ref.watch(unreadCountProvider).asData?.value ?? 0;
    final courses = ref.watch(coursesProvider);
    final bottom = math.max(
      kPqNavClearance,
      MediaQuery.paddingOf(context).bottom + 36,
    );

    return PqScreen(
      safeBottom: false,
      child: Column(
        children: [
          PqTabHeader(
            onBell: () => context.push('/app/notifications'),
            bellLabel: l.notifTitle,
            unread: unread > 0,
          ),
          Expanded(
            child: PqAsync<List<Course>>(
              value: courses,
              onRetry: () => ref.invalidate(coursesProvider),
              padding: EdgeInsets.fromLTRB(16, 4, 16, bottom),
              loadingBuilder:
                  (_) => SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16, 4, 16, bottom),
                    child: PqSkeletonList(title: l.learnTitle, rows: 4),
                  ),
              data:
                  (all) => PqRefresh(
                    onRefresh: _refresh,
                    child: _list(context, pq, all, bottom),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list(
    BuildContext context,
    PqColors pq,
    List<Course> all,
    double bottom,
  ) {
    final l = context.l10n;
    final q = _searching ? _search.text.trim().toLowerCase() : '';
    final tab =
        _tab ??
        _Tab.values.firstWhere(
          (t) => all.any((c) => _inTab(c, t)),
          orElse: () => _Tab.fresh,
        );
    final list = all.where((c) => _inTab(c, tab) && _matches(c, q)).toList();

    // Пустые состояния — с каскадом экранов входа (маркер pq-auth в макетах).
    final maxIndex = list.isNotEmpty ? 6 : 4;

    final items = <Widget>[
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: PqMotion.ease,
        child:
            _searching
                ? _SearchHeader(
                  key: const ValueKey('search'),
                  controller: _search,
                  focus: _focus,
                  onChanged: () => setState(() {}),
                  onCancel: _closeSearch,
                )
                : _Header(key: const ValueKey('title'), onSearch: _openSearch),
      ),
      PqSegmented<_Tab>(
        values: _Tab.values,
        selected: tab,
        labelOf: _tabLabel,
        onChanged: (t) => setState(() => _tab = t),
      ),
    ];

    if (all.isEmpty) {
      items.add(
        LearnStateBlock(
          icon: PqIcons.graduationCap,
          title: l.learnEmptyTitle,
          message: l.learnEmptyText,
          action: LearnOutlineButton(
            label: l.learnEnableNotifications,
            icon: PqIcons.bell,
            onPressed: () => context.push('/app/settings/notifications'),
          ),
        ),
      );
    } else if (list.isEmpty && q.isNotEmpty) {
      final other = _Tab.values.where(
        (t) => t != tab && all.any((c) => _inTab(c, t) && _matches(c, q)),
      );
      final query = _search.text.trim();
      items.add(
        LearnStateBlock(
          icon: PqIcons.search,
          title: l.learnNoResultsTitle,
          message:
              other.isEmpty
                  ? l.learnNoResultsAll(query)
                  : l.learnNoResultsInTab(query, _tabLabel(tab)),
          action:
              other.isEmpty
                  ? null
                  : LearnOutlineButton(
                    label: l.learnSearchEverywhere,
                    icon: PqIcons.search,
                    onPressed: () => setState(() => _tab = other.first),
                  ),
        ),
      );
    } else if (list.isEmpty) {
      items.add(
        LearnStateBlock(
          icon: PqIcons.graduationCap,
          title: l.learnTabEmptyTitle,
          message: switch (tab) {
            _Tab.fresh => l.learnTabEmptyNew,
            _Tab.progress => l.learnTabEmptyProgress,
            _Tab.done => l.learnTabEmptyDone,
          },
        ),
      );
    } else {
      for (final c in list) {
        items.add(
          _CourseCard(
            key: ValueKey(c.id),
            course: c,
            onTap: () => context.push('/app/learn/${c.id}'),
          ),
        );
      }
    }

    final gap = _searching ? 20.0 : 24.0;
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16, 4, 16, bottom),
      itemCount: items.length,
      itemBuilder:
          (_, i) => Padding(
            padding: EdgeInsets.only(top: i == 0 ? 0 : gap),
            child: PqAnimate(
              key: items[i].key,
              delay: PqMotion.staggerDelay(i, maxIndex: maxIndex),
              child: items[i],
            ),
          ),
    );
  }
}

/// Заголовок экрана + круглая кнопка поиска 44 с рамкой.
class _Header extends StatelessWidget {
  const _Header({super.key, required this.onSearch});

  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: PqPageTitle(l.learnTitle, subtitle: l.learnSubtitle)),
        const SizedBox(width: 12),
        PqPressable(
          onTap: onSearch,
          semanticLabel: l.learnSearchA11y,
          scale: .94,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: pq.surface,
              shape: BoxShape.circle,
              border: Border.all(color: pq.border),
            ),
            alignment: Alignment.center,
            child: PqIcon(PqIcons.search, size: 20, color: pq.text),
          ),
        ),
      ],
    );
  }
}

/// Режим поиска (макет LearnNoResults): h1 + поле 48/16 + «Отмена».
class _SearchHeader extends StatefulWidget {
  const _SearchHeader({
    super.key,
    required this.controller,
    required this.focus,
    required this.onChanged,
    required this.onCancel,
  });

  final TextEditingController controller;
  final FocusNode focus;
  final VoidCallback onChanged;
  final VoidCallback onCancel;

  @override
  State<_SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<_SearchHeader> {
  @override
  void initState() {
    super.initState();
    widget.focus.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.focus.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final focused = widget.focus.hasFocus;
    final hasText = widget.controller.text.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l.learnTitle, style: PqText.display(c: pq.text)),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Semantics(
                textField: true,
                label: l.learnSearchA11y,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 48,
                  padding: EdgeInsets.fromLTRB(
                    focused ? 13 : 14,
                    0,
                    focused ? 5 : 6,
                    0,
                  ),
                  decoration: BoxDecoration(
                    color: pq.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: focused ? pq.accent : pq.border,
                      width: focused ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      PqIcon(PqIcons.search, size: 20, color: pq.textMuted),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: widget.controller,
                          focusNode: widget.focus,
                          onChanged: (_) => widget.onChanged(),
                          textInputAction: TextInputAction.search,
                          cursorColor: pq.accent,
                          cursorWidth: 2,
                          cursorHeight: 20,
                          style: PqText.field(c: pq.text),
                          decoration: InputDecoration(
                            isDense: true,
                            filled: false,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: l.learnSearchPlaceholder,
                            hintStyle: PqText.field(c: pq.textMuted),
                          ),
                        ),
                      ),
                      if (hasText)
                        PqPressable(
                          onTap: () {
                            widget.controller.clear();
                            widget.onChanged();
                          },
                          semanticLabel: l.learnSearchClear,
                          scale: .94,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: pq.surfaceAlt,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: PqIcon(
                              PqIcons.x,
                              size: 16,
                              color: pq.textMuted,
                            ),
                          ),
                        )
                      else
                        const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            PqPressable(
              onTap: widget.onCancel,
              semanticLabel: l.commonCancel,
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                child: Text(
                  l.commonCancel,
                  style: PqText.text(15, FontWeight.w600, c: pq.accent),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Карточка курса (макет Learn): обложка 150, название + награда, описание,
/// три плитки (видео · тест · награда), прогресс и кнопка-действие.
/// Плитки и награда берутся из детали курса (в списке их нет).
class _CourseCard extends ConsumerWidget {
  const _CourseCard({super.key, required this.course, required this.onTap});

  final Course course;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pq = context.pq;
    final l = context.l10n;
    final detail = ref.watch(courseDetailProvider(course.id));
    final lessons = detail.asData?.value.lessons;
    final stats = lessons == null ? null : learnStats(lessons);
    final done = course.progress >= 1;
    final started = course.progress > 0;
    final pct = (course.progress.clamp(0, 1) * 100).round();

    Widget? tag;
    if (done) {
      tag = PqStatusBadge(l.learnCompleted, tone: PqTone.success);
    } else if (stats != null && stats.reward > 0) {
      tag = PqRewardTag.iqc(l.learnIqc(stats.reward));
    }

    final tiles = <Widget>[];
    if (stats != null && lessons != null) {
      if (stats.videos > 0) {
        tiles.add(
          _Tile(
            icon: PqIcons.video,
            iconColor: pq.accentText,
            label:
                stats.videos == 1
                    ? l.learnRowVideo
                    : l.learnTileVideo(stats.videos),
            value: stats.minutes > 0 ? l.learnMinutesShort(stats.minutes) : '—',
          ),
        );
      }
      if (stats.quizzes > 0) {
        final quizzes = lessons.where((x) => x.kind == 'quiz');
        tiles.add(
          _Tile(
            icon: PqIcons.checkSquare,
            iconColor: pq.accentText,
            label:
                stats.quizzes == 1
                    ? l.learnRowQuiz
                    : l.learnTileQuiz(stats.quizzes),
            value:
                quizzes.every((x) => x.completed)
                    ? l.learnCompleted
                    : quizzes.any((x) => x.locked != true)
                    ? l.learnQuizStatusOpen
                    : l.learnQuizStatusLocked,
          ),
        );
      }
      if (stats.reward > 0) {
        tiles.add(
          _Tile(
            icon: PqIcons.star,
            iconColor: learnRewardFg(pq),
            label: l.learnTileReward,
            value: l.learnIqc(stats.reward),
          ),
        );
      }
    }

    final (ctaIcon, ctaLabel) =
        done
            ? (PqIcons.rotateCcw, l.learnCtaRepeat)
            : started
            ? (PqIcons.play, l.learnCtaContinue)
            : (PqIcons.play, l.learnCtaStart);

    return PqCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LearnBanner(
            title: course.title,
            brand: course.ownerBrand ?? course.category,
            coverUrl: course.coverUrl,
            height: 150,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        course.title,
                        style: PqText.title(c: pq.text),
                      ),
                    ),
                    if (tag != null) ...[const SizedBox(width: 12), tag],
                  ],
                ),
                if (course.description.trim().isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Text(
                    course.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.body(c: pq.textSecondary),
                  ),
                ],
                if (detail.isLoading && stats == null) ...[
                  const SizedBox(height: 14),
                  const Row(
                    children: [
                      Expanded(child: PqSkeleton(height: 78, radius: 16)),
                      SizedBox(width: 8),
                      Expanded(child: PqSkeleton(height: 78, radius: 16)),
                      SizedBox(width: 8),
                      Expanded(child: PqSkeleton(height: 78, radius: 16)),
                    ],
                  ),
                ] else if (tiles.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 0; i < tiles.length; i++) ...[
                          if (i > 0) const SizedBox(width: 8),
                          Expanded(child: tiles[i]),
                        ],
                      ],
                    ),
                  ),
                ],
                if (started && !done) ...[
                  const SizedBox(height: 14),
                  Text(
                    l.learnProgressLabel(pct),
                    style: PqText.caption(c: pq.textMuted, w: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  PqProgressBar(value: course.progress, height: 6),
                ],
                const SizedBox(height: 14),
                _CardCta(icon: ctaIcon, label: ctaLabel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final PqIcons icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: pq.surfaceAlt,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Иконка — inline-svg в строке 16×1.4: блок 23 px, svg прижат к верху.
          SizedBox(
            height: 23,
            child: Align(
              alignment: Alignment.topLeft,
              child: PqIcon(icon, size: 18, color: iconColor),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: PqText.caption(c: pq.textMuted),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: PqText.text(14, FontWeight.w700, c: pq.text),
          ),
        ],
      ),
    );
  }
}

/// Кнопка внутри карточки (вся карточка — ссылка): 52/16, без тени.
class _CardCta extends StatelessWidget {
  const _CardCta({required this.icon, required this.label});

  final PqIcons icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final pressed = PqPressedScope.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 52,
      decoration: BoxDecoration(
        color: pressed ? pq.accentPressed : pq.accent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PqIcon(icon, size: 18, color: pq.onAccent),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: PqText.button(c: pq.onAccent),
            ),
          ),
        ],
      ),
    );
  }
}

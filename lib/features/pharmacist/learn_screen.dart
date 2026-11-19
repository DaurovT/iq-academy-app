import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/design.dart';
import '../../core/img.dart';
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
/// Карточка курса (макет CourseCardC «обложка»): обложка во всю карточку,
/// снизу затемнение, на нём название, длительность видео и число вопросов;
/// сверху метка категории и награда, в углу круглая кнопка запуска.
class _CourseCard extends ConsumerWidget {
  const _CourseCard({super.key, required this.course, required this.onTap});

  final Course course;
  final VoidCallback onTap;

  /// Обложки без картинки — градиент по курсу (как в макете: розовый,
  /// зелёный, оранжевый…), стабильный между запусками.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final detail = ref.watch(courseDetailProvider(course.id)).asData?.value;
    final lessons = detail?.lessons;
    final stats = lessons == null ? null : learnStats(lessons);
    final done = course.progress >= 1;
    final started = course.progress > 0 && !done;
    final quiz = lessons?.where((x) => x.kind == 'quiz').firstOrNull;
    final questions = quiz == null
        ? null
        : ref
            .watch(quizProvider((course.id, quiz.id)))
            .asData
            ?.value
            .questions
            .length;
    final label = (course.ownerBrand ?? course.category ?? '').trim();
    final cover = imgThumb(course.coverUrl, w: 900);
    final colors = learnCoverColors(course.id);
    const white85 = Color(0xD9FFFFFF);

    final meta = <Widget>[
      if (stats != null && stats.videos > 0 && stats.minutes > 0)
        _Meta(icon: PqIcons.video, text: l.learnMinutesShort(stats.minutes)),
      if (quiz != null)
        _Meta(
          icon: PqIcons.checkSquare,
          text: questions != null && questions > 0
              ? l.homeNewCourseQuizQuestions(questions)
              : l.learnRowQuiz,
        ),
    ];

    return PqPressable(
      onTap: onTap,
      semanticLabel: course.title,
      scale: .98,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Color(0x73111827),
              offset: Offset(0, 10),
              blurRadius: 24,
              spreadRadius: -14,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-1, -.7),
                    end: const Alignment(1, .7),
                    colors: colors,
                  ),
                ),
              ),
              // Декор обложки-заглушки: круг и наклонный «лист».
              if (cover == null) ...[
                Positioned(
                  right: -24,
                  top: -30,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      color: Color(0x24FFFFFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: 28,
                  bottom: -26,
                  child: Transform.rotate(
                    angle: -8 * math.pi / 180,
                    child: Container(
                      width: 70,
                      height: 92,
                      decoration: BoxDecoration(
                        color: const Color(0x38FFFFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ] else
                Image.network(
                  cover,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              // Затемнение снизу — под текст.
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00000000), Color(0xC70A0C14)],
                    stops: [.35, 1],
                  ),
                ),
              ),
              if (label.isNotEmpty)
                Positioned(
                  left: 14,
                  top: 14,
                  right: 120,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x8C111827),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.tag(c: Colors.white),
                      ),
                    ),
                  ),
                ),
              if (done || (stats != null && stats.reward > 0))
                Positioned(
                  right: 14,
                  top: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      done ? l.learnCompleted : l.learnIqc(stats!.reward),
                      style: PqText.text(
                        12,
                        FontWeight.w800,
                        c: done
                            ? const Color(0xFF15803D)
                            : const Color(0xFF6D28D9),
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: 16,
                right: 80,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: PqText.heading(
                        22,
                        FontWeight.w800,
                        height: 1.15,
                        c: Colors.white,
                      ),
                    ),
                    if (meta.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Wrap(spacing: 12, runSpacing: 2, children: meta),
                    ],
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: PqIcon(
                    done ? PqIcons.rotateCcw : PqIcons.play,
                    size: 20,
                    color: const Color(0xFF2563EB),
                  ),
                ),
              ),
              // Начатый курс — тонкая полоса прогресса по нижнему краю.
              if (started)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LinearProgressIndicator(
                    value: course.progress.clamp(0, 1).toDouble(),
                    minHeight: 4,
                    backgroundColor: const Color(0x33FFFFFF),
                    color: white85,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Строка метаданных под названием: иконка 15 + текст 13 на обложке.
class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final PqIcons icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    const c = Color(0xD9FFFFFF);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PqIcon(icon, size: 15, color: c),
        const SizedBox(width: 4),
        Text(text, style: PqText.text(13, FontWeight.w400, c: c)),
      ],
    );
  }
}


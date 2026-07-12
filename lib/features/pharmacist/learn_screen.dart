import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/learn.dart';
import '../shared/widgets/pharm_top_bar.dart';
import 'providers.dart';

String _lessonsWord(int n) {
  if (n % 10 == 1 && n % 100 != 11) return 'урок';
  if ([2, 3, 4].contains(n % 10) && !(n % 100 >= 12 && n % 100 <= 14)) {
    return 'урока';
  }
  return 'уроков';
}

enum _Tab { all, mine, done }

/// Обучение (список курсов). Перенесено один в один из макета Figma
/// «pharmiq-learning-courses».
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  _Tab _tab = _Tab.all;
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _L.of(context);
    final all = ref.watch(coursesProvider).asData?.value ?? const <Course>[];

    final byTab = switch (_tab) {
      _Tab.all => all,
      _Tab.mine => all.where((e) => e.progress > 0 && e.progress < 1),
      _Tab.done => all.where((e) => e.progress >= 1),
    };
    final q = _query.trim().toLowerCase();
    final list =
        byTab.where((e) => q.isEmpty || e.title.toLowerCase().contains(q)).toList();

    return Scaffold(
      backgroundColor: c.page,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(coursesProvider),
              child: ListView(
                padding: const EdgeInsets.only(top: 20, bottom: 24),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                    child: Text('Обучение',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: c.text)),
                  ),
                  const SizedBox(height: 12),
                  // search
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                          color: c.card,
                          borderRadius: BorderRadius.circular(22)),
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          Icon(Icons.search, size: 20, color: c.muted),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchCtrl,
                              onChanged: (v) => setState(() => _query = v),
                              style: TextStyle(fontSize: 13, color: c.text),
                              decoration: InputDecoration(
                                isCollapsed: true,
                                filled: false,
                                border: InputBorder.none,
                                hintText: 'Поиск по курсам...',
                                hintStyle:
                                    TextStyle(fontSize: 13, color: c.muted),
                              ),
                            ),
                          ),
                          if (_query.isNotEmpty)
                            InkWell(
                              onTap: () {
                                _searchCtrl.clear();
                                setState(() => _query = '');
                              },
                              child: Icon(Icons.close, size: 18, color: c.muted),
                            ),
                          const SizedBox(width: 14),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        for (final (t, label) in const [
                          (_Tab.all, 'Все'),
                          (_Tab.mine, 'Мои курсы'),
                          (_Tab.done, 'Пройденные'),
                        ]) ...[
                          _Chip(
                            c: c,
                            label: label,
                            selected: _tab == t,
                            onTap: () => setState(() => _tab = t),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (list.isEmpty)
                    _EmptySearch(
                      c: c,
                      query: _query,
                      onReset: () {
                        _searchCtrl.clear();
                        setState(() {
                          _query = '';
                          _tab = _Tab.all;
                        });
                      },
                    )
                  else
                    for (final course in list)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: _CourseCard(
                          c: c,
                          course: course,
                          onTap: () => context.push('/app/learn/${course.id}'),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.c,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final _L c;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 32,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1D4068) : c.card,
          borderRadius: BorderRadius.circular(999),
          border: selected ? null : Border.all(color: c.border),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? const Color(0xFFE4E2ED) : c.muted)),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.c, required this.course, required this.onTap});
  final _L c;
  final Course course;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final brand = course.ownerBrand ?? course.category;
    return Material(
      color: c.card,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // banner
            SizedBox(
              height: 160,
              width: double.infinity,
              child: Stack(
                children: [
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFE8621A), Color(0xFFF59F30)],
                      ),
                    ),
                    child: SizedBox.expand(),
                  ),
                  if (brand != null)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(999)),
                        child: Text(brand.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0D1117))),
                      ),
                    ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    right: 16,
                    child: Text(course.title.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            // content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(course.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: c.text)),
                      ),
                      if (course.isNew == true) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF59F30),
                              borderRadius: BorderRadius.circular(999)),
                          child: const Text('НОВЫЙ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0D1117))),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(course.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13, height: 1.5, color: c.muted)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.play_circle_outline, size: 14, color: c.muted),
                      const SizedBox(width: 6),
                      Text(
                          '${course.lessonCount} ${_lessonsWord(course.lessonCount)}',
                          style: TextStyle(fontSize: 12, color: c.muted)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 44,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D4068),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      course.progress > 0
                          ? 'ПРОДОЛЖИТЬ ОБУЧЕНИЕ'
                          : 'ПРОЙТИ КУРС',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE4E2ED)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch(
      {required this.c, required this.query, required this.onReset});
  final _L c;
  final String query;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: c.card, borderRadius: BorderRadius.circular(36)),
            child: Icon(Icons.search, size: 32, color: c.muted),
          ),
          const SizedBox(height: 16),
          Text('Курсы не найдены',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w700, color: c.text)),
          const SizedBox(height: 8),
          Text(
            query.isEmpty
                ? 'Попробуйте изменить фильтры'
                : 'По запросу «$query» ничего не нашлось.\nПопробуйте изменить запрос или сбросить фильтры.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: c.muted),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: c.text,
              side: BorderSide(color: c.border),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: onReset,
            child: const Text('Сбросить фильтры'),
          ),
        ],
      ),
    );
  }
}

class _L {
  const _L({
    required this.page,
    required this.card,
    required this.border,
    required this.text,
    required this.muted,
  });

  final Color page;
  final Color card;
  final Color border;
  final Color text;
  final Color muted;

  static _L of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _L(
    page: Color(0xFF0D1117),
    card: Color(0xFF131A28),
    border: Color(0xFF2A3040),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF8F909A),
  );

  static const _light = _L(
    page: Color(0xFFF5F6FA),
    card: Colors.white,
    border: Color(0xFFEBEDF0),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
  );
}

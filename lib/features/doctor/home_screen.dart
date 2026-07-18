import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/format.dart';
import '../../core/img.dart';
import '../../core/models/check.dart';
import '../../core/models/learn.dart';
import '../../core/models/quest.dart';
import '../../core/theme/app_colors.dart';
import '../shared/widgets/pharm_top_bar.dart';
import '../shared/widgets/screen_decor.dart';
import '../news/news_home_block.dart';
import '../news/survey_home_block.dart';
import '../mini_apps/mini_apps_home_block.dart';
import '../pharmacist/providers.dart';
import 'providers.dart';
import 'recipes_screen.dart';

/// Главная врача. Дизайн перенесён из макета Figma «pharmiq-home-md3»
/// (тёмная 156:186 и светлая 160:3 темы). Структура зеркалит PharmacistHome.
class DoctorHome extends ConsumerWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = PharmPalette.of(context);

    final name = ref
            .watch(authControllerProvider)
            .asData
            ?.value
            .account
            ?.fullName ??
        '';
    final wallet = ref.watch(walletProvider).asData?.value;
    final quests =
        ref.watch(questsListProvider(QuestTarget.recipes)).asData?.value ??
            const [];
    final recipes = ref.watch(recipesProvider).asData?.value ?? const [];
    final courses = ref.watch(coursesProvider).asData?.value ?? const [];

    final iqc = wallet?.balanceIqc ?? 0;
    final uzs = wallet?.balanceUzs ?? 0;
    final approved =
        recipes.where((r) => r.status == CheckStatus.approved).length;
    final recommended = courses.take(2).toList();

    return Scaffold(
      backgroundColor: p.bg,
      body: Column(
        children: [
          const PharmTopBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(walletProvider);
                ref.invalidate(questsListProvider(QuestTarget.recipes));
                ref.invalidate(recipesProvider);
                ref.invalidate(coursesProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: ScreenDecor(doctorHomeDecor),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _Greeting(palette: p, name: name),
                          const SizedBox(height: 24),
                          _WalletCard(
                            palette: p,
                            iqc: iqc,
                            uzs: uzs,
                            onWallet: () => context.go('/app/wallet'),
                          ),
                          const SizedBox(height: 16),
                          _QuickAction(
                            palette: p,
                            onTap: () => showNewRecipeSheet(context, ref),
                          ),
                          const SizedBox(height: 24),
                          _StatsRow(
                            palette: p,
                            recipesCount: recipes.length,
                            approved: approved,
                            iqc: iqc,
                          ),
                          const SizedBox(height: 24),
                          _SectionHeader(
                            palette: p,
                            title: 'Активные квесты',
                            action: 'Все квесты',
                            onAction: () => context.go('/app/quests'),
                          ),
                          const SizedBox(height: 16),
                          if (quests.isEmpty)
                            _EmptyCard(palette: p, text: 'Нет активных квестов')
                          else
                            for (final q in quests.take(3)) ...[
                              _QuestCard(quest: q),
                              const SizedBox(height: 12),
                            ],
                          const SizedBox(height: 12),
                          _SectionHeader(
                            palette: p,
                            title: 'Рекомендуемые курсы',
                            action: 'Все курсы',
                            onAction: () => context.go('/app/learn'),
                          ),
                          const SizedBox(height: 16),
                          if (recommended.isEmpty)
                            _EmptyCard(palette: p, text: 'Пока нет курсов')
                          else
                            for (final course in recommended) ...[
                              _CourseCard(
                                palette: p,
                                course: course,
                                onTap: () =>
                                    context.push('/app/learn/${course.id}'),
                              ),
                              const SizedBox(height: 12),
                            ],
                          const SizedBox(height: 12),
                          const NewsHomeBlock(),
                          const SizedBox(height: 24),
                          const SurveyHomeBlock(),
                          const SizedBox(height: 24),
                          const MiniAppsHomeBlock(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Приветствие ─────────────────────────────────────────────────────────

class _Greeting extends StatelessWidget {
  const _Greeting({required this.palette, required this.name});

  final PharmPalette palette;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.isEmpty ? 'Привет!' : 'Привет, $name',
          style: TextStyle(
            fontSize: 32,
            height: 1.1,
            fontWeight: FontWeight.w700,
            color: palette.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Отправляйте рецепты и получайте вознаграждение',
          style: TextStyle(fontSize: 16, height: 1.3, color: palette.textMuted),
        ),
      ],
    );
  }
}

// ── Карточка кошелька ───────────────────────────────────────────────────

class _WalletCard extends StatelessWidget {
  const _WalletCard({
    required this.palette,
    required this.iqc,
    required this.uzs,
    required this.onWallet,
  });

  final PharmPalette palette;
  final int iqc;
  final int uzs;
  final VoidCallback onWallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: palette.walletGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'БАЛАНС КОШЕЛЬКА',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: palette.walletText.withValues(alpha: 0.75),
                ),
              ),
              _WalletPill(palette: palette, onTap: onWallet),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$iqc',
                style: TextStyle(
                  fontSize: 56,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: palette.walletText,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'IQC',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: palette.walletText.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${formatUzsPlain(uzs)} UZS',
            style: TextStyle(
              fontSize: 14,
              color: palette.walletText.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletPill extends StatelessWidget {
  const _WalletPill({required this.palette, required this.onTap});

  final PharmPalette palette;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: palette.walletPillBg,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: palette.walletPillBorder),
        ),
        child: Text(
          'Кошелёк',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: palette.walletText,
          ),
        ),
      ),
    );
  }
}

// ── Быстрое действие ────────────────────────────────────────────────────

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.palette, required this.onTap});

  final PharmPalette palette;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: palette.quickBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: palette.quickBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: palette.quickIconBg,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.photo_camera_outlined,
                  size: 24, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Отправить рецепт',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: palette.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Сфотографируйте рецепт — ИИ распознает препараты',
                    style: TextStyle(fontSize: 14, color: palette.textMuted),
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

// ── Статистика ──────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.palette,
    required this.recipesCount,
    required this.approved,
    required this.iqc,
  });

  final PharmPalette palette;
  final int recipesCount;
  final int approved;
  final int iqc;

  @override
  Widget build(BuildContext context) {
    // IntrinsicHeight + stretch: плитки одной высоты, но растут, если подпись
    // на узком экране переносится на 2 строки (иначе bottom overflow).
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatItem(
                palette: palette,
                value: '$recipesCount',
                label: 'всего рецептов'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatItem(
                palette: palette, value: '$approved', label: 'одобрено'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child:
                _StatItem(palette: palette, value: '$iqc', label: 'баллов IQC'),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.palette,
    required this.value,
    required this.label,
  });

  final PharmPalette palette;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: palette.accent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
                fontSize: 12, height: 1.4, color: palette.textMuted),
          ),
        ],
      ),
    );
  }
}

// ── Заголовок секции ────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.palette,
    required this.title,
    required this.action,
    required this.onAction,
  });

  final PharmPalette palette;
  final String title;
  final String action;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: palette.textPrimary,
          ),
        ),
        InkWell(
          onTap: onAction,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              action,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: palette.accent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Карточка квеста ─────────────────────────────────────────────────────

class _QuestCard extends StatelessWidget {
  const _QuestCard({required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    final pct = (quest.progress.clamp(0, 1) * 100).round();
    final isVoucher = quest.rewardType == RewardType.voucher;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF241C52), Color(0xFF2E2470), Color(0xFF4B2A93)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40632CD4),
            blurRadius: 28,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -50,
            right: -30,
            child: Container(
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0x66A855F7), Color(0x00A855F7)],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        quest.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isVoucher
                            ? const Color(0xFFFACC15)
                            : Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isVoucher ? 'ВАУЧЕР' : 'IQC',
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w800,
                          color: isVoucher
                              ? const Color(0xFF1F2937)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Прогресс',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.65))),
                    Text(
                      '$pct% выполнено',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFC4B5FD),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _ProgressBar(value: quest.progress.clamp(0, 1).toDouble()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 8,
        color: Colors.white.withValues(alpha: 0.14),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: value <= 0 ? 0.03 : value,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFA855F7), Color(0xFF38BDF8)],
                ),
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [
                  BoxShadow(color: Color(0x80A855F7), blurRadius: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Рекомендуемый курс (компактная карточка) ────────────────────────────

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.palette,
    required this.course,
    required this.onTap,
  });

  final PharmPalette palette;
  final Course course;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pct = (course.progress.clamp(0, 1) * 100).round();
    final cover = imgThumb(course.coverUrl, w: 160);

    return Material(
      color: palette.card,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: isDark ? null : Border.all(color: palette.cardBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // обложка / иконка
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
                          ),
                        ),
                      ),
                      if (cover != null)
                        Image.network(
                          cover,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      if (cover == null)
                        const Center(
                          child: Icon(Icons.menu_book_rounded,
                              size: 24, color: Colors.white),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        color: palette.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Прогресс',
                            style: TextStyle(
                                fontSize: 12, color: palette.textMuted)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: LinearProgressIndicator(
                              value: course.progress.clamp(0, 1),
                              minHeight: 6,
                              backgroundColor: palette.progressTrack,
                              valueColor: const AlwaysStoppedAnimation(
                                  Color(0xFF6B9EF5)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('$pct%',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: palette.accent)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Пустая карточка ──────────────────────────────────────────────────────

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.palette, required this.text});

  final PharmPalette palette;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? null : Border.all(color: palette.cardBorder),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: palette.textMuted),
      ),
    );
  }
}

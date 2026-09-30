import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/design/design.dart';
import '../../../core/img.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/learn.dart';
import '../../../widgets/pq_states.dart';

/// Общие детали раздела «Обучение» (макеты Learn/Course/Lesson/Test*).

/// Светло-фиолетовый акцент награды (#c4b5fd / #6d28d9) — нет в токенах.
Color learnRewardFg(PqColors pq) =>
    pq.isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);

/// «Доритрицин (Андижан)» → «ДОРИТРИЦИН» — крупная надпись на обложке.
String learnBannerTitle(String title) {
  final short = title.split('(').first.trim();
  return (short.isEmpty ? title : short).toUpperCase();
}

/// «Доритрицин (Андижан)» → «Доритрицин» — для заголовка теста.
String learnShortTitle(String title) {
  final short = title.split('(').first.trim();
  return short.isEmpty ? title : short;
}

/// Человекочитаемый текст ошибки для тоста.
String learnErrorText(BuildContext context, Object e) {
  if (e is ApiException) return e.message;
  if (e is DioException && e.error is ApiException) {
    return (e.error as ApiException).message;
  }
  if (isOfflineError(e)) return context.l10n.stateOfflineTitle;
  return context.l10n.stateServerErrorTitle;
}

/// Сводка курса по урокам: видео, тесты, минуты видео, награда.
({int videos, int quizzes, int minutes, int reward}) learnStats(
  List<Lesson> lessons,
) {
  var videos = 0, quizzes = 0, minutes = 0, reward = 0;
  for (final l in lessons) {
    reward += l.rewardIqc;
    if (l.kind == 'quiz') {
      quizzes++;
    } else {
      videos++;
      minutes +=
          l.durationMin > 0
              ? l.durationMin
              : ((l.videoDurationSec ?? 0) / 60).ceil();
    }
  }
  return (videos: videos, quizzes: quizzes, minutes: minutes, reward: reward);
}

/// Первый доступный непройденный шаг курса (или первый шаг).
Lesson? learnNextStep(List<Lesson> lessons) {
  for (final l in lessons) {
    if (l.locked != true && !l.completed) return l;
  }
  return lessons.isEmpty ? null : lessons.first;
}

/// Длительность урока: «5:32» по видео или «~6 мин».
String? learnLessonDuration(BuildContext context, Lesson l) {
  final s = l.videoDurationSec;
  if (s != null && s > 0) {
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }
  if (l.durationMin > 0) return context.l10n.learnMinutesShort(l.durationMin);
  return null;
}

/// Путь урока/теста.
String learnStepPath(int courseId, Lesson l) =>
    '/app/learn/$courseId/${l.kind == 'quiz' ? 'quiz' : 'lesson'}/${l.id}';

/// Назад по стеку, а если некуда — на [fallback].
void learnBack(BuildContext context, String fallback) =>
    context.canPop() ? context.pop() : context.go(fallback);

/// Нижний отступ прокрутки над закреплённым футером (140 в макетах).
double learnFooterClearance(BuildContext context) =>
    140 + MediaQuery.viewPaddingOf(context).bottom;

/// Обложка курса (макеты Learn/Course): оранжевый градиент 120°, круг
/// rgba(255,255,255,.12), бренд-метка справа сверху, крупное название снизу.
/// Если у курса есть обложка — она поверх градиента, с затемнением снизу.
class LearnBanner extends StatelessWidget {
  const LearnBanner({
    super.key,
    required this.title,
    required this.height,
    required this.borderRadius,
    this.brand,
    this.coverUrl,
  });

  final String title;
  final String? brand;
  final String? coverUrl;
  final double height;
  final BorderRadius borderRadius;

  static const _gradient = LinearGradient(
    begin: Alignment(-0.87, -0.5),
    end: Alignment(0.87, 0.5),
    colors: [Color(0xFFE8611A), Color(0xFFF5A031)],
  );

  @override
  Widget build(BuildContext context) {
    final cover = imgThumb(coverUrl, w: 900);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        height: height,
        decoration: const BoxDecoration(gradient: _gradient),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (cover != null) ...[
              Image.network(
                cover,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00000000), Color(0x8C000000)],
                    stops: [.4, 1],
                  ),
                ),
              ),
            ],
            Positioned(
              right: -30,
              top: -40,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: Color(0x1FFFFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            if (brand != null && brand!.trim().isNotEmpty)
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    brand!.toUpperCase(),
                    style: PqText.tag(
                      c: const Color(0xFF111827),
                    ).copyWith(letterSpacing: .4),
                  ),
                ),
              ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Text(
                learnBannerTitle(title),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: PqText.heading(
                  30,
                  FontWeight.w800,
                  height: 1.1,
                  ls: .5,
                  c: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Закреплённый низ экрана: градиент из прозрачного в фон к 45%,
/// поля 24/16/28 (макеты Course/Lesson/Test*).
class LearnFooter extends StatelessWidget {
  const LearnFooter({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final bottom = math.max(28.0, MediaQuery.viewPaddingOf(context).bottom + 8);
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, bottom),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [pq.bg.withValues(alpha: 0), pq.bg],
          stops: const [0, .45],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

/// Основная кнопка 56/16 с иконкой ПОСЛЕ текста («Далее ›»): тот же вид,
/// что у [PqButton] (нажатие .98, тень, неактивное состояние, загрузка).
class LearnTrailingButton extends StatelessWidget {
  const LearnTrailingButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.loading = false,
    this.loadingLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final PqIcons icon;
  final bool loading;
  final String? loadingLabel;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;
    return PqPressable(
      onTap: enabled ? onPressed : null,
      enabled: enabled,
      semanticLabel: label,
      child: _TrailingFace(
        label: loading ? (loadingLabel ?? label) : label,
        icon: icon,
        loading: loading,
        disabled: onPressed == null && !loading,
      ),
    );
  }
}

class _TrailingFace extends StatelessWidget {
  const _TrailingFace({
    required this.label,
    required this.icon,
    required this.loading,
    required this.disabled,
  });

  final String label;
  final PqIcons icon;
  final bool loading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final pressed = PqPressedScope.of(context);
    final fg = disabled ? pq.textMuted : pq.onAccent;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      height: 56,
      decoration: BoxDecoration(
        color:
            disabled
                ? pq.fieldDisabledBg
                : pressed
                ? pq.accentPressed
                : pq.accent,
        borderRadius: BorderRadius.circular(16),
        border: disabled ? Border.all(color: pq.border) : null,
        boxShadow:
            disabled || pressed || loading
                ? null
                : [
                  BoxShadow(
                    color: pq.accentShadow,
                    offset: const Offset(0, 12),
                    blurRadius: 24,
                    spreadRadius: -12,
                  ),
                ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) ...[PqSpinner(color: fg), const SizedBox(width: 10)],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: PqText.button(c: fg),
            ),
          ),
          if (!loading) ...[
            const SizedBox(width: 10),
            PqIcon(icon, size: 20, color: fg),
          ],
        ],
      ),
    );
  }
}

/// Кнопка-контур 48/16 с иконкой 18 (Empty/NoResults: «Включить уведомления»).
class LearnOutlineButton extends StatelessWidget {
  const LearnOutlineButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final PqIcons icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onPressed,
      semanticLabel: label,
      child: Builder(
        builder: (context) {
          final pressed = PqPressedScope.of(context);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: pressed ? pq.surfaceAlt : pq.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: pressed ? pq.borderStrong : pq.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PqIcon(icon, size: 18, color: pq.text),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: PqText.text(15, FontWeight.w600, c: pq.text),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Пустое состояние раздела (макеты LearnEmpty/LearnNoResults): плитка 80
/// радиус 24 с рамкой (pqPop .5s + pqBob 3.2s после .6s), заголовок 22/700,
/// текст 15/1.5 до 300, необязательная кнопка.
class LearnStateBlock extends StatelessWidget {
  const LearnStateBlock({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  final PqIcons icon;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PqAnimate(
            fx: PqFx.pop,
            child: PqBob(
              duration: const Duration(milliseconds: 3200),
              delay: const Duration(milliseconds: 600),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: pq.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: pq.border),
                  boxShadow: pq.cardShadow,
                ),
                alignment: Alignment.center,
                child: PqIcon(icon, size: 34, color: pq.accentText),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: PqText.emptyTitle(c: pq.text),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: PqText.text(
                15,
                FontWeight.w400,
                height: 1.5,
                c: pq.textMuted,
              ),
            ),
          ),
          if (action != null) ...[const SizedBox(height: 24), action!],
        ],
      ),
    );
  }
}

/// Ссылка-действие по центру (цвет ссылок `a` — акцент): 15/600 + шеврон 16, ≥44
/// («Открыть кошелёк ›», «Пересмотреть урок ›»).
class LearnLink extends StatelessWidget {
  const LearnLink({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return PqPressable(
      onTap: onTap,
      semanticLabel: label,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 44),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: PqText.text(15, FontWeight.w600, c: pq.accent)),
            const SizedBox(width: 4),
            PqIcon(PqIcons.chevronRight, size: 16, color: pq.accent),
          ],
        ),
      ),
    );
  }
}

import 'dart:io' show SocketException;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api/api_exception.dart';
import '../core/design/design.dart';
import '../core/l10n/l10n.dart';

/// Ошибка из-за отсутствия связи (нет ответа сервера).
bool isOfflineError(Object e) {
  if (e is DioException) {
    if (e.response != null) return false;
    return switch (e.type) {
      DioExceptionType.connectionError ||
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        true,
      DioExceptionType.unknown => e.error is SocketException,
      _ => false,
    };
  }
  return e is SocketException;
}

/// HTTP-код ошибки сервера (для строки «Код ошибки: 503»).
int? errorStatusCode(Object e) {
  if (e is DioException) {
    final inner = e.error;
    if (inner is ApiException) return inner.statusCode;
    return e.response?.statusCode;
  }
  if (e is ApiException) return e.statusCode;
  return null;
}

/// Вид скелетона при загрузке.
enum PqLoadingKind {
  /// Карточка-список со строками (экраны списков).
  list,

  /// Главная: заголовок, большая карточка, секция.
  home,

  /// Только спиннер по центру.
  spinner,
}

/// Рендер AsyncValue в стиле редизайна: скелетон → данные;
/// ошибка связи → «Нет подключения», прочее → «Что-то пошло не так».
class PqAsync<T> extends StatelessWidget {
  const PqAsync({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
    this.loading = PqLoadingKind.list,
    this.loadingBuilder,
    this.onSupport,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 16, 40),
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;
  final PqLoadingKind loading;
  final WidgetBuilder? loadingBuilder;
  final VoidCallback? onSupport;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // Есть прошлые данные — показываем их, даже если идёт перезагрузка.
    if (value.hasValue && !value.hasError) return data(value.requireValue);
    return value.when(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      loading: () =>
          loadingBuilder?.call(context) ??
          switch (loading) {
            PqLoadingKind.list => Padding(padding: padding, child: const PqSkeletonList()),
            PqLoadingKind.home => Padding(padding: padding, child: const PqSkeletonHome()),
            PqLoadingKind.spinner => Center(child: PqSpinner(color: context.pq.accent, trackColor: context.pq.borderStrong)),
          },
      error: (e, _) => isOfflineError(e)
          ? PqOfflineView(onRetry: onRetry)
          : PqErrorView(
              onRetry: onRetry,
              onSupport: onSupport,
              code: errorStatusCode(e)?.toString(),
            ),
      data: data,
    );
  }
}

/// Полноэкранное состояние-заглушка: плитка 96 (pop + bob 3.2s),
/// заголовок Onest 24/700, текст 16/1.5, кнопки.
class PqStateView extends StatelessWidget {
  const PqStateView({
    super.key,
    required this.icon,
    required this.tone,
    required this.title,
    required this.message,
    this.actions = const [],
    this.footnote,
  });

  final PqIcons icon;
  final PqTone tone;
  final String title;
  final String message;
  final List<Widget> actions;
  final String? footnote;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final t = pq.tone(tone);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 96, 24, 40),
      child: PqStagger(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PqAnimate(
            fx: PqFx.pop,
            child: PqBob(
              duration: const Duration(milliseconds: 3200),
              delay: const Duration(milliseconds: 600),
              child: Container(
                width: 96,
                height: 96,
                decoration:
                    BoxDecoration(color: t.bg, borderRadius: BorderRadius.circular(28)),
                alignment: Alignment.center,
                child: PqIcon(icon, size: 44, color: t.fg),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text(title,
                textAlign: TextAlign.center,
                style: PqText.heading(24, FontWeight.w700, height: 1.2, c: pq.text)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Text(message,
                  textAlign: TextAlign.center, style: PqText.bodyLarge(c: pq.textMuted)),
            ),
          ),
          if (actions.isNotEmpty || footnote != null)
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Column(children: [
                for (var i = 0; i < actions.length; i++) ...[
                  if (i > 0) const SizedBox(height: 8),
                  actions[i],
                ],
                if (footnote != null) ...[
                  const SizedBox(height: 16),
                  Text(footnote!, style: PqText.caption(c: pq.textMuted)),
                ],
              ]),
            ),
        ],
      ),
    );
  }
}

/// «Что-то пошло не так» (макет ServerError).
class PqErrorView extends StatelessWidget {
  const PqErrorView({super.key, this.onRetry, this.onSupport, this.code});

  final VoidCallback? onRetry;
  final VoidCallback? onSupport;
  final String? code;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return PqStateView(
      icon: PqIcons.cloudAlert,
      tone: PqTone.danger,
      title: l.stateServerErrorTitle,
      message: l.stateServerErrorText,
      footnote: code == null ? null : l.stateErrorCode(code!),
      actions: [
        if (onRetry != null)
          PqButton(label: l.asyncRetry, icon: PqIcons.refresh, onPressed: onRetry),
        if (onSupport != null)
          PqButton(
            label: l.stateWriteSupport,
            icon: PqIcons.headphones,
            kind: PqButtonKind.secondary,
            height: 52,
            onPressed: onSupport,
          ),
      ],
    );
  }
}

/// «Нет подключения к интернету» (макет OfflineFull).
class PqOfflineView extends StatelessWidget {
  const PqOfflineView({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return PqStateView(
      icon: PqIcons.wifiOff,
      tone: PqTone.warning,
      title: l.stateOfflineTitle,
      message: l.stateOfflineText,
      actions: [
        if (onRetry != null)
          PqButton(label: l.asyncRetry, icon: PqIcons.refresh, onPressed: onRetry),
      ],
    );
  }
}

/// Баннер «Нет соединения · данные от 14:20» над контентом (макет Offline).
class PqOfflineBanner extends StatelessWidget {
  const PqOfflineBanner({super.key, this.since});

  /// Время последних данных; null — короткий текст.
  final DateTime? since;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final text = since == null
        ? l.stateOfflineBannerShort
        : l.stateOfflineBanner(
            '${since!.hour.toString().padLeft(2, '0')}:${since!.minute.toString().padLeft(2, '0')}');
    return PqAnimate(
      fx: PqFx.toast,
      child: Semantics(
        liveRegion: true,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: pq.warningSoft,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(children: [
            PqIcon(PqIcons.wifiOff, size: 18, color: pq.warning),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: PqText.link(c: pq.warning))),
            PqSpin(
              duration: const Duration(milliseconds: 1200),
              child: PqIcon(PqIcons.refresh, size: 16, color: pq.warning),
            ),
          ]),
        ),
      ),
    );
  }
}

/// Потянуть, чтобы обновить: вместо стандартного кружка — капсула
/// «Обновляем…» со спиннером (макет PullRefresh); контент сдвигается на 8.
class PqRefresh extends StatefulWidget {
  const PqRefresh({super.key, required this.onRefresh, required this.child, this.top = 0});

  final Future<void> Function() onRefresh;
  final Widget child;

  /// Отступ капсулы сверху (например, под шапкой).
  final double top;

  @override
  State<PqRefresh> createState() => _PqRefreshState();
}

class _PqRefreshState extends State<PqRefresh> {
  bool _busy = false;

  Future<void> _run() async {
    setState(() => _busy = true);
    try {
      await widget.onRefresh();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Stack(children: [
      RefreshIndicator.noSpinner(
        onRefresh: _run,
        child: AnimatedSlide(
          offset: Offset.zero,
          duration: const Duration(milliseconds: 250),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 250),
            curve: PqMotion.ease,
            padding: EdgeInsets.only(top: _busy ? 76 : 0),
            child: widget.child,
          ),
        ),
      ),
      Positioned(
        top: widget.top + 4,
        left: 0,
        right: 0,
        child: IgnorePointer(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (c, a) => FadeTransition(
              opacity: a,
              child: SlideTransition(
                position: Tween(begin: const Offset(0, -.4), end: Offset.zero)
                    .animate(CurvedAnimation(parent: a, curve: PqMotion.ease)),
                child: c,
              ),
            ),
            child: !_busy
                ? const SizedBox.shrink()
                : Center(
                    key: const ValueKey('busy'),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: pq.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: pq.border),
                        boxShadow: pq.cardShadow,
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        PqSpinner(
                            color: pq.accent, trackColor: pq.borderStrong, size: 18),
                        const SizedBox(width: 8),
                        Text(context.l10n.stateRefreshing,
                            style: PqText.link(c: pq.textSecondary)),
                      ]),
                    ),
                  ),
          ),
        ),
      ),
    ]);
  }
}

/// Скелетон экрана-списка (макет SkelList): заголовок экрана (реальный
/// текст, если передан) + полоса подзаголовка + карточка со строками.
class PqSkeletonList extends StatelessWidget {
  const PqSkeletonList({super.key, this.rows = 6, this.title, this.header});

  final int rows;

  /// Настоящий заголовок экрана («Мои чеки») — показывается сразу.
  final String? title;

  /// Блок между заголовком и списком (например, сегменты).
  final Widget? header;

  static const _widths = [.62, .48, .7, .55, .4, .66];

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      label: context.l10n.stateRefreshing,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        if (title != null) ...[
          Text(title!, style: PqText.display(c: pq.text)),
          const SizedBox(height: 4),
          const FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: .48,
              child: PqSkeleton(height: 16)),
          const SizedBox(height: 20),
        ],
        if (header != null) ...[header!, const SizedBox(height: 20)],
        PqListCard(children: [
          for (var i = 0; i < rows; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(children: [
                const PqSkeleton(width: 44, height: 44, radius: 12),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    FractionallySizedBox(
                        widthFactor: _widths[i % _widths.length],
                        child: const PqSkeleton(height: 14)),
                    const SizedBox(height: 8),
                    const FractionallySizedBox(
                        widthFactor: .38, child: PqSkeleton(height: 12)),
                  ]),
                ),
                const SizedBox(width: 14),
                const SizedBox(
                  width: 64,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    PqSkeleton(height: 14),
                    SizedBox(height: 8),
                    FractionallySizedBox(widthFactor: .7, child: PqSkeleton(height: 12)),
                  ]),
                ),
              ]),
            ),
        ]),
      ]),
    );
  }
}

/// Скелетон главной (макет SkelHome).
class PqSkeletonHome extends StatelessWidget {
  const PqSkeletonHome({super.key});

  @override
  Widget build(BuildContext context) {
    Widget frac(double f, double h, {double r = 8}) => FractionallySizedBox(
        alignment: Alignment.centerLeft, widthFactor: f, child: PqSkeleton(height: h, radius: r));
    return Semantics(
      label: context.l10n.stateRefreshing,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        frac(.6, 30),
        const SizedBox(height: 6),
        frac(.44, 16),
        const SizedBox(height: 24),
        PqCard(
          padding: const EdgeInsets.all(18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            frac(.36, 12),
            const SizedBox(height: 12),
            frac(.4, 56, r: 12),
            const SizedBox(height: 12),
            const Row(children: [
              Expanded(child: PqSkeleton(height: 34)),
              SizedBox(width: 14),
              Expanded(child: PqSkeleton(height: 34)),
              SizedBox(width: 14),
              Expanded(child: PqSkeleton(height: 34)),
            ]),
            const SizedBox(height: 12),
            const PqSkeleton(height: 54, radius: 16),
          ]),
        ),
        const SizedBox(height: 24),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(flex: 40, child: PqSkeleton(height: 20)),
          Spacer(flex: 40),
          Expanded(flex: 20, child: PqSkeleton(height: 16)),
        ]),
        const SizedBox(height: 24),
        PqCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            frac(.24, 22),
            const SizedBox(height: 12),
            frac(.7, 20),
            const SizedBox(height: 12),
            frac(.5, 14),
            const SizedBox(height: 12),
            const PqSkeleton(height: 8, radius: 4),
          ]),
        ),
        const SizedBox(height: 24),
        PqCard(
          child: Row(children: [
            const PqSkeleton(width: 64, height: 64, radius: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                frac(.9, 14),
                const SizedBox(height: 8),
                frac(.6, 14),
                const SizedBox(height: 8),
                frac(.3, 12),
              ]),
            ),
          ]),
        ),
      ]),
    );
  }
}

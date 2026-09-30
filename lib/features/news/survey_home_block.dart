import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/providers.dart';
import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/survey.dart';
import '../pharmacist/providers.dart' show walletProvider;

/// Следующий неотвеченный опрос (null — опросов нет).
final surveyNextProvider = FutureProvider<Survey?>((ref) {
  return ref.watch(apiProvider).surveys.next();
});

/// Шкала оценки на бэкенде (star_rating: 1…10).
const _kRatingMax = 10;

/// Блок «Опрос» на главной (макеты Refined, Surveys, SurveySheet).
///
/// * single_choice — карточка как на главной Refined: поле «Ваш ответ»
///   открывает нижний лист с вариантами (SurveySheet), оттуда же отправка;
/// * open_text / star_rating — карточки из макета Surveys;
/// * после отправки — «Спасибо за ответ!» (pqPop + pqRing), баланс
///   обновляется, следующий опрос подтягивается в фоне.
class SurveyHomeBlock extends ConsumerStatefulWidget {
  const SurveyHomeBlock({super.key, this.padding = EdgeInsets.zero});

  /// Отступ вокруг карточки — только когда она видна (опрос есть).
  final EdgeInsetsGeometry padding;

  @override
  ConsumerState<SurveyHomeBlock> createState() => _SurveyHomeBlockState();
}

class _SurveyHomeBlockState extends ConsumerState<SurveyHomeBlock> {
  int? _optionId;
  int? _rating;
  final _textCtrl = TextEditingController();
  bool _busy = false;

  /// Начисленная награда после отправки — показываем карточку «Спасибо».
  int? _doneReward;
  Timer? _doneTimer;

  @override
  void dispose() {
    _doneTimer?.cancel();
    _textCtrl.dispose();
    super.dispose();
  }

  bool _canSubmit(Survey s) => switch (s.questionType) {
        'single_choice' => _optionId != null,
        'open_text' => _textCtrl.text.trim().isNotEmpty,
        'star_rating' => _rating != null,
        _ => false,
      };

  /// Отправляет ответ. true — успешно.
  Future<bool> _submit(Survey s) async {
    if (_busy || !_canSubmit(s)) return false;
    setState(() => _busy = true);
    try {
      final res = await ref.read(apiProvider).surveys.answer(
            s.id,
            optionId: s.questionType == 'single_choice' ? _optionId : null,
            text: s.questionType == 'open_text' ? _textCtrl.text.trim() : null,
            rating: s.questionType == 'star_rating' ? _rating : null,
          );
      if (!mounted) return true;
      setState(() {
        _doneReward = res.rewardIqc;
        _optionId = null;
        _rating = null;
        _textCtrl.clear();
      });
      ref.invalidate(walletProvider);
      ref.invalidate(surveyNextProvider);
      _doneTimer?.cancel();
      _doneTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) setState(() => _doneReward = null);
      });
      return true;
    } catch (_) {
      if (mounted) {
        showPqToast(context, context.l10n.surveySendFailed, tone: PqTone.danger);
      }
      return false;
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _openOptions(Survey s) async {
    await showPqSheet<void>(
      context,
      scrollable: true,
      builder: (_) => _SurveyOptionsSheet(
        survey: s,
        initial: _optionId,
        onChanged: (id) => setState(() => _optionId = id),
        onSubmit: () => _submit(s),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final done = _doneReward;
    if (done != null) {
      return Padding(
        padding: widget.padding,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: SurveyThanksCard(key: const ValueKey('thanks'), reward: done),
        ),
      );
    }
    final v = ref.watch(surveyNextProvider);
    final s = v.asData?.value;
    if (s == null) return const SizedBox.shrink();
    final Widget? card = switch (s.questionType) {
      'single_choice' => _ChoiceCard(
          survey: s,
          selected: _optionId,
          busy: _busy,
          onPick: () => _openOptions(s),
          onSubmit: () => _submit(s),
        ),
      'open_text' => _TextCard(
          survey: s,
          controller: _textCtrl,
          busy: _busy,
          onChanged: () => setState(() {}),
          onSubmit: () => _submit(s),
        ),
      'star_rating' => _RatingCard(
          survey: s,
          rating: _rating,
          busy: _busy,
          onRate: (n) => setState(() => _rating = n),
          onSubmit: () => _submit(s),
        ),
      _ => null,
    };
    if (card == null) return const SizedBox.shrink();
    return Padding(
      padding: widget.padding,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: KeyedSubtree(key: ValueKey('survey-${s.id}'), child: card),
      ),
    );
  }
}

// ── Карточка «Выбор ответа» (макет Refined) ─────────────────────────────

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    required this.survey,
    required this.selected,
    required this.busy,
    required this.onPick,
    required this.onSubmit,
  });

  final Survey survey;
  final int? selected;
  final bool busy;
  final VoidCallback onPick;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final dark = pq.isDark;
    String? value;
    for (final o in survey.options) {
      if (o.id == selected) value = o.text;
    }
    final label = survey.rewardIqc > 0
        ? l.surveySubmitReward(survey.rewardIqc)
        : l.surveySubmit;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: const Alignment(-1, -.36),
          end: const Alignment(1, .36),
          colors: dark
              ? const [Color(0xFF1A0B2E), Color(0xFF1E1B4B), Color(0xFF0D1B3E)]
              : const [Color(0xFFEEF2FF), Color(0xFFF5F3FF), Color(0xFFE0F2FE)],
          stops: dark ? const [0, .5, 1] : const [0, .55, 1],
        ),
        border: Border.all(
            color: dark ? const Color(0x40A855F7) : const Color(0xFFE5E8EB)),
        boxShadow: dark
            ? null
            : const [
                BoxShadow(
                    color: Color(0x1F2563EB),
                    offset: Offset(0, 18),
                    blurRadius: 40,
                    spreadRadius: -16),
              ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          PqIcon(PqIcons.sparklePlus,
              size: 18,
              color: dark ? PqColors.questProgress : PqColors.reward),
          const SizedBox(width: 8),
          Expanded(
            child: Text(l.surveyTitle,
                style: PqText.heading(16, FontWeight.w700, c: pq.text)),
          ),
          if (survey.rewardIqc > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: dark ? const Color(0xFF14421E) : const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(l.surveyReward(survey.rewardIqc),
                  style: PqText.tag(
                      c: dark ? pq.success : const Color(0xFF15803D))),
            ),
        ]),
        const SizedBox(height: 14),
        Text(survey.questionText,
            style: PqText.heading(18, FontWeight.w600,
                height: 1.35, c: dark ? const Color(0xFFF3F4F6) : pq.text)),
        const SizedBox(height: 14),
        Text(l.surveyYourAnswer, style: PqText.caption(c: pq.textMuted)),
        const SizedBox(height: 6),
        PqPressable(
          onTap: busy ? null : onPick,
          semanticLabel: l.surveyYourAnswer,
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: dark ? pq.surfaceAlt : pq.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: pq.borderStrong),
            ),
            child: Row(children: [
              Expanded(
                child: Text(
                  value ?? l.surveyChooseOption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: PqText.text(14, FontWeight.w500,
                      c: value != null
                          ? pq.text
                          : (dark ? pq.textSecondary : const Color(0xFF4B5563))),
                ),
              ),
              const SizedBox(width: 8),
              PqIcon(PqIcons.chevronDown,
                  size: 18,
                  color: dark ? pq.textMuted : const Color(0xFF9CA3AF)),
            ]),
          ),
        ),
        const SizedBox(height: 14),
        _CardSubmitButton(
          label: label,
          enabled: selected != null,
          loading: busy,
          onTap: onSubmit,
        ),
      ]),
    );
  }
}

/// Кнопка «Ответить и получить N IQC» в карточке Refined: 52/12.
/// Неактивная — контурная (как в макете), активная — акцентная.
class _CardSubmitButton extends StatelessWidget {
  const _CardSubmitButton({
    required this.label,
    required this.enabled,
    required this.loading,
    required this.onTap,
  });

  final String label;
  final bool enabled;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final active = enabled || loading;
    final fg = active ? pq.onAccent : pq.textMuted;
    return PqPressable(
      onTap: enabled && !loading ? onTap : null,
      semanticLabel: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: PqMotion.ease,
        height: 52,
        decoration: BoxDecoration(
          color: active
              ? pq.accent
              : (pq.isDark ? Colors.transparent : pq.fieldDisabledBg),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: active ? pq.accent : pq.borderStrong),
        ),
        alignment: Alignment.center,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (loading) ...[
            PqSpinner(color: fg),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PqText.button(c: fg)),
          ),
        ]),
      ),
    );
  }
}

// ── Нижний лист с вариантами (макет SurveySheet) ────────────────────────

class _SurveyOptionsSheet extends StatefulWidget {
  const _SurveyOptionsSheet({
    required this.survey,
    required this.initial,
    required this.onChanged,
    required this.onSubmit,
  });

  final Survey survey;
  final int? initial;
  final ValueChanged<int> onChanged;
  final Future<bool> Function() onSubmit;

  @override
  State<_SurveyOptionsSheet> createState() => _SurveyOptionsSheetState();
}

class _SurveyOptionsSheetState extends State<_SurveyOptionsSheet> {
  late int? _selected = widget.initial;
  bool _busy = false;

  Future<void> _send() async {
    setState(() => _busy = true);
    final ok = await widget.onSubmit();
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final s = widget.survey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SurveyHeader(reward: s.rewardIqc, tileTone: PqTone.accent),
        const SizedBox(height: 16),
        Text(s.questionText, style: PqText.sheetTitle(c: pq.text)),
        const SizedBox(height: 16),
        Semantics(
          container: true,
          child: Column(children: [
            for (var i = 0; i < s.options.length; i++) ...[
              if (i > 0) const SizedBox(height: 8),
              Semantics(
                inMutuallyExclusiveGroup: true,
                checked: _selected == s.options[i].id,
                child: PqOption(
                  label: s.options[i].text,
                  selected: _selected == s.options[i].id,
                  onTap: _busy
                      ? null
                      : () {
                          setState(() => _selected = s.options[i].id);
                          widget.onChanged(s.options[i].id);
                        },
                ),
              ),
            ],
          ]),
        ),
        const SizedBox(height: 16),
        PqButton(
          label: s.rewardIqc > 0 ? l.surveySubmitReward(s.rewardIqc) : l.surveySubmit,
          loading: _busy,
          onPressed: _selected == null ? null : _send,
        ),
      ],
    );
  }
}

// ── Общая шапка карточек Surveys / SurveySheet ──────────────────────────

/// Плитка 32 со «звёздочками» · «Опрос» · капсула «+3 IQC».
class _SurveyHeader extends StatelessWidget {
  const _SurveyHeader({required this.reward, this.tileTone});

  final int reward;

  /// null — фиолетовая плитка карточки на градиенте (Surveys).
  final PqTone? tileTone;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final Color tileBg;
    final Color tileFg;
    if (tileTone != null) {
      final t = pq.tone(tileTone!);
      tileBg = t.bg;
      tileFg = t.fg;
    } else if (pq.isDark) {
      tileBg = const Color(0x29A78BFA);
      tileFg = const Color(0xFFC4B5FD);
    } else {
      tileBg = const Color(0xFFEEF2FF);
      tileFg = pq.accent;
    }
    return Row(children: [
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(color: tileBg, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: PqIcon(PqIcons.sparkles, size: 18, color: tileFg),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(context.l10n.surveyTitle,
            style: PqText.heading(16, FontWeight.w700, c: pq.text)),
      ),
      if (reward > 0) PqPill(context.l10n.surveyReward(reward), tone: PqTone.success),
    ]);
  }
}

/// Оформление карточек из макета Surveys: тёмная — фиолетовый градиент 145°,
/// светлая — обычная карточка.
class _SurveyCardShell extends StatelessWidget {
  const _SurveyCardShell({
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: pq.isDark ? null : pq.surface,
        gradient: pq.isDark
            ? const LinearGradient(
                begin: Alignment(-.8, -1),
                end: Alignment(.8, 1),
                colors: [Color(0xFF2A1A52), Color(0xFF161A36)],
              )
            : null,
        border: Border.all(color: pq.isDark ? const Color(0x47A78BFA) : pq.border),
        boxShadow: pq.cardShadow,
      ),
      child: child,
    );
  }
}

// ── Свободный ответ ─────────────────────────────────────────────────────

class _TextCard extends StatefulWidget {
  const _TextCard({
    required this.survey,
    required this.controller,
    required this.busy,
    required this.onChanged,
    required this.onSubmit,
  });

  final Survey survey;
  final TextEditingController controller;
  final bool busy;
  final VoidCallback onChanged;
  final VoidCallback onSubmit;

  @override
  State<_TextCard> createState() => _TextCardState();
}

class _TextCardState extends State<_TextCard> {
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final can = widget.controller.text.trim().isNotEmpty;
    final focused = _focus.hasFocus;
    return _SurveyCardShell(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _SurveyHeader(reward: widget.survey.rewardIqc),
        const SizedBox(height: 16),
        Text(widget.survey.questionText,
            style: PqText.heading(18, FontWeight.w600, height: 1.35, c: pq.text)),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: _focus.requestFocus,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            constraints: const BoxConstraints(minHeight: 88),
            padding: EdgeInsets.symmetric(
                horizontal: focused ? 15 : 16, vertical: focused ? 13 : 14),
            decoration: BoxDecoration(
              color: pq.isDark ? const Color(0x0DFFFFFF) : pq.bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: focused ? pq.accent : pq.border, width: focused ? 2 : 1),
            ),
            child: TextField(
              controller: widget.controller,
              focusNode: _focus,
              enabled: !widget.busy,
              minLines: 2,
              maxLines: 6,
              inputFormatters: [LengthLimitingTextInputFormatter(4000)],
              onChanged: (_) => widget.onChanged(),
              textCapitalization: TextCapitalization.sentences,
              cursorColor: pq.accent,
              // Тема Material подмешивает bodyLarge (letterSpacing 0.5) — обнуляем.
              style: PqText.field(c: pq.text).copyWith(letterSpacing: 0),
              decoration: InputDecoration(
                isCollapsed: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: l.surveyYourAnswer,
                hintStyle: PqText.field(c: pq.textMuted).copyWith(letterSpacing: 0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        PqButton(
          label: l.surveySubmit,
          loading: widget.busy,
          onPressed: can ? widget.onSubmit : null,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: PqMotion.ease,
          child: can || widget.busy
              ? const SizedBox(width: double.infinity)
              : Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(l.surveyWriteHint,
                      textAlign: TextAlign.center,
                      style: PqText.text(14, FontWeight.w400, c: pq.textMuted)),
                ),
        ),
      ]),
    );
  }
}

// ── Оценка звёздами ─────────────────────────────────────────────────────

class _RatingCard extends StatelessWidget {
  const _RatingCard({
    required this.survey,
    required this.rating,
    required this.busy,
    required this.onRate,
    required this.onSubmit,
  });

  final Survey survey;
  final int? rating;
  final bool busy;
  final ValueChanged<int> onRate;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final on = pq.isDark ? const Color(0xFFFBBF24) : const Color(0xFFF59E0B);
    final off = pq.isDark ? const Color(0xFF4B4D5C) : const Color(0xFFD1D5DB);
    final words = l.surveyRatingWords.split(',');
    String word(int n) =>
        words.isEmpty ? '' : words[((n / _kRatingMax) * words.length).ceil().clamp(1, words.length) - 1];
    final r = rating;
    return _SurveyCardShell(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _SurveyHeader(reward: survey.rewardIqc),
        const SizedBox(height: 16),
        Text(survey.questionText,
            style: PqText.heading(18, FontWeight.w600, height: 1.35, c: pq.text)),
        const SizedBox(height: 16),
        Semantics(
          label: l.surveyRatingLabel,
          container: true,
          child: Row(children: [
            for (var i = 1; i <= _kRatingMax; i++)
              Expanded(
                child: Semantics(
                  inMutuallyExclusiveGroup: true,
                  checked: r == i,
                  label: l.surveyRatingOf(i, _kRatingMax),
                  child: PqPressable(
                    onTap: busy ? null : () => onRate(i),
                    scale: .9,
                    child: SizedBox(
                      height: 52,
                      child: Center(
                        child: r != null && i <= r
                            ? PqAnimate(
                                key: ValueKey('on-$i-$r'),
                                fx: PqFx.pop,
                                duration: const Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 40 * (i - 1)),
                                child: PqIcon(PqIcons.starFilled, size: 28, color: on),
                              )
                            : PqIcon(PqIcons.star,
                                size: 28, color: off, strokeWidth: 1.6),
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ),
        const SizedBox(height: 6),
        Row(children: [
          Expanded(
            child: Text(words.isEmpty ? '' : words.first,
                style: PqText.caption(c: pq.textMuted)),
          ),
          if (r != null)
            Text('${l.surveyRatingOf(r, _kRatingMax)} · ${word(r)}',
                style: PqText.text(14, FontWeight.w700, c: pq.text)),
          Expanded(
            child: Text(words.isEmpty ? '' : words.last,
                textAlign: TextAlign.end,
                style: PqText.caption(c: pq.textMuted)),
          ),
        ]),
        const SizedBox(height: 16),
        PqButton(
          label: l.surveySubmit,
          loading: busy,
          onPressed: r == null ? null : onSubmit,
        ),
      ]),
    );
  }
}

// ── После отправки ──────────────────────────────────────────────────────

/// Карточка «Спасибо за ответ!» (макет Surveys, состояние «После отправки»).
class SurveyThanksCard extends StatelessWidget {
  const SurveyThanksCard({super.key, required this.reward});

  final int reward;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final t = pq.tone(PqTone.success);
    return Semantics(
      liveRegion: true,
      child: _SurveyCardShell(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(children: [
          PqAnimate(
            fx: PqFx.pop,
            delay: const Duration(milliseconds: 300),
            child: PqPulseRing.success(
              borderRadius: BorderRadius.circular(28),
              delay: const Duration(milliseconds: 600),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: t.bg, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: PqIcon(PqIcons.check, size: 28, color: t.fg),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(l.surveyThanks,
              textAlign: TextAlign.center,
              style: PqText.heading(18, FontWeight.w700, c: pq.text)),
          if (reward > 0) ...[
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: l.surveyReward(reward),
                    style: TextStyle(fontWeight: FontWeight.w700, color: t.fg)),
                TextSpan(text: ' ${l.surveyOnBalance}'),
              ]),
              textAlign: TextAlign.center,
              style: PqText.text(15, FontWeight.w400, c: pq.textMuted),
            ),
          ],
        ]),
      ),
    );
  }
}

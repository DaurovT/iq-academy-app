import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/survey.dart';
import '../../core/theme/app_colors.dart';
import '../pharmacist/providers.dart' show walletProvider;

/// Блок «Опрос» на главной. Перенесён 1:1 из макета Figma
/// (survey-card, ноды 180:16 / 181:30): градиентная карточка с иконкой,
/// значком награды, вопросом, выпадающим выбором ответа и кнопкой «Ответить».
/// Ответил → +IQC, баланс обновлён, подтягивается следующий опрос.
final surveyNextProvider = FutureProvider<Survey?>((ref) {
  return ref.watch(apiProvider).surveys.next();
});

class SurveyHomeBlock extends ConsumerStatefulWidget {
  const SurveyHomeBlock({super.key});

  @override
  ConsumerState<SurveyHomeBlock> createState() => _SurveyHomeBlockState();
}

class _SurveyHomeBlockState extends ConsumerState<SurveyHomeBlock> {
  int? _optionId;
  int? _rating;
  final _textCtrl = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  bool _canSubmit(Survey s) {
    switch (s.questionType) {
      case 'single_choice':
        return _optionId != null;
      case 'open_text':
        return _textCtrl.text.trim().isNotEmpty;
      case 'star_rating':
        return _rating != null;
    }
    return false;
  }

  Future<void> _submit(Survey s) async {
    if (_busy || !_canSubmit(s)) return;
    setState(() => _busy = true);
    try {
      final res = await ref.read(apiProvider).surveys.answer(
            s.id,
            optionId: s.questionType == 'single_choice' ? _optionId : null,
            text: s.questionType == 'open_text' ? _textCtrl.text.trim() : null,
            rating: s.questionType == 'star_rating' ? _rating : null,
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res.rewardIqc > 0
            ? context.l10n.surveyRewardCredited(res.rewardIqc)
            : context.l10n.surveyThanks),
      ));
      _optionId = null;
      _rating = null;
      _textCtrl.clear();
      ref.invalidate(walletProvider);
      ref.invalidate(surveyNextProvider);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.surveySubmitError('$e'))),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final v = ref.watch(surveyNextProvider);
    return v.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (s) {
        if (s == null) return const SizedBox.shrink();
        final p = PharmPalette.of(context);
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: p.surveyGradient,
              stops: isDark ? const [0, 0.5, 1] : const [0, 0.55, 1],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: p.surveyBorder),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? const Color(0x26A855F7)
                    : const Color(0x0F000000),
                blurRadius: isDark ? 24 : 10,
                spreadRadius: isDark ? -8 : 0,
                offset: Offset(0, isDark ? 8 : 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome,
                      size: 18,
                      color: isDark
                          ? const Color(0xFFC4B5FD)
                          : const Color(0xFF7C3AED)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      context.l10n.surveyTitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: p.textPrimary,
                      ),
                    ),
                  ),
                  if (s.rewardIqc > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: p.surveyBadgeBg,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        context.l10n.surveyRewardBadge(s.rewardIqc),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: p.surveyBadgeText,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                s.questionText,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: p.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              _buildInput(s, p),
              const SizedBox(height: 12),
              _SubmitButton(
                palette: p,
                busy: _busy,
                enabled: _canSubmit(s) && !_busy,
                onTap: () => _submit(s),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInput(Survey s, PharmPalette p) {
    switch (s.questionType) {
      case 'single_choice':
        final selected = _optionId == null
            ? null
            : s.options.firstWhere((o) => o.id == _optionId,
                orElse: () => s.options.first);
        return _PollSelect(
          palette: p,
          hint: context.l10n.surveyChooseOption,
          value: selected?.text,
          onTap: () => _pickOption(s, p),
        );
      case 'open_text':
        return Container(
          height: 52,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: p.pollSelectBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: p.pollSelectBorder),
          ),
          child: TextField(
            controller: _textCtrl,
            maxLines: 1,
            maxLength: 4000,
            onChanged: (_) => setState(() {}),
            style: TextStyle(color: p.inputText, fontSize: 14),
            decoration: InputDecoration(
              isCollapsed: true,
              // тема глобально включает filled+fillColor — без этого поверх
              // поля рисуется серая полоска заливки
              filled: false,
              hintText: context.l10n.surveyEnterAnswer,
              hintStyle: TextStyle(color: p.inputHint, fontSize: 14),
              border: InputBorder.none,
              counterText: '',
            ),
          ),
        );
      case 'star_rating':
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final starOff =
            isDark ? const Color(0xFF6E6F7B) : const Color(0xFFD1D5DB);
        return SizedBox(
          height: 52,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(10, (i) {
              final n = i + 1;
              final on = _rating != null && n <= _rating!;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => _rating = n),
                child: Icon(
                  on ? Icons.star_rounded : Icons.star_outline_rounded,
                  size: 24,
                  color: on ? const Color(0xFFF5A623) : starOff,
                ),
              );
            }),
          ),
        );
    }
    return const SizedBox.shrink();
  }

  Future<void> _pickOption(Survey s, PharmPalette p) async {
    final picked = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: p.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: p.textMuted.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 8),
            for (final o in s.options)
              ListTile(
                title: Text(o.text,
                    style: TextStyle(color: p.textPrimary, fontSize: 15)),
                trailing: _optionId == o.id
                    ? Icon(Icons.check, color: p.accent)
                    : null,
                onTap: () => Navigator.pop(ctx, o.id),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (picked != null) setState(() => _optionId = picked);
  }
}

// ── Поле выбора ответа (dropdown) ───────────────────────────────────────

class _PollSelect extends StatelessWidget {
  const _PollSelect({
    required this.palette,
    required this.hint,
    required this.value,
    required this.onTap,
  });

  final PharmPalette palette;
  final String hint;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final has = value != null && value!.isNotEmpty;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: palette.pollSelectBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: palette.pollSelectBorder),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                has ? value! : hint,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: has ? palette.inputText : palette.inputHint,
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down,
                size: 20, color: palette.inputHint),
          ],
        ),
      ),
    );
  }
}

// ── Кнопка «Ответить» ───────────────────────────────────────────────────

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.palette,
    required this.busy,
    required this.enabled,
    required this.onTap,
  });

  final PharmPalette palette;
  final bool busy;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled || busy ? 1 : 0.5,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: palette.submitGradient,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: busy
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(palette.submitText),
                  ),
                )
              : Text(
                  context.l10n.surveySubmit,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: palette.submitText,
                  ),
                ),
        ),
      ),
    );
  }
}

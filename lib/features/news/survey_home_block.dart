import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/survey.dart';
import '../pharmacist/providers.dart' show walletProvider;

/// Опрос за IQC компактным блоком на главной. Ответил → +IQC, баланс обновлён, подтягивается следующий.
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
            ? '+${res.rewardIqc} IQC зачислено'
            : 'Спасибо за ответ!'),
      ));
      _optionId = null;
      _rating = null;
      _textCtrl.clear();
      ref.invalidate(walletProvider);
      ref.invalidate(surveyNextProvider);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось отправить: $e')),
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
        final scheme = Theme.of(context).colorScheme;
        return Card(
          elevation: 0,
          color: scheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ОПРОС',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: scheme.onSurfaceVariant)),
                    if (s.rewardIqc > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                            color: const Color(0xFF7C5CFF),
                            borderRadius: BorderRadius.circular(999)),
                        child: Text('+${s.rewardIqc} IQC',
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(s.questionText,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                ..._buildInput(s, scheme),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _canSubmit(s) && !_busy ? () => _submit(s) : null,
                    child: _busy
                        ? const SizedBox(
                            height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('Ответить'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildInput(Survey s, ColorScheme scheme) {
    switch (s.questionType) {
      case 'single_choice':
        return s.options.map((o) {
          final sel = _optionId == o.id;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => setState(() => _optionId = o.id),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: sel ? scheme.primary : scheme.outlineVariant,
                      width: sel ? 2 : 1),
                ),
                child: Row(
                  children: [
                    Icon(sel ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                        size: 20, color: scheme.primary),
                    const SizedBox(width: 10),
                    Expanded(child: Text(o.text, style: const TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),
          );
        }).toList();
      case 'open_text':
        return [
          TextField(
            controller: _textCtrl,
            maxLines: 3,
            maxLength: 4000,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              hintText: 'Ваш ответ…',
              border: OutlineInputBorder(),
              counterText: '',
            ),
          ),
        ];
      case 'star_rating':
        return [
          Wrap(
            spacing: 2,
            children: List.generate(10, (i) {
              final n = i + 1;
              final on = _rating != null && n <= _rating!;
              return IconButton(
                padding: const EdgeInsets.all(2),
                constraints: const BoxConstraints(),
                onPressed: () => setState(() => _rating = n),
                icon: Icon(Icons.star,
                    size: 26,
                    color: on ? const Color(0xFFF5A623) : scheme.outlineVariant),
              );
            }),
          ),
          if (_rating != null)
            Text('$_rating/10', style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12)),
        ];
    }
    return const [];
  }
}

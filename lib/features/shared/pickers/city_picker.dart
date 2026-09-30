import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/models/common.dart';
import '../../../core/models/registration.dart';
import '../providers.dart';

/// Вариант выбора в [showPqOptionPicker].
class PqPickerOption {
  const PqPickerOption(this.value, this.label);

  final String value;
  final String label;
}

/// Язык справочников (бэкенд знает ru/uz/kz) по языку интерфейса.
Language pickerLanguage(WidgetRef ref) => switch (ref.read(localeProvider).languageCode) {
  'uz' => Language.uz,
  'kk' => Language.kz,
  _ => Language.ru,
};

/// Выбор города из справочника (макет CityPicker): нижний лист с поиском.
/// Города — из [citiesProvider]. Возвращает выбранный город или null.
Future<RefItem?> showPqCityPicker(BuildContext context, {String? selectedValue}) {
  return showPqSheet<RefItem>(
    context,
    builder:
        (_) => Consumer(
          builder: (ctx, ref, _) {
            final l10n = ctx.l10n;
            final cities = ref.watch(citiesProvider);
            final lang = pickerLanguage(ref);
            return _PickerBody(
              title: l10n.authCityTitle,
              searchHint: l10n.authCitySearch,
              selectedValue: selectedValue,
              loading: cities.isLoading && !cities.hasValue,
              error: cities.hasError && !cities.hasValue,
              onRetry: () => ref.invalidate(citiesProvider),
              options: [
                for (final c in cities.asData?.value ?? const <RefItem>[])
                  PqPickerOption(c.value, c.label.resolve(lang)),
              ],
              onSelect:
                  (o) => Navigator.of(
                    ctx,
                  ).pop(cities.asData?.value.firstWhere((c) => c.value == o.value)),
            );
          },
        ),
  );
}

/// Общий лист выбора одного значения в стиле CityPicker (заголовок, поиск,
/// список с галочкой у выбранного). Поиск показывается, если вариантов > 7
/// или [search] = true. Возвращает value выбранного варианта.
Future<String?> showPqOptionPicker(
  BuildContext context, {
  required String title,
  required List<PqPickerOption> options,
  String? selectedValue,
  String? searchHint,
  bool? search,
}) {
  return showPqSheet<String>(
    context,
    builder:
        (ctx) => _PickerBody(
          title: title,
          searchHint: (search ?? options.length > 7) ? (searchHint ?? ctx.l10n.authSearch) : null,
          options: options,
          selectedValue: selectedValue,
          onSelect: (o) => Navigator.of(ctx).pop(o.value),
        ),
  );
}

class _PickerBody extends StatefulWidget {
  const _PickerBody({
    required this.title,
    required this.options,
    required this.onSelect,
    this.searchHint,
    this.selectedValue,
    this.loading = false,
    this.error = false,
    this.onRetry,
  });

  final String title;
  final String? searchHint;
  final List<PqPickerOption> options;
  final String? selectedValue;
  final ValueChanged<PqPickerOption> onSelect;
  final bool loading;
  final bool error;
  final VoidCallback? onRetry;

  @override
  State<_PickerBody> createState() => _PickerBodyState();
}

class _PickerBodyState extends State<_PickerBody> {
  final _search = TextEditingController();
  final _focus = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() => _focused = _focus.hasFocus));
    _search.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _search.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l10n = context.l10n;
    final mq = MediaQuery.of(context);
    final q = _search.text.trim().toLowerCase();
    final items =
        q.isEmpty
            ? widget.options
            : widget.options.where((o) => o.label.toLowerCase().contains(q)).toList();
    // Список до 560 px (как в макете), но так, чтобы лист с клавиатурой
    // помещался на экран.
    final listMax = (mq.size.height * .92 -
            mq.viewInsets.bottom -
            mq.padding.bottom * .5 -
            (widget.searchHint == null ? 130 : 196))
        .clamp(120.0, 560.0);

    Widget list;
    if (widget.loading) {
      list = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 6; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: PqSkeleton(width: 120.0 + (i % 3) * 40, height: 16),
              ),
            ),
        ],
      );
    } else if (widget.error) {
      list = Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.stateServerErrorTitle,
              textAlign: TextAlign.center,
              style: PqText.body(c: pq.textMuted),
            ),
            const SizedBox(height: 12),
            PqButton(
              label: l10n.asyncRetry,
              kind: PqButtonKind.secondary,
              expand: false,
              onPressed: widget.onRetry,
            ),
          ],
        ),
      );
    } else if (items.isEmpty) {
      list = Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          l10n.authNothingFound,
          textAlign: TextAlign.center,
          style: PqText.body(c: pq.textMuted),
        ),
      );
    } else {
      list = ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (_, i) {
          final o = items[i];
          final selected = o.value == widget.selectedValue;
          return Semantics(
            selected: selected,
            child: PqPressable(
              onTap: () => widget.onSelect(o),
              scale: 1,
              child: Builder(
                builder: (context) {
                  final pressed = PqPressedScope.of(context);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    constraints: const BoxConstraints(minHeight: 52),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    decoration: BoxDecoration(
                      color: pressed ? pq.surfaceAlt : Colors.transparent,
                      border: Border(bottom: BorderSide(color: pq.divider)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            o.label,
                            style: PqText.field(
                              c: pq.text,
                              w: selected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ),
                        if (selected) PqIcon(PqIcons.check, size: 20, color: pq.accent),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title, style: PqText.heading(22, FontWeight.w700, c: pq.text)),
        if (widget.searchHint != null) ...[
          const SizedBox(height: 16),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 50, // 48 + рамка (в макете div с box-sizing: content-box)
            padding: EdgeInsets.symmetric(horizontal: _focused ? 13 : 14),
            decoration: BoxDecoration(
              color: pq.fieldBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _focused ? pq.accent : pq.border, width: _focused ? 2 : 1),
            ),
            child: Row(
              children: [
                PqIcon(PqIcons.search, size: 20, color: pq.textMuted),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _search,
                    focusNode: _focus,
                    textInputAction: TextInputAction.search,
                    cursorColor: pq.accent,
                    style: PqText.field(c: pq.text),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: false,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: widget.searchHint,
                      hintStyle: PqText.field(c: pq.textMuted),
                    ),
                  ),
                ),
                if (_search.text.isNotEmpty)
                  PqPressable(
                    onTap: _search.clear,
                    semanticLabel: l10n.commonCancel,
                    child: SizedBox.square(
                      dimension: 32,
                      child: Center(child: PqIcon(PqIcons.x, size: 18, color: pq.textMuted)),
                    ),
                  ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 16),
        ConstrainedBox(constraints: BoxConstraints(maxHeight: listMax), child: list),
      ],
    );
  }
}

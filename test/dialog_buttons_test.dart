import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/theme/app_theme.dart';
import 'package:platform_app/widgets/dialog_buttons.dart';

Future<void> _open(WidgetTester tester, ThemeData theme,
    Widget Function(BuildContext ctx) dialog) async {
  await tester.pumpWidget(MaterialApp(
    theme: theme,
    home: Builder(
      builder: (context) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => showDialog<void>(context: context, builder: dialog),
            child: const Text('open'),
          ),
        ),
      ),
    ),
  ));
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

void main() {
  for (final theme in [AppTheme.light(), AppTheme.dark()]) {
    final name = theme.brightness.name;

    testWidgets('диалог: две кнопки одной ширины в ряд ($name)', (tester) async {
      await _open(tester, theme, (ctx) => AlertDialog(
            title: const Text('Выйти из аккаунта?'),
            content: const Text('Чтобы снова пользоваться приложением, нужно будет войти ещё раз.'),
            actions: [
              DialogButtons(
                cancelLabel: 'Отмена',
                onCancel: () => Navigator.pop(ctx),
                confirmLabel: 'Выйти',
                onConfirm: () => Navigator.pop(ctx),
                destructive: true,
              ),
            ],
          ));
      expect(tester.takeException(), isNull);
      final cancel = tester.getRect(find.widgetWithText(FilledButton, 'Отмена'));
      final confirm = tester.getRect(find.widgetWithText(FilledButton, 'Выйти'));
      expect(cancel.width, moreOrLessEquals(confirm.width, epsilon: 0.5));
      expect(cancel.height, moreOrLessEquals(confirm.height, epsilon: 0.5));
      expect(cancel.top, moreOrLessEquals(confirm.top, epsilon: 0.5));
      expect(cancel.right, lessThan(confirm.left));
      // основная кнопка при destructive — цвета ошибки темы
      final style = tester.widget<FilledButton>(find.widgetWithText(FilledButton, 'Выйти')).style!;
      expect(style.backgroundColor!.resolve({}), theme.colorScheme.error);
    });

    testWidgets('диалог: длинные подписи не ломают раскладку ($name)', (tester) async {
      await _open(tester, theme, (ctx) => AlertDialog(
            title: const Text('Vaucherni rasmiylashtirasizmi?'),
            actions: [
              DialogButtons(
                cancelLabel: 'Bekor qilish',
                onCancel: () => Navigator.pop(ctx),
                confirmLabel: 'Rasmiylashtirish va davom ettirish',
                onConfirm: () => Navigator.pop(ctx),
              ),
            ],
          ));
      expect(tester.takeException(), isNull);
      final a = tester.getRect(find.widgetWithText(FilledButton, 'Bekor qilish'));
      final b = tester.getRect(find.widgetWithText(FilledButton, 'Rasmiylashtirish va davom ettirish'));
      expect(a.height, moreOrLessEquals(b.height, epsilon: 0.5));
    });

    testWidgets('диалог: три действия столбиком во всю ширину ($name)', (tester) async {
      await _open(tester, theme, (ctx) => AlertDialog(
            title: const Text('Недостаточно IQC'),
            content: const Text('Для участия нужно 5 IQC, у вас 2.'),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                      style: FilledButton.styleFrom(minimumSize: kDialogButtonSize),
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Квесты')),
                  const SizedBox(height: 8),
                  FilledButton(
                      style: DialogButtons.secondaryStyle(ctx),
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Обучение')),
                  TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Отмена')),
                ],
              ),
            ],
          ));
      expect(tester.takeException(), isNull);
      final q = tester.getRect(find.widgetWithText(FilledButton, 'Квесты'));
      final l = tester.getRect(find.widgetWithText(FilledButton, 'Обучение'));
      expect(q.width, moreOrLessEquals(l.width, epsilon: 0.5));
      expect(q.bottom, lessThan(l.top));
    });
  }
}

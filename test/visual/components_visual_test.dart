import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/design/design.dart';

import 'pq_shot.dart';

/// Копия доски «Компоненты» из дизайн-системы — сверка с Components.dc.html.
class _Board extends StatelessWidget {
  const _Board();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    Widget label(String s) => Text(s, style: PqText.text(12, FontWeight.w600, c: pq.textMuted));
    Widget cell(String l, Widget w) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [label(l), const SizedBox(height: 6), w]);
    Widget grid2(List<Widget> c) => Column(children: [
          for (var i = 0; i < c.length; i += 2) ...[
            if (i > 0) const SizedBox(height: 12),
            IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(child: c[i]),
                const SizedBox(width: 12),
                Expanded(child: c[i + 1]),
              ]),
            ),
          ],
        ]);
    Widget section(String n, String title, String desc, List<Widget> children) => Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: pq.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: pq.border),
            boxShadow: pq.cardShadow,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(n, style: PqText.text(12, FontWeight.w700, ls: 1, c: pq.accentText)),
            const SizedBox(height: 2),
            Text(title, style: PqText.heading(20, FontWeight.w700, c: pq.text)),
            const SizedBox(height: 2),
            Text(desc, style: PqText.body(c: pq.textMuted)),
            for (final c in children) ...[const SizedBox(height: 14), c],
          ]),
        );

    return Scaffold(
      body: Stack(children: [
        const Positioned.fill(child: PqBackground()),
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
          child: DefaultTextStyle(
            style: PqText.body(c: pq.text),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const PqPageTitle('Компоненты',
                  subtitle: 'Всё, из чего собраны экраны, во всех состояниях. Тёмная тема'),
              const SizedBox(height: 20),
              section('01', 'Кнопки', 'Обычная, нажатая, неактивная, загрузка', [
                grid2([
                  cell('Основная · обычная',
                      PqButton(label: 'Отправить', icon: PqIcons.camera, onPressed: () {})),
                  cell('Нажатая',
                      PqButton(
                          key: const ValueKey('pressed1'),
                          label: 'Отправить',
                          icon: PqIcons.camera,
                          onPressed: () {})),
                  cell('Неактивная',
                      const PqButton(label: 'Отправить', icon: PqIcons.camera, onPressed: null)),
                  cell('Загрузка',
                      PqButton(
                          label: 'Отправить',
                          loadingLabel: 'Отправляем…',
                          loading: true,
                          onPressed: () {})),
                ]),
                grid2([
                  cell('Вторичная',
                      PqButton(label: 'Отмена', kind: PqButtonKind.secondary, onPressed: () {})),
                  cell('Вторичная · нажатая',
                      PqButton(
                          key: const ValueKey('pressed2'),
                          label: 'Отмена',
                          kind: PqButtonKind.secondary,
                          onPressed: () {})),
                  cell('Опасная',
                      PqButton(label: 'Удалить', kind: PqButtonKind.danger, onPressed: () {})),
                  cell('Текстовая',
                      PqButton(label: 'Подробнее', kind: PqButtonKind.text, onPressed: () {})),
                ]),
                Text('Высота 56 · радиус 16 · текст Inter 16/700 · зона нажатия не меньше 44×44',
                    style: PqText.caption(c: pq.textMuted)),
              ]),
              const SizedBox(height: 20),
              section('02', 'Поля ввода',
                  'Высота 56 · радиус 14 · текст 16 — iOS не увеличивает экран', [
                cell('Пустое', const PqTextField(hint: 'Имя, аптека или город')),
                cell('В фокусе',
                    PqTextField(
                        autofocus: true, controller: TextEditingController(text: 'Зиёда'))),
                cell('Заполнено',
                    PqTextField(controller: TextEditingController(text: 'Зиёда Азизова'))),
                cell('Ошибка',
                    PqTextField(
                        controller: TextEditingController(text: '90 123'),
                        error: 'Введите номер полностью')),
                cell('Неактивное',
                    PqTextField(
                        enabled: false,
                        controller: TextEditingController(text: 'Аптека №12, Андижан'))),
              ]),
              const SizedBox(height: 20),
              section('03', 'Выбор', 'Сегменты, фильтры, переключатели', [
                cell(
                    'Сегменты',
                    PqSegmented<String>(
                        values: const ['Все', 'На проверке', 'Готовые'],
                        selected: 'Все',
                        labelOf: (s) => s,
                        onChanged: (_) {})),
                cell(
                    'Чипы-фильтры',
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      PqChip(label: 'Все', count: 17, selected: true, onTap: () {}),
                      PqChip(label: 'Активные', count: 8, selected: false, onTap: () {}),
                      PqChip(label: 'Пассивные', count: 9, selected: false, onTap: () {}),
                    ])),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      flex: 13,
                      child: cell(
                          'Переключатель',
                          Row(children: [
                            PqSwitch(value: true, onChanged: (_) {}),
                            const SizedBox(width: 8),
                            PqSwitch(value: false, onChanged: (_) {}),
                          ]))),
                  const SizedBox(width: 12),
                  Expanded(
                      flex: 10,
                      child: cell(
                          'Радио',
                          const Row(children: [
                            PqRadio(selected: true),
                            SizedBox(width: 10),
                            PqRadio(selected: false),
                          ]))),
                  const SizedBox(width: 12),
                  Expanded(
                      flex: 10,
                      child: cell(
                          'Флажок',
                          const Row(children: [
                            PqCheckbox(checked: true),
                            SizedBox(width: 10),
                            PqCheckbox(checked: false),
                          ]))),
                ]),
              ]),
              const SizedBox(height: 20),
              section('04', 'Статусы и метки', 'Один цвет — одно значение во всём приложении', [
                cell(
                    'Статусы чека и рецепта',
                    const Wrap(spacing: 8, runSpacing: 8, children: [
                      PqStatusBadge('На проверке', tone: PqTone.warning),
                      PqStatusBadge('Одобрен', tone: PqTone.success),
                      PqStatusBadge('Начислено', tone: PqTone.info),
                      PqStatusBadge('Отклонён', tone: PqTone.danger),
                    ])),
                cell(
                    'Награды',
                    const Wrap(spacing: 8, runSpacing: 8, children: [
                      PqRewardTag.iqc('+30 IQC'),
                      PqRewardTag.voucher('Ваучер'),
                      PqPill('+3 IQC', tone: PqTone.success),
                      PqPill('6д 23ч', icon: PqIcons.clock),
                    ])),
                cell(
                    'Счётчик',
                    const Row(children: [
                      PqCounter(3),
                      SizedBox(width: 8),
                      PqCounter.dot(),
                    ])),
              ]),
              const SizedBox(height: 20),
              section('05', 'Карточки', 'Радиус 20 · отступ 16 · граница 1 px', [
                cell(
                    'Строка списка',
                    const PqListCard(children: [
                      PqListRow(
                        icon: PqIcons.coin,
                        title: 'Цинкорот №50',
                        subtitle: '№23156 · 29.06, 18:15',
                        value: '+144 IQC',
                        valueTone: PqTone.info,
                        valueCaption: 'начислено',
                      ),
                    ])),
                grid2([
                  cell('Показатель',
                      const PqStatCard(
                          value: '206',
                          label: 'чеков',
                          icon: PqIcons.receipt,
                          tone: PqTone.success)),
                  cell(
                      'Скелетон',
                      const PqCard(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          PqSkeleton(width: 44, height: 44, radius: 12),
                          SizedBox(height: 12),
                          FractionallySizedBox(widthFactor: .8, child: PqSkeleton(height: 14)),
                          SizedBox(height: 12),
                          FractionallySizedBox(widthFactor: .5, child: PqSkeleton(height: 12)),
                        ]),
                      )),
                ]),
              ]),
              const SizedBox(height: 20),
              section('06', 'Нижнее меню', 'Высота 84 · активный пункт — капсула 64×32', [
                cell(
                    'Фармацевт',
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        child: PqBottomNav(
                            items: pharmacistNav, selected: 0, onSelect: (_) {}),
                      ),
                    )),
                cell(
                    'Врач',
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: PqBottomNav(items: doctorNav, selected: 0, onSelect: (_) {}),
                    )),
              ]),
              const SizedBox(height: 20),
              section('07', 'Подтверждения', 'Над меню, 4 секунды', [
                const PqToastCard(message: 'Ссылка скопирована'),
                PqToastCard(
                    message: 'Ваучер в архиве', actionLabel: 'Отменить', onAction: () {}),
                PqToastCard(
                    message: 'Не удалось отправить чек',
                    tone: PqTone.danger,
                    icon: PqIcons.alertTriangle,
                    actionLabel: 'Повторить',
                    onAction: () {}),
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}

void main() {
  pqShotBoth('Components', (t, dark) => pqShot(t,
      name: 'Components',
      dark: dark,
      height: 3200,
      screen: const _Board(),
      before: (t) async {
        // Состояние «нажатая»: держим палец на кнопках.
        for (final k in ['pressed1', 'pressed2']) {
          await t.startGesture(t.getCenter(find.byKey(ValueKey(k))));
        }
      }));
}

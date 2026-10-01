import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/models/quest.dart';

Quest _q({QuestStatus status = QuestStatus.active, String? endDate}) => Quest(
      id: 1,
      name: 'Q',
      description: '',
      status: status,
      rewardType: RewardType.iqc,
      target: QuestTarget.checks,
      prizeIqc: 10,
      progress: 0,
      completedCount: 0,
      endDate: endDate,
    );

String _day(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

void main() {
  final now = DateTime.now();

  test('активный квест без срока — действует', () {
    expect(_q().isLive, isTrue);
  });

  test('срок окончания включительно: сегодня ещё действует', () {
    expect(_q(endDate: _day(now)).isLive, isTrue);
    expect(_q(endDate: _day(now.add(const Duration(days: 3)))).isLive, isTrue);
  });

  test('срок истёк — на главной не показываем, даже если статус active', () {
    expect(_q(endDate: _day(now.subtract(const Duration(days: 1)))).isLive, isFalse);
  });

  test('отключённый квест не действует', () {
    expect(_q(status: QuestStatus.disabled).isLive, isFalse);
  });
}

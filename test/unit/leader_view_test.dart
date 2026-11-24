import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/models/medrep.dart';
import 'package:platform_app/features/medrep/medrep_widgets.dart';

/// Рейтинг медпредов: общие места при равенстве (жалоба 24.11.2026 — у всех
/// 0 чеков, а медпред на 35 месте и «до 34 места ещё 0 чеков»).
void main() {
  Leaderboard board(List<int> values, {required int me, String meName = 'Вы'}) =>
      Leaderboard(
        mode: AttributionMode.shared,
        metric: 'checks',
        myRank: me + 1,
        items: [
          for (final (i, v) in values.indexed)
            LeaderRow(
              rank: i + 1,
              name: i == me ? meName : 'М $i',
              value: v,
              isMe: i == me ? true : null,
            ),
        ],
      );

  test('у всех ноль: место общее первое, подсказки нет, имя из аккаунта', () {
    final v = medLeaderView(board(List.filled(35, 0), me: 34), myName: 'Бахрамова М.');
    expect(v.me!.rank, 1);
    expect(v.board.myRank, 1);
    expect(v.above, isNull);
    expect(v.gap, 0);
    expect(v.me!.name, 'Бахрамова М.');
    expect(v.board.items.every((r) => r.rank == 1), isTrue);
  });

  test('равные значения делят место, разрыв — до ближайшего выше', () {
    final v = medLeaderView(board([10, 7, 7, 3, 3, 0], me: 4));
    expect(v.board.items.map((r) => r.rank).toList(), [1, 2, 2, 4, 4, 6]);
    expect(v.me!.rank, 4);
    expect(v.above!.value, 7);
    expect(v.above!.rank, 2);
    expect(v.gap, 4);
  });

  test('настоящее имя от сервера не подменяем', () {
    final v = medLeaderView(board([5, 1], me: 1, meName: 'Дауров Т.'), myName: 'Другое И.');
    expect(v.me!.name, 'Дауров Т.');
  });
}

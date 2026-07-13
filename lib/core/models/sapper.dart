/// Мини-приложения + Супер Сапёр. Простые модели без freezed — чтение с бэка.
class MiniApp {
  const MiniApp({required this.key, required this.title, required this.subtitle,
    required this.available, required this.activeDraws});
  final String key;
  final String title;
  final String subtitle;
  final bool available;
  final int activeDraws;

  factory MiniApp.fromJson(Map<String, dynamic> j) => MiniApp(
        key: j['key'] as String? ?? '',
        title: j['title'] as String? ?? '',
        subtitle: j['subtitle'] as String? ?? '',
        available: j['available'] as bool? ?? false,
        activeDraws: (j['activeDraws'] as num?)?.toInt() ?? 0,
      );
}

class SapperDrawItem {
  const SapperDrawItem({required this.id, required this.title, required this.status,
    required this.cellCount, required this.priceIqc, this.revealAt,
    required this.occupied, required this.myCells, required this.prizeCount});
  final int id;
  final String title;
  final String status;
  final int cellCount;
  final int priceIqc;
  final String? revealAt;
  final int occupied;
  final int myCells;
  final int prizeCount;

  factory SapperDrawItem.fromJson(Map<String, dynamic> j) => SapperDrawItem(
        id: (j['id'] as num).toInt(),
        title: j['title'] as String? ?? '',
        status: j['status'] as String? ?? '',
        cellCount: (j['cellCount'] as num?)?.toInt() ?? 0,
        priceIqc: (j['priceIqc'] as num?)?.toInt() ?? 0,
        revealAt: j['revealAt'] as String?,
        occupied: (j['occupied'] as num?)?.toInt() ?? 0,
        myCells: (j['myCells'] as num?)?.toInt() ?? 0,
        prizeCount: (j['prizeCount'] as num?)?.toInt() ?? 0,
      );
}

class SapperLegend {
  const SapperLegend({required this.label, required this.count});
  final String label;
  final int count;
  factory SapperLegend.fromJson(Map<String, dynamic> j) =>
      SapperLegend(label: j['label'] as String? ?? '', count: (j['count'] as num?)?.toInt() ?? 0);
}

class SapperOccupied {
  const SapperOccupied({required this.index, required this.mine});
  final int index;
  final bool mine;
  factory SapperOccupied.fromJson(Map<String, dynamic> j) =>
      SapperOccupied(index: (j['index'] as num).toInt(), mine: j['mine'] as bool? ?? false);
}

class SapperRevealPrize {
  const SapperRevealPrize({required this.index, required this.label, required this.won, required this.wonByMe});
  final int index;
  final String label;
  final bool won;
  final bool wonByMe;
  factory SapperRevealPrize.fromJson(Map<String, dynamic> j) => SapperRevealPrize(
        index: (j['index'] as num).toInt(),
        label: j['label'] as String? ?? '',
        won: j['won'] as bool? ?? false,
        wonByMe: j['wonByMe'] as bool? ?? false,
      );
}

class SapperWinner {
  const SapperWinner({required this.index, required this.label, required this.name});
  final int index;
  final String label;
  final String name;
  factory SapperWinner.fromJson(Map<String, dynamic> j) => SapperWinner(
        index: (j['index'] as num).toInt(),
        label: j['label'] as String? ?? '',
        name: j['name'] as String? ?? '',
      );
}

class SapperField {
  const SapperField({
    required this.id, required this.title, required this.status,
    required this.cellCount, required this.cols, required this.priceIqc,
    this.revealAt, this.acceptingUntil, required this.balanceIqc,
    required this.legend, required this.occupied, required this.myCells,
    this.prizes = const [], this.winners = const [],
  });
  final int id;
  final String title;
  final String status;
  final int cellCount;
  final int cols;
  final int priceIqc;
  final String? revealAt;
  final String? acceptingUntil;
  final int balanceIqc;
  final List<SapperLegend> legend;
  final List<SapperOccupied> occupied;
  final List<int> myCells;
  final List<SapperRevealPrize> prizes;
  final List<SapperWinner> winners;

  bool get revealed => status == 'finished';

  factory SapperField.fromJson(Map<String, dynamic> j) => SapperField(
        id: (j['id'] as num).toInt(),
        title: j['title'] as String? ?? '',
        status: j['status'] as String? ?? '',
        cellCount: (j['cellCount'] as num?)?.toInt() ?? 0,
        cols: (j['cols'] as num?)?.toInt() ?? 8,
        priceIqc: (j['priceIqc'] as num?)?.toInt() ?? 0,
        revealAt: j['revealAt'] as String?,
        acceptingUntil: j['acceptingUntil'] as String?,
        balanceIqc: (j['balanceIqc'] as num?)?.toInt() ?? 0,
        legend: ((j['legend'] as List?) ?? []).map((e) => SapperLegend.fromJson((e as Map).cast<String, dynamic>())).toList(),
        occupied: ((j['occupied'] as List?) ?? []).map((e) => SapperOccupied.fromJson((e as Map).cast<String, dynamic>())).toList(),
        myCells: ((j['myCells'] as List?) ?? []).map((e) => (e as num).toInt()).toList(),
        prizes: ((j['prizes'] as List?) ?? []).map((e) => SapperRevealPrize.fromJson((e as Map).cast<String, dynamic>())).toList(),
        winners: ((j['winners'] as List?) ?? []).map((e) => SapperWinner.fromJson((e as Map).cast<String, dynamic>())).toList(),
      );
}

class SapperReserveResult {
  const SapperReserveResult({required this.cellIndex, required this.balanceIqc});
  final int cellIndex;
  final int balanceIqc;
  factory SapperReserveResult.fromJson(Map<String, dynamic> j) => SapperReserveResult(
        cellIndex: (j['cellIndex'] as num?)?.toInt() ?? 0,
        balanceIqc: (j['balanceIqc'] as num?)?.toInt() ?? 0,
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/async_view.dart';
import 'providers.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  String _metric = 'checks';

  static const _labels = {
    'checks': 'Чеки',
    'pharm': 'Аптеки',
    'quests': 'Квесты',
  };

  @override
  Widget build(BuildContext context) {
    final board = ref.watch(leaderboardProvider(_metric));
    return Scaffold(
      appBar: AppBar(title: const Text('Рейтинг')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SegmentedButton<String>(
              segments: [
                for (final e in _labels.entries)
                  ButtonSegment(value: e.key, label: Text(e.value)),
              ],
              selected: {_metric},
              onSelectionChanged: (s) => setState(() => _metric = s.first),
            ),
          ),
          Expanded(
            child: AsyncView(
              value: board,
              onRetry: () => ref.invalidate(leaderboardProvider(_metric)),
              data: (b) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (b.company != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('Компания: ${b.company}',
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  for (final row in b.items)
                    Card(
                      color: row.isMe == true
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      child: ListTile(
                        leading: _rankBadge(row.rank),
                        title: Text(row.name),
                        trailing: Text('${row.value}',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rankBadge(int rank) {
    final medal = switch (rank) {
      1 => Colors.amber,
      2 => Colors.grey,
      3 => Colors.brown,
      _ => null,
    };
    return CircleAvatar(
      backgroundColor: medal,
      child: Text('$rank',
          style: TextStyle(color: medal != null ? Colors.white : null)),
    );
  }
}

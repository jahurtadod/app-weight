import 'package:app_weight/bet/presentation/providers/bet_provider.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';
import 'package:app_weight/weight/presentation/public/widgets/weight_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BetDetailScreen extends ConsumerWidget {
  const BetDetailScreen({super.key, required this.betId});
  final String betId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(betDetailsProvider(betId, weightsLimit: 10));

    return details.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (d) {
        final bet = d.bet;
        final users = d.userIds;

        return Scaffold(
          appBar: AppBar(title: Text(bet.title)),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: users.length,
            itemBuilder: (context, i) {
              final uid = users[i];
              final data = (d.weightsByUser[uid] ?? const <Weight>[])
                  .whereType<Weight>()
                  .toList();

              final initW = d.initialWeightByUser[uid] ?? 0.0;

              return WeightListView(data: data, initialWeight: initW);
            },
          ),
        );
      },
    );
  }
}

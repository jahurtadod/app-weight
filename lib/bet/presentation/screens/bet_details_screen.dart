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
    final asyncDetDetails = ref.watch(
      betDetailsProvider(betId, weightsLimit: 10),
    );

    return asyncDetDetails.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (d) {
        final bet = d.bet;
        final users = d.participantIds;

        print(d);

        return Scaffold(
          appBar: AppBar(title: const Text('Bet details')),
          body: asyncDetDetails.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error: $e')),
            data: (details) {
              // details.bet, details.userIds, details.weightsByUser, details.initialWeightByUser
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Apuesta: ${details.bet.id}'),
                  Text('Participantes: ${details.participantIds.length}'),
                  // pinta lo que necesites...
                ],
              );
            },
          ),
        );
      },
    );
  }
}

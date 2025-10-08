import 'package:app_weight/weight/domain/services/weight_trend_service.dart';
import 'package:app_weight/weight/presentation/mappers/trend_ui_mapper.dart';
import 'package:app_weight/weight/presentation/providers/person_providers.dart';
import 'package:app_weight/weight/presentation/providers/weights_providers.dart';
import 'package:app_weight/weight/presentation/public/widgets/card_weight_error.dart';
import 'package:app_weight/weight/presentation/widgets/card_weigths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridWeights extends ConsumerWidget {
  const GridWeights({required this.personId, this.limit, super.key});
  final String personId;
  final int? limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weights = ref.watch(watchWeightsByPersonProvider(personId, limit));
    final person = ref.watch(watchPersonByIdProvider(personId));

    return person.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text('Error persona: $e'),
      data: (person) {
        if (person == null) return const CardWeightError();

        return weights.when(
          data: (weights) {
            if (weights!.isEmpty) {
              return const CardWeightError();
            }
            return GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 60,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: weights.length,
              itemBuilder: (context, index) {
                final weight = weights[index];

                final trend = (index == weights.length - 1)
                    ? trendFor(
                        person.initialWeight,
                        weight.weight,
                      )
                    : trendFor(weights[index + 1].weight, weight.weight);
                final icon = iconForTrend(trend);
                final color = colorForTrend(trend);

                return CardWeigth(weight: weight, icon: icon, color: color);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        );
      },
    );
  }
}
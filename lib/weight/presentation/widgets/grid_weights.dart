import 'package:app_weight/config/widgets/icon_card.dart';
import 'package:app_weight/weight/domain/services/weight_trend_service.dart';
import 'package:app_weight/weight/presentation/providers/person_providers.dart';
import 'package:app_weight/weight/presentation/providers/weights_providers.dart';
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

class CardWeightError extends StatelessWidget {
  const CardWeightError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          IconCard(color: Colors.white, icon: Icons.sentiment_neutral_sharp),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'SIN REGISTROS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}

IconData iconForTrend(Trend t) => switch (t) {
  Trend.up => Icons.trending_up,
  Trend.down => Icons.trending_down,
  Trend.flat => Icons.trending_flat,
};

Color colorForTrend(Trend t) => switch (t) {
  Trend.up => Colors.redAccent,
  Trend.down => Colors.greenAccent,
  Trend.flat => Colors.amberAccent,
};

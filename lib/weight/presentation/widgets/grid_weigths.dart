import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';
import 'package:app_weight/weight/domain/services/weight_trend_service.dart';
import 'package:app_weight/weight/presentation/mappers/trend_ui_mapper.dart';
import 'package:app_weight/weight/presentation/widgets/card_weigths.dart';
import 'package:flutter/material.dart';

class GridWeights extends StatelessWidget {
  const GridWeights({
    super.key,
    required this.person,
    required this.weights,
  });

  final Person person;
  final List<Weight> weights;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
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
            : trendFor(
                weights[index + 1].weight,
                weight.weight,
              );

        final icon = iconForTrend(trend);
        final color = colorForTrend(trend);

        return CardWeigth(
          weight: weight,
          icon: icon,
          color: color,
        );
      },
    );
  }
}
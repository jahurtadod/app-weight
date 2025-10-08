import 'package:app_weight/weight/domain/entities/weight.dart';
import 'package:app_weight/weight/presentation/mappers/trend_ui_mapper.dart';
import 'package:app_weight/weight/presentation/public/widgets/card_weight_error.dart';
import 'package:flutter/material.dart';
import '../../../domain/services/weight_trend_service.dart';
import '../../widgets/card_weigths.dart';

class WeightListView extends StatelessWidget {
  const WeightListView({
    super.key,
    required this.data,
    required this.initialWeight,
    this.title,
    this.itemExtent = 60,
  });

  final List<Weight> data;
  final double initialWeight;
  final String? title;
  final double itemExtent;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const CardWeightError();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(title!, style: Theme.of(context).textTheme.titleMedium),
          ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: itemExtent,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final w = data[index];

            final trend = (index == data.length - 1)
                ? trendFor(initialWeight, w.weight)
                : trendFor(data[index + 1].weight, w.weight);

            final icon  = iconForTrend(trend);
            final color = colorForTrend(trend);

            return CardWeigth(weight: w, icon: icon, color: color);
          },
        ),
      ],
    );
  }
}
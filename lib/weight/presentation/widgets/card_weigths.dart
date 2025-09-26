import 'package:app_weight/config/widgets/icon_card.dart';
import 'package:flutter/material.dart';
import 'package:app_weight/weight/domain/entities/weights.dart';

class CardWeigth extends StatelessWidget {
  const CardWeigth({
    super.key,
    required this.weight,
    required this.icon,
    required this.color,
  });
  final Weights weight;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconCard(color: color, icon: icon),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PESO: ${weight.weight} ${weight.unit.toUpperCase()} - IMC: ${weight.imc}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                Text(
                  '${weight.dateWeight.toLocal()}'.split(' ')[0],
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app_weight/config/widgets/icon_card.dart';
import 'package:flutter/material.dart';

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

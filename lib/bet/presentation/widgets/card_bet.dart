import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardBet extends StatelessWidget {
  const CardBet({super.key, required this.bet});
  final Bet bet;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          context.goNamed(
            AppRoute.bet.name,
            pathParameters: {'bid': bet.id},
            extra: bet,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bet.title),
              const SizedBox(height: 8),
              Text('bet.description'),
            ],
          ),
        ),
      ),
    );
  }
}

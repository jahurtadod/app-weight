import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CardBetTittle extends StatelessWidget {
  const CardBetTittle({
    super.key,
    required this.bet,
    this.width = double.infinity,
    required this.onOpenDrawer,
  });

  final Bet bet;
  final VoidCallback onOpenDrawer;
  final double width;

  @override
  Widget build(BuildContext context) {
    final dateEndBet = DateFormat('dd MMM yyyy').format(bet.endDate);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: width < 900
              ? WrapAlignment.center
              : WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 16,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bet.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text('Finaliza el: $dateEndBet'),
                Text('Apuesta: \$ ${bet.stakeValue}'),
              ],
            ),
            SizedBox(
              width: 170,
              child: TextButton(
                onPressed: () => onOpenDrawer(),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/coin.svg', width: 24, height: 24),
                    const SizedBox(width: 8),
                    const Text("APUESTAS", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

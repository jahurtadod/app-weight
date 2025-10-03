import 'package:app_weight/bet/presentation/providers/bet_provider.dart';
import 'package:app_weight/bet/presentation/widgets/card_bet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BetsScreen extends ConsumerWidget {
  const BetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bets = ref.watch(betAllProvider);

    const spacing = 12.0;
    const minTileWidth = 340.0;

    return bets.when(
      data: (bets) {
        if (bets!.isEmpty) {
          return const Center(child: Text('NO EXISTEN APUESTAS'));
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            final maxW = constraints.maxWidth;
            final cols = (maxW / (minTileWidth + spacing)).floor().clamp(1, 4);
            final tileW = (maxW - spacing * (cols - 1)) / cols;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: bets.map((bet) {
                return SizedBox(
                  width: tileW,
                  child: CardBet(bet: bet),
                );
              }).toList(),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

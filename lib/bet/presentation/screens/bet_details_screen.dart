import 'package:app_weight/bet/presentation/providers/bet_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BetDetailScreen extends ConsumerWidget {
  const BetDetailScreen({super.key, required this.betId, this.bet});

  final String betId;
  final Bet? bet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBet = ref.watch(betByIdProvider(betId));
    final initial = bet;
    final loaded = asyncBet.value;
    final effective = loaded ?? initial;


    if (effective == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(body: Container(child: Text(effective.title),));
  }
}
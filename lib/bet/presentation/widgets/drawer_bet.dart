import 'package:app_weight/bet/domain/usecases/watch_bet_details.dart';
import 'package:app_weight/bet/presentation/providers/winner_bet_provider.dart';
import 'package:app_weight/bet/presentation/widgets/winner_bet_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DrawerBet extends ConsumerStatefulWidget {
  const DrawerBet({super.key, required this.bet});

  final BetDetails bet;

  @override
  ConsumerState<DrawerBet> createState() => _DrawerBetState();
}

class _DrawerBetState extends ConsumerState<DrawerBet> {
  bool _showForm = false;

  @override
  Widget build(context) {
    final asyncWinnerBet = ref.watch(winnerBetAllProvider(widget.bet.bet.id));

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(32.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        BackButton(),
                        Text('APUESTA: \n"${widget.bet.bet.title}"'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => setState(() {
                          _showForm = !_showForm;
                        }),
                        child: const Text("APOSTAR"),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/parix.png',
                  height: 120,
                  // fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: _showForm
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: WinnerBetForm(bet: widget.bet,),
          ),

          Builder(
            builder: (context) {
              return asyncWinnerBet.when(
                data: (winnerBets) {
                  if (winnerBets.isEmpty) {
                    return const Center(
                      child: Text('NO HAY APUESTAS REALIZADAS'),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: winnerBets.map((winnerBet) {
                        final dateEndBet = DateFormat(
                          'dd MMM yyyy',
                        ).format(winnerBet!.createdAt);
                    
                        return SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(winnerBet.displayName),
                                Text(
                                  'Apuesta todo ( \$ ${winnerBet.amount} ) por: ${winnerBet.targetParticipantName}',
                                ),
                                Text('Apuesta realizada: $dateEndBet'),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              );
            },
          ),
        ],
      ),
    );
  }
}

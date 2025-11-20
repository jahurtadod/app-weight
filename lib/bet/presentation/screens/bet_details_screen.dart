import 'package:app_weight/bet/presentation/providers/bet_provider.dart';
import 'package:app_weight/bet/presentation/widgets/card_bar_comparative.dart';
import 'package:app_weight/bet/presentation/widgets/chart_line_comparative.dart';
import 'package:app_weight/weight/presentation/widgets/card_person.dart';
import 'package:app_weight/weight/presentation/widgets/grid_weigths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BetDetailScreen extends ConsumerWidget {
  const BetDetailScreen({super.key, required this.betId});
  final String betId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetDetails = ref.watch(
      betDetailsProvider(betId, weightsLimit: 10),
    );

    // print("🔄 La UI se reconstruye a las ${DateTime.now()}");

    return asyncDetDetails.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (details) {
        final bet = details.bet;
        final particpants = details.participants;

        final dateEndBet = DateFormat('dd MMM yyyy').format(details.bet.endDate);

        return Scaffold(
          appBar: AppBar(title: Text(bet.title)),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isWide = width > 900; 

              if (isWide) {
                return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Finaliza el: $dateEndBet'),
                  Text('Apuesta: \$ ${details.bet.stakeValue}'),
                  const SizedBox(height: 16),
              
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...particpants.map<Widget>((participant) {
                        final person = participant.person;
                        final weights = participant.weights;
              
                        // rakingsitems.addAll(RankingItem(name: person.name, realLoss: person.initialWeight, handicap: ));
              
                        return Expanded(
                          child: Column(
                            children: [
                              CardPerson(person: person),
                              const SizedBox(height: 8),
                              GridWeights(
                                person: person,
                                weights: weights,
                              ),
                            ],
                          ),
                        );
                      }),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              // width: double.infinity,
                              child: ChartLineComparative(
                                seriesByUser: particpants,
                              ),
                            ),
                            AspectRatio(
                               aspectRatio: 2 / 1,
                              child: RankingWithHandicapChart(
                                items: particpants,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ); 
              } else {
                // 📱 Layout para móvil (todo en columna)
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Participantes uno debajo del otro
                    ...particpants.map<Widget>((participant) {
                      final person = participant.person;
                      final weights = participant.weights;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          children: [
                            CardPerson(person: person),
                            const SizedBox(height: 8),
                            GridWeights(
                              person: person,
                              weights: weights,
                            ),
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 16),

                    // Gráfica de líneas
                    SizedBox(
                      height: 300,
                      child: ChartLineComparative(
                        seriesByUser: particpants
    ,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Ranking
                    SizedBox(
                      height: 250,
                      child: RankingWithHandicapChart(
                        items: particpants,
                      ),
                    ),
                  ],
                );
              }
            },
            
          ),
        );
      },
    );
  }
}

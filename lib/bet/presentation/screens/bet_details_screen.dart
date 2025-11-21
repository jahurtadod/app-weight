import 'package:app_weight/bet/presentation/providers/bet_provider.dart';
import 'package:app_weight/bet/presentation/widgets/card_bar_comparative.dart';
import 'package:app_weight/bet/presentation/widgets/card_bet_tittle.dart';
import 'package:app_weight/bet/presentation/widgets/chart_line_comparative.dart';
import 'package:app_weight/bet/presentation/widgets/drawer_bet.dart';
import 'package:app_weight/weight/presentation/widgets/card_person.dart';
import 'package:app_weight/weight/presentation/widgets/grid_weigths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

        return Scaffold(
          // appBar: AppBar(title: Text(bet.title), actions: [BackButton()],),
          endDrawer: SizedBox(width: 540, child: DrawerBet(bet: details)),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isWide = width > 900;

              if (isWide) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    CardBetTittle(
                      bet: bet,
                      width: width,
                      onOpenDrawer: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),

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
                                GridWeights(person: person, weights: weights),
                                
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
                            SizedBox(
                              width: double.infinity,
                              child: CardBetTittle(
                                bet: bet,
                                width: width,
                                onOpenDrawer: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                              ),
                            ),
                            CardPerson(person: person),
                            const SizedBox(height: 8),
                            GridWeights(person: person, weights: weights),
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 16),

                    // Gráfica de líneas
                    SizedBox(
                      height: 300,
                      child: ChartLineComparative(seriesByUser: particpants),
                    ),
                    const SizedBox(height: 16),

                    // Ranking
                    SizedBox(
                      height: 250,
                      child: RankingWithHandicapChart(items: particpants),
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
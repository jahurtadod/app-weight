import 'dart:async';

import 'package:app_weight/bet/domain/entities/ranking_item.dart';
import 'package:app_weight/bet/domain/usecases/participant_person.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RankingWithHandicapChart extends StatelessWidget {
  final List<ParticipantWithPersonAndWeights> items;

  const RankingWithHandicapChart({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text("Sin datos para el ranking"));
    }

    final rankingItems = items.map((ppw) {
      final name = ppw.person.name;

      final initialWeight = ppw.participant.initialWeight;
      final handicap = ppw.participant.handicap;

      // Nos aseguramos de tomar el último peso por fecha
      final sortedWeights = [...ppw.weights]
        ..sort((a, b) => a.dateWeight.compareTo(b.dateWeight));

      final currentWeight = sortedWeights.isNotEmpty
          ? sortedWeights.last.weight
          : initialWeight;

      final realLoss = currentWeight - initialWeight;

      return RankingItem(
        name: name,
        realLoss: realLoss,
        handicap: handicap ?? 0.0,
      );
    }).toList()..sort((a, b) => b.score.compareTo(a.score));

    final allValues = rankingItems
        .expand((e) => [e.realLoss, e.score])
        .toList();

    final rawMin = allValues.reduce((a, b) => a < b ? a : b);
    final rawMax = allValues.reduce((a, b) => a > b ? a : b);

    final baseMin = rawMin < 0 ? rawMin : 0.0;
    final baseMax = rawMax > 0 ? rawMax : 0.0;

    final range = (baseMax - baseMin).abs();
    final padding = range == 0
        ? (baseMax.abs() > 0 ? baseMax.abs() * 0.2 : 1.0) // caso rango 0
        : range * 0.1; // 10%

    final minY = baseMin - padding;
    final maxY = baseMax + padding;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('KG PERDIDOS (considerando handicap)'),
            Expanded(
              child: AspectRatio(
                aspectRatio: 4,
                child: BarChart(
                  BarChartData(
                    // alignment: BarChartAlignment.spaceBetween,
                    rotationQuarterTurns: 1,
                    minY: minY,
                    maxY: maxY,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      // Nombres abajo (eje X)
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 90,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= items.length) {
                              return const SizedBox.shrink();
                            }
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(
                                rankingItems[index].name,
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          },
                        ),
                      ),
                      // Valores en el eje Y (kg)
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(
                                value.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                            // return Text(
                            //   value.toStringAsFixed(1),
                            //   style: const TextStyle(fontSize: 10),
                            // );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(),
                      topTitles: const AxisTitles(),
                    ),
                    gridData: FlGridData(show: true, drawVerticalLine: false),
                    borderData: FlBorderData(show: false),
                    barGroups: List.generate(rankingItems.length, (i) {
                      final user = rankingItems[i];

                      final realLoss = user.realLoss; // puede ser + o -
                      final finalLoss =
                          -user.handicap + realLoss; // realLoss + handicap

                      print("Usuario: ${user.name}");
                      print(realLoss.toStringAsFixed(2));
                      print(finalLoss.toStringAsFixed(2));
                      return BarChartGroupData(
                        x: i,
                        // barsSpace: 6, // separación entre barras del mismo usuario
                        barRods: [
                          // Barra 1: pérdida real
                          BarChartRodData(
                            toY: double.parse(finalLoss.toStringAsFixed(2)),
                            width: 10,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                            rodStackItems: [
                              BarChartRodStackItem(
                                0,
                                double.parse(realLoss.toStringAsFixed(2)),
                                Colors.blue,
                              ),
                              BarChartRodStackItem(
                                double.parse(realLoss.toStringAsFixed(2)),
                                double.parse(finalLoss.toStringAsFixed(2)),
                                Colors.green,
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

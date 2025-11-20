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
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text('KG GANADOS/PERDIDOS (considerando handicap)'),
            Expanded(
              child: BarChart(
                BarChartData(
                  // alignment: BarChartAlignment.spaceBetween,
                  rotationQuarterTurns: 1,
                  minY: minY,
                  maxY: maxY,
                  barTouchData: BarTouchData(
                    enabled: true,
                    handleBuiltInTouches: true,

                    touchTooltipData: BarTouchTooltipData(
                      fitInsideVertically: true,

                      // tooltipPadding: const EdgeInsets.all(8),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final user = rankingItems[groupIndex];

                        final score = user.score;

                        String textInitial;
                        if (score < 0) {
                          textInitial = 'Perdida';
                        } else if (score > 0) {
                          textInitial = 'Aumento';
                        } else {
                          textInitial = 'Sin cambio';
                        }

                        return BarTooltipItem(
                          '$textInitial \n',
                          const TextStyle(
                            color: Colors.white, //widget.touchedBarColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: user.handicap == 0
                                  ? '${((rod.toY).toStringAsFixed(1))} kg '
                                  : '${((rod.toY + user.handicap).toStringAsFixed(1))} + ${user.handicap * -1} kg',
                              style: const TextStyle(
                                color: Colors.white, //widget.touchedBarColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

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
                        // reservedSize: 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          if (value % 2 != 0) return const SizedBox.shrink();
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
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,

                    // Solo pintar líneas horizontales
                    checkToShowHorizontalLine: (value) => true,

                    getDrawingHorizontalLine: (value) {
                      // 🔥 Línea especial cuando value == 0
                      if (value == 0) {
                        return const FlLine(color: Colors.grey, strokeWidth: 2);
                      }

                      // Otras líneas normales
                      return FlLine(
                        color: Colors.grey.withValues(alpha: 0.3),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(rankingItems.length, (i) {
                    final user = rankingItems[i];

                    final realLoss = user.realLoss; // puede ser + o -
                    final finalLoss =
                        -user.handicap + realLoss; // realLoss + handicap

                    return BarChartGroupData(
                      x: i,
                      // barsSpace: 6, // separación entre barras del mismo usuario
                      barRods: [
                        // Barra 1: pérdida real
                        BarChartRodData(
                          toY: double.parse(finalLoss.toStringAsFixed(2)),
                          width: 10,
                          color: Colors.blue,
                          // borderRadius: BorderRadius.circular(4),
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
          ],
        ),
      ),
    );
  }
}

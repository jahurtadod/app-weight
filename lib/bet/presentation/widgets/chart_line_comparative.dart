import 'package:app_weight/bet/domain/usecases/participant_person.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartLineComparative extends StatelessWidget {
  final List<ParticipantWithPersonAndWeights> seriesByUser;

  const ChartLineComparative({super.key, required this.seriesByUser});

  @override
  Widget build(BuildContext context) {
    // Aplanar todos los pesos
    final List<Weight> allWeights = [
      for (final p in seriesByUser) ...p.weights,
    ];

    if (allWeights.isEmpty) {
      return const Center(child: Text("Sin datos para la gráfica"));
    }

    // Obtener min y max peso para el eje X
    final allDates = allWeights.map((w) => w.dateWeight).toList()..sort();

    const int marginDays = 1;
    final DateTime realFirstDate = allDates.first;
    final DateTime lastDate = allDates.last;

    final DateTime chartStartDate = realFirstDate.subtract(
      const Duration(days: marginDays),
    );

    final double totalDays = lastDate
        .difference(chartStartDate)
        .inDays
        .toDouble()
        .clamp(1, double.infinity);

    final int step = calculateStep(totalDays);

    // Obtener min y max peso para el eje Y
    final weightsOnly = allWeights.map((w) => w.weight).toList();

    double minWeight = weightsOnly.reduce((a, b) => a < b ? a : b);
    double maxWeight = weightsOnly.reduce((a, b) => a > b ? a : b);

    const double yMargin = 1.0;

    final double minY = (minWeight - yMargin).floorToDouble();
    final double maxY = (maxWeight + yMargin).ceilToDouble();

    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.brown,
      Colors.pink,
    ];

    // Crear las líneas asegurando color ↔ usuario consistente
    final List<LineChartBarData> lineBars = [];

    for (int i = 0; i < seriesByUser.length; i++) {
      // final userId = entries[i].key;
      final list = seriesByUser[i].weights;

      final color = colors[i % colors.length];

      final spots = toSpotsByDate(list, chartStartDate);

      lineBars.add(
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 3,
          color: color,
          dotData: FlDotData(show: true),
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                for (int i = 0; i < seriesByUser.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        color: colors[i % colors.length],
                      ),
                      const SizedBox(width: 6),
                      Text(
                        seriesByUser[i].person.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 16),

            Flexible(
              child: AspectRatio(
                aspectRatio: 2,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    minX: -2,
                    maxX: totalDays + 0.5,
                    minY: minY,
                    maxY: maxY,
                    lineBarsData: lineBars,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      drawHorizontalLine: true,
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(color: Colors.black, width: 2),
                        bottom: BorderSide(color: Colors.black, width: 2),
                        right: BorderSide(color: Colors.transparent),
                        top: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            // Mostramos solo si es entero real
                            if ((value - value.round()).abs() > 0.01) {
                              return const SizedBox.shrink();
                            }

                            // Si está fuera del rango lindo → no mostrar
                            if (value < minY || value > maxY) {
                              return const SizedBox.shrink();
                            }

                            return Text(
                              value.round().toString(),
                              style: const TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: step.toDouble(),
                          getTitlesWidget: (value, meta) {
                            final dayIndex = value.toInt();

                            if (dayIndex < 0 || dayIndex > totalDays.toInt()) {
                              return const SizedBox.shrink();
                            }

                            // Evitar labels intermedias
                            if (dayIndex % step != 0) {
                              return const SizedBox.shrink();
                            }

                            final date = chartStartDate.add(
                              Duration(days: dayIndex),
                            );

                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '${date.day}/${date.month}',
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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

/// X = días desde chartStartDate, Y = peso
List<FlSpot> toSpotsByDate(List<Weight> list, DateTime chartStartDate) {
  return list.map((w) {
    final x = w.dateWeight.difference(chartStartDate).inDays.toDouble();
    return FlSpot(x, w.weight);
  }).toList();
}

/// Decide cada cuántos días poner una etiqueta según el rango
int calculateStep(double totalDays) {
  if (totalDays <= 7) return 1;
  if (totalDays <= 30) return 3;
  if (totalDays <= 90) return 7;
  if (totalDays <= 180) return 15;
  return 30;
}

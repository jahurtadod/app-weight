import 'package:app_weight/weight/domain/services/weight_trend_service.dart';
import 'package:flutter/material.dart';

IconData iconForTrend(Trend t) => switch (t) {
  Trend.up => Icons.trending_up,
  Trend.down => Icons.trending_down,
  Trend.flat => Icons.trending_flat,
};

Color colorForTrend(Trend t) => switch (t) {
  Trend.up => Colors.redAccent,
  Trend.down => Colors.greenAccent,
  Trend.flat => Colors.amberAccent,
};
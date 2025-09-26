enum Trend { up, down, flat }

Trend trendFor(double previousWeight, double newWeight, {double tol = .2}) {
  final d = newWeight - previousWeight;
  if (d > tol) return Trend.up;     // el peso subió
  if (d < -tol) return Trend.down;  // el peso bajó
  return Trend.flat;                // sin cambios relevantes
}
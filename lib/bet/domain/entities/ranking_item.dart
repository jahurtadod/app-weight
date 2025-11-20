class RankingItem {
  final String name;
  final double realLoss; // kg perdidos reales
  final double handicap; // bonus (en kg o equivalente)
  
  RankingItem({
    required this.name,
    required this.realLoss,
    required this.handicap,
  });

  double get score => realLoss - handicap;
}
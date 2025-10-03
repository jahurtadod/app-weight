enum BetStatus { draft, active, finished, canceled }

enum StakeType { none, money, points }

class Bet {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final BetStatus status;
  final StakeType stakeType;
  final num? stakeValue;
  final int participantsCount;
  final BetRules rules;

  const Bet({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.stakeType,
    required this.stakeValue,
    required this.participantsCount,
    required this.rules,
  });
}

class BetRules {
  final double tolKg;
  final int minWeighingIntervalDays;

  const BetRules({required this.tolKg, required this.minWeighingIntervalDays});
}

import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';

class BetDetails {
  final Bet bet;
  final List<String> userIds;
  final Map<String, List<Weight?>> weightsByUser;
  final Map<String, double> initialWeightByUser;

  const BetDetails({
    required this.userIds, 
    required this.bet,
    required this.weightsByUser,
    required this.initialWeightByUser,
  });
}

abstract class WatchBetDetails {
  Stream<BetDetails> call(String betId, {int? weightsLimit});
}

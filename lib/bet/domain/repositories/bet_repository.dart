import 'package:app_weight/bet/domain/entities/bet.dart';

abstract class BetRepository {
  // Future<void> createBet(Bet bet);
  Future<Bet?> getBetById(String id);
  Future<List<Bet>> getAllBets();
  // Future<void> updateBet(Bet bet);
  // Future<void> deleteBet(String id);
}
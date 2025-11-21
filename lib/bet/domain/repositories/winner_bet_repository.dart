import 'package:app_weight/bet/domain/entities/winner_bet.dart';

abstract class WinnerBetRepository {
  Future<List<WinnerBet?>> getWinnerBetByBet(String id);
}
import 'package:app_weight/bet/data/models/winner_bet_model.dart';

abstract class WinnerBetDatasource {
  Future<List<WinnerBetModel>> getWinnerBetDatasourceById(String betId);
}
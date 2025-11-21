import 'package:app_weight/bet/data/datasources/winner_bet_datasource.dart';
import 'package:app_weight/bet/data/models/winner_bet_model.dart';
import 'package:app_weight/bet/domain/repositories/winner_bet_repository.dart';

class WinnerBetRepositoryImpl extends WinnerBetRepository {
  WinnerBetRepositoryImpl(this._datasource);
  final WinnerBetDatasource _datasource;

  @override
  Future<List<WinnerBetModel>> getWinnerBetByBet(String betId) {
    return _datasource.getWinnerBetDatasourceById(betId);
  }
}

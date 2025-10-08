import 'package:app_weight/bet/data/datasources/bet_datasource.dart';
import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/bet/domain/repositories/bet_repository.dart';

class BetRepositoryImpl extends BetRepository {
  BetRepositoryImpl(this._datasource);
  final BetDatasource _datasource;

  @override
  Future<Bet?> getBetById(String id) {
    return _datasource.getBetById(id);
  }
  
  @override
  Future<List<Bet>> getAllBets() {
    return _datasource.getAllBets();
  }
  
  @override
  Stream<Bet> watchById(String id) {
    return _datasource.watchById(id);
  }
}

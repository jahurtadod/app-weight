import 'package:app_weight/bet/data/models/bet_model.dart';

abstract class BetDatasource {
  Future<BetModel?> getBetById(String id);
  Future<List<BetModel>> getAllBets();
  Stream<BetModel> watchById(String id);
}

import 'package:app_weight/weight/data/models/weights_model.dart';

abstract class WeightsDatasource {
  // Future<WeightsModel?> getWeightsByPerson(String id);
  Stream<List<WeightsModel>> watchWeightsByPerson(String id, {int? limit});
}
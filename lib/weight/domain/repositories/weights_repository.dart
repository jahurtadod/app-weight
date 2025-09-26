
import 'package:app_weight/weight/domain/entities/weights.dart';

abstract class WeightsRepository {
  // Future<Weights?> getWeightsByPerson(String id);
  Stream<List<Weights?>> watchWeightsByPerson(String id, {int? limit});
}
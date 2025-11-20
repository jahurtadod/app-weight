
import 'package:app_weight/weight/domain/entities/weight.dart';

abstract class WeightsRepository {
  // Future<Weights?> getWeightsByPerson(String id);
  Stream<List<Weight>> watchWeightsByPerson(String id, {int? limit, DateTime? beforeDate, DateTime? afterDate});
}
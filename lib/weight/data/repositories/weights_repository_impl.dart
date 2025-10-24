import 'package:app_weight/weight/data/datasources/weigths_datasource.dart';
import 'package:app_weight/weight/data/models/weights_model.dart';
import 'package:app_weight/weight/domain/repositories/weights_repository.dart';

class WeightsRepositoryImpl implements WeightsRepository {
  WeightsRepositoryImpl(this._datasource);
  final WeightsDatasource _datasource;

  @override
  Stream<List<WeightsModel>> watchWeightsByPerson(
    String personId, {
    int? limit,
  }) {
    return _datasource.watchWeightsByPerson(personId, limit: limit);
  }
}

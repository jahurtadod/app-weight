import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:app_weight/weight/data/datasources/weigths_datasource.dart';
import 'package:app_weight/weight/data/datasources/weigths_datasource_impl.dart';
import 'package:app_weight/weight/data/repositories/weights_repository_impl.dart';
import 'package:app_weight/weight/domain/repositories/weights_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weights_providers.g.dart';

/// Provider del DataSource (inyecta FirebaseFirestore)
@riverpod
WeightsDatasource weightsRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider); // FirebaseFirestore
  return WeightsDatasourceImpl(db);
}

@riverpod
WeightsRepository weightsRepository(Ref ref) {
  final dataSource = ref.watch(weightsRemoteDataSourceProvider);
  return WeightsRepositoryImpl(dataSource);
}

@riverpod
Stream<List?> watchWeightsByPerson(Ref ref, String id, int? limit) {
  final repo = ref.watch(weightsRepositoryProvider);
  return repo.watchWeightsByPerson(id, limit: limit);
}
import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:app_weight/weight/data/datasources/person_datasource.dart';
import 'package:app_weight/weight/data/datasources/person_datasource_impl.dart';
import 'package:app_weight/weight/data/repositories/person_repository_impl.dart';
import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:app_weight/weight/domain/repositories/person_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_providers.g.dart';

/// Provider del DataSource (inyecta FirebaseFirestore)
@riverpod
PersonDatasource personRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider); // FirebaseFirestore
  return PersonDatasourceImpl(db);
}

/// Provider del Repository (inyecta el DataSource)
@riverpod
PersonRepository personRepository(Ref ref) {
  final ds = ref.watch(personRemoteDataSourceProvider);
  return PersonRepositoryImpl(ds);
}

/// “Query” para leer una persona por id (sin casos de uso)
@riverpod
Future<Person?> personById(Ref ref, String id) async {
  final repo = ref.watch(personRepositoryProvider);
  return repo.getPersonById(id);
}

/// Tiempo real (este es el que necesitas)
@riverpod
Stream<Person?> watchPersonById(Ref ref, String id) async* {
  final repo = ref.watch(personRepositoryProvider);
  yield* repo.watchPersonById(id);
}

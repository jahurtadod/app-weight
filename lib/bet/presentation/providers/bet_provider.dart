import 'package:app_weight/bet/data/datasources/bet_datasource.dart';
import 'package:app_weight/bet/data/datasources/bet_datasource_impl.dart';
import 'package:app_weight/bet/data/repositories/bet_repository_impl.dart';
import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/bet/domain/repositories/bet_repository.dart';
import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bet_provider.g.dart';

@riverpod
BetDatasource betRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider); // FirebaseFirestore
  return BetDatasourceImpl(db);
}

// Provider del Repository (inyecta el DataSource)
@riverpod
BetRepository betRepository(Ref ref) {
  final ds = ref.watch(betRemoteDataSourceProvider);
  return BetRepositoryImpl(ds);
}

// “Query” para leer una persona por id (sin casos de uso)
@riverpod
Future<Bet?> betById(Ref ref, String id) async {
  final repo = ref.watch(betRepositoryProvider);
  return repo.getBetById(id);
}

@riverpod
Future<List<Bet>?> betAll(Ref ref) async {
  final repo = ref.watch(betRepositoryProvider);
  return repo.getAllBets();
}
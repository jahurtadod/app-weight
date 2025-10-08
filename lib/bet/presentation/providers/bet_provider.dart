import 'package:app_weight/bet/data/datasources/bet_datasource.dart';
import 'package:app_weight/bet/data/datasources/bet_datasource_impl.dart';
import 'package:app_weight/bet/data/repositories/bet_repository_impl.dart';
import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/bet/domain/repositories/bet_repository.dart';
import 'package:app_weight/bet/domain/usecases/watch_bet_details.dart';
import 'package:app_weight/bet/domain/usecases/watch_bet_details_impl.dart';
import 'package:app_weight/bet/presentation/providers/participant_provider.dart';
import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:app_weight/weight/presentation/providers/person_providers.dart';
import 'package:app_weight/weight/presentation/providers/weights_providers.dart';
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

@Riverpod(keepAlive: true)
WatchBetDetails watchBetDetails(Ref ref) {
  final betRepo = ref.watch(betRepositoryProvider);
  final partRepo = ref.watch(participantRepositoryProvider); 
  final weightRepo = ref.watch(weightsRepositoryProvider);
  final personRepo = ref.watch(personRepositoryProvider);
  return WatchBetDetailsImpl(betRepo, weightRepo, personRepo, partRepo);
}

@riverpod
Stream<BetDetails> betDetails(Ref ref, String betId, {int? weightsLimit}) {
  return ref
      .watch(watchBetDetailsProvider)
      .call(betId, weightsLimit: weightsLimit);
}

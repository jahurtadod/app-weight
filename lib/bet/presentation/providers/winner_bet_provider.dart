import 'package:app_weight/bet/data/datasources/winner_bet_datasource.dart';
import 'package:app_weight/bet/data/datasources/winner_bet_datasource_impl.dart';
import 'package:app_weight/bet/data/repositories/winner_bet_repository_impl.dart';
import 'package:app_weight/bet/domain/entities/winner_bet.dart';
import 'package:app_weight/bet/domain/repositories/winner_bet_repository.dart';
import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'winner_bet_provider.g.dart';

@riverpod
WinnerBetDatasource winnerBetRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider); // FirebaseFirestore
  return WinnerBetDatasourceImpl(db);
}

@riverpod
WinnerBetRepository winnerBetRepository(Ref ref) {
  final ds = ref.watch(winnerBetRemoteDataSourceProvider);
  return WinnerBetRepositoryImpl(ds);
}

@riverpod
Future<List<WinnerBet?>> winnerBetAll(Ref ref, String betId) {
  final repo = ref.watch(winnerBetRepositoryProvider);
  return repo.getWinnerBetByBet(betId);
}

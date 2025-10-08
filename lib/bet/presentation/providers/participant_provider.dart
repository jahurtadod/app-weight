import 'package:app_weight/bet/data/datasources/participant_datasorce_impl.dart';
import 'package:app_weight/bet/data/datasources/participant_datasource.dart';
import 'package:app_weight/bet/data/repositories/participant_repository_impl.dart';
import 'package:app_weight/bet/domain/entities/participants.dart';
import 'package:app_weight/bet/domain/repositories/participants_repository.dart';
import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'participant_provider.g.dart';


@riverpod
ParticipantDatasource participantRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider); // FirebaseFirestore
  return ParticipantDatasourceImpl(db);
}

@riverpod
ParticipantsRepository participantRepository(Ref ref) {
  final ds = ref.watch(participantRemoteDataSourceProvider);
  return ParticipantRepositoryImpl(ds);
}

@riverpod
Stream<List<Participant>?> participantAll(Ref ref, String betId) async* {
  final repo = ref.watch(participantRepositoryProvider);
  yield* repo.getAllParticipants(betId);
}
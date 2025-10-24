import 'package:app_weight/bet/domain/repositories/bet_repository.dart';
import 'package:app_weight/bet/domain/repositories/participants_repository.dart';
import 'package:app_weight/bet/domain/usecases/watch_bet_details.dart';
import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';
import 'package:app_weight/weight/domain/repositories/person_repository.dart';
import 'package:app_weight/weight/domain/repositories/weights_repository.dart';
import 'package:rxdart/rxdart.dart';

class WatchBetDetailsImpl implements WatchBetDetails {
  final BetRepository betRepo;
  final WeightsRepository weightRepo;
  final PersonRepository personRepo;
  final ParticipantsRepository participantsRepo;

  WatchBetDetailsImpl(
    this.betRepo,
    this.weightRepo,
    this.personRepo,
    this.participantsRepo,
  );

  @override
  Stream<BetDetails> call(String betId, {int? weightsLimit}) {
    final bet$ = betRepo.watchById(betId);
    final participants$ = participantsRepo.getAllParticipants(betId);

    // Combina bet$ y participants$, luego para cada participante obtiene sus pesos e información de persona
    return Rx.combineLatest2(
      bet$,
      participants$,
      (bet, participants) => (bet, participants),
    ).switchMap<BetDetails>((tuple) {
      final bet = tuple.$1;
      final personIds =
          tuple.$2.map((p) => p.personId).where((id) => id.isNotEmpty).toList()
            ..sort();
      // Si no hay personIds, retorna BetDetails con userIds vacío
      if (!personIds.isNotEmpty) {
        return Stream.value(
          BetDetails(
            bet: bet,
            participantIds: const [],
            weightsByUser: const {},
            personsByParticipant: const {},
          ),
        );
      }
      // Optiene los pesos por persona
      final weights$ = personIds.map(
        (id) => weightRepo
            .watchWeightsByPerson(id, limit: weightsLimit)
            .map((list) => MapEntry(id, list)),
      );

      // Optiene la información de persona con el id del participante
      final persons$ = personIds.map(
        (id) => personRepo
            .watchPersonById(id)
            // controlamos el caso nulo
            .where((list) => list != null)
            .map((list) => MapEntry(id, list!)),
      );

      // Combina todos los streams de pesos y personas
      final combinedWeights$ =
          Rx.combineLatestList<MapEntry<String, List<Weight>>>(
            weights$,
          ).map<Map<String, List<Weight>>>(
            (entries) => {for (final e in entries) e.key: e.value},
          );

      final combinedPersons$ =
          Rx.combineLatestList<MapEntry<String, Person>>(
            persons$,
          ).map<Map<String, Person>>(
            (entries) => {for (final e in entries) e.key: e.value},
          );

      return Rx.combineLatest2(
        combinedWeights$,
        combinedPersons$,
        (weightsByUser, personsByParticipant) => BetDetails(
          bet: bet,
          participantIds: personIds,
          weightsByUser: weightsByUser,
          personsByParticipant: personsByParticipant,
        ),
      ).distinct(
        (a, b) =>
            identical(a, b) ||
            (a.bet.id == b.bet.id &&
                _mapEq(a.weightsByUser, b.weightsByUser) &&
                _mapEq(a.personsByParticipant, b.personsByParticipant)),
      );
    });
  }

  // Helper de igualdad
  bool _mapEq<K, V>(Map<K, V> a, Map<K, V> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (final k in a.keys) {
      if (!b.containsKey(k)) return false;
      if (a[k] != b[k]) return false;
    }
    return true;
  }
}

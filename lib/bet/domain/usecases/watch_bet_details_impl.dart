import 'package:app_weight/bet/domain/usecases/participant_person.dart';
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
      final participants = List.of(tuple.$2)
        ..removeWhere((p) => p.personId.isEmpty)
        ..sort((a, b) => a.personId.compareTo(b.personId));

      if (participants.isEmpty) {
        return Stream.value(
          BetDetails(
            bet: bet,
            // participantIds: const [],
            // weightsByUser: const {},
            // personsByParticipant: const {},
            participants: const [],
          ),
        );
      }
      // Optiene los pesos por persona
      final weights$ = participants.map(
        (participant) => weightRepo
            .watchWeightsByPerson(
              participant.personId,
              limit: weightsLimit,
              beforeDate: bet.endDate,
              afterDate: bet.startDate,
            )
            .map((list) => MapEntry(participant.personId, list)),
      );

      // Optiene la información de persona con el id del participante
      final persons$ = participants.map(
        (participant) => personRepo
            .watchPersonById(participant.personId)
            .where((p) => p != null)
            .map((p) => MapEntry(participant.personId, p!)),
      );

      final weightsByUser$ =
          Rx.combineLatestList<MapEntry<String, List<Weight>>>(
            weights$,
          ).map<Map<String, List<Weight>>>(
            (entries) => {for (final e in entries) e.key: e.value},
          );

      final personsByUser$ =
          Rx.combineLatestList<MapEntry<String, Person>>(
            persons$,
          ).map<Map<String, Person>>(
            (entries) => {for (final e in entries) e.key: e.value},
          );

      // final combinedWeights$ =
      //     Rx.combineLatestList<MapEntry<Participant, List<Weight>>>(
      //       weights$,
      //     ).map<Map<Participant, List<Weight>>>(
      //       (entries) => {for (final e in entries) e.key: e.value},
      //     );

      // final combinedPersons$ =
      //     Rx.combineLatestList<MapEntry<ParticipantWithPerson, Person>>(
      //       persons$,
      //     ).map<Map<String, Person>>(
      //       (entries) => {for (final e in entries) e.key: e.value},
      //     );

      //   return Rx.combineLatest2(
      //     combinedWeights$,
      //     combinedPersons$,
      //     (weightsByUser, personsByParticipant) => BetDetails(
      //       bet: bet,
      //       participantIds: participants,
      //       weightsByUser: weightsByUser,
      //       personsByParticipant: personsByParticipant,
      //     ),
      //   ).distinct(
      //     (a, b) =>
      //         identical(a, b) ||
      //         (a.bet.id == b.bet.id &&
      //             _mapEq(a.weightsByUser, b.weightsByUser) &&
      //             _mapEq(a.personsByParticipant, b.personsByParticipant)),
      //   );
      // });
      return Rx.combineLatest2<
        Map<String, List<Weight>>,
        Map<String, Person>,
        BetDetails
      >(weightsByUser$, personsByUser$, (weightsByUser, personsByUser) {
        final participantsWithAll = participants
            .map<ParticipantWithPersonAndWeights?>((p) {
              final person = personsByUser[p.personId];
              if (person == null) return null;

              final weights = weightsByUser[p.personId] ?? const <Weight>[];

              return ParticipantWithPersonAndWeights(
                participant: p,
                person: person,
                weights: weights,
              );
            })
            .whereType<ParticipantWithPersonAndWeights>()
            .toList();

        // print("⚡ BetDetails emitido a las ${DateTime.now()}");

        return BetDetails(bet: bet, participants: participantsWithAll);
      });
    });
  }

  // Helper de igualdad
  // bool _mapEq<K, V>(Map<K, V> a, Map<K, V> b) {
  //   if (identical(a, b)) return true;
  //   if (a.length != b.length) return false;
  //   for (final k in a.keys) {
  //     if (!b.containsKey(k)) return false;
  //     if (a[k] != b[k]) return false;
  //   }
  //   return true;
  // }

  // Helper con listas
  // bool _listEq<T>(List<T> a, List<T> b) {
  //   if (identical(a, b)) return true;
  //   if (a.length != b.length) return false;
  //   for (int i = 0; i < a.length; i++) {
  //     if (a[i] != b[i]) return false;
  //   }
  //   return true;
  // }
}

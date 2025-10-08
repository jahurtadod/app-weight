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

    // combina stream bet + participants
    return Rx.combineLatest2(
      bet$,
      participants$,
      (bet, participants) => (bet, participants),
    ).switchMap<BetDetails>((tuple) {
      final personIds = tuple.$2.map((p) => p.personId).toList();
      if (personIds.isNotEmpty) {
        return Stream.value(
          BetDetails(
            bet: tuple.$1,
            userIds: const [],
            weightsByUser: const {},
            initialWeightByUser: const {},
          ),
        );
      }
      // weightsStreams: Stream<MapEntry<String, List<Weight>>> por cada user

      // personsStreams: Stream<MapEntry<String, double>> por cada user
      final weights$ = personIds.map(
        (uid) => weightRepo
            .watchWeightsByPerson(
              uid,
              limit: weightsLimit,
            ) // Stream<List<Weight>>
            .map(
              (list) => MapEntry(uid, list),
            ), // MapEntry<String, List<Weight>>
      );

      final persons$ = personIds.map(
        (uid) => personRepo
            .watchPersonById(uid) // Stream<Person?>
            .map(
              (p) => MapEntry(uid, p?.initialWeight ?? 0.0),
            ), // MapEntry<String, double>
      );

      final combinedWeights$ =
          Rx.combineLatestList<MapEntry<String, List<Weight?>>>(weights$);
      final combinedPersons$ = Rx.combineLatestList<MapEntry<String, double>>(
        persons$,
      );

      return Rx.combineLatest2(combinedWeights$, combinedPersons$, (ws, ps) {
        final weightsByUser = <String, List<Weight?>>{
          for (final e in ws) e.key: e.value,
        };
        final initialByUser = <String, double>{
          for (final e in ps) e.key: e.value,
        };
        return BetDetails(
          bet: tuple.$1,
          userIds: personIds,
          weightsByUser: weightsByUser,
          initialWeightByUser: initialByUser,
        );
      });
    });
  }
}

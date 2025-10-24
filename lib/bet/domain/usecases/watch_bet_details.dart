import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';

part 'watch_bet_details.freezed.dart';

@freezed
abstract class BetDetails with _$BetDetails {
  const factory BetDetails({
    required Bet bet,
    required List<String> participantIds,
    @Default(<String, List<Weight>>{}) Map<String, List<Weight>> weightsByUser,
    @Default(<String, Person>{}) Map<String, Person> personsByParticipant,
  }) = _BetDetails;
}

abstract class WatchBetDetails {
  Stream<BetDetails> call(String betId, {int? weightsLimit});
}

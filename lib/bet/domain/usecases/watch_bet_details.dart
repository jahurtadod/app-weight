import 'package:app_weight/bet/domain/usecases/participant_person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_weight/bet/domain/entities/bet.dart';

part 'watch_bet_details.freezed.dart';

@freezed
abstract class BetDetails with _$BetDetails {
  const factory BetDetails({
    required Bet bet,
    required List<ParticipantWithPersonAndWeights> participants,
  }) = _BetDetails;
}

abstract class WatchBetDetails {
  Stream<BetDetails> call(String betId, {int? weightsLimit});
}

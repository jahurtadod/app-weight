import 'package:app_weight/bet/domain/entities/participants.dart';
import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:app_weight/weight/domain/entities/weight.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_person.freezed.dart';

class ParticipantWithPerson {
  final Participant participant;
  final Person person;

  ParticipantWithPerson({
    required this.participant,
    required this.person,
  });

  String get personId => participant.personId;
  String get displayName => person.name;
}

@freezed
abstract class ParticipantWithPersonAndWeights
    with _$ParticipantWithPersonAndWeights {
  const factory ParticipantWithPersonAndWeights({
    required Participant participant,
    required Person person,
    required List<Weight> weights,
  }) = _ParticipantWithPersonAndWeights;
}
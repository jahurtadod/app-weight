import 'package:app_weight/bet/domain/entities/participants.dart';

abstract class ParticipantsRepository {
  // Future<void> createParticipant(Participant participant);
  // Future<Participant?> getParticipantById(String id);
  Stream<List<Participant>> getAllParticipants(String betId);
  // Future<void> updateParticipant(Participant participant);
  // Future<void> deleteParticipant(String id);
}
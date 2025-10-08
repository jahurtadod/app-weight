import 'package:app_weight/bet/data/models/participant_model.dart';

abstract class ParticipantDatasource {
  Stream<List<ParticipantModel>> getAllParticipants(String betId);
}
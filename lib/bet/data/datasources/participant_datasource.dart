import 'package:app_weight/bet/data/models/participant_model.dart';

abstract class ParticipantDatasource {
  Future<List<ParticipantModel>> getAllParticipants(String betId);
}
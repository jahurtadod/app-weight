import 'package:app_weight/bet/data/datasources/participant_datasource.dart';
import 'package:app_weight/bet/data/models/participant_model.dart';
import 'package:app_weight/bet/domain/repositories/participants_repository.dart';

class ParticipantRepositoryImpl extends ParticipantsRepository {
  ParticipantRepositoryImpl(this._datasource);
  final ParticipantDatasource _datasource;

  @override
  Future<List<ParticipantModel>> getAllParticipants(String betId) {
    return _datasource.getAllParticipants(betId);
  }
  
}

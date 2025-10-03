import 'package:app_weight/bet/data/datasources/participant_datasource.dart';
import 'package:app_weight/bet/data/models/participant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ParticipantDatasourceImpl extends ParticipantDatasource {
  ParticipantDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _collection(String betId) =>
      _firestore.collection('bets').doc(betId).collection('participants');

  @override
  Future<List<ParticipantModel>> getAllParticipants(String betId) {
    return _collection(betId).get().then((snapshot) {
      if (snapshot.docs.isEmpty) return [];

      return snapshot.docs
          .map((doc) => ParticipantModel.fromJson(doc.data(), docId: doc.id))
          .toList();
    });
  }
}

import 'package:app_weight/bet/data/datasources/bet_datasource.dart';
import 'package:app_weight/bet/data/models/bet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BetDatasourceImpl extends BetDatasource {
  BetDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('bets');

  @override
  Future<BetModel?> getBetById(String id) {
    return _collection.doc(id).get().then((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return BetModel.fromJson(doc.data()!, docId: doc.id);
    });
  }
  
  @override
  Future<List<BetModel>> getAllBets() {
    return _collection.get().then((snapshot) {
      if (snapshot.docs.isEmpty) return [];

      return snapshot.docs
          .map((doc) => BetModel.fromJson(doc.data(), docId: doc.id))
          .toList();
    });
  }

  
}

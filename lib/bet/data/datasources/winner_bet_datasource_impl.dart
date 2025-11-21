import 'package:app_weight/bet/data/datasources/winner_bet_datasource.dart';
import 'package:app_weight/bet/data/models/winner_bet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WinnerBetDatasourceImpl extends WinnerBetDatasource {
  WinnerBetDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<List<WinnerBetModel>> getWinnerBetDatasourceById(String betId) {
    return _firestore
        .collection('winner_bets')
        .where('betId', isEqualTo: betId)
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .map((doc) => WinnerBetModel.fromJson(doc.data(), docId: doc.id))
            .toList());
  }
}

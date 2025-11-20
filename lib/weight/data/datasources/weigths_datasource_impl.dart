import 'package:app_weight/weight/data/datasources/weigths_datasource.dart';
import 'package:app_weight/weight/data/models/weights_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightsDatasourceImpl implements WeightsDatasource {
  WeightsDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _collection(String personId) =>
      _firestore.collection('person').doc(personId).collection('weights_entry');

  @override
  Stream<List<WeightsModel>> watchWeightsByPerson(
    String personId, {
    int? limit,
    DateTime? beforeDate,
    DateTime? afterDate,
  }) {
    return _buildQuery(personId, limit, beforeDate, afterDate).snapshots().map((
      snapshot,
    ) {
      if (snapshot.docs.isEmpty) return [];

      return snapshot.docs
          .map(
            (doc) => WeightsModel.fromJson(
              doc.data() as Map<String, dynamic>,
              docId: doc.id,
            ),
          )
          .toList();
    });
  }

  Query _buildQuery(
    String personId,
    int? limit,
    DateTime? beforeDate,
    DateTime? afterDate,
  ) {
    var query = _collection(personId).orderBy('dateWeight', descending: true);

    if (beforeDate != null) {
      query = query.where(
        'dateWeight',
        isLessThan: Timestamp.fromDate(beforeDate),
      );
    }

    if (afterDate != null) {
      query = query.where(
        'dateWeight',
        isGreaterThan: Timestamp.fromDate(afterDate),
      );
    }
    if (limit != null) query = query.limit(limit);
    return query;
  }
}

import 'package:app_weight/weight/data/datasources/person_datasource.dart';
import 'package:app_weight/weight/data/models/person_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonDatasourceImpl implements PersonDatasource {
  PersonDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('person');

  @override
  Future<PersonModel?> getPersonById(String id) async {
    return _collection.doc(id).get().then((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return PersonModel.fromJson(doc.data()!, docId: doc.id);
    });
  }

  @override
  Stream<PersonModel?> watchPersonById(String id) {
    return _collection.doc(id).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return PersonModel.fromJson(doc.data()!, docId: doc.id);
    });
  }
}

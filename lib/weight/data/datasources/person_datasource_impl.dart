import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:app_weight/weight/data/datasources/person_datasource.dart';
import 'package:app_weight/weight/data/models/person_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_datasource_impl.g.dart';

class PersonDatasourceImpl implements PersonDatasource {
  PersonDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('persons');

  @override
  Future<PersonModel?> getPersonById(String id) async {
    final doc = await _collection.doc(id).get();
    if (doc.exists) {
      return PersonModel.fromJson(doc.data()!);
    }
    return null;
  }

}

@riverpod
PersonDatasource personRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider);
  return PersonDatasourceImpl(db);
}
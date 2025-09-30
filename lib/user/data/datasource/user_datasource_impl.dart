import 'package:app_weight/user/data/datasource/user_datasource.dart';
import 'package:app_weight/user/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatasourceImpl extends UserDatasource {
  UserDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<UserModel?> authenticationUser(String email) async {
    final query = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (query.docs.isEmpty) return null;

    final doc = query.docs.first;
    final data = doc.data();

    return UserModel.fromJson({"id": doc.id, ...data});
  }

  @override
  Stream<UserModel?> closeUser() {
    throw UnimplementedError();
  }

  @override
  Stream<UserModel?> getUserById(String id) {
    throw UnimplementedError();
  }
}

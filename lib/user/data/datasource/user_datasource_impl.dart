import 'package:app_weight/user/data/datasource/user_datasource.dart';
import 'package:app_weight/user/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatasourceImpl extends UserDatasource {
  UserDatasourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Stream<User?> authenticationUser() {
    // TODO: implement authenticationUser // Firebase Here
    print('Funciona ${_firestore}');
    throw UnimplementedError();
  }

  @override
  Stream<User?> closeUse() {
    // TODO: implement closeUse
    throw UnimplementedError();
  }

  @override
  Stream<User?> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }
}

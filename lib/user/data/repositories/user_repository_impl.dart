import 'package:app_weight/user/data/datasource/user_datasource.dart';
import 'package:app_weight/user/domain/entities/user.dart';
import 'package:app_weight/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource _userDatasource;
  UserRepositoryImpl(this._userDatasource);

  @override
  Future<User?> authenticationUser(String email) async {
    final userModel = await _userDatasource.authenticationUser(email);
    return userModel?.toEntity();
  }

  @override
  Stream<User?> closeUser() {
    // TODO: implement closeUse
    throw UnimplementedError();
  }

  @override
  Stream<User?> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }
}

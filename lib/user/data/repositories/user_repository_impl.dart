import 'package:app_weight/user/data/datasource/user_datasource.dart';
import 'package:app_weight/user/domain/entities/user.dart';
import 'package:app_weight/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource _userDatasource;
  UserRepositoryImpl(this._userDatasource);

  @override
  Stream<String?> authStateChanges() {
    return _userDatasource.authStateChanges();
  }

  @override
  Future<User> signInWithGoogle() async {
    final m = await _userDatasource.signInWithGoogle();
    if (m == null) {
      throw Exception('No se pudo iniciar sesión con Google');
    }
    return m.toEntity();
  }

  @override
  Future<void> signOut() {
    return _userDatasource.signOut();
  }

  @override
  Stream<User?> getUserById(String id) {
    return _userDatasource.getUserById(id).map((m) => m?.toEntity());
  }
}

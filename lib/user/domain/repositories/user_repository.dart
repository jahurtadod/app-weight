import 'package:app_weight/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> authenticationUser(String email);
  Stream<User?> getUserById(String id);
  Stream<User?> closeUser();
}

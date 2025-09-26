import 'package:app_weight/user/domain/entities/user.dart';

abstract class UserDatasource {
  Stream<User?> authenticationUser();
  Stream<User?> getUserById(String id);
  Stream<User?> closeUse();
}

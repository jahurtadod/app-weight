import 'package:app_weight/user/data/models/user_model.dart';


abstract class UserDatasource {
  Future<UserModel?> authenticationUser(String email);
  Stream<UserModel?> getUserById(String id);
  Stream<UserModel?> closeUser();
}

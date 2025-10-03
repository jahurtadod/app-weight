import 'package:app_weight/user/data/models/user_model.dart';


abstract class UserDatasource {
  // Future<UserModel?> authenticationUser(String email);

  // Authenticacion
  Future<UserModel?> signInWithGoogle();

  // Cierra sesión en Firebase Auth.
  Future<void> signOut();

  // Stream del UID actual (o null).
  Stream<String?> authStateChanges();
  
  Stream<UserModel?> getUserById(String id);
}

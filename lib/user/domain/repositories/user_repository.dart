import 'package:app_weight/user/domain/entities/user.dart';

abstract class UserRepository {
  // Authenticacion
  Future<User> signInWithGoogle();

  // Cierra sesión en Firebase Auth.
  Future<void> signOut();

  // Stream del UID actual (o null).
  Stream<String?> authStateChanges();

  // Obeter el usuario
  Stream<User?> getUserById(String id);
}

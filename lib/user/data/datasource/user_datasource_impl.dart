import 'package:app_weight/user/data/datasource/user_datasource.dart';
import 'package:app_weight/user/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:app_weight/user/domain/entities/user.dart';

class UserDatasourceImpl extends UserDatasource {
  UserDatasourceImpl(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final fb.FirebaseAuth _auth;

  @override
  Stream<String?> authStateChanges() =>
      _auth.authStateChanges().map((u) => u?.uid);

  @override
  Future<UserModel?> signInWithGoogle() async {
    // Web: popup
    final provider = fb.GoogleAuthProvider();
    final cred = await _auth.signInWithPopup(provider);

    final fbUser = cred.user;
    if (fbUser == null) return null;

    final uid = fbUser.uid;
    final docRef = _firestore.collection('users').doc(uid);
    final snap = await docRef.get();
    final fbPhoto = fbUser.photoURL ?? '';
    if (!snap.exists) {
      // Primer login: Crea perfil base en la coleccion 'users'
      final model = UserModel(
        id: uid,
        name: fbUser.displayName?.split(' ').firstOrNull ?? '',
        lastName: fbUser.displayName?.split(' ').skip(1).join(' ') ?? '',
        email: fbUser.email ?? '',
        phoneNumber: fbUser.phoneNumber ?? '',
        role: ROL.user,
        avatarUrl: fbPhoto,
      );
      await docRef.set(model.toJson());
      return model;
    }
    final data = snap.data()!;
    // (Opcional) si el doc no tiene avatarUrl aún, lo actualizas una sola vez:
    if ((data['avatarUrl'] ?? '').toString().isEmpty && fbPhoto.isNotEmpty) {
      await docRef.update({'avatarUrl': fbPhoto});
    }
    return UserModel.fromJson({"id": uid, ...data});
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Stream<UserModel?> getUserById(String id) {
    return _firestore.collection('users').doc(id).snapshots().map((snap) {
      if (!snap.exists) return null;
      final data = snap.data()!;
      return UserModel.fromJson({"id": snap.id, ...data});
    });
  }
}

// name: fbUser.displayName?.split(' ').firstOrNull ?? '', Si el nombre esta vacio devuelve '' en ves de null
extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

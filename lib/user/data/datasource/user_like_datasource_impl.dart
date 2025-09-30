import 'package:app_weight/user/data/datasource/user_like_datasource.dart';
import 'package:app_weight/user/domain/entities/like.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class UserLikeDatasourceImpl implements UserLikeDatasource {
  UserLikeDatasourceImpl(this._db, this._auth);

  final FirebaseFirestore _db;
  final fb.FirebaseAuth _auth;

  CollectionReference<Map<String, dynamic>> _users() => _db.collection('users');
  CollectionReference<Map<String, dynamic>> _persons() => _db.collection('person');

  DocumentReference<Map<String, dynamic>> _targetDoc(LikeTargetRef ref) {
    switch (ref.type) {
      case LikeTargetType.person:
        return _persons().doc(ref.targetId);
      // case LikeTargetType.post: return _db.collection('posts').doc(ref.targetId);
      // case LikeTargetType.comment: return _db.collection('comments').doc(ref.targetId);
    }
  }

  String _counterField(LikeTargetRef ref) {
    switch (ref.type) {
      case LikeTargetType.person:
        return 'likes';
      // case LikeTargetType.post: return 'likesCount';
      // case LikeTargetType.comment: return 'likes';
    }
  }

  DocumentReference<Map<String, dynamic>> _userLikeRef(String uid, LikeTargetRef ref) {
    return _users().doc(uid).collection('likes').doc(ref.likeDocId);
  }

  @override
  Stream<bool> isLikedByCurrentUser(LikeTargetRef ref) {
    return _auth.authStateChanges().asyncExpand((u) {
      if (u == null) return Stream.value(false);
      return _userLikeRef(u.uid, ref).snapshots().map((d) => d.exists);
    });
  }

  @override
  Future<void> toggleLike(LikeTargetRef ref) async {
    final u = _auth.currentUser;
    if (u == null) throw Exception('Debes iniciar sesión');

    final likeRef = _userLikeRef(u.uid, ref);
    final targetRef = _targetDoc(ref);
    final counterField = _counterField(ref);

    await _db.runTransaction((tx) async {
      final likeSnap = await tx.get(likeRef);
      final targetSnap = await tx.get(targetRef);
      if (!targetSnap.exists) {
        throw Exception('Objetivo no encontrado');
      }

      if (likeSnap.exists) {
        // UNLIKE
        tx.delete(likeRef);
        tx.update(targetRef, {counterField: FieldValue.increment(-1)});
      } else {
        // LIKE
        tx.set(likeRef, {
          'type': ref.type.name,
          'targetId': ref.targetId,
          'createdAt': FieldValue.serverTimestamp(),
        });
        tx.update(targetRef, {counterField: FieldValue.increment(1)});
      }
    });
  }
}

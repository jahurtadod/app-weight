import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:app_weight/user/data/datasource/user_like_datasource_impl.dart';
import 'package:app_weight/user/data/datasource/user_like_datasource.dart';
import 'package:app_weight/user/data/repositories/user_like_repository_impl.dart';
import 'package:app_weight/user/domain/repositories/user_like_repository.dart';
import 'package:app_weight/user/domain/entities/like.dart';

part 'user_like_providers.g.dart';

@riverpod
UserLikeDatasource userLikeDatasource(Ref ref) {
  final db = ref.watch(firestoreProvider);
  final auth = ref.watch(firebaseAuthProvider);
  return UserLikeDatasourceImpl(db, auth);
}

@riverpod
UserLikeRepository userLikeRepository(Ref ref) {
  final ds = ref.watch(userLikeDatasourceProvider);
  return UserLikeRepositoryImpl(ds);
}

// Families con (type, targetId) para que sean serializables
@riverpod
Stream<bool> isLiked(Ref ref, LikeTargetType type, String targetId) {
  final repo = ref.watch(userLikeRepositoryProvider);
  return repo.isLiked(LikeTargetRef(type: type, targetId: targetId));
}

@riverpod
Future<void> toggleLike(Ref ref, LikeTargetType type, String targetId) async {
  final repo = ref.watch(userLikeRepositoryProvider);
  await repo.toggle(LikeTargetRef(type: type, targetId: targetId));
}

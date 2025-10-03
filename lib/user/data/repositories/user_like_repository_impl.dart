import 'package:app_weight/user/data/datasource/user_like_datasource.dart';
import 'package:app_weight/user/domain/entities/like.dart';
import 'package:app_weight/user/domain/repositories/user_like_repository.dart';

class UserLikeRepositoryImpl implements UserLikeRepository {
  final UserLikeDatasource _dsUserLike;

  UserLikeRepositoryImpl(this._dsUserLike);

  @override
  Stream<bool> isLiked(LikeTargetRef ref) {
    return _dsUserLike.isLikedByCurrentUser(ref);
  }

  @override
  Future<void> toggle(LikeTargetRef ref) {
    return _dsUserLike.toggleLike(ref);
  }
}

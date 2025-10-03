import 'package:app_weight/user/domain/entities/like.dart';

abstract class UserLikeDatasource {
  Stream<bool> isLikedByCurrentUser(LikeTargetRef ref);
  Future<void> toggleLike(LikeTargetRef ref);
}
import 'package:app_weight/user/domain/entities/like.dart';

abstract class UserLikeRepository {
  Stream<bool> isLiked(LikeTargetRef ref);
  Future<void> toggle(LikeTargetRef ref);
}
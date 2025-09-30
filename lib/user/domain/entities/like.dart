enum LikeTargetType { person /*, post, comment, ...*/ }

class LikeTargetRef {
  final LikeTargetType type;
  final String targetId;

  const LikeTargetRef({required this.type, required this.targetId});

  /// ID único del like dentro del subcollección del usuario
  String get likeDocId => '${type.name}_$targetId';
}
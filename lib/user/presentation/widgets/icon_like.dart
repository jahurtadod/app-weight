// user/presentation/widgets/icon_like.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_weight/user/domain/entities/like.dart';
import 'package:app_weight/user/presentation/providers/user_like_providers.dart';

class IconLike extends ConsumerWidget {
  const IconLike({
    super.key,
    required this.targetType,
    required this.targetId,
    required this.likes,
  });

  final LikeTargetType targetType;
  final String targetId;
  final int likes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$likes'),
        const SizedBox(width: 8),
        Consumer(
          builder: (context, ref, _) {
            final likedAsync = ref.watch(isLikedProvider(targetType, targetId));

            return likedAsync.when(
              data: (liked) => IconButton(
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : null,
                ),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(
                    context,
                  ); // captura antes del await
                  try {
                    await ref.read(
                      toggleLikeProvider(
                        LikeTargetType.person,
                        targetId,
                      ).future,
                    );
                  } catch (e) {
                    messenger.showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                },

                tooltip: liked ? 'Quitar like' : 'Dar like',
              ),
              loading: () => const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              error: (err, __) => IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: null,
              ),
            );
          },
        ),
      ],
    );
  }
}

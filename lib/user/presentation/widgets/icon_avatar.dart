import 'package:app_weight/user/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconAvatar extends ConsumerWidget {
  final double size;
  final String? fallbackText;

  const IconAvatar({this.size = 28, this.fallbackText, super.key});

  @override
  Widget build(BuildContext contextm, WidgetRef ref) {
    final avatarAsync = ref.watch(currentUserAvatarUrlProvider);

    return avatarAsync.when(
      data: (url) {
        if (url.isNotEmpty) {
          return CircleAvatar(
            radius: size / 2,
            backgroundImage: NetworkImage(url),
            backgroundColor: Colors.transparent,
            onBackgroundImageError: (_, __) {},
          );
        }
        // Fallback: icono o iniciales
        final text = (fallbackText ?? 'U').substring(0, 1).toUpperCase();
        return CircleAvatar(radius: size / 2, child: Text(text));
      },
      error: (_, __) =>
          CircleAvatar(radius: size / 2, child: const Icon(Icons.person)),
      loading: () => SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

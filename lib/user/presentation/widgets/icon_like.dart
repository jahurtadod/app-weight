// user/presentation/widgets/icon_like.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_weight/user/domain/entities/like.dart';
import 'package:app_weight/user/presentation/providers/user_like_providers.dart';

class IconLike extends ConsumerStatefulWidget {
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
  ConsumerState<IconLike> createState() => _IconLikeState();
}

class _IconLikeState extends ConsumerState<IconLike> {
  bool _busy = false;
  bool? _lastKnownLiked; // cache del stream para evitar saltos en loading
  bool? _overrideLiked; // override optimista hasta que el stream confirme

  @override
  Widget build(BuildContext context) {
    final likedAsync = ref.watch(
      isLikedProvider(widget.targetType, widget.targetId),
    );

    // actualiza cache cuando haya dato
    likedAsync.whenData((v) {
      _lastKnownLiked = v;
      // si el stream CONFIRMA lo que mostramos en override -> limpiamos override
      if (_overrideLiked != null && v == _overrideLiked) {
        _overrideLiked = null; // ya no necesitamos mantener el estado local
      }
    });

    // baseLiked = dato del stream o último conocido (si loading/error)
    final bool baseLiked =
        (likedAsync.maybeWhen(data: (v) => v, orElse: () => _lastKnownLiked) ??
        false);

    // visibleLiked = override (si existe) o valor base
    final bool visibleLiked = _overrideLiked ?? baseLiked;

    // contador optimista: si hay override y conocemos el baseLiked, ajusta +1/-1
    int displayLikes = widget.likes;
    if (_overrideLiked != null) {
      displayLikes += baseLiked ? -1 : 1;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$displayLikes'),
        const SizedBox(width: 8),
        IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 120),
            transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
            child: Icon(
              visibleLiked ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(
                visibleLiked,
              ), // misma key => no hay doble animación
              color: visibleLiked ? Colors.red : null,
            ),
          ),
          onPressed: _busy
              ? null
              : () async {
                  final messenger = ScaffoldMessenger.of(context);
                  // establece override optimista inmediato (sin invertir luego)
                  setState(() {
                    _busy = true;
                    _overrideLiked =
                        !baseLiked; // mostramos el estado final esperado
                  });
                  try {
                    await ref.read(
                      toggleLikeProvider(
                        widget.targetType,
                        widget.targetId,
                      ).future,
                    );
                    // cuando llegue el stream con el nuevo valor == _overrideLiked,
                    // el override se auto-limpia en whenData() de arriba.
                  } catch (e) {
                    if (!mounted) return;
                    // error → revierte override para no “mentir” visualmente
                    setState(() => _overrideLiked = null);
                    messenger.showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  } finally {
                    if (mounted) setState(() => _busy = false);
                  }
                },
          tooltip: visibleLiked ? 'Quitar like' : 'Dar like',
        ),
      ],
    );
  }
}

import 'package:app_weight/user/presentation/providers/user_provider.dart';
import 'package:app_weight/user/presentation/widgets/icon_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconAuth extends ConsumerWidget {
  const IconAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final uidAsync = ref.watch(authUidProvider);
    final fullNameAsync = ref.watch(currentUserFullNameProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Iniciar con Google
        TextButton.icon(
          onPressed: () async {
            final user = await ref.read(signInWithGoogleProvider.future);
            if (!context.mounted) return;
            if (user != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Bienvenido ${user.name.isEmpty ? user.email : user.name}',
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No se pudo iniciar sesión')),
              );
            }
          },
          icon: const Icon(Icons.login, color: Colors.white),
          label: const Text('Google', style: TextStyle(color: Colors.white)),
        ),

        const SizedBox(width: 8),

        // Cerrar sesión
        TextButton.icon(
          onPressed: () async {
            await ref.read(signOutProvider.future);
            if (!context.mounted) return;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Sesión cerrada')));
          },
          icon: const Icon(Icons.logout, color: Colors.white),
          label: const Text(
            'Cerrar sesión',
            style: TextStyle(color: Colors.white),
          ),
        ),

        const SizedBox(width: 16),
        IconAvatar(size: 28), // Icono de la persona
        fullNameAsync.when(
          data: (fullName) => Text(
            fullName,
            style: const TextStyle(color: Colors.white70),
            overflow: TextOverflow.ellipsis,
          ),
          loading: () => const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (_, __) =>
              const Text('—', style: TextStyle(color: Colors.redAccent)),
        ),
      ],
    );
  }
}

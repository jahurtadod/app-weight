import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_weight/user/presentation/providers/user_provider.dart';

class IconAuth extends ConsumerWidget {
  const IconAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 🔑 Autenticación por correo
        TextButton.icon(
          onPressed: () async {
            final email = "jahurtadodxd1@gmail.com";
            final asyncUser = ref.read(
              userByEmailAuthenticationProvider(email).future,
            );

            final user = await asyncUser;

            if (user != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Bienvenido ${user.name}")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Usuario no encontrado")),
              );
            }
          },
          icon: const Icon(Icons.login, color: Colors.white),
          label: const Text(
            "Autenticación",
            style: TextStyle(color: Colors.white),
          ),
        ),

        // 🔒 Cerrar sesión
        TextButton.icon(
          onPressed: () {
            // Como tu repositorio aún no implementa logout,
            // aquí puedes limpiar estado o futuro provider.
            ref.invalidate(userByEmailAuthenticationProvider);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Sesión cerrada")));
          },
          icon: const Icon(Icons.logout, color: Colors.white),
          label: const Text(
            "Cerrar sesión",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

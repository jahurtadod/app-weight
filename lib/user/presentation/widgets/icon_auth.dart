import 'package:app_weight/user/presentation/providers/user_provider.dart';
import 'package:app_weight/user/presentation/widgets/icon_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconAuth extends ConsumerWidget {
  const IconAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uidAsync = ref.watch(authUidProvider); // sesión
    final fullNameAsync = ref.watch(currentUserFullNameProvider); // nombre

    // Un poco de padding para separarlo del borde derecho del AppBar
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: uidAsync.when(
        loading: () => const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        error: (_, __) =>
            const Text('—', style: TextStyle(color: Colors.redAccent)),
        data: (uid) {
          // SIN SESIÓN
          if (uid == null) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.grey[300], // gris claro (igual que Entrar)
                foregroundColor: Colors.black, // ícono y texto en negro
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // esquinas redondeadas
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final user = await ref.read(signInWithGoogleProvider.future);
                if (!context.mounted) return;
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(
                      user != null
                          ? 'Bienvenido ${user.name.isEmpty ? user.email : user.name}'
                          : 'No se pudo iniciar sesión',
                    ),
                  ),
                );
              },
              child: const Text(
                "Entrar",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black, // mejor contraste con gris claro
                ),
              ),
            );
          }

          // LOGUEADO
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 8),
              Flexible(
                child: fullNameAsync.when(
                  data: (fullName) => Text(
                    fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  loading: () => const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (_, __) => const Text(
                    '—',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconAvatar(size: 28),
              const SizedBox(width: 12),
              SizedBox(
                height: 28, // alto del divisor
                child: VerticalDivider(
                  width: 16, // espacio horizontal ocupado
                  thickness: 2, // grosor de la línea
                  color: Colors.white, // ajusta a tu tema
                ),
              ),
              const SizedBox(width: 12),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.grey[300], // gris claro (igual que Entrar)
                  foregroundColor: Colors.black, // ícono y texto en negro
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // esquinas redondeadas
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  await ref.read(signOutProvider.future);
                  if (!context.mounted) return;
                  messenger.showSnackBar(
                    const SnackBar(content: Text('Sesión cerrada')),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Salir",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black, // contraste con gris claro
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          );
        },
      ),
    );
  }
}

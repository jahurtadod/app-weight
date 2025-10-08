import 'package:app_weight/config/widgets/app_dialogs.dart';
import 'package:app_weight/config/widgets/primary_button.dart';
import 'package:app_weight/user/presentation/providers/user_provider.dart';
import 'package:app_weight/user/presentation/widgets/icon_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconAuth extends ConsumerStatefulWidget {
  const IconAuth({super.key});
  @override
  ConsumerState<IconAuth> createState() => _IconAuthState();
}

class _IconAuthState extends ConsumerState<IconAuth> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final uidAsync = ref.watch(authUidProvider);
    final fullNameAsync = ref.watch(currentUserFullNameProvider);
    final messenger = ScaffoldMessenger.of(context);

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
          if (uid == null) {
            // SIN SESIÓN
            return PrimaryButton(
              label: 'Entrar',
              icon: const Icon(Icons.login, size: 16, color: Colors.black),
              isBusy: _busy,
              onPressed: () async {
                setState(() => _busy = true);
                try {
                  final user = await ref.read(signInWithGoogleProvider.future);
                  if (!mounted) return;
                  await showStatusModal(
                    context,
                    title: user != null
                        ? 'Bienvenido!'
                        : 'Inicio de Sesión Fallido',
                    message: user != null
                        ? (user.name.isEmpty ? user.email : user.name)
                        : 'Intentalo Nuevamente.',
                    variant: user != null
                        ? StatusVariant.success
                        : StatusVariant.error,
                    autoCloseDuration: const Duration(
                      seconds: 5,
                    ), // ⏱ auto-cierre
                    showActions: false, // sin Aceptar/Cancelar
                    showOkWhenNoActions:
                        true, // muestra OK además del timer (opcional)
                  );
                  // messenger.showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //       user != null
                  //           ? 'Bienvenido ${user.name.isEmpty ? user.email : user.name}'
                  //           : 'No se pudo iniciar sesión',
                  //     ),
                  //   ),
                  // );
                } catch (e) {
                  if (!mounted) return;
                  messenger.showSnackBar(SnackBar(content: Text(e.toString())));
                } finally {
                  if (mounted) setState(() => _busy = false);
                }
              },
            );
          }

          // CON SESIÓN
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
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
              ),
              const SizedBox(width: 12),
              const IconAvatar(size: 28),
              const SizedBox(width: 8),
              SizedBox(
                height: 24,
                child: VerticalDivider(
                  width: 16,
                  thickness: 1.5,
                  color: Colors.white24,
                ),
              ),
              const SizedBox(width: 8),
              PrimaryButton(
                label: 'Salir',
                icon: const Icon(Icons.logout, size: 16, color: Colors.black),
                isBusy: _busy,
                onPressed: () async {
                  if (_busy) return;

                  final confirmed = await showStatusModal(
                    context,
                    title: 'Estas Seguro?',
                    message: 'Deseas Cerrar Sesión',
                    variant: StatusVariant.info,
                    showActions: true, // ← muestra Aceptar / Cancelar
                    confirmText: 'Aceptar',
                    cancelText: 'Cancelar',
                    autoCloseDuration: null, // ← sin auto-cierre
                    barrierDismissible: true,
                  );
                  if (!confirmed) return;

                  setState(() => _busy = true);
                  try {
                    await ref.read(signOutProvider.future);
                    if (!mounted) return;
                    // (Opcional) mostrar un diálogo de “Sesión cerrada” aquí si quieres
                    // await showStatusModal(context, title:'Done', message:'Sesión cerrada', variant: StatusVariant.success);
                  } catch (e) {
                    if (!mounted) return;
                    await showStatusModal(
                      context,
                      title: 'Error',
                      message: e.toString(),
                      variant: StatusVariant.error,
                      showActions: false, // solo OK
                      autoCloseDuration: null,
                    );
                  } finally {
                    if (mounted) setState(() => _busy = false);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

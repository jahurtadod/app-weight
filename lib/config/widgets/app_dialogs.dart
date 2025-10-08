// lib/config/widgets/app_status_dialog.dart
import 'package:flutter/material.dart';

enum StatusVariant { success, error, warning, info }

Color _variantColor(StatusVariant v, BuildContext ctx) {
  final cs = Theme.of(ctx).colorScheme;
  switch (v) {
    case StatusVariant.success: return const Color(0xFF18B7A0); // teal
    case StatusVariant.error:   return cs.error;
    case StatusVariant.warning: return Colors.amber;
    case StatusVariant.info:    return cs.primary;
  }
}

/// Dialog centrado con header de color + icono circular.
/// - Modo "estado": [autoCloseDuration] != null y [showActions] == false  → se cierra solo.
/// - Modo "confirmación": [showActions] == true y [autoCloseDuration] == null → Aceptar/Cancelar.
/// Devuelve `true` si se acepta, `false` si se cancela/cierra.
Future<bool> showStatusModal(
  BuildContext context, {
  required String title,
  required String message,
  StatusVariant variant = StatusVariant.success,
  IconData? icon,
  Duration? autoCloseDuration,       // p.ej. Duration(seconds: 5) para auto-cierre
  bool showActions = false,          // true → muestra Aceptar/Cancelar
  String confirmText = 'Aceptar',
  String cancelText = 'Cancelar',
  bool barrierDismissible = true,
  bool showOkWhenNoActions = true,   // en modo estado, ¿mostrar botón OK además del auto-cierre?
}) {
  final bg = _variantColor(variant, context);
  final ico = icon ??
      (variant == StatusVariant.success
          ? Icons.check
          : variant == StatusVariant.error
              ? Icons.close
              : variant == StatusVariant.warning
                  ? Icons.warning_amber_rounded
                  : Icons.info_outline);

  bool scheduled = false;

  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (dialogCtx) {
      // Programar autocierre si corresponde (modo estado)
      if (!scheduled && autoCloseDuration != null && !showActions) {
        scheduled = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(autoCloseDuration, () {
            if (Navigator.of(dialogCtx).canPop()) {
              Navigator.of(dialogCtx).pop(true); // devolvemos true por conveniencia
            }
          });
        });
      }

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Center(
                  child: Container(
                    width: 72, height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(ico, size: 40, color: Colors.white),
                  ),
                ),
              ),

              // Contenido + acciones
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                          ),
                    ),
                    const SizedBox(height: 14),

                    if (showActions) // Modo confirmación
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(dialogCtx).pop(false),
                              child: Text(cancelText),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton(
                              onPressed: () => Navigator.of(dialogCtx).pop(true),
                              child: Text(confirmText),
                            ),
                          ),
                        ],
                      )
                    else if (showOkWhenNoActions) // Modo estado con botón OK
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () => Navigator.of(dialogCtx).pop(true),
                          child: const Text('OK'),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).then((value) => value ?? false);
}

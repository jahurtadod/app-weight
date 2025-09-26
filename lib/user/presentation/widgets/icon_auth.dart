import 'package:flutter/material.dart';

class IconAuth extends StatefulWidget {
  const IconAuth({super.key});

  @override
  State<IconAuth> createState() => _IconAuthState();
}

class _IconAuthState extends State<IconAuth> {
  @override
  Widget build(BuildContext context) {
    // TODO: Hacer tres botones
    return Row(
      mainAxisSize: MainAxisSize.min, // para que no ocupe todo el espacio
      children: [
        TextButton.icon(
          onPressed: () {
            print("Autenticación");
          },
          icon: const Icon(Icons.login, color: Colors.white),
          label: const Text(
            "Autenticación",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            print("Cerrar sesión");
            // TODO: Logout firebase
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

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isBusy = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: (isBusy ? null : onPressed),
      icon: isBusy
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : (icon ?? const SizedBox.shrink()),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

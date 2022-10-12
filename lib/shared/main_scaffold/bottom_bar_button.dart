import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class BottomBarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final IconData? icon;
  final bool current;

  const BottomBarButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.current = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                current ? TW3Colors.emerald.shade500 : TW3Colors.slate.shade500,
          ),
          Text(
            label,
            style: TextStyle(
              color: current
                  ? TW3Colors.emerald.shade600
                  : TW3Colors.slate.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class SnapshotState extends StatelessWidget {
  final IconData? icon;
  final String text;

  const SnapshotState({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 60,
          color: TW3Colors.slate.shade500,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TW3Colors.slate.shade700,
          ),
        )
      ],
    );
  }
}

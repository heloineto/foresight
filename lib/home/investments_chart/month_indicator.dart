import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MonthIndicator extends StatelessWidget {
  const MonthIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1 / 7,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              TW3Colors.emerald.shade300.withOpacity(0),
              TW3Colors.emerald.shade300.withOpacity(0.5),
            ],
          ),
        ),
      ),
    );
  }
}

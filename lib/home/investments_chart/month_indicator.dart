import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MonthIndicator extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final bool isSelected;
  const MonthIndicator({
    super.key,
    required this.index,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    print("$index $isSelected");

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      TW3Colors.emerald.shade300.withOpacity(0),
                      TW3Colors.emerald.shade300.withOpacity(0.5),
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

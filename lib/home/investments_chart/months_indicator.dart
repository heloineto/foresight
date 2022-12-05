import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/month_indicator.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MonthsIndicator extends StatefulWidget {
  const MonthsIndicator({super.key});

  @override
  State<MonthsIndicator> createState() => _MonthsIndicatorState();
}

class _MonthsIndicatorState extends State<MonthsIndicator> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < 7; index++)
          MonthIndicator(
            index: index,
            isSelected: selectedIndex == index,
            onTap: () => setState(() => selectedIndex = index),
          ),
      ],
    );
  }
}

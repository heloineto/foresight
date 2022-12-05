import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/month_indicator.dart';

class MonthsIndicator extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onChange;

  const MonthsIndicator({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < 7; index++)
          MonthIndicator(
            index: index,
            isSelected: selectedIndex == index,
            onTap: () => onChange(index),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/month_indicator.dart';

class MonthsIndicator extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onChange;
  final List<DateTime> months;

  const MonthsIndicator({
    super.key,
    required this.selectedIndex,
    required this.onChange,
    required this.months,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < months.length; index++)
          MonthIndicator(
            index: index,
            isSelected: selectedIndex == index,
            onTap: () => onChange(index),
          ),
      ],
    );
  }
}

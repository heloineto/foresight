import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentLabel extends StatelessWidget {
  final String title;
  final String value;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const InvestmentLabel({
    super.key,
    required this.title,
    required this.value,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: TW3Colors.slate.shade500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: TW3Colors.slate.shade700,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/utils/investments.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentHeader extends StatelessWidget {
  final Investment investment;

  const InvestmentHeader({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            investment.bank,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: TW3Colors.slate.shade800,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                toPercentage(investment.returnRate),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade600,
                ),
              ),
              Text(
                investment.index,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

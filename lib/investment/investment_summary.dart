import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/investment_chart.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/utils/investments.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentSummary extends StatelessWidget {
  final Investment investment;

  const InvestmentSummary({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    var prices = getSixMonths().map(
      (month) => getInvestmentPrice(date: month, investment: investment),
    );

    print(prices);

    return Column(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                toBrl(investment.price),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade700,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'rendeu R\$ 8 esse mês',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: InvestmentChart(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/investment_chart.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/utils/investments.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentSummary extends StatefulWidget {
  final Investment investment;

  const InvestmentSummary({super.key, required this.investment});

  @override
  State<InvestmentSummary> createState() => _InvestmentSummaryState();
}

class _InvestmentSummaryState extends State<InvestmentSummary> {
  int selectedIndex = 3;
  List<DateTime> months = getNMonths(9);

  @override
  Widget build(BuildContext context) {
    var prices = months.map(
      (month) {
        return getInvestmentPrice(date: month, investment: widget.investment);
      },
    ).toList();

    bool isPast = months[selectedIndex].difference(DateTime.now()).isNegative;

    return Column(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                doubleToBrl(prices[selectedIndex]),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade700,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '${isPast ? "rendeu" : "renderá"} ${getMonthlyRate(prices, selectedIndex)} esse mês',
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
          child: InvestmentChart(
            prices: prices,
            months: months,
            selectedIndex: selectedIndex,
            onChangeSelectedIndex: (index) {
              setState(() => selectedIndex = index);
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/investment_chart.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/utils/investments.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

class InvestmentsSummary extends StatefulWidget {
  const InvestmentsSummary({super.key});

  @override
  State<InvestmentsSummary> createState() => _InvestmentsSummaryState();
}

class _InvestmentsSummaryState extends State<InvestmentsSummary> {
  int selectedIndex = 3;
  List<DateTime> months = getNMonths(7);

  double sumMonthPrice({
    required DateTime month,
    required List<Investment> investments,
  }) {
    double sum = 0;

    for (Investment investment in investments) {
      sum += getInvestmentPrice(date: month, investment: investment);
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    List<Investment> investments = Provider.of<List<Investment>>(context);
    var prices = months
        .map((month) => sumMonthPrice(month: month, investments: investments))
        .toList();

    double previousPrice = sumMonthPrice(
      month: Jiffy(months.first).subtract(months: 1).dateTime,
      investments: investments,
    );

    double nextPrice = sumMonthPrice(
      month: Jiffy(months.last).add(months: 1).dateTime,
      investments: investments,
    );

    bool isPast = months[selectedIndex].difference(DateTime.now()).isNegative;

    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 8),
                  child: Text(
                    'Seu saldo atual é de:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  doubleToBrl(prices[selectedIndex]),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 30,
                    bottom: 30,
                    left: 30,
                  ),
                  child: Text(
                    'Seu dinheiro ${isPast ? "rendeu" : "renderá"} ${getMonthlyRate(prices, selectedIndex)} esse mês.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: InvestmentChart(
              prices: prices,
              months: getNMonths(7),
              onChangeSelectedIndex: (index) {
                setState(() => selectedIndex = index);
              },
              selectedIndex: selectedIndex,
              previousPrice: previousPrice,
              nextPrice: nextPrice,
            ),
          ),
        ],
      ),
    );
  }
}

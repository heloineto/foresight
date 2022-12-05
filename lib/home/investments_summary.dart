import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/investment_chart.dart';
import 'package:foresight/services/models.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

class InvestmentsSummary extends StatelessWidget {
  const InvestmentsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    List<Investment> investments = Provider.of<List<Investment>>(context);
    double balance = 0;

    for (Investment investment in investments) {
      balance += double.parse(investment.price);
    }

    return Center(
      child: Column(children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 8),
                child: Text('Seu saldo atual é de:',
                    style: TextStyle(fontSize: 16)),
              ),
              Text(
                brlFormatter.format(balance),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, right: 30, bottom: 30, left: 30),
                child: Text(
                  'Seu dinheiro já rendeu ${brlFormatter.format(balance * 0.08)} esse mês.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 3, child: InvestmentChart()),
      ]),
    );
  }
}

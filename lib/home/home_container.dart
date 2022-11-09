import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/services/models.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Investment> investments = Provider.of<List<Investment>>(context);
    double balance = 0;

    for (Investment investment in investments) {
      balance += double.parse(investment.price);
    }

    return Center(
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 8),
          child: Text('Seu saldo atual é de:', style: TextStyle(fontSize: 18)),
        ),
        Text(
          brlFormatter.format(balance),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 44),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, right: 30, bottom: 30, left: 30),
          child: Text(
            'Seu dinheiro já rendeu ${brlFormatter.format(balance * 0.08)} esse mês.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ]),
    );
  }
}

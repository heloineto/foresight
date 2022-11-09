import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 8),
          child: Text('Seu saldo atual é de:', style: TextStyle(fontSize: 18)),
        ),
        Text('R\$ 1000,00',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 44)),
        Container(
          margin: EdgeInsets.only(top: 10, right: 30, bottom: 30, left: 30),
          child: Text(
            'Seu dinheiro já rendeu R\$ 25,00 esse mês.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ]),
    );
  }
}

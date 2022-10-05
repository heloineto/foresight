import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foresight/investments/investment.dart';
import 'package:foresight/utils/hex_color.dart';

class InvestmentsColumn extends StatelessWidget {
  InvestmentsColumn({super.key});

  final _investments = [
    {'bank': 'Nubank', 'date': DateTime.utc(2022, 04, 9), 'value': 22.5},
    {'bank': 'BB', 'date': DateTime.utc(2022, 02, 9), 'value': 220.75},
    {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
    {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
    {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
    {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: _investments
              .map(
                (investment) => Column(
                  children: <Widget>[
                    Investment(
                      bankName: investment['bank'] as String,
                      investmentDate: investment['date'] as DateTime,
                      investmentValue: investment['value'] as double,
                    ),
                    Divider(
                      color: HexColor('#E0E0E0'),
                      thickness: 1,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

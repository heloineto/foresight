import 'package:flutter/material.dart';
import 'package:foresight/investments/investment.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

// ! Perguntar para o professor
// class Investment {
//   final String bank;
//   final DateTime date;
//   final int value;

//   Investment(this.bank, this.date, this.value);
// }

//   final List<Investment> _investments = [
//     {'bank': 'Nubank', 'date': DateTime.utc(2022, 04, 9), 'value': 22.5},
//     {'bank': 'BB', 'date': DateTime.utc(2022, 02, 9), 'value': 220.75},
//     {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
//     {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
//     {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
//     {'bank': 'Itaú', 'date': DateTime.utc(2022, 24, 8), 'value': 300.0},
//   ];

class InvestmentsColumn extends StatelessWidget {
  InvestmentsColumn({super.key});

  final List<Map<String, Object>> investments = [
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
          children: [
            for (var i = 0; i < investments.length; i++)
              Column(
                children: <Widget>[
                  if (i > 0)
                    Divider(
                      color: TW3Colors.slate.shade200,
                      thickness: 1,
                    ),
                  Investment(
                    bankName: investments[i]['bank'] as String,
                    investmentDate: investments[i]['date'] as DateTime,
                    investmentValue: investments[i]['value'] as double,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

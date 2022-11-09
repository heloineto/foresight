import 'package:flutter/material.dart';
import 'package:foresight/investments/investment.dart';
import 'package:foresight/settings/firestore.dart';
import 'package:foresight/settings/models.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentsColumn extends StatelessWidget {
  const InvestmentsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: FutureBuilder<List<Investment>>(
            future: FirestoreService().getInvestments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('waiting');
              }

              if (snapshot.hasError) {
                return Text('error');
              }

              if (!snapshot.hasData) {
                return Text('empty');
              }

              List<Investment> investments = snapshot.data!;

              return Column(
                children: investments.asMap().entries.map((entry) {
                  int index = entry.key;
                  var investment = entry.value;

                  return Column(
                    children: <Widget>[
                      if (index > 0)
                        Divider(
                          color: TW3Colors.slate.shade200,
                          thickness: 1,
                          height: 1,
                        ),
                      InvestmentItem(investment: investment),
                    ],
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}

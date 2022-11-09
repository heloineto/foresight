import 'package:flutter/material.dart';
import 'package:foresight/investments/investment_item.dart';
import 'package:foresight/services/firestore.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/shared/snapshot_states/empty_state.dart';
import 'package:foresight/shared/snapshot_states/error_state.dart';
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
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ErrorState(),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: EmptyState(text: 'Você ainda não tem investimentos'),
                );
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

import 'package:flutter/material.dart';
import 'package:foresight/investments/investment_item.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/shared/snapshot_states/empty_state.dart';
import 'package:provider/provider.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentsColumn extends StatelessWidget {
  const InvestmentsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    var investments = Provider.of<List<Investment>>(context);

    return Expanded(
      child: SingleChildScrollView(
        child: investments.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(top: 16),
                child: EmptyState(text: 'Você ainda não tem investimentos'),
              )
            : Column(
                children: investments.asMap().entries.map(
                  (entry) {
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
                  },
                ).toList(),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foresight/home/investments_chart/investment_chart.dart';
import 'package:foresight/investment/investment_header.dart';
import 'package:foresight/investment/investment_summary.dart';
import 'package:foresight/investments/investments_form/return_rate_field.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:foresight/utils/investments.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class InvestmentPage extends StatelessWidget {
  final Investment investment;

  const InvestmentPage({
    super.key,
    required this.investment,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InvestmentHeader(investment: investment),
              SizedBox(height: 20),
              InvestmentSummary(investment: investment),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      investment.bank,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    ),
                    Text(
                      dateTimeToString(investment.startDate),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rentabilidade',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    ),
                    Text(
                      toPercentage(investment.returnRate),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    ),
                    Text(
                      investment.product,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Indexador',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    ),
                    Text(
                      investment.index,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: TW3Colors.slate.shade800,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

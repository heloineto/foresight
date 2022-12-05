import 'package:flutter/material.dart';
import 'package:foresight/investment/investment_header.dart';
import 'package:foresight/investment/investment_label.dart';
import 'package:foresight/investment/investment_summary.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:foresight/utils/investments.dart';
import 'package:jiffy/jiffy.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InvestmentHeader(investment: investment),
                SizedBox(height: 20),
                InvestmentSummary(investment: investment),
                Divider(height: 40, color: TW3Colors.slate.shade500),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InvestmentLabel(
                            title: 'BANCO OU CORRETORA',
                            value: investment.bank,
                          ),
                          InvestmentLabel(
                            title: 'RENTABILIDADE',
                            value:
                                '${toPercentage(investment.returnRate)} ${investment.index}',
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InvestmentLabel(
                            title: 'INVESTIMENTO INICIAL',
                            value: toBrl(investment.price),
                          ),
                          InvestmentLabel(
                            title: 'PRODUTO',
                            value: investment.product,
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InvestmentLabel(
                            title: 'DATA DA OPERAÇÃO',
                            value: Jiffy(investment.startDate)
                                .format('dd/MM/yyyy'),
                          ),
                          InvestmentLabel(
                            title: 'DATA DE VENCIMENTO',
                            value: investment.endDate != null
                                ? Jiffy(investment.endDate).format('dd/MM/yyyy')
                                : '-',
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

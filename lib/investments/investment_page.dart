import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:intl/intl.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
final percentageFormatter = NumberFormat.decimalPercentPattern(
  decimalDigits: 2,
  locale: 'pt_BR',
);

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
        padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Text(
                'Investimento',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 40),
              child: Text(
                brlFormatter.format(double.parse(investment.price)),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: TW3Colors.slate.shade700,
                ),
              ),
            ),
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
                    percentageFormatter.format(
                      double.parse(investment.returnRate),
                    ),
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
    ));
  }
}

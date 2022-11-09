import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:intl/intl.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

class InvestmentPage extends StatelessWidget {
  final String bankName;
  final DateTime investmentDate;
  final double investmentValue;
  final String product;
  final String indexer;
  final double rentabilityRate;

  const InvestmentPage(
      {super.key,
      required this.bankName,
      required this.investmentDate,
      required this.investmentValue,
      required this.product,
      required this.indexer,
      required this.rentabilityRate});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: Padding(
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
          // Divider(
          //   color: TW3Colors.slate.shade500,
          //   thickness: 1,
          //   height: 1,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 40),
            child: Text(
              brlFormatter.format(investmentValue),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.normal,
                color: TW3Colors.slate.shade700
              ),
            ),
          ),
          // Divider(
          //   color: TW3Colors.slate.shade500,
          //   thickness: 1,
          //   height: 1,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bankName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: TW3Colors.slate.shade800,
                  ),
                ),
                Text(
                  dateTimeToString(investmentDate),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: TW3Colors.slate.shade800,
                  ),
                )
              ],
            ),
          ),
          // Divider(
          //   color: TW3Colors.slate.shade500,
          //   thickness: 1,
          //   height: 1,
          // ),
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
                  '$rentabilityRate%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: TW3Colors.slate.shade800,
                  ),
                )
              ],
            ),
          ),
          // Divider(
          //   color: TW3Colors.slate.shade500,
          //   thickness: 1,
          //   height: 1,
          // ),
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
                  product,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: TW3Colors.slate.shade800,
                  ),
                )
              ],
            ),
          ),
          // Divider(
          //   color: TW3Colors.slate.shade500,
          //   thickness: 1,
          //   height: 1,
          // ),
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
                  indexer,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: TW3Colors.slate.shade800,
                  ),
                )
              ],
            ),
          ),
          // Divider(
          //   color: TW3Colors.slate.shade500,
          //   thickness: 1,
          //   height: 1,
          // ),
        ],
      ),
    ));
  }
}

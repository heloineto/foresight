import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:intl/intl.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

final brlFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

class Investment extends StatelessWidget {
  final String bankName;
  final DateTime investmentDate;
  final double investmentValue;

  const Investment({
    super.key,
    required this.bankName,
    required this.investmentDate,
    required this.investmentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                bankName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.slate.shade800,
                ),
              ),
              SizedBox(height: 2),
              Text(
                dateTimeToString(investmentDate),
                style: TextStyle(fontSize: 15, color: TW3Colors.slate.shade400),
              )
            ],
          ),
          Text(
            brlFormatter.format(investmentValue),
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: TW3Colors.slate.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

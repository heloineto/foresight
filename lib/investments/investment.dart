import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:foresight/utils/hex_color.dart';
import 'package:intl/intl.dart';

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
      padding: const EdgeInsets.all(16),
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
                  fontWeight: FontWeight.bold,
                  color: HexColor('#333335'),
                ),
              ),
              Text(
                dateTimeToString(investmentDate),
                style: TextStyle(color: HexColor('#979797')),
              )
            ],
          ),
          Text(
            brlFormatter.format(investmentValue),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

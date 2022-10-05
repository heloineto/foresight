import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/utils/convert_date.dart';
import 'package:foresight/utils/hex_color.dart';

class Investment extends StatelessWidget {
  final String? bankName;
  final DateTime? investmentDate;
  final double? investmentValue;

  const Investment(
      {super.key, this.bankName, this.investmentDate, this.investmentValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 15, bottom: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bankName ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HexColor('#333335'),
                  ),
                ),
                Text(convertFromDateTime2String(investmentDate),
                    style: TextStyle(color: HexColor('#979797')))
              ]),
          Text('R\$$investmentValue',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

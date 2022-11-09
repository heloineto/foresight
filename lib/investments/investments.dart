import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_column.dart';
import 'package:foresight/investments/investments_header.dart';

class Investments extends StatelessWidget {
  const Investments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        InvestmentsHeader(),
        InvestmentsColumn(),
      ],
    );
  }
}

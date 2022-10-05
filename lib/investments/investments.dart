import 'package:flutter/material.dart';
import 'package:foresight/investments/investments_column.dart';
import 'package:foresight/investments/investments_header.dart';

class InvestmentsPage extends StatelessWidget {
  bool? isItOccupyingEntireScreen;

  InvestmentsPage({super.key, this.isItOccupyingEntireScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: isItOccupyingEntireScreen ?? false ? 35 : 15),
            color: Colors.white,
            child: Align(
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  InvestmentsHeader(),
                  InvestmentsColumn(),
                ]))));
  }
}

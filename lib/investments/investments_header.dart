import 'package:flutter/material.dart';

class InvestmentsHeader extends StatelessWidget {
  const InvestmentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(25),
      child: Text(
        'Investimentos',
        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InvestmentsHeader extends StatelessWidget {
  const InvestmentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Text(
        'Investimentos',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InvestmentsHeader extends StatelessWidget {
  const InvestmentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Text('Investimentos',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)));
  }
}

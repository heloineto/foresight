import 'package:flutter/material.dart';
import 'package:foresight/investments/investments.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Investments(),
        ),
      ),
    );
  }
}

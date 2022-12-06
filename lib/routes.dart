import 'package:flutter/material.dart';
import 'package:foresight/biometrics/biometrics.dart';
import 'package:foresight/home/home.dart';
import 'package:foresight/investment/investment.dart';
import 'package:foresight/investments/investments_form/investments_form.dart';
import 'package:foresight/investments/investments_page.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/settings/settings.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const HomePage(),
  '/biometrics': (context) => const BiometricsPage(),
  '/investments': (context) => const InvestmentsPage(),
  '/investments/create': (context) => const InvestmentsFormPage(),
  '/investment': (context) {
    final investment = ModalRoute.of(context)!.settings.arguments as Investment;

    return InvestmentPage(investment: investment);
  },
  '/settings': (context, {arguments}) => const SettingsPage(),
};

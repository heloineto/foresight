import 'package:flutter/material.dart';
import 'package:foresight/home/home.dart';
import 'package:foresight/investments/investment_page.dart';
import 'package:foresight/investments/investments_form/investments_form.dart';
import 'package:foresight/investments/investments_page.dart';
import 'package:foresight/routes/investment_page_route_arguments.dart';
import 'package:foresight/services/models.dart';
import 'package:foresight/settings/settings.dart';

Map<String, StatelessWidget Function(dynamic)> routes = {
  '/': (context) => const HomePage(),
  '/investments': (context) => const InvestmentsPage(),
  '/investments/create': (context) => const InvestmentsFormPage(),
  '/investment': (context) {
    final investment = ModalRoute.of(context)!.settings.arguments as Investment;

    return InvestmentPage(investment: investment);
  },
  '/settings': (context, {arguments}) => const SettingsPage(),
};

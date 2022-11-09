import 'package:flutter/material.dart';
import 'package:foresight/enter/enter.dart';
import 'package:foresight/home/home.dart';
import 'package:foresight/investments/investment_page.dart';
import 'package:foresight/investments/investments_form/investments_form.dart';
import 'package:foresight/investments/investments_page.dart';
import 'package:foresight/routes/investment_page_route_arguments.dart';
import 'package:foresight/settings/settings.dart';

Map<String, StatelessWidget Function(dynamic)> routes = {
  '/': (context) => const HomePage(),
  '/enter': (context) => const EnterPage(),
  '/investments': (context) => const InvestmentsPage(),
  '/investments/create': (context) => const InvestmentsFormPage(),
  '/investment': (context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as InvestmentPageRouteArguments;

    return InvestmentPage(
      bankName: arguments.bankName,
      investmentDate: arguments.investmentDate,
      investmentValue: arguments.investmentValue,
      product: arguments.product,
      indexer: arguments.indexer,
      rentabilityRate: arguments.rentabilityRate,
    );
  },
  '/settings': (context, {arguments}) => const SettingsPage(),
};

import 'package:flutter/material.dart';
import 'package:foresight/enter/enter.dart';
import 'package:foresight/home/home.dart';
import 'package:foresight/investments/investments.dart';
import 'package:foresight/investments/investments_form.dart';
import 'package:foresight/settings/settings.dart';

Map<String, StatelessWidget Function(dynamic)> routes = {
  '/': (context) => const HomePage(),
  '/enter': (context) => const EnterPage(),
  '/investments': (context) => const InvestmentsPage(),
  '/investments/create': (context) => const InvestmentsFormPage(),
  '/settings': (context) => const SettingsPage(),
};

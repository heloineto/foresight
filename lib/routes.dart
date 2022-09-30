import 'package:flutter/material.dart';
import 'package:foresight/enter/enter.dart';
import 'package:foresight/home/home.dart';
import 'package:foresight/investments/investments.dart';

Map<String, StatelessWidget Function(dynamic)> routes = {
  '/': (context) => const HomePage(),
  '/enter': (context) => const EnterPage(),
  '/investments': (context) => const InvestmentsPage(),
};

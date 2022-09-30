import 'package:flutter/material.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}

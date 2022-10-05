import 'package:flutter/material.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Center(
        child: TextButton(
          child: Text("Log out"),
          onPressed: () {},
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Hello"),
          onPressed: null,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Entrar'),
          Text('Ou crie sua conta'),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text("Continar com o Facebook"),
          )
        ],
      ),
    );
  }
}

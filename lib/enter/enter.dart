import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        width: double.maxFinite,
        color: TW3Colors.slate[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 245,
              decoration: BoxDecoration(
                color: TW3Colors.slate.shade400,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            Transform.translate(
              offset: Offset(-7, 22),
              child: Text(
                'Entrar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
              ),
            ),
            Text(
              'Ou crie sua conta',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              padding: EdgeInsets.all(20),
              color: Color(0xFF1877F2),
              minWidth: double.maxFinite,
              child: Text(
                'Continuar com o Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

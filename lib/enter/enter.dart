import 'package:flutter/material.dart';
import 'package:foresight/enter/enter_button.dart';
import 'package:foresight/services/auth.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          width: double.maxFinite,
          color: TW3Colors.slate[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: double.maxFinite,
              //   height: 245,
              //   decoration: BoxDecoration(
              //     color: TW3Colors.slate.shade400,
              //     borderRadius: BorderRadius.all(Radius.circular(7)),
              //   ),
              // ),
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
              SizedBox(height: 40),
              // EnterButton(
              //   color: Color(0xFF1877F2),
              //   icon: PhosphorIcons.facebookLogoFill,
              //   text: 'Continuar com Facebook',
              //   onPressed: () => {},
              // ),
              // SizedBox(height: 15),
              EnterButton(
                color: TW3Colors.slate.shade500,
                icon: PhosphorIcons.googleLogoFill,
                text: 'Continuar com Google',
                onPressed: () => AuthService().googleLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

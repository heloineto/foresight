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
          padding: const EdgeInsets.all(25),
          width: double.maxFinite,
          color: TW3Colors.slate[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(-7, 22),
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                ),
              ),
              const Text(
                'Ou crie sua conta',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 40),
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

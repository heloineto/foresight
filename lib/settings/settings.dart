import 'package:flutter/material.dart';
import 'package:foresight/services/auth.dart';
import 'package:foresight/services/local_auth.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var localAuthService = Provider.of<LocalAuthService>(context);

    return MainScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                height: 52,
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return Colors.white;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return TW3Colors.red.shade400;
                      },
                    ),
                  ),
                  onPressed: () {
                    AuthService().signOut().then((_) {
                      localAuthService.locallyAuthenticated = false;
                    });

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(PhosphorIcons.signOut),
                      SizedBox(width: 10),
                      Text(
                        'Sair',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

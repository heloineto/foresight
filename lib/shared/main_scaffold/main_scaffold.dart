import 'package:flutter/material.dart';
import 'package:foresight/biometrics/biometrics.dart';
import 'package:foresight/services/auth.dart';
import 'package:foresight/services/local_auth.dart';
import 'package:foresight/shared/main_scaffold/bottom_bar_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class MainScaffold extends StatelessWidget {
  final Widget? body;

  const MainScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    var localAuthService = Provider.of<LocalAuthService>(context);

    bool locallyAuthenticated = localAuthService.locallyAuthenticated;

    if (!locallyAuthenticated) {
      return BiometricsPage(
        onSuccess: () {
          localAuthService.locallyAuthenticated = true;
        },
        onUnsupported: () {
          localAuthService.locallyAuthenticated = true;
        },
      );
    }

    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Scaffold(
      body: body,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Container(
            child: !isKeyboardVisible
                ? FloatingActionButton(
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    disabledElevation: 0,
                    highlightElevation: 0,
                    onPressed: () {
                      Navigator.pushNamed(context, '/investments/create');
                    },
                    backgroundColor: TW3Colors.emerald,
                    child: const Icon(PhosphorIcons.currencyDollarSimple),
                  )
                : const SizedBox(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: TW3Colors.slate.shade300,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomBarButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                label: 'Home',
                icon: PhosphorIcons.houseFill,
                current: currentRoute == '/',
              ),
              BottomBarButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/investments');
                },
                label: 'Invest',
                icon: PhosphorIcons.chartLineUpFill,
                current: currentRoute == '/investments',
              ),
              const SizedBox(width: 24),
              BottomBarButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                label: 'Config',
                icon: PhosphorIcons.gearSixFill,
                current: currentRoute == '/settings',
              ),
              BottomBarButton(
                onPressed: () {
                  AuthService().signOut();

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                label: 'Sair',
                icon: PhosphorIcons.signOutFill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

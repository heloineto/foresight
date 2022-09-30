import 'package:flutter/material.dart';
import 'package:foresight/shared/main_scaffold/bottom_bar_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MainScaffold extends StatelessWidget {
  final Widget? body;

  const MainScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Scaffold(
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        // tooltip: 'Add Investment',
        onPressed: () {},
        backgroundColor: TW3Colors.emerald,
        child: const Icon(PhosphorIcons.currencyDollarSimple),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: TW3Colors.slate[300],
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
                  Navigator.pushNamed(context, '/settings');
                },
                label: 'Config',
                icon: PhosphorIcons.gearSixFill,
                current: currentRoute == '/settings',
              ),
              const SizedBox(width: 24),
              BottomBarButton(
                onPressed: null,
                label: 'Home',
                icon: PhosphorIcons.houseFill,
              ),
              BottomBarButton(
                onPressed: null,
                label: 'Home',
                icon: PhosphorIcons.houseFill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
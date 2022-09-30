import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text('Hello'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: TW3Colors.emerald,
        child: const Icon(PhosphorIcons.currencyDollarSimple),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: TW3Colors.slate.shade300,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.houseFill,
                      color: TW3Colors.slate.shade500,
                    ),
                    const Text('Home'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
        ),
        // IconTheme(
        //   data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        //   child:
        // ),
      ),
    );
  }
}

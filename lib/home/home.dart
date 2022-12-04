import 'package:flutter/material.dart';
import 'package:foresight/enter/enter.dart';
import 'package:foresight/home/home_container.dart';
import 'package:foresight/investments/investments.dart';
import 'package:foresight/services/auth.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:foresight/shared/snapshot_states/error_state.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:foresight/utils/convert_currency.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    convert_currency(12);
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('auth loading');
        }

        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.only(top: 16),
            child: ErrorState(text: 'Erro ao autenticar'),
          );
        }

        if (!snapshot.hasData) {
          return EnterPage();
        }

        return MainScaffold(
          body: Container(
            color: TW3Colors.slate.shade200,
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: TW3Colors.slate.shade200,
                    child: HomeContainer(),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/investments'),
                    child: Investments(),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}

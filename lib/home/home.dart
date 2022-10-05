import 'package:flutter/material.dart';
import 'package:foresight/home/home_container.dart';
import 'package:foresight/investments/investments.dart';
import 'package:foresight/routes.dart';
import 'package:foresight/shared/main_scaffold/main_scaffold.dart';
import 'package:foresight/utils/hex_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
    body: Container(
      color: HexColor('##D9D9D9'),
      child: Column(children: <Widget>[
        Expanded(
          flex: 3,
          child: HomeContainer()
        ),
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InvestmentsPage(isItOccupyingEntireScreen: true))),
            child: InvestmentsPage()
          )
        ),
      ]
    ))); 
    }
}

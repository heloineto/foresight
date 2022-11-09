import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foresight/firebase_options.dart';
import 'package:foresight/routes.dart';
import 'package:foresight/shared/snapshot_states/error_state.dart';
import 'package:foresight/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ErrorState(text: 'Erro ao conectar com o servidor'),
          );
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return Text(
            'loading',
            textDirection: TextDirection.ltr,
          );
        }

        return MaterialApp(
          title: 'Foresight',
          routes: routes,
          theme: theme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [Locale('pt', 'BR')],
        );
      },
    );
  }
}

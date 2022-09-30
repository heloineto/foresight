// import 'package:firebase_core/firebase_core.dart';
// import 'package:foresight/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:foresight/routes.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

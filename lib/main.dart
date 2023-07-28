import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'navigator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'calendar_app_new',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            shadowColor: Color.fromARGB(255, 220, 220, 220),
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            backgroundColor: Color.fromARGB(220, 255, 255, 255),
          ),
          fontFamily: 'Lato',
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                fontSize: 15, fontFamily: 'Hind', fontWeight: FontWeight.bold),
          ),
        ),
        home: NavigatorBar());
  }
}

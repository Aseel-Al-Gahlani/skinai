import 'package:flutter/material.dart';

import 'pages/doctors.dart';
import 'home.dart';
import 'pages/diagnosis.dart';
import 'splashScreen.dart';
import 'start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (BuildContext context) => Home(),
        '/start': (BuildContext context) => StartScreen(),
        // '/MyWidget': (BuildContext context) => Diagnosis(),
        '/Doctor': (BuildContext context) => Doctor(),
      },
    );
  }
}


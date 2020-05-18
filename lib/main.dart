import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelIt App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "AirbnbCereal",
        platform: TargetPlatform.android,
        primaryTextTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.w700),
        ),
        accentColor: Colors.indigoAccent,
      ),
      home: SplashScreen(),
    );
  }
}

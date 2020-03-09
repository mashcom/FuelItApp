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
      title: 'FuelApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "AirbnbCereal",
        platform: TargetPlatform.iOS,
        primaryTextTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.w700),
        ),
        accentColor: Colors.greenAccent,
      ),
      home: SplashScreen(),
    );
  }
}

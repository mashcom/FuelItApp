import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'tabs_page.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (BuildContext context) => TabsPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: 400,
        child: Column(
          children: <Widget>[
            Icon(
              Icons.local_gas_station,
              size: 100,
              color: Colors.indigo,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "FuelIt App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            ),
          ],
        ),
      )),
    );
  }
}

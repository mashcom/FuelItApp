import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelUp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "AirbnbCereal",
        platform: TargetPlatform.iOS,
        primaryTextTheme:
            TextTheme(headline: TextStyle(fontWeight: FontWeight.w700)),
        accentColor: Colors.greenAccent,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.local_gas_station),
                  text: "Stations",
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: "Settings",
                ),
              ],
            ),
            title: Text('FuelApp'),
          ),
          body: TabBarView(
            children: [
              MyHomePage(),
              Text("Settings"),
            ],
          ),
        ),
      ),
    );
  }
}

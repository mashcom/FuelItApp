import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:service_station_app/search_page.dart';
import 'home_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelIt',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "AirbnbCereal",
        platform: TargetPlatform.iOS,
        primaryTextTheme:
            TextTheme(headline: TextStyle(fontWeight: FontWeight.w700)),
        accentColor: Colors.tealAccent,
      ),
      home: DefaultTabController(
        length: 3,
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
                  icon: Icon(Icons.search),
                  text: "Search",
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: "Settings",
                ),
              ],
            ),
            title: Text('FuelIt'),
          ),
          body: TabBarView(
            children: [
              MyHomePage(),
              SearchPage(),
              Text("Settings"),
            ],
          ),
        ),
      ),
    );
  }
}

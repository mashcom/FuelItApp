import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:service_station_app/search_page.dart';
import 'package:service_station_app/settings_page.dart';
import 'home_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelIt App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "AirbnbCereal",
        platform: TargetPlatform.iOS,
        primaryTextTheme:
            TextTheme(headline: TextStyle(fontWeight: FontWeight.w700)),
        accentColor: Colors.lightGreen,

      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                 child: Row(
                    children: <Widget>[
                      Icon(Icons.local_gas_station),
                      Text("Stations")
                    ],
                  ),
                ),
                Tab(
                 child: Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      Text("Search")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.settings),
                      Text("Settings")
                    ],
                  ),
                ),
              ],
            ),
            title: Text('FuelIt'),
          ),
          body: TabBarView(
            children: [
              MyHomePage(),
              SearchPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

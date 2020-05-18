import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/lists.dart';
import 'models/station_model.dart';
import 'dart:convert';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          ListTile(
    
            leading: Icon(Icons.location_on,size: 40,),
            title: Text(
              'Use GPS Location',
              style: TextStyle(
                  color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Text("Let the app user current location in real-time. This requires location service enabled" ,style: TextStyle(
                  color: Colors.black87, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
            trailing:Switch(value:true, onChanged: null),
          ),
           ListTile(
              leading: Icon(Icons.shutter_speed,size: 40,),
              title: Text(
                'Hot Data Syncing',
                style: TextStyle(
                    color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text("Enable active polling of new data" ,style: TextStyle(
                    color: Colors.black87, fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
              trailing:Switch(value:true, onChanged: null),
            ),
             ListTile(
              leading: Icon(Icons.offline_bolt,size: 40,),
              title: Text(
                'Offline Capabilities',
                style: TextStyle(
                    color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text("Allows app to work while offline. This requires more space" ,style: TextStyle(
                    color: Colors.black87, fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
              trailing:Switch(value:true, onChanged: null),
            ),
             ListTile(
              leading: Icon(Icons.map,size: 40,),
              title: Text(
                'Cache Map Data',
                style: TextStyle(
                    color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text("Allows app to cache map data. This requires more space" ,style: TextStyle(
                    color: Colors.black87, fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
              trailing:Switch(value:false, onChanged: null,),
            ),
        ],),
      ),
    );
  }
}

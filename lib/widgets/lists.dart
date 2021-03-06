import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_station_app/models/station_model.dart';
import 'package:service_station_app/single_station_page.dart';

Widget stationsTile(BuildContext context, station) {
  return ListTile(
    onTap: () {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => SingleStationPage(station: station),
        ),
      );
    },
    leading: Icon(Icons.location_on),
    title: Text(
      '${station["name"]}',
      style: TextStyle(
          color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: <Widget>[
       Row(children: [
         //Text(station["products"].toString()),
         badge(Color.fromRGBO(0, 0, 0, 0.1), Colors.black54,  '${station["city"]}'),
         badge(Colors.lightGreen, Colors.black, station["products"].length.toString() +" Products"),
       ]),
       ],
    ),

    trailing: Icon(Icons.arrow_forward_ios),
  );
}

Widget storesWatched(Color background, String storeName) {
  return SizedBox(
    height: 25,
    child: Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              storeName,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget badge(Color background, Color textColor, String text) {
  return SizedBox(
    height: 25,
    child: Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ))),
  );
}

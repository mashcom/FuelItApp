import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/lists.dart';
import 'models/station_model.dart';
import 'dart:convert';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController stationController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool _productListReady = true;
  bool _emptySearch=false;
  List productList = List();
  StationModel sm = StationModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
              child: TextField(
                controller: stationController,
                decoration: InputDecoration(
                  labelText: "Search Station",
                  hintText: "",
                  prefixIcon: Icon(Icons.local_gas_station),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Location",
                  hintText: "",
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  String station_to_find = stationController.text;
                  String location_to_find = locationController.text;
                  StationModel sm = StationModel();
                  sm
                      .searchProducts(station_to_find, location_to_find)
                      .then((resp) {
                    var result = jsonDecode(resp);
                    print(result);
                    if (result['status']) {
                      productList = result['data'];
                      print(productList);
                      if (productList.length == 0) {
                        _emptySearch = true;
                      } else {
                        _emptySearch = false;
                      }
                      print(productList.length);
                    }

                    setState(() {
                      _productListReady = true;
                    });
                  });
                },
                child: Text('Search'),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        _emptySearch
                            ? Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.local_gas_station,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                  Text(
                                    "No Results Found!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              )
                            : Text(
                                "Results!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              )
                      ],
                    ))
              ],
            ),
            Expanded(
              child: _productListReady
                  ? SingleChildScrollView(
                      child: Column(
                        children: productList.map((station) {
                          return stationsTile(context, station);
                        }).toList(),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

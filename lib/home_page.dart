import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/lists.dart';
import 'models/station_model.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
  bool _productListReady = false;
  List productList = List();
  StationModel sm = StationModel();

  @override
  void initState() {
    super.initState();
    populateProducts();
  }

  void populateProducts() {
    sm.getProducts().then((resp) {
      var result = jsonDecode(resp);
      //if (result['success']) {
        productList = result['data'];
      //}

      setState(() {
        _productListReady = true;
      });
    });
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
                onChanged: (value) {
                  var duration = Duration(seconds: 5);
                  setState(() {
                    _productListReady = false;
                  });
                  Timer(duration, () {
                    print(value);
                    sm.searchProducts(value,"").then((resp) {
                      var result = jsonDecode(resp);

                      if (result['status']) {
                        productList = result['data'];
                      }

                      setState(() {
                        _productListReady = true;
                      });
                    });
                  });
                },
                controller: editingController,
                decoration: InputDecoration(
                  labelText: "Search Station",
                  hintText: "",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.local_gas_station,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                            Text(
                              "Featured Stations",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ],
                        ),
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

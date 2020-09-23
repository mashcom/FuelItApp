import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  int id;
  String currency;
  String name;
  double price;
  String availability_status;
  String queue_status;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "currency": currency,
      "name": name,
      "price": price,
      "availability_status": availability_status,
      "queque_status": queue_status,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product();

  Product.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    price = map["price"];
    currency = map["currency"];
    availability_status = map["availability_status"];
    queue_status = map["queque_status"];
  }

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        price = json["price"],
        currency = json["currency"],
        availability_status = json["availability_status"],
        queue_status = json["queue_status"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "currency": currency,
        "availability_status": availability_status,
        "queque_status": queue_status,
      };
}

class Station {
  int id;
  String email;
  String name;
  String status;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "email": email,
      "name": name,
      "status": status
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Station();

  Station.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    status = map["status"];
  }

  Station.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        status = json["status"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "status": status,
      };
}

class StationModel {
  final API_BASE = "http://192.168.20.177/fuel_it/public/api";

  Future getProducts() async {
    print("Getting products");
    String url ="$API_BASE/stations/featured/gweru";
    var response = await http.get(url);
    print("Response");
    print(response.body);
    return response.body;
  }

  Future searchProducts(String query, String location) async {
    print("Starting search");
    print(query);

    print(location);
    String url = "$API_BASE/stations/search/$query/$location";
    var response = await http.get(url);
    print("Response");
    print(response.body);
    return response.body;
  }
}

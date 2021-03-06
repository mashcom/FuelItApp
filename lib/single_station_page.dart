import 'package:flutter/material.dart';
import 'widgets/lists.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SingleStationPage extends StatefulWidget {
  final dynamic station;

  SingleStationPage({Key key, @required this.station}) : super(key: key);

  @override
  _SingleStationPageState createState() => _SingleStationPageState();
}

class _SingleStationPageState extends State<SingleStationPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 5,
            primary: true,
            floating: true,
            flexibleSpace: stationHero(),
            expandedHeight: 475,
            pinned: true,
            title: Text(widget.station['name']),
          ),
          // Next, create a SliverList
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) {
                return Column(
                  children: widget.station["products"].map<Widget>((item) {
                    final availability = item["availability"];
                    var availability_status;
                    if (availability != null) {
                      availability_status = item["availability"]["available"];
                    }

                    var availability_text = "No Information";

                    Color badge_background_color = Color.fromRGBO(0, 0, 0, 0.1);
                    Color badge_text_color = Colors.black54;
                    switch (availability_status) {
                      case 0:
                        badge_background_color = Colors.yellow;
                        badge_text_color = Colors.black87;
                        availability_text = "Not Available";
                        break;

                      case 1:
                        badge_background_color = Colors.green;
                        availability_text = "Available";
                        badge_text_color = Colors.white;
                        break;

                      default:
                    }

                    return ListTile(
                      leading: Icon(
                        Icons.local_car_wash,
                        size: 40,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                      title: Text(
                        item["name"],
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Row(
                        children: [
                          badge(badge_background_color, badge_text_color,
                              availability_text),
                          badge(Colors.black12, Colors.black,
                              "USD\$" + item["usd_price"].toString()),
                        ],
                      ),
                      trailing: Text(
                        "ZWL\$" + item["zwl_price"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    );
                  }).toList(),
                );
              },
              // Builds 1000 ListTiles
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget stationHero() {
    return Stack(
      children: <Widget>[
        Hero(
          tag: widget.station["name"],
          child: Center(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x0000000000), Color(0xd933333333)],
                  stops: [0.0, 0.9],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 0.5))),
        ),
        Positioned(
          height: 50,
          bottom: -1,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(0),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text(
                  widget.station["city"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

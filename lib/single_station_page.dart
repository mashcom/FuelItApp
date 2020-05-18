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
            flexibleSpace:stationHero(),
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
                  children: widget.station['products'].map<Widget>((item) {
                    final availability_status = item["availability_status"];
                    final queue_status = item["queue_status"];
                    Color badge_background_color = Color.fromRGBO(0, 0, 0, 0.1);
                    Color badge_text_color = Colors.black54;
                    if (availability_status == "Not Available") {
                      badge_background_color = Colors.yellow;
                      badge_text_color = Colors.black87;
                    }

                    Color queue_badge_background_color =
                        Color.fromRGBO(0, 0, 0, 0.1);
                    Color queue_badge_text_color = Colors.black54;
                    if (queue_status == "Short Queue" ||
                        queue_status == "No Queue") {
                      queue_badge_background_color = Colors.green;
                      queue_badge_text_color = Colors.white;
                    }
                    if (queue_status == "Medium Queue") {
                      queue_badge_background_color = Colors.yellow;
                      queue_badge_text_color = Colors.black87;
                    }

                    if (queue_status == "Long Queue") {
                      queue_badge_background_color = Colors.red;
                      queue_badge_text_color = Colors.white;
                    }

                    return ListTile(
                      leading: Icon(
                        Icons.local_gas_station,
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
                              availability_status),
                          badge(queue_badge_background_color,
                              queue_badge_text_color, queue_status),
                        ],
                      ),
                      trailing: Text(
                        item["price"].toString() + " " + item["currency"],
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
                myLocationEnabled:true ,
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
                  widget.station["name"],
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

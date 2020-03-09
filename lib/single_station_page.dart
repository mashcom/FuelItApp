import 'package:flutter/material.dart';
import 'widgets/lists.dart';

class SingleStationPage extends StatefulWidget {
  final dynamic station;
  SingleStationPage({Key key, @required this.station}) : super(key: key);

  @override
  _SingleStationPageState createState() => _SingleStationPageState();
}

class _SingleStationPageState extends State<SingleStationPage> {
  @override
  void initState() {
    super.initState();
  }

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
                  children: widget.station['products'].map<Widget>((item) {
                    return ListTile(
                      leading: FlutterLogo(
                        size: 50,
                      ),
                      title: Text(
                        item["name"],
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          badge(Colors.green, Colors.white, item["availability_status"]),
                          badge(Colors.red, Colors.black87, item["queue_status"]),
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
            child: Image.asset("assets/map.JPG"),
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
                    bottomRight: Radius.circular(0))),
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text(
                  widget.station["name"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

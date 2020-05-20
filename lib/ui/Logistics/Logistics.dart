import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/Logistics/Planning/Planning.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/CreateShipment.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/package_detail/PackageDetail.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/ShipperDetails/ShipperDetails.dart';

class Logistics extends StatefulWidget {
  @override
  _LogisticsState createState() => _LogisticsState();
}

class _LogisticsState extends State<Logistics> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: ROUTE_PLANNING),
                      builder: (context) => Planning()));
            },
            title: Column(
              children: <Widget>[
                Container(
                  width: w / 1.5,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Planning',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.event,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: ROUTE_SHIPPERDETAILS),
                      builder: (context) => ShipperDetails()));
            },
            title: Column(
              children: <Widget>[
                Container(
                  width: w / 1.5,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Create Shipment',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.local_shipping,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: ROUTE_CREATESHIPMENT),
                      builder: (context) => PackageDetail()));
            },
            title: Column(
              children: <Widget>[
                Container(
                  width: w / 1.5,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Tracking',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

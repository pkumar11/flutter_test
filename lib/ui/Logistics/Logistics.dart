import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/Logistics/Planning/Planning.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/CreateShipment.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/package_detail/PackageDetail.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/ShipperDetails/ShipperDetails.dart';
import 'package:eunimart/ui/Logistics/Tracking/Tracking.dart';

class Logistics extends StatefulWidget {
  @override
  _LogisticsState createState() => _LogisticsState();
}

class _LogisticsState extends State<Logistics> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Planning',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.event,
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Create Shipment',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.local_shipping,
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
                        builder: (context) => Tracking()));
              },
              title: Column(
                children: <Widget>[
                  Container(
                    width: w / 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Tracking',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.location_on,
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
      ),
    );
  }
}

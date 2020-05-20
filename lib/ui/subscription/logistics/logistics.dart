import 'package:flutter/material.dart';
import 'package:eunimart/singleton/AAASingleton.dart';

class Logistics extends StatefulWidget {
  @override
  _LogisticsState createState() => _LogisticsState();
}

class _LogisticsState extends State<Logistics> {
  AAASingleton appSingleton = AAASingleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc7c8c9),
      body: Container(
        child: ListView(
          children: <Widget>[Text('ooooooo')],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:th_app/ui/login/login.dart';

import 'util/app_constants.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 2),() {
      Navigator.pushReplacement(context, MaterialPageRoute(
          settings: RouteSettings(name: ROUTE_LOGIN),
          builder: (context) => Login()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Compnay Name'),
      ),
    );
  }
}

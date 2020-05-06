import 'package:flutter/material.dart';
import 'package:th_app/singleton/AAASingleton.dart';
import 'package:th_app/ui/profile/profile.dart';
import 'package:th_app/util/app_constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  AAASingleton appSingleton = AAASingleton();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("${appSingleton.name}"),),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Welocome to Home page ${appSingleton.name}'),
          ),
          RaisedButton(
            child: Text('Next'),
            onPressed: _goToProfilePage,
          )
        ],
      ),
    );
  }

  void _goToProfilePage() {
    appSingleton.name = "Pankaj";
    Navigator.push(context, MaterialPageRoute(
        settings: RouteSettings(name: ROUTE_PROFILE),
        builder: (context) => Profile()));
  }
}

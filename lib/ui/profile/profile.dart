import 'package:flutter/material.dart';
import 'package:th_app/singleton/AAASingleton.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  AAASingleton appSingleton = AAASingleton();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${appSingleton.name}"),),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Singleton name ${appSingleton.name}'),
          ),
          RaisedButton(
            child: Text('Back'),
            onPressed: _goToBackPage,
          )
        ],
      ),
    );
  }

  void _goToBackPage() {
    appSingleton.name = "Anant";
    Navigator.pop(context);
  }
}

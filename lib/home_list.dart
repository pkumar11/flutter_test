import 'package:flutter/material.dart';
import 'package:th_app/util/socket_singleton.dart';

import 'home_page_one.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {

  SocketSingleton _socket = SocketSingleton();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Center(
              child: Text('${_socket.name}'),
            ),
          ),
          RaisedButton(
            child: Text('Change Name'),
            onPressed: _changeName,
          ),
          RaisedButton(
            child: Text('Next Page'),
            onPressed: _nextPage,
          )
        ],
      ),
    );
  }

  void _changeName() {
    _socket.name = "Ajit";
  }

  void _nextPage() {
    Navigator.push(context, MaterialPageRoute(
        settings: RouteSettings(name: '/MyHomePageOne'),
        builder: (c) {
          return MyHomePageOne();
        }));
  }
}

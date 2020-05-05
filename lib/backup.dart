//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData.dark(),
//      home: MyHomePage(title: 'Users List'),
//      debugShowCheckedModeBanner: false,
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  var userList = [];
//  var isCleared = false;
//
//  _fetchAllTUsers() async {
//    setState(() {
//      isCleared = false;
//    });
//    final res = await http.get('http://gray-tomato.herokuapp.com/getAllTUsers');
//    if (res.statusCode == 200){
//      final d = json.decode(res.body);
//      setState(() {
//        userList = d['userList'];
//      });
//    }
//  }
//
//
//  _fetchClearResults() async {
//    final res = await http.get('http://gray-tomato.herokuapp.com/clearTUsers');
//    if (res.statusCode == 200){
//      final d = json.decode(res.body);
//
//      setState(() {
//        isCleared = true;
//      });
//
//      print(isCleared);
//    }
//  }
//
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _fetchAllTUsers();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    print("isCleared ${isCleared}");
//
//    Widget _bodyW = Container(
//      child: userList.length == 0 ? Center(child: CircularProgressIndicator(),) :
//      ListView.builder(
//          itemCount: userList.length,
//          itemBuilder: (context, i){
//            var _uname = userList[i]['username'];
//            var _upass = userList[i]['password'];
//            return ListTile(
//              title: Text("${_uname}"),
//              subtitle: Text('password : ${_upass}'),
//            );
//          }),
//    );
//
//    if(isCleared){
//      _bodyW = Center(child: Text('Cleared All Results'),);
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.refresh),
//            onPressed: () => _fetchAllTUsers(),
//          ),
//          IconButton(
//            icon: Icon(Icons.delete),
//            onPressed: () => _fetchClearResults(),
//          ),
//
//        ],
//      ),
//      body: _bodyW
//    );
//  }
//}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  var userList = [];
//  var isCleared = false;
//
//  var response = [];
//
//  _fetchAllTUsers() async {
//    setState(() {
//      isCleared = false;
//    });
//    final res = await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=578152be1392218f6d775ceb67b4e4f6&language=en-US&page=1');
//    if (res.statusCode == 200){
//      final d = json.decode(res.body);
//      response = d['results'];
//      setState(() {
//        //userList = d['userList'];
//      });
//    }
//  }
//
//
//  _fetchClearResults() async {
//    final res = await http.get('http://gray-tomato.herokuapp.com/clearTUsers');
//    if (res.statusCode == 200){
//      final d = json.decode(res.body);
//
//      setState(() {
//        isCleared = true;
//      });
//
//      print(isCleared);
//    }
//  }
//
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _fetchAllTUsers();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    print("isCleared ${isCleared}");
//
//    Widget _bodyW = Container(
//      child: response.length == 0 ? Center(child: CircularProgressIndicator(),) :
//      ListView.builder(
//          itemCount: response.length,
//          itemBuilder: (context, i){
//            var _uname = response[i]['title'];
//            var _upass = response[i]['overview'];
//            return ListTile(
//
//              title: Text("${_uname}"),
//              subtitle: Text('password : ${_upass}'),
//            );
//          }),
//    );
//
//    if(isCleared){
//      _bodyW = Center(child: Text('Cleared All Results'),);
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.refresh),
//            onPressed: () => _fetchAllTUsers(),
//          ),
//          IconButton(
//            icon: Icon(Icons.delete),
//            onPressed: () => _fetchClearResults(),
//          ),
//
//        ],
//      ),
//      body: _bodyW
//    );
//  }
//}


//import 'package:flutter/material.dart';
//import 'package:web_socket_channel/io.dart';
//import 'package:th_app/home_page_one.dart';
//
//import 'home_list.dart';
//import 'util/socket_singleton.dart';
//void main() => runApp(MyApp());
//
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  SocketSingleton singleton = SocketSingleton();
//
//  @override
//  Widget build(BuildContext context) {
//
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData.dark(),
//      home: HomeList(),
//      //MyHomePageOne(channel: IOWebSocketChannel.connect("ws://192.168.1.31:3000/")),
//      debugShowCheckedModeBanner: false,
//    );
//  }
//
//  @override
//  void dispose() {
//    singleton.channel.sink.close();
//    super.dispose();
//  }
//
//}
//
//
//

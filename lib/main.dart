import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:th_app/app_models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  new Promise(( resolve, reject) => {
//    // everthing is fine
//    resolve(asdasdsa)
//
//    reject('asdada')
//  })

  List<MovieObject> movieList = List();

  callMovieDataAPI() async {
    movieList.clear();
    setState(() => movieList);
    // Promise / Future
    try {
      final res =
          await http.get("https://api.tvmaze.com/search/shows?q=batman");
      switch (res.statusCode) {
        case 200:
          final j_data = json.decode(res.body);

          MovieResponse movieResponse = MovieResponse();
          movieList = movieResponse.createMovieList(
              j_data: j_data, movieList: movieList);
          setState(() => movieList);
          print(movieList);
          break;
        default:
          print("HTTP ERROR CODE : ${res.statusCode}");
          break;
      }
    } catch (err) {
      //
      print("Server ERROR : $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    //cc -> x-axis
    //cm -> y-axis

    //rc -> y-axis
    //rm -> x-axis

    // Row -> Flexible
//    Row(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Flexible(child: Icon(Icons.star, size: 100)),
//        Flexible(child: Icon(Icons.star, size: 100)),
//        Flexible(child: Icon(Icons.star, size: 100)),
//      ],
//    )

    // list.map((obj, i) => {})

    // Item 1 -> Context
    // Item 2 -> Context

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Call API'),
              onPressed: () => callMovieDataAPI(),
            ),
            Flexible(
              flex: 1,
              child: _showListWidget(),
            ),
          ],
        ));
  }

  Widget _showListWidget() {
    if (movieList.length == 0) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (_, index) {

          MovieObject movieObject = movieList[index];

//          String imageUrl = "";
//          if(movieObject != null){
//            Show show = movieObject.show;
//            if(show != null){
//              String medium = show.showImage.medium;
//              if(medium != null){
//                imageUrl = medium;
//              }
//            }
//          }
          Show show = movieObject?.show;
          print("iten number ----> $index");
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(show?.showImage?.medium ?? ""),
              backgroundColor: Colors.white12,
            ),
            title: Text(show?.name ?? "" ),
            subtitle: Text("${show?.id}"  ??  ""),
          );
        });
  }
}

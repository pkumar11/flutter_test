import 'package:flutter/material.dart';
import 'package:th_app/splash.dart';
import 'package:th_app/ui/home/home.dart';
import 'package:th_app/ui/login/login.dart';

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


import 'package:flutter/material.dart';
import 'package:eunimart/splash.dart';
import 'package:eunimart/ui/home/home.dart';
import 'package:eunimart/ui/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

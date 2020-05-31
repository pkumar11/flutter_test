import 'package:eunimart/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:eunimart/splash.dart';

import 'package:eunimart/singleton/AAASingleton.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AAASingleton appSingleton = AAASingleton();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Splash(),
      theme: ThemeData.fallback(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyApp extends StatelessWidget {

// }

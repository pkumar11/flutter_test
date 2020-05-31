import 'package:flutter/material.dart';

class AAASingleton {
  static final AAASingleton _singleton = AAASingleton._internal();
  Widget home = Text('welcome');

  bool dark = false;
  bool darkedChanged = false;
  factory AAASingleton() {
    return _singleton;
  }

  AAASingleton._internal();
}

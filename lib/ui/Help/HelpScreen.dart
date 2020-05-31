import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HelpScreenPage extends StatefulWidget {
  @override
  _HelpScreenPageState createState() => _HelpScreenPageState();
}

class _HelpScreenPageState extends State<HelpScreenPage> {
  final webView = FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    // webView.close();
    // _launchWeb(context);
    // _launchInWebViewOrVC();
  }

  @override
  void dispose() {
    webView.dispose();
  }

  _launchWeb(context) {
    webView.launch('https://www.eunimart.com/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: GestureDetector(child: _launchWeb(context)),
    );
  }
}

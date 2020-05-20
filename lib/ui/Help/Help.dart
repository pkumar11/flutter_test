import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
    _launchInWebViewOrVC();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'We hope it helped you if not',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            RaisedButton(
              onPressed: _launchInWebViewOrVC,
              child: Text('Retry'),
            )
          ],
        ));
  }

  Future<void> _launchInWebViewOrVC() async {
    String url = 'https://eunimart.com';

    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
      Center(
        child: CircularProgressIndicator(),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

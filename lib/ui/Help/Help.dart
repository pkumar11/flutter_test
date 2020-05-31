import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:eunimart/ui/Help/HelpScreen.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  // final webView = FlutterWebviewPlugin();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     alignment: Alignment.center,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           'We hope it helped you if not',
    //           style: TextStyle(color: Colors.black, fontSize: 18),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.all(5),
    //         ),
    //         RaisedButton(
    //           onPressed: () {

    //           },
    //           child: Text('Retry'),
    //         )
    //       ],
    //     ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eunimart Help Web Page'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Container(
          child: WebView(
            initialUrl: 'https://www.eunimart.com/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
              });
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          ),
        );
      }),
    );
  }

  Future<void> _launchInWebViewOrVC() async {
    String url = 'https://help.go.vdezi.com/';

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

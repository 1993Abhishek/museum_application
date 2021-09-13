import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:museum_application/router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSiteView extends StatefulWidget {
  final String url;
  const WebSiteView({Key key,this.url}) : super(key: key);

  @override
  _WebSiteViewState createState() => _WebSiteViewState();
}

class _WebSiteViewState extends State<WebSiteView> {


  final Completer<WebViewController> _completer =
  Completer<WebViewController>();
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacementNamed(MuseumRouter.ROUTE_HOME);
      },
      child: WebView(
        key: _key,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
        onWebViewCreated: (WebViewController controller) {
          _completer.complete(controller);
        },
      ),
    );
  }
}

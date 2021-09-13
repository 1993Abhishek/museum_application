import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/helper/static_widget_helper.dart';
import 'package:museum_application/widgets/web_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  StreamSubscription _connectionChangeStream;

  bool isOnline = false;

  @override
  initState() {
    checkConnection();
    super.initState();
  }

  void checkConnection() async
  {
    isOnline =await isInternetConnectionAvailable();
    if(!isOnline)
      {
        WidgetHelper.showToastMessage('Please turn on your internet connection to show this page.');
      }
    else
      {
        print('Online');
        setState(() {
        });
      }

  }
  static Future<bool> isInternetConnectionAvailable() async {
    print('hello');
    return await DataConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isOnline ? WebSiteView(
        url: 'https://p3d.in/lquD0',
        key: widget.key,
      ):Container(),
    );
  }
}

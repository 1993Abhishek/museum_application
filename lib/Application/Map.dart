import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/static_widget_helper.dart';
import 'package:museum_application/widgets/web_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  bool isOnline = false;

  @override
  initState() {

    checkConnection();
    super.initState();
  }
  bool isGettingObj=false;

  void checkConnection() async
  {
    isOnline =await isInternetConnectionAvailable();
    if(!isOnline)
      {
        WidgetHelper.showToastMessage('Please turn on your internet connection to show this page.');
        AppSettings.openAppSettings();
      }
    else
      {

        Timer(Duration(seconds: 5), () {
          setState(() {
            isGettingObj=false;
          });
        });
      }

  }
   Future<bool> isInternetConnectionAvailable() async {
    setState(() {
      isGettingObj=true;
    });
    return await DataConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:isGettingObj ? Center(child: CircularProgressIndicator(backgroundColor: AppColor.colorPrimary,),):Container(
        height: double.infinity,
        width: double.infinity,
        child: WebSiteView(
          url: 'https://object.devci.vidinitechnology.com',
          key: widget.key,
        ),
      ),
    );
  }
}

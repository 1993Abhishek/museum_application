import 'dart:async';

import 'package:flutter/material.dart';
import 'package:museum_application/router.dart';
import 'package:museum_application/utility/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        MuseumRouter.ROUTE_HOME,
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    // bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    // print(isPortrait);
    // print(isLandScape);
    return Scaffold(
      body:  OrientationBuilder(
        builder: (context,orientation){
          print(orientation);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:orientation==Orientation.portrait ? AssetImage(
                  "assets/Load.jpg",
                ):Container(),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

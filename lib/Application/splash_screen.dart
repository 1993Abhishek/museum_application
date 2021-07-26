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
    return Scaffold(
      body:  Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/Load.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
    );
  }
}

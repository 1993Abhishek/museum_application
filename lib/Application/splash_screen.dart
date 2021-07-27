import 'dart:async';

import 'package:flutter/material.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/router.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double finalWidth = 560;

  Widget loadingContainer() {
    return Container(
      height: hDimen(15),
      width: hDimen(560),
      decoration: BoxDecoration(
        color: Colors.white /*Color(0xFFf2f2f2)*/,
        borderRadius: BorderRadius.circular(hDimen(20)),
        border: Border.all(
          color: Color(0xFFf2f2f2),
          width: 0.0,
        ),
      ),
      child: AnimatedPadding(
        duration: Duration(
          seconds: 3,
        ),
        padding: EdgeInsets.only(right: finalWidth),
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          height: hDimen(2),
          width: 1,
          decoration: BoxDecoration(
            color: Color(0xFF99856a),
            borderRadius: BorderRadius.circular(hDimen(20)),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      while (finalWidth > 0) {
        setState(() {
          finalWidth = finalWidth - 1;
        });
      }
    });

    Timer(
        Duration(
          seconds: 4,
          milliseconds: 280,
        ), () {
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/loader-bg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: hDimen(170),
            ),
            child: Align(
              child: loadingContainer(),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

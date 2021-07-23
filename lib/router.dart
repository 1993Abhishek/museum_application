import 'package:flutter/material.dart';
import 'package:museum_application/Application/Dashboard.dart';
import 'package:museum_application/Application/splash_screen.dart';
import 'package:museum_application/route_aniation.dart';

const String initialRoute = "/";

class MuseumRouter
{
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_HOME = "home";

  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;
    switch (settings.name){
      case ROUTE_INITIAL:
        currentWidget = SplashScreen();
        break;
      case ROUTE_HOME:
        currentWidget = HomeScreen();
        break;
      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return FadeRoute(page: currentWidget, settings: settings);
  }
}
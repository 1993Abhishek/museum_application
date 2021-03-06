import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(Museum());
  });

}

class Museum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Museum',
      theme: ThemeData(
        primaryColor: AppColor.colorPrimary ,
        accentColor: AppColor.colorPrimary,
        fontFamily: "Roboto",
      ),
      initialRoute: MuseumRouter.ROUTE_INITIAL,
      onGenerateRoute: MuseumRouter.generateRoute,
    );
  }
}

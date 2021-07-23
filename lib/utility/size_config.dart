import 'package:flutter/material.dart';
import 'package:museum_application/utility/appview_helper.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double scaleFactor;

  static final SizeConfig _singleton = new SizeConfig._internal();

  factory SizeConfig() {
    return _singleton;
  }

  SizeConfig._internal();

  Future init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    print(screenWidth);
    screenHeight = _mediaQueryData?.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    scaleFactor = _mediaQueryData.textScaleFactor;

    if (screenWidth >= 600) {
      safeBlockHorizontal = safeBlockHorizontal - 2;
      safeBlockVertical = safeBlockVertical - 1.50;
    }

    mPrint("screenWidth==>$screenWidth");
    mPrint("screenHeight==>$screenHeight");
    mPrint("blockSizeHorizontal==>$blockSizeHorizontal");
    mPrint("blockSizeVertical==>$blockSizeVertical");
    mPrint("safeBlockHorizontal==>$safeBlockHorizontal");
    mPrint("safeBlockVertical==>$safeBlockVertical");
    mPrint("textScaleFactor==>${_mediaQueryData.textScaleFactor}");
    return Future.value();
  }
}

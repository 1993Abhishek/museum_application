import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:museum_application/helper/appcolor.dart';

class WidgetHelper {
  static showToastMessage(String message, {Color backgroundColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:
        backgroundColor != null ? AppColor.colorPrimary : Colors.black54,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
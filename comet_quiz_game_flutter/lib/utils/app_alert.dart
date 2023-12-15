import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppAlert {
  static Future<bool?> showAppToast(String message) async {
    return await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        webShowClose: true,
        fontSize: 16.0);
  }
}

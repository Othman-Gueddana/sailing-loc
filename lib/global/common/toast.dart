import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.blue.shade900,
    webBgColor: "linear-gradient(to right, #0D47A1FF, #0D47A1FF)",
    webPosition: "center",
    textColor: Colors.white,
    webShowClose: true,
    fontSize: 16.0,
  );
}

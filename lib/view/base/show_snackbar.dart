import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomSnackBar(String message, {bool isError = false}) {
  if (message.isNotEmpty) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: Colors.black87,
      fontSize: 16.0,
    );
  }
}

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

class Toasts {
  static void success(String message , BuildContext context) {
    CherryToast.success(
      backgroundColor : ColorManager.grey,
      title: Text(message, style: TextStyle(color: Colors.black)),
    ).show(context);
  }
  static void error(String message , BuildContext context) {
    CherryToast.error(
      backgroundColor: ColorManager.grey,
      title: Text(message, style: TextStyle(color: Colors.black)),
    ).show(context);
  }
}
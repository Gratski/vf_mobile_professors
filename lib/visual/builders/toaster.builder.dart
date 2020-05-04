import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:professors/visual/styles/colors.dart';

class ToasterBuilder {

  static buildSuccessToaster(BuildContext context, String msg) {
    _showToaster("#00c24a", msg, AppColors.regularGreen);
  }

  static buildInfoToaster(BuildContext context, String msg) {
    _showToaster("#1b1b1b", msg, AppColors.bgMainColor);
  }

  static buildErrorToaster(BuildContext context, String msg) {
    _showToaster("#cf0a2c", msg, AppColors.bgMainColor);
  }

  static _showToaster(String hexColor, String msg, Color color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: hexColor,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      gravity: ToastGravity.CENTER
    );
  }

}
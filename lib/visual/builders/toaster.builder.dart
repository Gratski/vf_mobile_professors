import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToasterBuilder {

  static buildSuccessToaster(BuildContext context, String msg) {
    _showToaster("#00c24a", msg);
  }

  static buildInfoToaster(BuildContext context, String msg) {
    _showToaster("#1b1b1b", msg);
  }

  static buildErrorToaster(BuildContext context, String msg) {
    _showToaster("#cf0a2c", msg);
  }

  static _showToaster(String hexColor, String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: hexColor,
      timeInSecForIosWeb: 5,
    );
  }

}
import 'package:flutter/material.dart';

class AppPaddings {

  static EdgeInsets regularPadding(BuildContext context){
    return EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.06,
        right: MediaQuery.of(context).size.width * 0.06);
  }

  static EdgeInsets sliverListPadding(BuildContext context) {
    return EdgeInsets.only(left: MediaQuery.of(context).size.width / 40, right: MediaQuery.of(context).size.width / 40);
  }

  static EdgeInsets regularWithBottomPadding(BuildContext context){
    return EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.width * 0.03);
  }

  static EdgeInsets regularAllPadding(BuildContext context){
    return EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.width * 0.05,
    );
  }

  static EdgeInsets topTitlePadding(BuildContext context) {
    return EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.02
    );
  }

}
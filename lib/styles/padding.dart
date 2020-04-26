import 'package:flutter/material.dart';

class AppPaddings {

  static EdgeInsets regularPadding(BuildContext context){
    return EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05);
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
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.05
    );
  }

}
import 'package:flutter/material.dart';

class PaddingsBuilder {

  static EdgeInsets regularPadding(BuildContext context){
    return EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05);
  }

}
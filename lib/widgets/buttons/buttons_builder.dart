import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ButtonsBuilder {

  /// FLAT BUTTONS
  static FlatButton redFlatButton(String text, VoidCallback callback){
    return createFlatButton(text, callback, Colors.red, Colors.white);
  }

  /// LINK TEXT BLUE
  static FlatButton whiteFlatButton(String text, VoidCallback callback) {
    return createFlatButton(text, callback, Colors.white, Colors.teal);
  }

  static FlatButton createFlatButton(String text, VoidCallback callback, Color bgColor, Color textColor){
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      color: bgColor,
      textColor: textColor,
      onPressed: callback,
      child: TextsBuilder.regularText(text),
    );
  }

}
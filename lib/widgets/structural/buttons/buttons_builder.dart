import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ButtonsBuilder {

  /// FLAT BUTTONS
  static FlatButton redFlatButton(String text, VoidCallback callback, {Color color}){
    return createFlatButton(text, callback, AppColors.regularRed, Colors.white);
  }

  /// FLAT BUTTON WITH ICON
  static FlatButton redFlatButtonWithIcon(String text, VoidCallback callback, Icon icon){
    return createFlatButtonWithIcon(text, callback, AppColors.regularRed, Colors.white, icon);
  }

  /// LINK TEXT BLUE
  static FlatButton whiteFlatButton(String text, VoidCallback callback) {
    return createFlatButton(text, callback, Colors.transparent, AppColors.regularGreen);
  }

  static FlatButton createFlatButton(String text, VoidCallback callback, Color bgColor, Color textColor){
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      color: bgColor,
      textColor: textColor,
      onPressed: callback,
      child: TextsBuilder.regularText(text, color: textColor),
    );
  }

  static FlatButton createFlatButtonWithIcon(
      String text, VoidCallback callback,
      Color bgColor, Color textColor,
      Icon icon
      ){
    return FlatButton(
      padding: EdgeInsets.all(10.0),
      color: bgColor,
      textColor: textColor,
      onPressed: callback,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: TextsBuilder.regularText(text, alignment: TextAlign.center),
          ),
          Expanded(
            flex: 4,
            child: Icon(Icons.file_upload),
          )
        ],
      )
    );
  }

}
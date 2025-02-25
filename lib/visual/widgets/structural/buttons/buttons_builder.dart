import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ButtonsBuilder {

  /// FLAT BUTTONS
  static FlatButton redFlatButton(String text, VoidCallback callback, {Color color}){
    return createFlatButton(text, callback, AppColors.regularRed, Colors.white);
  }

  static FlatButton flatButton(String text, VoidCallback callback, {Color color}){
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      color: AppColors.regularRed,
      textColor: Colors.white,
      onPressed: callback,
      child: TextsBuilder.regularText(text, color: Colors.white, bold: true),
    );
  }

  static FlatButton greenFlatButton(String text, VoidCallback callback, {Color color}){
    return createFlatButton(text, callback, AppColors.regularGreen, Colors.white);
  }

  /// FLAT BUTTON WITH ICON
  static FlatButton redFlatButtonWithIcon(String text, VoidCallback callback, Icon icon, {Color color}){
    return createFlatButtonWithIcon(text, callback, AppColors.regularRed, (color != null) ? color : Colors.white, icon);
  }

  /// LINK TEXT BLUE
  static FlatButton transparentButton(String text, VoidCallback callback, {Color color}) {
    return createFlatButton(text, callback, Colors.transparent, ( color != null ) ? color : AppColors.linksColor, bold: true);
  }

  static FlatButton transparentCustomButton(Widget widget, VoidCallback callback, {Color color}) {
    return createCustomFlatButton(widget, callback, Colors.transparent, ( color != null ) ? color : AppColors.linksColor);
  }

  static blackButton(String text, VoidCallback callback) {
    return createFlatButton(text, callback, AppColors.bgMainColor, AppColors.linksColor);
  }

  static FlatButton createFlatButton(String text, VoidCallback callback, Color bgColor, Color textColor, {bool bold: false}){
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      color: bgColor,
      textColor: textColor,
      onPressed: callback,
      child: TextsBuilder.regularText(text, color: textColor, bold: true),
    );
  }

  static FlatButton createCustomFlatButton(Widget widget, VoidCallback callback, Color bgColor, Color textColor){
    return FlatButton(
      padding: EdgeInsets.all(2.0),
      color: bgColor,
      textColor: textColor,
      onPressed: callback,
      child: widget,
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
            child: TextsBuilder.regularText(text, alignment: TextAlign.center, color: textColor),
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
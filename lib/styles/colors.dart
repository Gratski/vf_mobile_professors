import 'package:flutter/material.dart';

class AppColors {

  static Color get linksColor => Colors.white;
  static Color get fontColor => Colors.white;
  static Color get regularGreen => Colors.teal;
  static Color get lightGreen => Color.fromRGBO(0, 221, 57, 1);
  static Color get regularRed => Color.fromRGBO(254, 0, 47, 1);

  /// INPUT
  static Color get textInputBorder => Colors.grey[500];

  /// Background Colors
  static Color get bgMainColor => Color.fromRGBO(12, 12, 12, 1);
  static Color get bgGreyColor => Color.fromRGBO(241, 241, 241, 1);

  /// Text Colors
  static Color get textRegularColor => Colors.grey[200];
  static Color get textRegularHintColor => Colors.grey[300];
  static Color get textDarkRegularColor => Colors.white;
  static Color get textDarkHintColor => Colors.grey[800];

  /// Button Colors
  static Color get confirmButtonBg => regularRed;
  static Color get confirmButtonText => Colors.white;
  static Color get cancelButtonBg => Colors.transparent;
  static Color get cancelButtonText => Colors.grey;

  /// DIVIDERS
  static Color get dividerMainColor => Colors.grey[300];
  static Color get dividerDarkColor => Colors.grey[300];

  /// ICONS
  static Color get iconRegular => fontColor;
  static Color get iconRed => regularRed;

}
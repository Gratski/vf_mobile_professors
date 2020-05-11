import 'package:flutter/material.dart';

class AppColors {

  static Color get linksColor => AppColors.bgMainColor;
  static Color get paypalColor => Color.fromRGBO(0, 107, 192, 1);
  static Color get fontColor => AppColors.bgMainColor;
  static Color get regularGreen => Color.fromRGBO(6, 197, 18, 1);
  static Color get lightGreen => Color.fromRGBO(30, 215, 97, 1);
  static Color get regularRed => Color.fromRGBO(248, 0, 12, 1);

  /// INPUT
  static Color get textInputBorder => Colors.grey[500];
  static Color get textInputFocusedBorder => AppColors.fontColor;

  /// Background Colors
  static Color get bgMainColor => Color.fromRGBO(34, 34, 34, 1);
  static Color get bgMainLightColor => Color.fromRGBO(45, 45, 45, 1);
  static Color get bgGreyColor => Color.fromRGBO(241, 241, 241, 1);
  static Color get bgInputColor => Colors.transparent;

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

  ///
  /// Gets a colors based on the discipline status
  ///
  static Color getBgColorByStatus(int status) {
    switch(status) {
      case 1: return Colors.amber;
      case 2: return regularGreen;
      case 3: return bgMainColor;
      case 4: return bgMainColor;
    }
  }

  ///
  /// Gets text color by status
  ///
  static Color getTextColorByStatus(int status) {
    switch(status) {
      case 1: return bgMainColor;
      case 2: return Colors.white;
      case 3: return regularRed;
      case 4: return regularRed;
    }
  }

}
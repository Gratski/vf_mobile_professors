import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:professors/visual/styles/colors.dart';

/// Builder for Text Span App Elements
class TextsBuilder {
  static String _FONT_FAMILY_RALE_EXTRA_BOLD = 'Raleway Extra Bold';
  static String _FONT_FAMILY_RALE_BOLD = 'Raleway Bold';
  static String _FONT_FAMILY_RALE_REGULAR = 'Raleway';
  static String _FONT_FAMILY_BOLD = 'Inter Bold';
  static String _FONT_FAMILY_REGULAR = 'Inter';

  static double _FONT_SIZE_JUMBO = 55;
  static double _FONT_SIZE_H1 = 35.0;
  static double _FONT_SIZE_H2 = 30.0;
  static double _FONT_SIZE_H3 = 24.0;
  static double _FONT_SIZE_H4 = 16.0;
  static double _FONT_SIZE_H5 = 13.0;
  static double _FONT_SIZE_REGULAR = 16.0;
  static double _FONT_SMALL = 14.0;
  static double _FONT_EXTRA_SMALL = 12.0;

  /// List Item Text
  static TextSpan listItemSpan(String text) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SIZE_H4, fontFamily: _FONT_FAMILY_REGULAR));
  }

  /// SPAN
  static TextSpan h1BoldSpan(String text, {Color color}) {
    return TextSpan(
        text: text,
        style:
            TextStyle(fontSize: _FONT_SIZE_H1, fontFamily: _FONT_FAMILY_RALE_EXTRA_BOLD, color: (color != null) ? color : AppColors.bgMainColor ));
  }

  /// SPAN
  static TextSpan h2BoldSpan(String text) {
    return TextSpan(
        text: text,
        style:
            TextStyle(fontSize: _FONT_SIZE_H2, fontFamily: _FONT_FAMILY_BOLD));
  }

  /// SPAN
  static TextSpan h3LightSpan(String text, {Color color = Colors.black}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SIZE_H3, fontFamily: _FONT_FAMILY_REGULAR, color: color));
  }

  static TextSpan regularSpan(String text, {Color color}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SIZE_REGULAR, fontFamily: _FONT_FAMILY_REGULAR, color: (color != null) ? color : AppColors.bgMainColor ));
  }

  static TextSpan subTitleSpan(String text, {Color color = Colors.grey}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SMALL, fontFamily: _FONT_FAMILY_REGULAR, color: color));
  }

  static textSmallSpan(String text, {Color color}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SMALL, fontFamily: _FONT_FAMILY_REGULAR, color: (color != null) ? color : AppColors.bgMainColor),);
  }

  static TextSpan hintSpan(String text) {
    return TextSpan(
        text: text,
        style: TextStyle(
            color: Colors.grey,
            fontSize: _FONT_EXTRA_SMALL,
            fontFamily: _FONT_FAMILY_REGULAR));
  }

  static Text jumboBold(BuildContext context, String text, {Color color}) {
    return createText(text, MediaQuery.of(context).size.width / 7.8, _FONT_FAMILY_RALE_EXTRA_BOLD, color: color);
  }

  static Text h1Bold(String text, {Color color}) {
    return createText(text, _FONT_SIZE_H1, _FONT_FAMILY_RALE_EXTRA_BOLD, color: ( color != null ) ? color : AppColors.fontColor);
  }

  /// TEXT H2
  static Text h2Bold(String text, {Color color}) {
    return createText(text, _FONT_SIZE_H2, _FONT_FAMILY_RALE_EXTRA_BOLD, color: color);
  }

  /// TEXT H3
  static Text h3Bold(String text, {Color color}) {
    return createText(text, _FONT_SIZE_H3, _FONT_FAMILY_RALE_EXTRA_BOLD, color: color);
  }
  /// TEXT H3
  static Text h3Light(String text, {Color color = Colors.black}) {
    return createText(text, _FONT_SIZE_H3, _FONT_FAMILY_REGULAR, color: color);
  }

  /// TEXT H4
  static Text h4Bold(String text, {Color color}) {
    return createText(text, _FONT_SIZE_H4, _FONT_FAMILY_RALE_EXTRA_BOLD, color: color);
  }

  /// TEXT H4
  static Text h4Regular(String text) {
    return createText(text, _FONT_SIZE_H4, _FONT_FAMILY_REGULAR);
  }

  /// TEXT SMALL
  static Text textSmall(String text, {TextAlign align, Color color = Colors.black}) {
    return createText(text, 12, _FONT_FAMILY_REGULAR, color: color);
  }

  static Text textSmallBold(String text, {Color color}) {
    return createText(text, _FONT_SMALL, _FONT_FAMILY_BOLD, color: color);
  }

  /// TEXT LINK
  static Text regularLink(String text) {
    return createText(text, _FONT_SIZE_REGULAR, _FONT_FAMILY_REGULAR, color: Colors.teal);
  }

  /// TEXT HINT
  static Text textHint(String text) {
    return createText(text, _FONT_EXTRA_SMALL, _FONT_FAMILY_REGULAR,
        color: Colors.grey[500]);
  }

  static Text regularText(String text, {TextAlign alignment, Color color, bool bold = false}) {
    TextAlign align = TextAlign.start;
    if (alignment != null) {
      align = alignment;
    }
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: ( color != null ) ? color : AppColors.fontColor,
          fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
          fontSize: _FONT_SIZE_REGULAR, fontFamily: _FONT_FAMILY_REGULAR),
    );
  }

  static createText(String text, double size, String fontFamily,
      {Color color, TextAlign align = TextAlign.start}) {
    return Text(text,
      textAlign: align,
      style: TextStyle(fontSize: size, fontFamily: fontFamily, color: ( color != null ) ? color : AppColors.fontColor),
      overflow: TextOverflow.visible,);
  }
}

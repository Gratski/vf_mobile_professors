import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Builder for Text Span App Elements
class TextsBuilder {
  static String _FONT_FAMILY_BOLD = 'Inter Bold';
  static String _FONT_FAMILY_REGULAR = 'Inter';

  static double _FONT_SIZE_H1 = 28.0;
  static double _FONT_SIZE_H2 = 24.0;
  static double _FONT_SIZE_H3 = 20.0;
  static double _FONT_SIZE_H4 = 18.0;
  static double _FONT_SIZE_H5 = 13.0;
  static double _FONT_SIZE_REGULAR = 15.0;
  static double _FONT_SMALL = 11.0;

  /// List Item Text
  static TextSpan listItemSpan(String text) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SIZE_H4, fontFamily: _FONT_FAMILY_REGULAR));
  }

  /// SPAN
  static TextSpan h1BoldSpan(String text) {
    return TextSpan(
        text: text,
        style:
            TextStyle(fontSize: _FONT_SIZE_H1, fontFamily: _FONT_FAMILY_BOLD));
  }

  /// SPAN
  static TextSpan h3LightSpan(String text) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SIZE_H3, fontFamily: _FONT_FAMILY_REGULAR));
  }

  static TextSpan regularSpan(String text) {
    return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: _FONT_SIZE_REGULAR, fontFamily: _FONT_FAMILY_REGULAR));
  }

  static TextSpan hintSpan(String text) {
    return TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.grey,
            fontSize: _FONT_SMALL, fontFamily: _FONT_FAMILY_REGULAR));
  }

  /// TEXT H3
  static Text h3Bold(String text) {
    return createText(text, _FONT_SIZE_H4, _FONT_FAMILY_BOLD);
  }

  /// TEXT H4
  static Text h4Bold(String text) {
    return createText(text, _FONT_SIZE_H4, _FONT_FAMILY_BOLD);
  }

  /// TEXT H4
  static Text h4Regular(String text) {
    return createText(text, _FONT_SIZE_H4, _FONT_FAMILY_REGULAR);
  }

  /// TEXT SMALL
  static Text textSmall(String text) {
    return createText(text, _FONT_SMALL, _FONT_FAMILY_REGULAR);
  }

  static createText(String text, double size, String fontFamily) {
    return Text(text, style: TextStyle(fontSize: size, fontFamily: fontFamily));
  }

  static Text regularText(String text) {
    return Text(text,
        style: TextStyle(
            fontSize: _FONT_SIZE_REGULAR, fontFamily: _FONT_FAMILY_REGULAR));
  }
}

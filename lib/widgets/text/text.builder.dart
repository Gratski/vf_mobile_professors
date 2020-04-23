import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Builder for Text Span App Elements
class TextsBuilder {
  static String _FONT_FAMILY_BOLD = 'Inter Bold';
  static String _FONT_FAMILY_REGULAR = 'Inter';

  static double _FONT_SIZE_H1 = 38.0;
  static double _FONT_SIZE_H2 = 30.0;
  static double _FONT_SIZE_H3 = 24.0;
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
  static TextSpan h2BoldSpan(String text) {
    return TextSpan(
        text: text,
        style:
            TextStyle(fontSize: _FONT_SIZE_H2, fontFamily: _FONT_FAMILY_BOLD));
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
            fontSize: _FONT_SMALL,
            fontFamily: _FONT_FAMILY_REGULAR));
  }

  static Text h1Bold(String text) {
    return createText(text, _FONT_SIZE_H1, _FONT_FAMILY_BOLD);
  }

  /// TEXT H2
  static Text h2Bold(String text) {
    return createText(text, _FONT_SIZE_H2, _FONT_FAMILY_BOLD);
  }

  /// TEXT H3
  static Text h3Bold(String text) {
    return createText(text, _FONT_SIZE_H3, _FONT_FAMILY_BOLD);
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

  static Text textHint(String text) {
    return createText(text, _FONT_SMALL, _FONT_FAMILY_REGULAR,
        color: Colors.grey[500]);
  }

  static Text regularText(String text, {TextAlign alignment}) {
    TextAlign align = TextAlign.start;
    if (alignment != null) {
      align = alignment;
    }
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontSize: _FONT_SIZE_REGULAR, fontFamily: _FONT_FAMILY_REGULAR),
    );
  }

  static createText(String text, double size, String fontFamily,
      {Color color}) {
    if (color != null) {
      return Text(text,
          style:
              TextStyle(color: color, fontSize: size, fontFamily: fontFamily), overflow: TextOverflow.visible,);
    }
    return Text(text, style: TextStyle(fontSize: size, fontFamily: fontFamily,), overflow: TextOverflow.visible,);
  }
}

import 'package:flutter/material.dart';
import 'package:professors/widgets/text/text.builder.dart';

class BadgesBuilder {
  static Widget label(String label, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextsBuilder.regularText(label, color: Colors.white),
    );
  }
}
